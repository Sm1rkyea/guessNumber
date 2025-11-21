# THIS CODE IS WRITTEN IN PYTHON PROGRAMMING LANGUAGE

import random

secret = random.randint(1, 10)
tries = 0

while True:
    print("Guess a number between 1 - 10:")

    try:
        guess = int(input())
    except:
        continue

    tries += 1

    if guess == secret:
        print("You guessed the right number. Well done.")
        print("Attempts:", tries)
        break
    elif guess < secret:
        print("Number is too low. Try again!")
    else:
        print("Number is too high. Try again!")