:- [characters].
:- [relations].
:- [lifetimes].
:- [dynasties].

% Helper predicate to check if dates are known
% This will help us disregard characters with no known
% birth or death years
has_known_dates(Person) :-
    lifetime(Person, Birth, Death),
    Birth \= unknown,
    Death \= unknown.

% Extract actual year from circa/2 and /1
actual_birth_year(Person, Year) :-
    lifetime(Person, Birth, _),
    extract_year(Birth, Year).

actual_death_year(Person, Year) :-
    lifetime(Person, _, Death),
    extract_year(Death, Year).

% Extract year from different date formats
extract_year(Year, Year) :- 
    number(Year).
extract_year(circa(Year), AdjustedYear) :- 
    number(Year),
    AdjustedYear is Year - 1.
extract_year(circa(Start, _), Start). 

% Line of succession: ordered list of children by birth year
succession_order(Parent, OrderedChildren) :-
    findall(Child-Birth, 
           (parent_of(Parent, Child), 
            has_known_dates(Child),
            actual_birth_year(Child, Birth)), 
           ChildBirthPairs),
    keysort(ChildBirthPairs, SortedPairs),
    pairs_keys(SortedPairs, OrderedChildren).

% Who was the eldest child with known dates
eldest_child(Parent, EldestChild) :-
    succession_order(Parent, [EldestChild|_]).

% Contemporary: people who lived at the same time
contemporary(Person1, Person2) :-
    has_known_dates(Person1),
    has_known_dates(Person2),
    Person1 \= Person2,
    actual_birth_year(Person1, Birth1),
    actual_death_year(Person1, Death1),
    actual_birth_year(Person2, Birth2),
    actual_death_year(Person2, Death2),
    Birth1 =< Death2,
    Birth2 =< Death1.


% === SUCCESSION ===

% Absolute Agnatic Primogeniture

% Get all male children with known dates, ordered by birth
male_succession_order(Parent, OrderedSons) :-
    findall(Son-Birth, 
           (parent_of(Parent, Son), 
            has_known_dates(Son),
            gender(Son, male),
            actual_birth_year(Son, Birth)), 
           SonBirthPairs),
    keysort(SonBirthPairs, SortedPairs),
    pairs_keys(SortedPairs, OrderedSons).

% Primary heir under agnatic primogeniture (eldest son)
agnatic_heir(Parent, EldestSon) :-
    male_succession_order(Parent, [EldestSon|_]).

% All potential heirs in order under agnatic primogeniture
agnatic_heirs(Parent, Sons) :-
    male_succession_order(Parent, Sons),
    Sons \= [].  % Must have at least one son

% Check if someone has a male heir
has_male_heir(Parent) :-
    agnatic_heir(Parent, _).

% Agnatic inheritance chain: who inherits if primary heir dies
% If eldest son dies, next son inherits, etc.
agnatic_successor(Parent, Successor) :-
    agnatic_heir(Parent, PrimaryHeir),
    agnatic_heirs(Parent, [PrimaryHeir|OtherSons]),
    % If primary heir dies before parent, next son becomes heir
    (   actual_death_year(PrimaryHeir, HeirDeath),
        actual_death_year(Parent, ParentDeath),
        HeirDeath < ParentDeath
    ->  member(Successor, OtherSons)
    ;   Successor = PrimaryHeir
    ).

% Dynastic succession: trace male line through generations
% This follows the male line down through agnatic heirs
agnatic_line(Ancestor, [Ancestor|RestOfLine]) :-
    agnatic_heir(Ancestor, Heir),
    agnatic_line(Heir, RestOfLine).
agnatic_line(Person, [Person]) :-
    \+ agnatic_heir(Person, _).  % No male heir, line ends

% Check if inheritance line is "broken" (no male heirs)
agnatic_extinction(Parent) :-
    \+ has_male_heir(Parent).

% Find the senior male line from a given ancestor
senior_agnatic_line(Ancestor, Line) :-
    agnatic_line(Ancestor, Line).


% Agnatic-Cognatic Primogeniture Rules
% Males inherit first, but females can inherit if no males available

% Get all female children with known dates, ordered by birth
female_succession_order(Parent, OrderedDaughters) :-
    findall(Daughter-Birth, 
           (parent_of(Parent, Daughter), 
            has_known_dates(Daughter),
            gender(Daughter, female),
            actual_birth_year(Daughter, Birth)), 
           DaughterBirthPairs),
    keysort(DaughterBirthPairs, SortedPairs),
    pairs_keys(SortedPairs, OrderedDaughters).

% Primary heir under agnatic-cognatic primogeniture
% First try males, then females if no males
agnatic_cognatic_heir(Parent, Heir) :-
    (   agnatic_heir(Parent, Heir)  % Try male heir first
    ;   \+ has_male_heir(Parent),   % No male heirs available
        female_succession_order(Parent, [Heir|_])  % Take eldest daughter
    ).

% All potential heirs in order under agnatic-cognatic primogeniture
% All sons first (by age), then all daughters (by age)
agnatic_cognatic_heirs(Parent, Heirs) :-
    male_succession_order(Parent, Sons),
    female_succession_order(Parent, Daughters),
    append(Sons, Daughters, Heirs),
    Heirs \= [].  % Must have at least one child

% Check if someone has any heir (male or female)
has_heir(Parent) :-
    agnatic_cognatic_heir(Parent, _).

% Agnatic-cognatic successor accounting for deaths
agnatic_cognatic_successor(Parent, Successor) :-
    agnatic_cognatic_heirs(Parent, AllHeirs),
    actual_death_year(Parent, ParentDeath),
    % Find first heir who outlived the parent
    member(Successor, AllHeirs),
    actual_death_year(Successor, SuccessorDeath),
    SuccessorDeath > ParentDeath.

% Dynastic succession through agnatic-cognatic line
agnatic_cognatic_line(Ancestor, [Ancestor|RestOfLine]) :-
    agnatic_cognatic_heir(Ancestor, Heir),
    agnatic_cognatic_line(Heir, RestOfLine).
agnatic_cognatic_line(Person, [Person]) :-
    \+ agnatic_cognatic_heir(Person, _).  % No heirs, line ends

% Check if inheritance line is completely broken (no children at all)
complete_extinction(Parent) :-
    \+ has_heir(Parent).

% Female inheritance: when daughters inherit due to no male heirs
female_inheritance(Parent, Daughter) :-
    \+ has_male_heir(Parent),           % No sons available
    agnatic_cognatic_heir(Parent, Daughter),
    gender(Daughter, female).

% Senior line from ancestor (following agnatic-cognatic rules)
senior_agnatic_cognatic_line(Ancestor, Line) :-
    agnatic_cognatic_line(Ancestor, Line).