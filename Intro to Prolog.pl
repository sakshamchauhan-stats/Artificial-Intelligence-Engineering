% This program is to just give an introduction to Prolog Basics

% This is a comment

% let us write facts or predicates: Syntax: relation(ob1, ob2, ob3, ....)
likes(a,b).
likes(b,c).
likes(b,a).
% in the current example, likes is the predicate/relation name. Predicates must end with a full stop.

% Let us write rules: Syntax: rule_name(ob1, ob2, ...)  :- fact/rule(ob1, ob2, ....)
% Rule is written as pred1(x) if pred2(x)
% Rules are conditionally true. If the LHS is true, then RHS is also true
friends(X,Y):-likes(X,Y),likes(Y,X).
    
% Operators
% :- stands for if-then
% , stands for conjunction
% ; stands for disjunction
    
% queries are written as q- query

% There is no inherent way to express quantifiers in prolog
% Instead, it handles them implicitly through how facts and rules are interpreted.
% Every rule in Prolog is assumed to be universally quantified.
% ∀X (human(X) → mortal(X)) = mortal(X) :- human(X)
% Whenever you ask a query, Prolog implicitly assumes existential quantification.
% ?- mortal(X) = ∃X (mortal(X)) — “Is there any X such that X is mortal?”


% Variables in prolog are to be in uppercase

% Negation in Prolog
% \+ Goal or not(goal) are the same
% It doesn’t mean “Goal is false”, it means “Prolog cannot show it’s true.”
male(a).
% ?- not(male(a)) or \+male(a) will return false

% \== and == are used for identity and inequality of identity


%****************************************************************************************
% Input and Output in Prolog: using read and write 
hello :- write("Hello World").




%****************************************************************************************
% Now let us begin with our example 1
% a few facts: burger is a food, sandwich is a food, pizza is a food, sandwich is a lunch, pizza is a dinner
food(burger).
food(sandwich).
food(pizza).
lunch(sandwich).
dinner(pizza).

% rule: every food is a meal
meal(X) :- food(X). % or that anything is meal if it is food

% now queries
%?- food(pizza). Is pizza a food? : True
%?- meal(X), lunch(X). Which food is both meal and lunch? returns Sandwich 
%?- dinner(sandwich). Is sandwich a dinner?  : False


%****************************************************************************************
% Some good example for logic building

% Now facts with 2 objects
age(ram, 27).

%Queries are of the form
%?- age(X,27). returns ram
%?- age(ram,X). returns 27
%?- age(X,Y). returns ram, 27

% Now observe one more rule
%parent(X,Y):-mother(X,Y);father(X,Y). % X is parent of Y if X is either mother or father
mother(a,b). 
% query
%?- parent(A,B). will raise an error as you need to declare father predicate first
father(b,c). 
% Now the query will return True


% breaking down rules
parent(X,Y):-mother(X,Y).
parent(X,Y):-father(X,Y).
% same as above, disjunction can be written in two separate statements.
% but conjunction needs to be written in a single statement
parent(X,Y):-mother(X,Y),female(X).
parent(X,Y):-father(X,Y),male(X).
female(a).
male(b).
% the above example is same as
%parent(X,Y):-(mother(X,Y),female(X));(father(X,Y),male(X)).



% Interpreting relations
% consider, Raj and Ram are brothers if they have the same parent and are males
parent1(sam,raj).
parent1(sam,ram).
male1(ram).
male1(raj).
brother(X,Y):-parent1(Z,X),parent1(Z,X),male1(X),male1(Y).
% query is ?- brother(X,Y) will give me (ram, ram), (raj, ram) and (raj,raj)
% Here the relation is ambiguous. I need to pass another condition that Raj <> Ram
% so add new condition
is_equal(ram, ram).
is_equal(raj,raj).
brother1(X,Y):-parent1(Z,X),parent1(Z,Y),male1(X),male1(Y),X\==Y.  














