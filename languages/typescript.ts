// THIS CODE IS WRITTEN IN TYPESCRIPT PROGRAMMING LANGUAGE

import * as readline from "readline";

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let secret: number = Math.floor(Math.random() * 10) + 1;
let tries: number = 0;

function ask(): void {
    rl.question("Guess a number between 1 - 10:\n", (input: string) => {
        let guess: number = parseInt(input, 10);
        tries++;

        if (guess === secret) {
            console.log("You guessed the right number. Well done.");
            console.log("Attempts:", tries);
            rl.close();
        } else if (guess < secret) {
            console.log("Number is too low. Try again!");
            ask();
        } else {
            console.log("Number is too high. Try again!");
            ask();
        }
    });
}

ask();