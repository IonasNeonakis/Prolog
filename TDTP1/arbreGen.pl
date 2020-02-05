homme(andre).
homme(berndard).
homme(clement).
homme(dudulle).
homme(damien).
homme(baptiste).
homme(cedric).
homme(didier).
homme(dominique).
homme(dagobert).
homme(babar).

femme(augustine).
femme(becassine).
femme(chantal).
femme(daniela).
femme(celestine).
femme(brigitte).
femme(charlotte).
femme(caroline).


enfants(babar,andre,augustine).
enfants(bernard,andre,augustine).
enfants(babar,andre,augustine).

enfants(brigitte,andre,augustine).
enfants(clement,bernard,becassine).
enfants(celestine,bernard,becassine).

enfants(dudulle,clement,chantal).
enfants(damien,clement,chantal).
enfants(daniela,clement,chantal).

enfants(cedric,brigitte,baptiste).
enfants(caroline,brigitte,baptiste).

enfants(didier,cedric,charlotte).
enfants(dagobert,cedric,charlotte).
enfants(dominique,cedric,charlotte).

/* qs sq dqs*/ 
enfant(babar,augustine).
enfant(babar,andre).
enfant(bernard,augustine).
enfant(bernard,andre).
enfant(babar,andre).
enfant(babar,augustine).
enfant(brigitte,andre).
enfant(brigitte,augustine).
enfant(clement,bernard).
enfant(clement,becassine).
enfant(celestine,becassine).
enfant(celestine,bernard).
enfant(dudulle,clement).
enfant(dudulle,chantal).
enfant(damien,clement).
enfant(damien,chantal).
enfant(daniela,chantal).
enfant(daniela,clement).
enfant(cedric,baptiste).
enfant(cedric,brigitte).
enfant(caroline,baptiste).
enfant(caroline,brigitte).
enfant(didier,charlotte).
enfant(didier,cedric).
enfant(dagobert,charlotte).
enfant(dagobert,cedric).
enfant(dominique,cedric).
enfant(dominique,charlotte).

/* Exercice 2*/
/*1*/
parent(Y,X):-
	enfant(X,Y).
/*2*/
fils(F,P):- enfant(F,P),
		homme(F).

fille(F,P):- enfant(F,P),
		femme(F).

pere(P,F):- enfant(F,P),
		homme(P).

mere(M,F):- enfant(F,M),
		femme(M).
/*3*/
grand_parent(G,PF):- enfant(PF,P),
			enfant(P,G).

petit_enfant(PE,G):- enfant(X,G),
			enfant(PE,X).

grand_pere(G,PF):- enfant(PF,P),
			enfant(P,G),
			homme(G).

grand_mere(G,PF):- enfant(PF,P),
			enfant(P,G),
			femme(G). 

petit_fils(PF,G):- enfant(X,G),
			enfant(PF,X),
			homme(PF).

petite_fille(PF,G):- enfant(X,G),
			enfant(PF,X),
			femme(PF).

/*4*/
frere_soeur(X,Y):-  pere(Z,X),
		pere(Z,Y),
		mere(T,X),
		mere(T,Y),
		X\==Y.

frere(X,Y):- pere(Z,X),
		pere(Z,Y),
		mere(T,X),
		mere(T,Y),
		X\==Y,
		homme(X).

soeur(X,Y):- pere(Z,X),
		pere(Z,Y),
		mere(T,X),
		mere(T,Y),
		X\==Y,
		femme(X).

/*5*/
oncle_tante(X,Y):- parent(Z,Y),
		frere_soeur(X,Z).


oncle(X,Y):- parent(Z,Y),
		frere_soeur(X,Z),
		homme(X).

oncle_tante(X,Y):- parent(Z,Y),
		frere_soeur(X,Z),femme(X).

/*6*/
cousin_cousine(X,Y):- oncle_tante(Z,X),
			enfant(Y,Z).

cousin(X,Y):- oncle_tante(Z,X),
		enfant(Y,Z),
		homme(X).


cousine(X,Y):- oncle_tante(Z,X),
		enfant(Y,Z),
		femme(X).

/*Exercice 3*/
/*1*/
ancetre(A,X):-
	enfant(X,A).

ancetre(A,X):-
	enfant(X,Y), ancetre(A,Y).

descadant(D,X):-
	enfant(D,X).

descadant(D,X):-
	enfant(Y,X), descadant(D,Y).

