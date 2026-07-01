% Prolog Program 4: Writing the Knowledge Base using Facts and Rules & Querying. 
% Focusing on relations with genders
 
%****************************************************************************************
% Part A)
% Consider the following facts, rules and goals

% Facts 
% Ethan is the father of Lily and Noah.
% Grace is the mother of Lily and Noah.
parent(ethan,lily).
parent(ethan,noah).
parent(grace,lily).
parent(grace,noah).
male(ethan).
female(grace).
% Lily is married to Ryan.
% Noah is married to Ava.
couple(ethan,grace).
couple(lily,ryan).
couple(noah,ava).

% Rules
father(X,Y):-parent(X,Y),male(X).
mother(X,Y):-parent(X,Y),female(X).
sibling(X,Y):-father(W,X),father(W,Y),mother(Z,X),mother(Z,Y),X\==Y.
married(X,Y):-couple(X,Y).
father_in_law(X,Y):-father(X,W),couple(W,Y).

% Queries
% Who are Lily’s siblings?
% sibling(X,lily).
% Who is Ryan married to?
% ?- married(X,ryan).
% Who is the spouse of Grace?
% ?- married(X,grace).
% Who is the father-in-law of Ava?
% ?- father_in_law(X,ava).
