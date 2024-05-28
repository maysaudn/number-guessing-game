#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

START_GAME() {
  # Generate a random number as $WINNING_NUMBER, check variable scope

  # if no argument
  if [[ -z $1 ]]
  then
    # Tell user to guess a number
    echo -e "\nGuess the secret number between 1 an 1000:"

  else
    # Enter arg as prompt
    echo -e "\n$1"

  fi

  read GUESS
  echo $GUESS
}

# if username is not in the database
if [[ -z $($PSQL "SELECT username FROM users WHERE username='$USERNAME'") ]]
then
  # add user to database
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"

  # welcome user
  echo "Welcome, $USERNAME! It looks like this is your first time here."

else

  # get user id

  # get games played

  # get best game

  # welcome user
  echo -e "\nWelcome back $USERNAME!"
fi

# start game
START_GAME

# If guess is not a number
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
  # restart game
  START_GAME "That is not an integer, guess again:"

# initiate for loop
else
  for (( i = 0; $GUESS = $WINNING_NUMBER; i++ )) {
    
    # if number of too low
    if (( $GUESS < $WINNING_NUMBER ))
    then
      echo -e "It's lower than that, guess again:"
    else
      echo -e "It's higher than that, guess again:"
    fi

    # change guess
    $GUESS

    # test if guess actually changed
    echo -e "your new guess is $GUESS"
  }
fi


: '
  # initiate for loop
  for (( i=0; $GUESS=$WINNING_NUMBER; i++ )) {

  }

# if username is not in the database
if [[ $USERNAME != $($PSQL "SELECT username FROM users WHERE username='$USERNAME'")]]
then
  # add user to database
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')"

  # welcome user
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  # get user id

  # get games played

  # get best game

  # welcome user
  echo -e "\nWelcome back $USERNAME!"

  # start game
  START_GAME

  # If guess is not a number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    # restart game
    START_GAME "That is not an integer, guess again:"

  #if guess is a match

  #if guess is too low

  fi
fi
'