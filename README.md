# Theory-of-Algorithms-Project

**Student Name:** Gary McHugh <br />
**Student ID:** G00308668 <br />
**Module:** Theory of Algorithms<br />
**Lecturer:** Dr Ian McLoughlin <br />

___

# Introduction	

### Technologies Used:

+ **Operating System:** Windows 10
+ **IDE:** DrRacket
+ **Programming Language:** Racket
+ **Hosting Site:** GitHub
+ **Documentation:** ReadMe.md and GitHub Wiki
+ **Additional:** GitHub Issues, ZenHub Boards (Kanban board)


### Deployment Details
Follow the steps below to run this project:

1. Download [DrRacket](https://download.racket-lang.org/) for your desired operation system and run the installer.
2. Download a zip file of this project and unzip it or download [Git] (https://git-scm.com/downloads) and execute the following command in the Git Bash Console
	```
	git clone https://github.com/GaryMcHugh/Theory-of-Algorithms-Project.git
	```
3. Open this project within DrRacket
4. Press CTRL + R <kbd>ctrl</kbd> + <kbd>r</kbd> To run the code

### What is the Countdown Numbers Game
The Countdown Numbers Game is a numerical based game that is featured on the popular television gameshow Countdown which first aired on Channel 4 in 1982. It originated from a French version of the gameshow called 'Des chiffres et des lettres' which translates to 'Numbers and Letters', it along with Countdown is one of the longest running gameshows in the world. The game contains a collection of 24 numbers, 6 of those numbers are then selected by the contestant. A target number is then generated between 101-999, The contestants have 30 seconds to get as close to the target number as possible using those six numbers. They may only use each number once and only the addition, subtraction, multiplication and division operators can be applied to the numbers. The contestants do not have to use all of the numbers. For more information, checkout the [Wikipedia](https://en.wikipedia.org/wiki/Countdown_(game_show)#Numbers_round) page.

Example:
> List of numbers: {1, 2, 3, 4, 5, 6}

> Target Number: 110

> Solution: ((3×6)+4)×5

### Rules of the game
+ 6 numbers are randomly selected from the set of 24 numbers
+ The set of 24 numbers is {1 , 1 , 2 , 2 , 3 , 3 , 4 , 4 , 5 , 5 , 6 , 6 , 7 , 7 , 8 , 8 , 9 , 9 , 10 , 10, 25 , 50 , 75 , 100}
+ A target number is generated between 101 and 999
+ The contestants are given 30 seconds to get as close to the target number as possible
+ They may only use the following 4 operators: +, -, x, ÷
+ Not all digits need to be used
+ Each digit may only be used once
+ Negative numbers and Fractions are not allowed
+ If the same number appears twice in the list of six then it may be used twice

Rules adapted from [datagenetics](http://datagenetics.com/blog/august32014/index.html)
### Summary of Project
The project should contain a solution that contains a function that will take two arguments. First, a target number between 101 and 999 and second, a list of six numbers that have been randomly selected from the set of numbers. The function should return a way of calculating the target number using the six selected numbers by applying the operators *, +, - / . The target number should be randomly generated in the program so that it is different each time. The six numbers should be randomly selected from the list of all possible values. It should not contain the same number twice i.e. he number 25 may not be selected twice as it only appears once in the list. As stated in the rules the solution may not use fractions in its calculation and it may not use negative numbers in its solution.

### Quantifying the problem
#### Selecting the list of 6 numbers
According to [crosswordtools](https://www.codeproject.com/Articles/740035/Countdown-Number-Puzzle-Solver) there are 13243 different possible ways of representing an ordered list of six numbers. The calculation which they have used is shown below:

> 3 duplicate numbers:
> aabbcc : 10C3 = 120 possibilities 

> 2 duplicate numbers:
> aabbcA : 10C34C13C2 = 120x4x3 = 1440 possibilities

> aabbcd : 10C44C2 = 210x6 = 1260 possibilities

> aabbAB : 10C24C2 = 45x6 = 270 possibilities

> 1 duplicate number:
> aabcde : 10C55C1 = 252x5 = 1260 possibilities

> aabcdA : 10C44C14C1 = 210x4x4 = 3360 possibilities

> aabcAB : 10C34C23C1 = 120x6x3 = 2160 possibilities

> aabABC : 10C24C32C1 = 45x4x2 = 360 possibilities

> aaABCD : 10C1 = 10 possibilities

> All numbers different:
> abcdef : 10C6 = 210 possibilities

> abcdeA : 10C54C1 = 252x4 = 1008 possibilities

> abcdAB : 10C44C2 = 210x6 = 1260 possibilities

> abcABC : 10C34C3 = 120x4 = 480 possibilities

> abABCD : 10C2 = 45 possibilities


> 120+1440+1260+270+1260+3360+2160+360+10+210+1008+1260+480+45=13243 possible combinations.

#### Combining that with target number
Therefore, given the integers 100 to 999 as target numbers, there are 13243 * 900 = 11,918,700 different puzzles to solve.
If 100 is excluded as it is in our solution, there are 11,905,457 different puzzles to solve.
Source: [Countdown Numbers report](http://ccg.doc.gold.ac.uk/papers/colton_aisb14a.pdf)
#### The number of equations
It's the sum of the number of equations for each number of tiles k, where k is the number of numbers used in the equation. If there are no duplicate tiles, then this is straight forward. Using the formula found on [code project](https://www.codeproject.com/Articles/740035/Countdown-Number-Puzzle-Solver)

> k = 2 n = 15*2*1*4 = 120

> k = 3 n = 20*6*2*16 = 3840

> k = 4 n = 15*24*5*64 = 115,200

> k = 5 n = 6*120*14*256 = 2,580,480

> k = 6 n = 1*720*42*1024 = 30,965,760

>120 + 3840 + 115200 + 2580480 + 30965760 = 33,665,400 

This means that there are roughly 34 million equations to be evaluated for each game.
### How it works
