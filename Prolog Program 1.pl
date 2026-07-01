% Prolog Program 1: Writing the Knowledge Base using Facts and Rules and Querying
 
%****************************************************************************************
% Part A)
% Consider the following facts, rules and goals

% charlie studies csc 135
studies(charlie, csc135).
% olivia studies csc 135
studies(olivia, csc135).
% jack studies csc131
studies(jack,csc131).
% arthur studies csc134
studies(arthur, csc134).

% kirke teaches csc135
teaches(kirke, csc135).
% collins teaches csc131
teaches(collins, csc131).
% collins teaches csc171
teaches(collins, csc171).
% juniper teacher csc134
teaches(juniper, csc134).


% rules
% X is a professor of Y if X teaches C and Y studies C
professor(X,Y) :- teaches(X,C),studies(Y,C).
    
    
% queries
% ?- studies(charlie, X). charlie studies what? returns: csc
% ?- professor(kirke, X). who are the students of kripke? returns: charlie, olivia

%****************************************************************************************
% Part B)

% Bob is a child of pam and tom, and bob also has two children — ann and pat. 
% Bob has one brother liz, whose parent is also tom.
% Write queries to answer the following questions:
% Who are parents of bob?
% Who are children of bob?
% Who are siblings of bob?

% Facts
parent(pam,bob).
parent(tom, bob).
parent(bob,ann).
parent(bob,patt).
parent(tom,liz).
brother(bob,liz).
brother(liz,bob).

% Rules
sibling(X,Y) :- parent(C,X),parent(C,Y),X\==Y. % X is sibling of Y
child(X,Y) :- parent(Y,X). % X is child of Y

% Queries
% ?- parent(X,bob).
% returns pam, tom

% ?- child(X, bob).
% retunrs ann and patt

% ?-sibling(X, bob).
% returns liz


