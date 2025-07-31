% Titles and succession for major realms
:- [characters].
:- [relations].
:- [lifetimes].
:- [dynasties].
:- [succession].

% Title holding: holds_title(Person, Title, StartYear, EndYear, HowObtained)
% HowObtained: inheritance, conquest, usurpation, treaty, election, appointment

% === DUCHY OF NORMANDY ===

% Founded by Rollo through Treaty of Saint-Clair-sur-Epte
holds_title(rollo, duke_of_normandy, 911, 933, treaty).

% Norman succession - mostly straightforward agnatic primogeniture
holds_title(william_longsword, duke_of_normandy, 933, 942, inheritance).
holds_title(richard_the_fearless, duke_of_normandy, 942, 996, inheritance).
holds_title(richard_the_good, duke_of_normandy, 996, 1026, inheritance).
holds_title(richard_iii_de_normandie, duke_of_normandy, 1026, 1027, inheritance).
holds_title(robert_le_magnifique, duke_of_normandy, 1027, 1035, inheritance).
holds_title(william_the_conqueror, duke_of_normandy, 1035, 1087, inheritance).

% After conquest of England, Norman dukes were also English kings
holds_title(william_rufus, duke_of_normandy, 1087, 1100, inheritance).
holds_title(henry_beauclerc, duke_of_normandy, 1100, 1135, usurpation). % Took from Robert Courtheuse
holds_title(stephen_de_blois, duke_of_normandy, 1135, 1144, usurpation). % Disputed claim
holds_title(geoffrey_de_anjou, duke_of_normandy, 1144, 1150, conquest). % Conquered for his son
holds_title(henry_plantagenet, duke_of_normandy, 1150, 1189, inheritance).
holds_title(richard_coeur_de_lion, duke_of_normandy, 1189, 1199, inheritance).
holds_title(king_john, duke_of_normandy, 1199, 1204, inheritance). % Lost to Philip Augustus

% === KINGDOM OF ENGLAND ===

% William's conquest
holds_title(william_the_conqueror, king_of_england, 1066, 1087, conquest).

% Norman kings of England
holds_title(william_rufus, king_of_england, 1087, 1100, inheritance).
holds_title(henry_beauclerc, king_of_england, 1100, 1135, usurpation). % Usurped from Robert

% The Anarchy - disputed succession
holds_title(stephen_de_blois, king_of_england, 1135, 1154, usurpation). % Disputed by Maud
% Note: Empress Maud was never fully crowned but controlled much of England 1141-1148

% Plantagenet kings
holds_title(henry_plantagenet, king_of_england, 1154, 1189, treaty). % Treaty of Wallingford
holds_title(richard_coeur_de_lion, king_of_england, 1189, 1199, inheritance).
holds_title(king_john, king_of_england, 1199, 1216, inheritance).
holds_title(henry_iii, king_of_england, 1216, 1272, inheritance).

% === TITLE QUERIES ===

% Who held a title in a given year
title_holder(Title, Person, Year) :-
    holds_title(Person, Title, Start, End, _),
    Year >= Start,
    Year =< End.

% How someone obtained a title
title_acquisition(Person, Title, Method) :-
    holds_title(Person, Title, _, _, Method).

% Duration of rule
reign_length(Person, Title, Years) :-
    holds_title(Person, Title, Start, End, _),
    Years is End - Start.

% Contested titles (multiple people claiming same title in overlapping periods)
contested_title(Title, Year, Claimants) :-
    findall(Person, title_holder(Title, Person, Year), Claimants),
    length(Claimants, Count),
    Count > 1.

% Successful conquest
conquered_title(Person, Title) :-
    title_acquisition(Person, Title, conquest).

% Usurped titles
usurped_title(Person, Title) :-
    title_acquisition(Person, Title, usurpation).

% Dynastic succession (inherited titles)
inherited_title(Person, Title) :-
    title_acquisition(Person, Title, inheritance).

% Find all titles held by a person
all_titles(Person, Titles) :-
    findall(Title, holds_title(Person, Title, _, _, _), Titles).

% Simultaneous rule (person holding multiple titles at once)
simultaneous_titles(Person, Year, Titles) :-
    findall(Title, title_holder(Title, Person, Year), Titles),
    length(Titles, Count),
    Count > 1.