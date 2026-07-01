% Prolog Program 6: Extensive Knowledge bases 

%****************************************************************************************
% Part A)
% Consider the following facts, rules and goals

% Facts
% Venkat eats veg food.
eats(venkat, veg).
% Prabhu eats non-veg-food.
eats(prabhu, nonveg).
% Assuming whoever eats veg(non veg) food, eats sambhar (biryani). Note eats_1 is for dishes and X
eats_1(X,Y) :- eats(X,Z),food_type(Y,Z).

% Biryani is non-veg-food.
food_type(biryani, nonveg).
% Sambar is veg-food.
food_type(sambhar,veg).

% rules
% Priya likes who eats veg-food.
likes(priya,X) :- eats(X,veg).
% Lakshmi likes those who eat biryani.
likes(lakshmi,X) :- eats_1(X,biryani).


% queries
% a) Write a query and output to answer the following: ‘Who eats Biryani?
% ?- eats_1(X,biryani).
% b) Write query and output to answer ‘Whom does Priya like?
% ?- likes(priya,X).
% c) Write a query and output to answer the following: ‘Whom does Lakshmi like?
% ?- likes(laksmhi,X).

%****************************************************************************************
% Part B)
% Consider the following facts, rules and goals

% Facts
doctor(dr_smith).
doctor(dr_jones).
doctor(dr_brown).

patient(john).
patient(mary).
patient(david).
patient(susan).

specialization(dr_smith, cardiology).
specialization(dr_jones, neurology).
specialization(dr_brown, orthopedics).

assigned_to(john, dr_smith).
assigned_to(mary, dr_jones).
assigned_to(david, dr_brown).
assigned_to(susan, dr_smith).

age(john, 45).
age(mary, 32).
age(david, 65).
age(susan, 28).

% Queries
% 1. Which doctor specializes in cardiology?
% ?- specialization(X,cardiology).
% 
% 2. Who is assigned to Dr. Brown?
% ?- assigned_to(X,dr_brown).
% 
% 3. List patients older than 40 years. 
% ?- age(X,A), A>40.
% 
% 4. Who is Mary’s doctor?
% ?- assigned_to(mary,X).
% 
% 5. What is John's age?
% ?- age(john,X).


%****************************************************************************************
% Part C)
% Consider the following facts, rules and goals

% Facts
student(john).
student(mary).
student(susan).
student(david).

subject(math).
subject(science).
subject(english).
subject(history).

teaches(mr_smith, math).
teaches(mr_jones, science).
teaches(ms_clark, english).
teaches(ms_lee, history).

enrolled(john, math).
enrolled(mary, science).
enrolled(susan, english).
enrolled(david, history).

grade(john, math, 85).
grade(mary, science, 92).
grade(susan, english, 88).
grade(david, history, 75).


% Queries
% 1. Who teaches math?
% ?- teaches(X,math).
% 
% 2. What subjects is John enrolled in?
% ?- enrolled(john,X).
% 
% 3. Who got a grade higher than 90 in any subject?
% ?- grade(Student,_,Marks), Marks>90
% 
% 4. What is David's grade in history?
% ?- grade(david,history,X).
% 
% 5. List all students enrolled in science.
% ?- enrolled(X,science).


%****************************************************************************************
% Part D)
% Consider the following facts, rules and goals

% Facts 

degree(alice, engineering).
degree(bob, computer_science).
degree(carol, engineering).
degree(dave, computer_science).
degree(eve, business_administration).

experience(alice, 5).
experience(bob, 2).
experience(carol, 2).
experience(dave, 3).
experience(eve, 4).

certification(alice, data_analysis).
certification(bob, data_analysis).
certification(dave, project_management).
certification(eve, marketing).

% Rules
% A company wants to hire candidates based on their educational qualifications,
% experience, and certifications. Candidates with a degree in Engineering and at least 3
% years of experience or with a Project Management certification are eligible.
% Alternatively, candidates with a degree in Computer Science, 2 years of experience,
% and a Data Analysis certification are also eligible

eligible(X) :- ( degree(X,engineering), experience(X,A),A>=3 );certification(X,project_management); 
    (degree(X,computer_science),experience(X,B),B>=2,certification(X,data_analysis)).


% Queries
% 1. Find eligible candidates
% ?- eligible(X).
% 
% 2. Check if Carol is eligible for the job
% ?- eligible(carol).
%
% 3. Find candidates with engineering
% ?- degree(X,engineering).
% 
% 4. Who has project management certification?
% ?- certification(X,project_management).
% 
% 5. Find candidates with at least 3 years of experience:
% ?- experience(X,A),A>=3.
% 
% 6. Backtrack to find all candidates with a Computer Science degree and a certification in Data
% ?- certification(X,data_analysis),degree(X,computer_science).
% 
% 7. Find candidates who are eligible with the Project Management certification. (Assuming eligible and certification is asked).
% ?- eligible(X), certification(X,project_management)
% 
% 8. Check if Eve has both a Business Administration degree and a certification: 
% ?- degree(eve,business_administration),degree(eve,_)




%****************************************************************************************
% Part E)
% Consider the following facts, rules and goals

% Facts 

credit_score(alice, 750).
credit_score(bob, 650).
credit_score(carol, 800).
credit_score(dave, 780).
income(alice, 60000).
income(bob, 40000).
income(carol, 50000).
income(dave, 55000).

% Rules
% A bank approves loans based on a customer's credit score and income. A credit
% score of 700 or higher and an income of at least $50,000 are required for approval.
% Alternatively, customers with a credit score of 800 or higher are automatically
% approved regardless of income.

approved(X) :- ( credit_score(X,A),A>=700,income(X,B),B>=50000 ) ; ( credit_score(X,C),C>=800 ).
denied(X) :- credit_score(X,_), not(approved(X)). 
% This is to check for all X which are present in the KB

% Queries
% 1. Check if Alice is eligible for a loan:
% ?- approved(alice).

% 2. Find customers with a credit score of at least 700:
% ?- credit_score(X,A),A>=700.

% 3. Who has a credit score of 800 or higher?
% ?- credit_score(X,A),A>=800.

% 4. Find all customers eligible for a loan
% ?- approved(X).

% 5. Backtrack to find customers with an income of at least $50,000.
% ?- income(X,A),A>=50000.

% 6. Find all customers who are denied loan
% ?- denied(X).

% 7. Check if dave is eligible for a loan 
% ?- approved(dave).



