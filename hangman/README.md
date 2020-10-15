A Hangman game using ruby!
---
Hangman is a game for two or more players. One player thinks of a word and the other(s) tries to guess it by suggesting letters within a certain number of guesses. In the case of this game, the player has just 8 guesses.

What is this?
---
As can be expected, this is a Hangman game using Ruby from the console using OOP. The game features a save and load game options. The save files are stored in the save_file.yaml. To run the game the main.rb file is the one that needs to be opened. THe other two files (GameObj.rb and logicMethods.rb) contain the code of the game class and the methos used in the main file to run the game.

What I have learned?
---
1.The idea behind OOP programming is becoming more clear with each proyect, that's nice. other codes that i have seen contain all the logic of the game behind the class, but this, in my opinion, makes too convoluted the code that makes it really hard to understand. I tried to limit the methods of the game class to just those that represent the behaviour of composing and analising  the game. I think this is the correct way, but I could be easily mistaken, I'm a rookie after all! On the other part, I think this is my best usage of OOP at the moment (15/10/20).

2.Beware of the freaking rubocop. I know that the recomendation in TOP where to be confident about the sugestions, but this broke my code so horribly and made it look so weird (the indentation was and is a mess) that almost lost my mind. the worst part is that i did the rubocop check, got the commit, did it again, that when i noticed the bugg was already too late. My last save was from an hour ago. So for these reason the final code contains some of the suggestion of rubocop that make the code look uglier than it really is...

Things to do
---
There is a bugg in the game that appears when you save the game and, inmediatly try to load that saved game. For the moment I don't have a remote idea why this is happenning, so it will stay for the moment.

About me
---
I'm a philosopher that's learning to code following The Odin Proyect.