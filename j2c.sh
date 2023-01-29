#!/bin/bash

# Initialize variables
conclusion=0
turns=0

# Display welcome message and instructions
echo "Welcome to the Jump to Conclusions game!"
echo "Based on the movie Office Space"
echo "Select a number corresponding to a conclusion to jump to it."
echo "You can also type 'help' for instructions."
echo ""

# Main game loop
while true; do
  # Display current conclusion and options
  echo "Current conclusion: $conclusion"
  echo "1. ???  2. JUMP AGAIN  3. STRIKE OUT  4. COULD BE"
  echo "5. LOOSE ONE TURN  6. YES!  7. NO!  8. ACCEPT IT"
  echo "9. GO WILD  10. ONE STEP BACK  11. THINK AGAIN  12. MOOT!"

  # Get player input
  read -p "What's your next move? " choice

  # Handle player input
  case $choice in
    1) conclusion=0;;
    2) conclusion=$conclusion;;
    3) conclusion=0; turns=$((turns+1));;
    4) conclusion=$conclusion;;
    5) turns=$((turns+1));;
    6) conclusion=$((conclusion+1));;
    7) conclusion=$((conclusion-1));;
    8) echo "You have accepted your current conclusion.";;
    9) conclusion=$((RANDOM % 12 + 1));;
    10) conclusion=$((conclusion-1));;
    11) conclusion=$conclusion;;
    12) echo "The current conclusion is moot.";;
    help) echo "The game is simple, select a number corresponding to a conclusion to jump to it.";;
    *) echo "Invalid input. Type 'help' for instructions.";;
  esac

  # Check for game over
  if [ $turns -ge 10 ]; then
    echo "Game over! You took too many turns."
    break
  fi
done
