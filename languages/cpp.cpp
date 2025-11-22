// THIS CODE IS WRITTEN IN C++

#include <iostream>
#include <ctime>

using namespace std;

int main() {
    srand(time(0));

    int maxNumber = 10;
    int number = rand() % (maxNumber + 1);
    int attempts = 0;
    int guess;

    cout << "Guess a number between 0 and " << maxNumber << ": \n";

    do {
        cin >> guess;
        attempts++;

        cout << "The number you guessed is too " << (guess < number ? "low" : "high") << "! Try again: \n";
    } while (guess != number);

    cout << "Congratulations! You guessed the number " << number << " in " << attempts << " attempts." << endl;

    return 0;
}
