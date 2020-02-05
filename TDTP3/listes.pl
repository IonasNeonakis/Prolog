/*
Exercice 2 
8)
compte(+L, ?N) est vrai si N est le nombre d’éléments dans la liste L 
*/

compte([],0).

compte([T|Q],N):- compte(Q,F), N is F+1. 

/*
9)
somme(+L, ?N) est vrai si N est la somme des éléments de la liste d’entiers L
*/

somme([],0).

somme([H|T],N):-somme(T,Z), N is H+Z.

/*
10)
nieme1(+N,+L, ?X) est vrai si X est le N-ème élément de la liste L.
*/

nieme1(1,[H|_],H):- ! .

nieme1(N,[_|T],X):- K is N-1, nieme1(K,T,X).

/*
11)
nieme2( ?N,+L,+X) est vrai si X est le N-ème élément de la liste L. (Attention à la spécification du prédicat.)
*/


nieme2(1,[X|T],X):-!.

nieme2(N,[_|T],X):- nieme2(A,T,X), N is A+1.

/*
12)
occurrence(+L,+X, ?N) est vrai si N est le nombre de fois où X est présent dans la liste L.
*/

occurrence([],X,0).

occurrence([H|T],H,N):-occurrence(T,H,Z), N is Z+1, !.

occurrence([H|T],X,N):-H=\=X, occurrence(T,X,N).

/*
13)
sous_ensemble(+L1,+L2) est vrai si tous les éléments de la liste L1 font partie de la liste L2.
*/

sous_ensemble([],_).


sous_ensemble([H1|T1],L2):- occurrence(L2,H1,K), K>0, sous_ensemble(T1,L2).


/*
14)
substitue(+X,+Y,+L1,-L2) est vrai si L2 est le résultat du remplacement de X par Y dans L1.
*/


substitue(_,_,[],[]).

substitue(X,Y,[X|T],L2):-  substitue(X,Y,T,L3), L2=[Y|L3], ! .

substitue(X,Y,[H|T],L2):-  substitue(X,Y,T,L3), L2=[H|L3].

/*
15)ajoute_fin(+X,+L1,-L2) est vrai si L2 est le résultat de l’ajout de X à la fin de la liste L1.
*/



ajoute_fin(X,[],[X]):-!.

ajoute_fin(X,[H|T],[H|L2]):- ajoute_fin(X,T,L2).
 
%ou ajoute_fin(X,[H|T],L2):- ajoute_fin(X,T,L3), L2=[H|L3].



/*
16) A REFAIRE NE MARCHE PAS DU TOUT
retourne(+L1,-L2) est vrai si la liste L2 est la liste L1 dans l’ordre inverse.
*/


retourne([],_).

retourne([H|T],L2):- retourne(T,L3), L2=[L3,H].




/*
17)
selection(+L,+LI,-R) est vrai si R est la liste composée des éléments de L ayant l’indice dans LI. 
Par exemple selection([a,b,c,d,e],[1,3,5],R) réussit avec R=[a,c,e].
*/


selection(L,[H2|T2],R):-



