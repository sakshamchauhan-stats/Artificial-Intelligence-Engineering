% Prolog Program 7: Extensive Knowledge bases to understand Backward Chaining in Prolog

%****************************************************************************************
% Part A


% The law says that it is a crime for an American to sell weapons to hostile nations. The
% country Nono, an enemy of America, has some missiles, and all of its missiles were
% sold to it by Colonel West, who is American. Prove that Col. West is a criminal.

% Facts
enemy(nono,america). % Nono is an enemy nation to america
american(west). % west is an american
owns(nono,m1). % Nono owns some missiles
missile(m1). % m1 is missile

% Rules
criminal(X) :- american(X), sells(X,Y,Z), hostile(Z), weapons(Y).
% X is a criminal, if he is american, he sells Y to Z, Z is a hostile nation and Y is a weapon
hostile(X) :- enemy(X,america). 
% X is a hostile nation if it is an enemy of America
weapons(X) :- missile(X).
% X is a weapon if it is a missile
sells(west,X,nono) :- missile(X),owns(nono,X).

% Query
% ?- criminal(west). %evaluates to True

%****************************************************************************************
% Part B

% In a university’s admission expert system, the AI advisor decides whether a student is
% eligible for scholarship. The knowledge base contains information about students’
% grades, income, and achievements. 

% A student can receive a scholarship if they have high grades and are from a low-income family, 
% or if they have won a national award.
% Additionally, any student enrolled in a sports program and having good grades is also eligible. 

% The system stores data for student Ravi, who has high grades, 
% is from a lowincome family, and is not in a sports program. Does Ravi qualify for a scholarship?


% Facts
student(ravi).
grades(ravi,high).
family_income(ravi, low).
engaged_in_sports(dummy_placeholder).
% Note that I am putting a dummy placeholder to declare the predicate. 
% If I dont do it, it will throw me an error.
national_awardee(dummy_placeholder).
% using predicate(_) would make the truth value true for all the constants. 
% Like predicate(ravi)will be evaluated to true even though its fact is missing


% Rules
eligible(X) :- student(X) , ( ( grades(X,high), family_income(X,low) ) ;
                            ( national_awardee(X) ) ; 
                            ( grades(X,good), engaged_in_sports(X) ) ).


% query
% ?- eligible(ravi). %evaluates to true














