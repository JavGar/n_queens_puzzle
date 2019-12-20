# n_quees_puzzle

An little application to solve N Queens Puzzle.

## Getting Started

This application works for Android an iOS.

To calculate the solutions enter the number of queens you want and

- In Android emulator: tap the action button in the keyboard
- In iOS emulator: press "intro" key

To search for stored solutions just enter the number of queen and tap "Search" button

Once the solutions have been calculated / obtained, a list of solutions is shown, when you touch one the application shows the solution on a chess board.

## How its work

Each time the application calculates the solutions for N queens, it tries to send the result to Firebase, if there is a previous result the current one is discarded.

Whe the user search for stored solution, the application try to get it from Firebase, if there isn't shows a message else list all the solutions

## References
- [N-queens problem](https://rosettacode.org/wiki/N-queens_problem#Dart)
- [One of the oldest chess based puzzles is known, affectionately, as The Eight Queens Problem.](http://datagenetics.com/blog/august42012/index.html)
