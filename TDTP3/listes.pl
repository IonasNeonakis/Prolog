/*
Exercice 2 
8)
compte(+L, ?N) est vrai si N est le nombre d’éléments dans la liste L 
*/

compte([],0).

compte([_|Q],N):- compte(Q,F), N is F+1. 

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


nieme2(1,[X|_],X):-!.

nieme2(N,[_|T],X):- nieme2(A,T,X), N is A+1.

/*
12)
occurrence(+L,+X, ?N) est vrai si N est le nombre de fois où X est présent dans la liste L.
*/

occurrence([],_,0).

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

retourne(L1,L2):- retourne(L1,L2,[]).

retourne([],L2,L2).
retourne([H|T],L2,Res):- retourne(T,L2,[H|Res]).




/*
17)
selection(+L,+LI,-R) est vrai si R est la liste composée des éléments de L ayant l’indice dans LI. 
Par exemple selection([a,b,c,d,e],[1,3,5],R) réussit avec R=[a,c,e].
*/


selection(_,[],[]):-!.

selection(L,[H|T],[P|L2]):- nieme1(H,L,P), selection(L,T,L2). 

%ou selection(L,[H|T],R):- nieme1(H,L,P), selection(L,T,L2), R=[P|L2]. 



/*
18)
aplatir(+LL, -L) est vrai si L est la liste LL aplatie. La liste LL est composée de constantes ou de nombres. Par exemple aplatir([a,[[2],[3]]],L) réussit avec L=[a,2,3].
Vous pouvez utiliser les prédicats prédéfinis atomic(T) qui réussit si T est une constante ou un nombre, list(T) qui réussit si T est une liste.

*/

aplatir([],[]).

aplatir([H|T],L):- aplatir(H,H1), aplatir(T,T1), append(H1,T1,L).

aplatir([H|T1], [H|T2]):- H\=[], H\=[_|_], aplatir(T1,T2).


/*
-------------------------------------------------------------------------------------EXERCICE 3 
*/


/*
1)

Ecrire un prédicat triee(+L) qui réussit si L est une liste triée dans l’ordre croissant, échoue sinon.
Par exemple triee([4,6,8]) réussit et triee([4,2,6,8]) échoue.


*/


triee([]):-!.


triee([_|[]]):-!.

triee([A,B|T]):- A=<B, L=[B|T],triee(L).


/*
2)
Ecrire un prédicat insert(+X,+L,-R) pour insérer un entier X dans une liste L, que l’on suppose triée, de telle façon que la liste résultat R soit triée. 
Par exemple insert(7,[3,6,10],R) réussit avec R=[3,6,7,10].

*/

insert(X,[],[X]):-!.

insert(X, [H1 | T], [X, H1 | T ]):- X =< H1, !.

insert(X,[H|T1],[H|T2]):-insert(X,T1,T2). 




/*
3)
Ecrire un prédicat tri_insert(+L,-R) pour trier une liste d’entiers L en une liste triée R, par un tri par insertion :
— La liste vide est triée.
— Pour trier la liste [N—L] on commence par trier L, puis on insère N dans le résultat en respectant
l’ordre croissant des éléments.
*/

tri_insert([],_,_):-!.

tri_insert([H1|T],L,R):- insert(H1,L,R), tri_insert(T,L,R).

tri_insert(L1,L2):-tri_insert(L1,[],L2).






















