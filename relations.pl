% load the gender declarations
:- [characters].

% === SPOUSAL RELATIONS ===

% House de Normandie

married(rollo, poppa).
married(william_longsword, sprota).
married(richard_the_fearless, gunner).
married(richard_the_good, judith_de_rennes).
married(robert_le_magnifique, herleva).
married(william_the_conqueror, matilda_de_flandre).
married(adela_comtesse_de_blois, stephen_comte_de_blois).
married(henry_beauclerc, edith_of_scotland).
married(empress_maud, henry_v_holy_roman_emperor).
married(empress_maud, geoffrey_de_anjou).


% House de Blois

married(stephen_de_blois, matilda_i_comtesse_de_boulogne).

% Plantagenets

married(henry_plantagenet, alienor_d_aquitaine).
married(king_john, isabella_d_angouleme).


married(F, M):- married(M, F).

husband_to(M, W):- married(M, W), gender(M, male).
wife_to(W, M):- married(W, M), gender(W, female).



% === FAMILIAL RELATIONS ===

% children_of(Father, Mother, [Children])


% House de Normandie

children_of(rollo, poppa, [william_longsword]).

children_of(william_longsword, sprota, [richard_the_fearless]).

children_of(richard_the_fearless, gunner, [emma_de_normandie, richard_the_good, robert_archeveque_de_rouen, mauger_de_corbeil]).

children_of(richard_the_good, judith_de_rennes, [richard_iii_de_normandie, william_de_talou, robert_le_magnifique]).

children_of(robert_le_magnifique, herleva, [adelaide_comtesse_de_aumale, william_the_conqueror]).

children_of(william_the_conqueror, matilda_de_flandre, [william_rufus, robert_courtheuse, richard_de_normandie, henry_beauclerc, adela_comtesse_de_blois, cecilia_abbesse, constance_duchesse_de_bretagne]).

children_of(henry_beauclerc, edith_of_scotland, [empress_maud]).


% House de Blois

children_of(stephen_comte_de_blois, adela_comtesse_de_blois, [william_comte_de_sully, odo_de_blois, theobald_ii_comte_de_champagne, stephen_de_blois]).

children_of(stephen_de_blois, matilda_i_comtesse_de_boulogne, [eustace_iv_comte_de_boulogne, william_i_comte_de_boulogne]).


% House Plantagenet

children_of(geoffrey_de_anjou, empress_maud, [henry_plantagenet, geoffrey_comte_de_nantes, william_fitzempress]).

children_of(henry_plantagenet, alienor_d_aquitaine, [william_ix_comte_de_poitiers, henry_jeune_roi, richard_coeur_de_lion, geoffrey_ii_duc_de_bretagne, king_john, matilda_duchesse_de_saxe, eleanor_reine_de_castille, joanne_reine_de_sicile]).

children_of(king_john, isabella_d_angouleme, [henry_iii, richard_king_of_the_romans, joanne_reine_d_ecosse, empress_isabella, alienor_de_pembroke]).


% Parentage rules
parent_of(Father, Child) :- 
    children_of(Father, _, Children), 
    member(Child, Children).

parent_of(Mother, Child) :- 
    children_of(_, Mother, Children), 
    member(Child, Children).

father_of(Father, Child):-
    parent_of(Father, Child),
    gender(Father, male).

mother_of(Mother, Child):-
    parent_of(Mother, Child),
    gender(Mother, female).

ancestor(X, Y):- parent_of(X, Y).
ancestor(X, Y):- parent_of(X, A), ancestor(A, Y).

descendant(X, Y):- ancestor(Y, X).


% Nuclear families
siblings(X, Y):-
    parent_of(P, X),
    parent_of(P, Y),
    X \= Y.

brother_to(X, Y):-
    siblings(X, Y),
    gender(X, male),
    X \= Y.

sister_to(X, Y):-
    siblings(X, Y),
    gender(X, female),
    X \= Y.


% Extended Family
grandparent_to(X, Y):-
    parent_of(X, P), 
    parent_of(P, Y).

grandmother_to(X, Y):-
    grandparent_to(X, Y),
    gender(X, female).

grandfather_to(X, Y):-
    grandparent_to(X, Y),
    gender(X, male).

cousins(X, Y):-
    grandparent_to(G, X),
    grandparent_to(G, Y),
    \+ siblings(X, Y),
    X \= Y.

uncle_to(X, Y):-
    parent_of(P, Y),
    brother_to(X, P).

aunt_to(X, Y):-
    parent_of(P, Y),
    sister_to(X, P).

