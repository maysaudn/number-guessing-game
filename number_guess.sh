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

  # get games played

  # get best game

  # welcome user
  echo -e "\nWelcome back $USERNAME!"
fi

# Generate a random number as $WINNING_NUMBER, check variable scope
WINNING_NUMBER=$[ $RANDOM % 1000 + 0 ]
echo $WINNING_NUMBER

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

  echo -e "\nYou guessed it in $i tries. The secret number was $WINNING_NUMBER. Nice job!"
fi

: '

START_GAME() {
  # Generate a random number as $WINNING_NUMBER, check variable scope
  WINNING_NUMBER=$[ $RANDOM % 1000 + 0 ] 

  # test if that worked
  echo -e "Winning Number is $WINNING_NUMBER"

  # if no argument
  if [[ -z $1 ]]
  then
    # Tell user to guess a number
    echo -e "\nGuess the secret number between 1 and 1000:"

  else
    # Enter arg as prompt
    echo -e "\n$1"

  fi

  read GUESS
  # If guess is not a number
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    # restart game
    START_GAME "That is not an integer, guess again:"

    # initiate for loop
  else
    for (( i = 0; $GUESS == $WINNING_NUMBER; i++ )) {
    
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
  for (( i = 0; $GUESS == $WINNING_NUMBER; i++ )) {
    
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

'
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