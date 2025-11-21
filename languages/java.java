// THIS CODE IS WRITTEN IN JAVA PROGRAMMING LANGUAGE

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int secret = (int)(Math.random() * 10) + 1;
        int tries = 0;

        while (true) {
            System.out.println("Guess a number between 1 - 10:");
            
            int guess;

            try {
                guess = Integer.parseInt(sc.nextLine());
            } catch (Exception e) {
                continue;
            }

            tries++;

            if (guess == secret) {
                System.out.println("You guessed the right number. Well done.");
                System.out.println("Attempts: " + tries);

                break;
            } else if (guess < secret) {
                System.out.println("Number is too low. Try again!");
            } else {
                System.out.println("Number is too high. Try again!");
            }
        }
        
        sc.close();
    }
}
