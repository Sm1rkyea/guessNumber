// THIS CODE IS WRITTEN IN JAVASCRIPT PROGRAMMING LANGUAGE

const readline = require("readline");

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

let secret = Math.floor(Math.random() * 10) + 1;
let tries = 0;

function ask() {
    rl.question("Guess a number between 1 - 10:\n", (input) => {
        let guess = parseInt(input, 10);
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
