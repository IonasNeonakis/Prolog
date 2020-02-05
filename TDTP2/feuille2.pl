/*Exerice 1*/
/*1.*/
%somme(+X,+Y,?Z)
somme(X,Y,Z):- Z is X+Y.
/*2.*/
%max2(+X,+Y,?Z)
max2(X,Y,X):- X>=Y.
max2(X,Y,Y):- X<Y.

max3(X,Y,Z,M):- max2(X,Y,K), max2(Z,K,M).


/*Exerice 3*/
/*1.*/

afficher(N):-afficher(1,N).

afficher(X,N):- X=<N, write(X), nl, K is X+1, afficher(K,N).
afficher(X,N):- X>N.


/*2.*/

envers(X):-X>0, Y is X mod 10, write(Y), Z is X // 10, envers(Z).
envers(X):-X=<0.


/*3.*/

somme(0,0).
somme(N,X):-N>0, M is N-1, somme(M,Y), X is Y+N.

/*4.*/
fact(1,1).
fact(N,X):- N>1, K is N-1, fact(K,Y), X is Y*N.

/*5.*/
fibo(1,1).
fibo(0,0).
fibo(N,X):-N>1, J is N-1, K is N-2, fibo(J,R1) , fibo(K,R2), X is R1+R2.


/*6.*/
div(N,M):-N=<M.
div(N,M):-N=M.

div(N,M):-N>M, K is M-N, div(N,K).
