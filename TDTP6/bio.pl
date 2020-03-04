	
bio(louis13, h, 1601, 1643, henri4, marie_medicis).
bio(elisabeth_france, f, 1603, 1644, henri4, marie_medicis).
bio(marie_therese_autriche, f, 1638, 1683, philippe4, elisabeth_france).
bio(louis14, h, 1638, 1715, louis13, anne_autriche).
bio(grand_dauphin, h, 1661, 1711, louis14, marie_therese_autriche).
bio(louis_bourbon, h, 1682, 1712, grand_dauphin, marie_anne_baviere).
bio(philippe5, h, 1683, 1746, grand_dauphin, marie_anne_baviere).
bio(louis15, h, 1710, 1774, louis_bourbon, marie_adelaide_savoie).
bio(louis_dauphin, h, 1729, 1765, louis15, marie_leczcynska).
bio(louis16, h, 1754, 1793, louis_dauphin, marie_josephe_saxe).
bio(louis18, h, 1755, 1824, louis_dauphin, marie_josephe_saxe).
bio(charles10, h, 1757, 1836, louis_dauphin, marie_josephe_saxe).
bio(clotilde, f, 1759, 1802, louis_dauphin, marie_josephe_saxe).
bio(louis17, h, 1785, 1795, louis16, marie_antoinette).
bio(philippe1, h, 1640, 1701, louis13, anne_autriche).
bio(philippe2, h, 1674, 1723, philippe1, charlotte_baviere).
bio(louis_orleans, h, 1703, 1752, philippe, francoise_marie_bourbon).
bio(louis_philippe, h, 1725, 1785, louis_orleans, augusta_marie_bade).
bio(philippe_egalite, h, 1747, 1793, louis_philippe, louise_henriette_bourbon_conti).
bio(louis_philippe1, h, 1773, 1850, philippe_egalite, louise_marie_adelaide_bourbon).


/*Exercice 1*/

/*1*/

les_femmes(X):-bio(X,f,_,_,_,_).

/*2*/
compter_femmes(L,T):- findall(X,(bio(X,f,_,_,_,_), bio(_,_,_,_,_,X)),L), length(L,T).

/*3*/

nees(L,N):- findall(X,(bio(X,_,A,_,_,_), A>=1700, A=<1800),L), length(L,N).


/*4*/

enf_hen(L):- findall(E,(bio(E,f,_,_,henri4,_), bio(_,_,_,_,_,E)),L).

/*Partie 2 exercice 1*/

/*1*/

enfant(E,P):- bio(E,_,_,_,P,_) ; bio(E,_,_,_,_,P).

ptenfant(E,GP):- enfant(E,P), enfant(P,GP).

descendant(D,A):- enfant(D,A).

descendant(D,A):- enfant(Y,A), descendant(D,Y). 

/*1*/
ptfille_hen(L,N):- findall(PT,(ptenfant(PT,henri4), bio(PT,f,_,_,_,_)),L), length(L,N).

/*2*/

dhe(L,N):- setof(D,descendant(D,henri4),L), length(L,N).

/*3*/

aslouis17(L,N):- setof(A,descendant(louis17,A),L), length(L,N).

/*4*/

ashen4(L,N):- setof(A,descendant(henri4,A),L), length(L,N).


/*Exercice 2*/

/*1*/

fact(N,R):- 

