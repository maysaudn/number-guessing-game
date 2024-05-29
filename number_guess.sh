#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# try this all without the function

# if username is not in the database
if [[ -z $($PSQL "SELECT username FROM users WHERE username='$USERNAME'") ]]
then
  # add user to database
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"

  # welcome user
  echo "Welcome, $USERNAME! It looks like this is your first time here."

else

  # get user id
  USER_ID=$($PSQL "
    SELECT user_id FROM users WHERE username='$USERNAME'
  ")

  # get games played
  GAMES_PLAYED=$($PSQL "
    SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID
  ")

  # get best game
  BEST_GAME=$($PSQL "
    SELECT MIN(no_of_guesses) FROM games WHERE user_id=$USER_ID
  ")

  # welcome user
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# get user id
USER_ID=$($PSQL "
  SELECT user_id FROM users WHERE username='$USERNAME'
")

# Generate a random number as $WINNING_NUMBER, check variable scope
WINNING_NUMBER=$[ $RANDOM % 1000 + 0 ]

# Tell user to guess a number
echo -e "\nGuess the secret number between 1 and 1000:"
read GUESS

# If guess is not a number
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
  # Instruct user to input a number
  echo -e "\nThat is not an integer, guess again:"
  read GUESS

else
  #initiate for loop
  for (( i=1; $GUESS!=$WINNING_NUMBER; i++ ))
  do
    # If guess is higher than winning number
    if (( $GUESS>$WINNING_NUMBER ))
    then
      # guess again
      echo -e "It's lower than that, guess again:"

    else
      # guess again
      echo -e "It's higher than that, guess again:"
    fi

    # update guess variable
    read GUESS

  done
  # add game to database
  $PSQL "INSERT INTO games(user_id, no_of_guesses) VALUES($USER_ID, $i)" | sed '"s/INSERT 0 1//'

  echo -e "You guessed it in $i tries. The secret number was $WINNING_NUMBER. Nice job!"

fi