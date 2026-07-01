% Prolog Program 3: Writing the Knowledge Base using Facts and Rules & Querying. Focusing on relations
 
%****************************************************************************************
% Part A)
% Consider the following facts, rules and goals

% Facts:
% Mark and Susan are parents of Emma and Jake.
parent(mark, emma).
parent(susan, emma).
parent(mark, jake).
parent(susan, jake).
% Emma and David have two children — Mia and Ryan.
parent(emma, mia).
parent(david, mia).
parent(emma, ryan).
parent(david, ryan).
% Jake has one child — Noah.
parent(jake, noah).
% Emma is married to David.
couple(emma, david).

% Rules
grandparent(X,Y):-parent(X,Z),parent(Z,Y).
sibling(X,Y):- parent(W,X),parent(W,Y),X\==Y.
uncle(X,Y):- parent(Z,Y),sibling(Z,X).
cousin(X,Y):- parent(Z,X),parent(W,Y),sibling(Z,W).


%1. Who are the parents of Emma?
% ?- parent(X, emma).
%2. Who are the children of Emma?
% ?- parent(emma,X).
%3. Who are the grandchildren of Mark?
% ?- grandparent(mark, X).
%4. Who is the uncle of Mia?
% ?- uncle(X,mia).
%5. Who are the cousins of Ryan?
% ?- cousin(X,ryan).
