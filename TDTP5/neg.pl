pair(X):-0 is X mod 2.

filtre([],_,[]).

filtre([H|T],NP,[H|LT]):- Pred=..[NP,H], call(Pred),!,filtre(T,NP,LT).

filtre([_|T],NP,LT):- filtre(T,NP,LT).


/*Exercice 2*/

/*Question 2*/

addition(X,Y,Z):- Z is X+Y.

soustraction(X,Y,Z):- Z is X-Y.

multiplication(X,Y,Z):- Z is Y*X.

division(X,Y,Z):- Z is X/Y.


appliquer([],_,[]).

appliquer([X],_,[X]):-!.

appliquer([H1,H2|T],NP,[Z|TL]):- Pred=..[NP,H1,H2,Z], call(Pred), appliquer(T,NP,TL).

/*Question  3*/


eval(X,_,X):- number(X),!.

eval(X,L,V):-member((X,V),L), !.

 
/*VOIR SUR CELENE POUR LA CORRECTION*/



