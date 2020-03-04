position(X,[X|_],1).

position(X,[H|T],N):-position(X,T,P), N is P+1.

