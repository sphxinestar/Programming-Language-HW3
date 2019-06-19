isPrime(2).
isPrime(3).
isPrime(N):- 
	integer(N), N>3, N mod 2 =\= 0, \+ has_factor(N,3). %判別一個數字是否為質數

has_factor(N,L):-
	N mod L =:= 0.
has_factor(N.L):-
	L * L < N, L2 is L + 2, has_factor(N,L2).

tfprime(A,B):-
	isPrime(A),
	isPrime(B).

find(X,Y):-
	terminal(X,Y), %若是X>Y那就停止執行(會重複)
	tfprime(X,Y) -> write(X),write(' '),write(Y),nl, %nl是換行的意思
	XX is X+1,YY is Y-1,find(XX,YY);XX is X+1,YY is Y-1,find(XX,YY).

terminal(A,B):-
	A > B -> halt
	; true.
	
main:-
	write('Input: '),
	readln(N),
	M is 2, %從2開始算就好 因為1不是質數
	X is N - M, %剛開始寫 N is N-M這種寫法似乎不行會有Bug
	find(M,X).

:- initialization(main).
