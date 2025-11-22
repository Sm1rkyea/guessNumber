// THIS CODE IS WRITTEN IN C
// Run this code easily online at https://www.onlinegdb.com/online_c_compiler

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    srand(time(NULL));

    int secret = rand() % 10 + 1;
    int tries = 0;
    int guess;

    while (1) {
        printf("Guess a number between 1 - 10:\n");

        if (scanf("%d", &guess) != 1) {
            int ch;
            while ((ch = getchar()) != '\n' && ch != EOF);
            
            continue;
        }

        tries++;

        if (guess == secret) {
            printf("You guessed the right number. Well done.\n");
            printf("Attempts: %d\n", tries);
            break;
        } else if (guess < secret) {
            printf("Number is too low. Try again!\n");
        } else {
            printf("Number is too high. Try again!\n");
        }
    }

    return 0;
}