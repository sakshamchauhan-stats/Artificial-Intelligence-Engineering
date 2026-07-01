% Prolog Program 2: Writing the Knowledge Base using Facts and Rules & Querying. Focusing on relations
 
%****************************************************************************************
% Part A)
% Consider the following facts, rules and goals

% Facts
% John and Mary are parents of Alice and Ben.
parent(john,alice).
parent(mary,alice).
parent(john,ben).
parent(mary,ben).
% Alice has one child, Rose.
parent(alice,rose).
% Ben has two children, Jack and Lily.
parent(ben, jack).
parent(ben, lily).

% Rules
% X is child of Y if Y is parent of X.
child(X,Y) :- parent(Y,X).
% X is sibling of Y if C is parent of both X and Y, and X <> Y
sibling(X,Y) :- parent(C,X),parent(C,Y),X\==Y.
% X is grandparent of Y if C is parent of Y, and X is parent of C
grandparent(X,Y) :- parent(C,Y), parent(X,C).

% Queries
% 1. Who are the children of John?
% ?- child(X,john).
% Returns: alice, ben

% 2. Who are the siblings of Alice?
% ?- sibling(X,alice).
% Returns: ben

% 3. Who are the grandchildren of Mary?
% ?- grandparent(mary,X).
% Returns: rose, jack, lily

% 4. Who is the parent of Rose?
% ?- parent(X,rose).
% Returns: alice
