# Theory-of-Algorithms-Project

**Student Name:** Gary McHugh <br />
**Student ID:** G00308668 <br />
**Module:** Theory of Algorithms<br />
**Lecturer:** Dr Ian McLoughlin <br />

___

# Introduction	

###Technologies Used:

+ **Operating System:** Windows 10
+ **IDE:** DrRacket
+ **Programming Language:** Racket
+ **Hosting Site:** GitHub
+ **Documentation:** ReadMe.md and GitHub Wiki
+ **Additional:** GitHub Issues, ZenHub Boards (kanban board)


###Deployment Details
Follow the steps below to run this project:

1. Download [DrRacket](https://download.racket-lang.org/) for your desired operation system and run the installer.
2. Download a zip file of this project and unzip it or download [Git] (https://git-scm.com/downloads) and execute the following command in the Git Bash Console
	```
	git clone https://github.com/GaryMcHugh/Theory-of-Algorithms-Project.git
	```
3. Open this project within DrRacket
4. Press CTRL + R <kbd>ctrl</kbd> + <kbd>r</kbd> To run the code

###What is the Countdown Numbers Game
The Countdown Numbers Game is a numerical based game that is featured on the popular television gameshow Countdown which first aired on Channel 4 in 1982. It originated from a French verison of the gameshow called 'Des chiffres et des lettres' which translates to 'Numbers and Letters', It along with Countdown is one of the longest running gameshows in the world. The game contains a collection of 24 numbers, 6 of those numbers are then selected by the contestant. A target number is then generated between 101-999, The contestants have 30 seconds to get as close to the target number as possible using those six numbers. They may only use each number once and only the addition, subtraction, multiplication and division operators can be applied to the numbers. They do not have to use all numbers. For more information, checkout the [Wikipedia](https://en.wikipedia.org/wiki/Countdown_(game_show)#Numbers_round) page.

Example:
> List of numbers: {1, 2, 3, 4, 5, 6}
> Target Number: 110
> Solution: ((3×6)+4)×5

###Rules of the game
+ 6 numbers are randomly selected from the set of 24 numbers
+ The set of 24 numbers is {1 , 1 , 2 , 2 , 3 , 3 , 4 , 4 , 5 , 5 , 6 , 6 , 7 , 7 , 8 , 8 , 9 , 9 , 10 , 10, 25 , 50 , 75 , 100}
+ A target number is generated between 101 and 999
+ The contestants are given 30 seconds to get as close to the target number as possible
+ They may only use the following 4 operators: +, -, x, ÷
+ Not all digits need to be used
+ Each digit may only be used once
+ Negative numbers and Fractions are not allowed
+ If the same number appears twice in the list of six then it may be used twice

###Summary of Project

###How it works