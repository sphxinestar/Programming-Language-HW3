ancestor(A,B):-
	parent(A,B). %A是B的父母那A是B的祖先
ancestor(A,B):-
	parent(X,B),ancestor(A,X). %如果x是B的parent,且A是x的祖先那麼A就是B的祖先

lca(A,B):-
	A==B -> write(A),nl; %AB相等的話選A
	ancestor(A,B) -> write(A),nl; %A是B的祖先那選A
	parent(X,A),lca(X,B),nl.

buildtree(A):- %將你給的樹建好
	A > 0 
	->
		readln(T1),readln(T2),
		assert(parent(T1,T2)),
		AA is A -1,
		buildtree(AA)
	;true. %建好tree之後回傳true
query(A):-
	A > 0 
	->
		readln(T1),readln(T2),
		lca(T1,T2),
		AA is A -1,
		query(AA)
	;true.
main:-
	readln(X),
	Y is X-1, %因為會執行的指令會比你給的Node數-1
	buildtree(Y),
	readln(Z), %準備做query
	query(Z),halt.

:- initialization(main).

%最重要的地方是要記得使用->之後要有一個;true.才會回傳,不然會卡死在函式裡面＝＝
