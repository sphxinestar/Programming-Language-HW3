path(X,Y,_):-
	edge(X,Y).
path(X,Y,V):-
	edge(X,Z),
	not(member(Z,V)),
	path(Z,Y,[X|V]).  %製作關係圖

buildrelation(M,N):- %先把關係建立好
	N > 0
	->
		readln(X),readln(Y),
		assert(edge(X,Y)),assert(edge(Y,X)), %1跟2有關係等於2跟1有關係
		NN is N-1,
		buildrelation(M,NN)
	;true.

query(Q):-
	Q > 0
	->
		readln(X),readln(Y),
		tfpath(X,Y),
		QQ is Q-1,
		query(QQ)
	;true.

tfpath(X,Y):-
	path(X,Y,[]),write('Yes'),nl
	;write('No'),nl.

main:-
	readln(M),readln(N),%N是邊的數量代表要做幾次關係
	buildrelation(M,N),
	readln(Q),
	query(Q),halt.

:- initialization(main).

%這裡其實有點不知道為何要輸入有幾個nodes 結果好像也沒有用到...
%整體來說跟第二題有點類似的題目
