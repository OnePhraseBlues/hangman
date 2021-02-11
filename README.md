# hangman

Assignment:
-6 misses is traditional threshhold
-can add more by drawing the gallows or face. Also a line between the head and body.
-script wants to draw a random word between 5 and 12 letters
-notify user of how many guesses are left and track incorrect guesses
-implement functionality to save and load game state. Load game state should be option when program first boots.

To-do list:
-Objects: game board, gallows, container for missed guesses
-Logic: random draw from dictionary, game flow
-Deserialization from dictionary to game board
-Serialization of game state (likely using JSON)
