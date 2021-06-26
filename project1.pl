/* COMP90048 S1, 2021 Project 1.
** Author: Hoang Viet Mai <vietm@student.unimelb.edu.au>.
** Purpose: Solve a given math puzzle.
*/

/* Dependencies. */
:- ensure_loaded(library(apply)).
:- ensure_loaded(library(clpfd)).

/* Unify the diagonal of the puzzle row by row, starting from the last row.
** Ignore the header row.
*/
valid_diagonal([_, [_, Elt|_]|_], Elt, 1).

valid_diagonal(Puzzle, Elt, Index) :-

    % Unify the current row's diagonal element with Elt, the benchmark element.
    nth0(Index, Puzzle, Row),
    nth0(Index, Row, DiagonalElt),
    DiagonalElt = Elt,
    
    % Move on to the previous row.
    Prev is Index - 1,
    valid_diagonal(Puzzle, Elt, Prev).
    
valid_diagonal(Puzzle) :-
    
    % Take the last row's diagonal element as benchmark.
    length(Puzzle, Length),
    Length > 1,
    Index is Length - 1,
    nth0(Index, Puzzle, Row),
    nth0(Index, Row, Elt),
    
    % Starting from the last row, unify the diagonal elements of the puzzle.
    valid_diagonal(Puzzle, Elt, Index).

/* Get the product of all elements in List. */
list_product([], A, A).

list_product([Head|Tail], A, Product) :-
    A1 #= Head * A,
    list_product(Tail, A1, Product).

/* Check if a given row's header holds the product of the remaining digits. */
row_product([Header|Elts]) :-
    list_product(Elts, 1, Header).

/* Check if a given row's header holds the sum of the remaining digits. */
row_sum([Header|Elts]) :-
    sum(Elts, #=, Header).
D
/* Check if a given non-header row satisfies all specified conditions. */
valid_row(Row) :-
    
    % Ignore the header element.
    Row = [_|NonHeaders],
    
    % Contains only integer from 1 to 9 inclusive.
    NonHeaders ins 1..9,
    
    % Contains no repeated digits.
    all_distinct(NonHeaders),
    
    % The header holds either the sum or the product of the remaining digits. 
    (row_sum(Row);
    row_product(Row)).

/* Solve a given puzzle. */
puzzle_solution(Puzzle) :-
    
    % Unify the diagonal.
    valid_diagonal(Puzzle),
    
    % Validate all rows except for the header row.
    Puzzle = [_|Rows],
    maplist(valid_row, Rows),
    
    % Transpose the puzzle to validate all columns except for the header column.
    transpose(Puzzle, TransposedPuzzle),
    TransposedPuzzle = [_|Columns],
    maplist(valid_row, Columns),
    
    % All conditions are satisfied, fill in the puzzle.
    maplist(label, Rows).
