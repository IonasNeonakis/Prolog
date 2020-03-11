/*
REPRISE DU TD1
*/
:-consult(arbreGen).
%analyse(+L)

analyse(L):-delta(L,1),!.

delta([qui|L],1):-delta(L,2).

delta([est|L],2):-delta(L,3).

delta([le|L],3):-delta(L,4).
delta([l|L],3):-delta(L,5).
delta([la|L],3):-delta(L,10).

delta([frere|L],4):-delta(L,6).
delta([neveu|L],4):-delta(L,6).
delta([pere|L],4):-delta(L,6).
delta([grand_pere|L],4):-delta(L,6).

delta([oncle|L],5):-delta(L,6).
delta([enfant|L],5):-delta(L,6).
delta([ancetre|L],5):-delta(L,6).

delta([mere|L],10):-delta(L,6).
delta([soeur|L],10):-delta(L,6).
delta([cousine|L],10):-delta(L,6).
delta([tante|L],10):-delta(L,6).
delta([grand_mere|L],10):-delta(L,6).

delta([d|L],6):-delta(L,7).
delta([de|L],6):-delta(L,8).
delta([du|L],6):-delta(L,4).

delta([andre|L],7):-delta(L,9).
delta([augustine|L],7):-delta(L,9).

delta([l|L],8):-delta(L,5).
delta([la|L],8):-delta(L,10).
delta([X|L],8):-X\=augustine, X\=andre, delta(L,9).

delta([],9).

