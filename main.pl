% Medieval Genealogy Database - Showcase
% This file demonstrates the capabilities of the complete system
% Load all components
:- [characters].
:- [relations].
:- [lifetimes].
:- [dynasties].
:- [succession].
:- [titles].

% === DEMONSTRATION QUERIES ===

% Print a formatted demo of the system's capabilities
demo :-
    nl, write('=== MEDIEVAL GENEALOGY DATABASE DEMO ==='), nl, nl,
    
    write('1. BASIC GENEALOGY'), nl,
    write('Who were William the Conqueror\'s children?'), nl,
    findall(Child, parent_of(william_the_conqueror, Child), Children),
    write('Answer: '), write(Children), nl, nl,
    
    write('2. SUCCESSION ANALYSIS'), nl,
    write('Who was William the Conqueror\'s eldest child?'), nl,
    eldest_child(william_the_conqueror, Eldest),
    write('Answer: '), write(Eldest), nl, nl,
    
    write('3. TITLE SUCCESSION'), nl,
    write('Who held the English crown in 1150?'), nl,
    title_holder(king_of_england, King, 1150),
    write('Answer: '), write(King), nl, nl,
    
    write('4. DYNASTIC ANALYSIS'), nl,
    write('What\'s the male line from Rollo?'), nl,
    agnatic_line(rollo, MaleLine),
    write('Answer: '), write(MaleLine), nl, nl,
    
    write('5. CONTEMPORARY FIGURES'), nl,
    write('Who lived at the same time as William the Conqueror?'), nl,
    findall(Person, contemporary(william_the_conqueror, Person), Contemporaries),
    length(Contemporaries, Count),
    write('Answer: '), write(Count), write(' people including some: '),
    take(5, Contemporaries, Sample),
    write(Sample), nl, nl,
    
    write('=== END DEMO ==='), nl.

% Helper predicate to take first N elements
take(0, _, []) :- !.
take(_, [], []) :- !.
take(N, [H|T], [H|R]) :- 
    N > 0, 
    N1 is N - 1, 
    take(N1, T, R).

% === INTERESTING HISTORICAL QUERIES ===

% The Norman Conquest generation
conquest_generation(People) :-
    findall(Person, contemporary(william_the_conqueror, Person), People).

% Who conquered what?
conquerors_and_conquests(Results) :-
    findall(Person-Title, conquered_title(Person, Title), Results).

% Usurpers throughout history
usurpers_and_usurpations(Results) :-
    findall(Person-Title, usurped_title(Person, Title), Results).

% The Anarchy period - who fought for the throne?
anarchy_claimants(Claimants) :-
    findall(Year-People, 
           (between(1135, 1154, Year),
            contested_title(king_of_england, Year, People)), 
           Claimants).

% Plantagenet family tree
plantagenet_tree :-
    write('PLANTAGENET DYNASTY:'), nl,
    dynasty(plantagenet, Members),
    forall(member(Person, Members),
           (write('- '), write(Person), 
            (holds_title(Person, Title, _, _, _) -> 
                (write(' (held: '), write(Title), write(')')) ; 
                true),
            nl)).

% Power transitions - how titles changed hands
power_transitions(Title, Transitions) :-
    findall(Person-Method-Years, 
           (holds_title(Person, Title, Start, End, Method),
            Years = Start-End),
           Transitions).

% === SUCCESSION WHAT-IFS ===

% What if we used strict agnatic primogeniture throughout?
strict_agnatic_analysis :-
    write('STRICT AGNATIC PRIMOGENITURE ANALYSIS:'), nl,
    write('After Henry I (who had no legitimate sons):'), nl,
    (agnatic_extinction(henry_beauclerc) ->
        write('- Norman male line extinct, throne would pass to collateral male line') ;
        write('- Norman male line continues')),
    nl,
    write('Stephen\'s claim through his mother Adela would be invalid'), nl,
    write('Maud\'s claim as daughter would be invalid'), nl, nl.

% What if we used agnatic-cognatic primogeniture?
flexible_succession_analysis :-
    write('AGNATIC-COGNATIC PRIMOGENITURE ANALYSIS:'), nl,
    write('After Henry I:'), nl,
    (female_inheritance(henry_beauclerc, Heir) ->
        (write('- '), write(Heir), write(' inherits as eldest child')) ;
        write('- No clear heir')),
    nl,
    write('This supports Maud\'s historical claim'), nl, nl.

% === FULL SYSTEM SHOWCASE ===

showcase :-
    write('MEDIEVAL GENEALOGY DATABASE - FULL SHOWCASE'), nl,
    write('====================================='), nl, nl,
    
    demo, nl,
    
    write('ADVANCED HISTORICAL ANALYSIS:'), nl,
    write('-----------------------------'), nl,
    conquerors_and_conquests(Conquests),
    write('Conquests: '), write(Conquests), nl,
    usurpers_and_usurpations(Usurpations),  
    write('Usurpations: '), write(Usurpations), nl, nl,
    
    plantagenet_tree, nl,
    
    write('SUCCESSION ANALYSIS:'), nl,
    write('-------------------'), nl,
    strict_agnatic_analysis,
    flexible_succession_analysis,
    
    write('TITLE TRANSITIONS FOR ENGLAND:'), nl,
    power_transitions(king_of_england, Transitions),
    forall(member(Person-Method-Years, Transitions),
           (write(Person), write(' ('), write(Method), write(') '), 
            write(Years), nl)),
    nl,
    
    write('Database contains genealogical, temporal, and political data'), nl,
    write('for medieval European nobility from 835-1275 CE'), nl.

% === QUERY EXAMPLES FOR USERS ===

% Sample queries users can try:
sample_queries :-
    write('TRY THESE SAMPLE QUERIES:'), nl,
    write('========================'), nl,
    write('?- eldest_child(william_the_conqueror, X).'), nl,
    write('?- agnatic_heir(henry_plantagenet, X).'), nl,
    write('?- title_holder(duke_of_normandy, X, 1100).'), nl,
    write('?- contemporary(richard_coeur_de_lion, X).'), nl,
    write('?- female_inheritance(Parent, Daughter).'), nl,
    write('?- contested_title(king_of_england, Year, Claimants).'), nl,
    write('?- reign_length(Person, king_of_england, Years).'), nl,
    write('?- dynasty(normandie, Members).'), nl, nl.