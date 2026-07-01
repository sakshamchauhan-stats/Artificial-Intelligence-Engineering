% Prolog Program 5: Writing the Knowledge Base using Facts and Rules & Querying. 
% Focusing on manager employee relationship
 
%****************************************************************************************
% Part A)
% Consider the following facts, rules and goals

% Facts
% Mr. Thomas is the manager of Alice and Ben.
manager(thomas,alice).
manager(thomas,ben).
% Alice works in the marketing department.
works(alice,marketing).
% Ben works in the finance department.
works(ben,finance).
% Dr. Clara provides training sessions for all employees in both departments.
train(clara,ben).
train(clara,alice).
train(clara,thomas).

% Rules
department_manager(X,Y):-manager(X,Z),works(Z,Y).
trainer(X,Y):-train(X,Y).


% Queries
% Who is the manager of the finance department?
% ?- department_manager(X,finance).
% Who works in the marketing department?
% ?- works(X,marketing).
% Who conducts the training sessions?
% ?- trainer(X,_).
% Which department does Ben belong to?
% ?- works(ben,X).