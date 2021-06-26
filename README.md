# COMP90048 Declarative Programming, S1 2021, Project 1 - Math Puzzles

### Problem description
You will write Prolog code to solve maths puzzles. Your program should supply a predicate puzzle_solution(Puzzle) that holds when Puzzle is the representation of a solved maths puzzle.

A maths puzzle will be represented as a list of lists, each of the same length, representing a single row of the puzzle. The first element of each list is considered to be the header for that row. Each element but the first of the first list in the puzzle is considered to be the header of the corresponding column of the puzzle. The first element of the first element of the list is the corner square of the puzzle, and thus is ignored.

You can assume that when your puzzle_solution/1 predicate is called, its argument will be a proper list of proper lists, and all the header squares of the puzzle (plus the ignored corner square) are bound to integers. Some of the other squares in the puzzle may also be bound to integers, but the others will be unbound. When puzzle_solution/1 succeeds, its argument must be ground. You may assume your code will only be tested with proper puzzles, which have at most one solution. Of course, if the puzzle is not solvable, the predicate should fail, and it should never succeed with a puzzle argument that is not a valid solution. For example,
your program would solve the above puzzle as below:

    ?- Puzzle=[[0,14,10,35],[14,_,_,_],[15,_,_,_],[28,_,1,_]], puzzle_solution(Puzzle).
    Puzzle = [[0, 14, 10, 35], [14, 7, 2, 1], [15, 3, 7, 5], [28, 4, 1, 7]] ;
    false.

Your puzzle_solution/1 predicate, and all supporting code, should be written in the file proj2.pl. You may also use Prolog library modules supported by SWI Prolog as installed on the server, which is version 7.2.3. You may, but need not, use SWI Prolog’s Constraint Logic Programming facilities to solve the problem.
