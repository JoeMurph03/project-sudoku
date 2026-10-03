% QUESTION 2
% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

%Think for this solution all i need to do is change the numbers from 4 to 9 and subgrid size to 3

% describe board
row(1..9).
col(1..9).
num(1..9).

#const subgridSize = 3.

% Yes that worked

%need to create subgrid rules??, easier way to do this but will hardcode for now

subgrid(X, Y, (1+(((X-1)/subgridSize)*subgridSize)+(Y-1)/subgridSize)) :- row(X), col(Y).



{sudoku(X, Y, N): num(N)} = 1 :- row(X), col(Y).

sudoku(X, Y, N) :- initial(X, Y, N).


:- sudoku(X, Y1, N), sudoku(X, Y2, N), Y1 != Y2.
:- sudoku(X1, Y, N), sudoku(X2, Y, N), X1 != X2.

:- sudoku(X1, Y1, N), sudoku(X2, Y2, N), subgrid(X1, Y1, G), subgrid(X2, Y2, G), (X1, Y1) != (X2, Y2).

#show sudoku/3.
