% This is a set of characters from the historical viking Rollo to John of England

% === GENDER DECLARATIONS ===


% House de Normandie
gender(rollo, male).        % scandinavian adventurer

% son of Rollo and Poppa
gender(william_longsword, male).

% son of William longsword and Sprota
gender(richard_the_fearless, male).

% sons of Gunner and Richard the Fearless
gender(richard_the_good, male).
gender(robert_archeveque_de_rouen, male).
gender(mauger_de_corbeil, male).

% sons of Richard the Good and Judith of Rennes
gender(william_de_talou, male).
gender(robert_le_magnifique, male).
gender(richard_iii_de_normandie, male).

% of Robert the magnificent and Herleve
gender(william_the_conqueror, male).

% of William the Conqueror and Matilda of Flanders
gender(william_rufus, male).
gender(robert_courtheuse, male).
gender(richard_de_normandie, male).
gender(henry_beauclerc, male).

% spouses of Matilda, daughter to Henry I Beauclerc
gender(henry_v_holy_roman_emperor, male).
gender(geoffrey_de_anjou, male).


% House de Normandie - Females
gender(poppa, female).

gender(sprota, female).

gender(gunner, female).

gender(emma_de_normandie, female).      % of Gunner and Richard the Fearless
gender(judith_de_rennes, female).       

gender(herleva, female).

gender(adelaide_comtesse_de_aumale, female).        % of Herleve and Robert the Magnificent
gender(matilda_de_flandre, female).

% daughters of William the Conqueror
gender(adela_comtesse_de_blois, female).
gender(cecilia_abbesse, female).
gender(constance_duchesse_de_bretagne, female).

% Henry Beauclerc's daughter and wife respectively
gender(empress_maud, female).
gender(edith_of_scotland, female).



% House de Blois 
gender(stephen_comte_de_blois, male).       % married Adela, one of William the Conqueror's daughters

% of Stephen and Adela
gender(william_comte_de_sully, male).
gender(odo_de_blois, male).
gender(theobald_ii_comte_de_champagne, male).
gender(stephen_de_blois, male).     % became King

% sons of King Stephen and Matilda of Boulogne
gender(eustace_iv_comte_de_boulogne, male).
gender(william_i_comte_de_boulogne, male).


% House de Blois - females
gender(matilda_i_comtesse_de_boulogne, female).



% House Plantagenet
gender(henry_plantagenet, male).        % usurped King Stephen -- founded House Plantagenet/Angevin
gender(geoffrey_comte_de_nantes, male).
gender(william_fitzempress, male).      % brothers of King Henry II, sons of empress Maud

% of King Henry II Plantagenet and Eleanor of Aquitaine
gender(william_ix_comte_de_poitiers, male).
gender(henry_jeune_roi, male).
gender(richard_coeur_de_lion, male).
gender(geoffrey_ii_duc_de_bretagne, male).
gender(king_john, male).

% of the bad King John and Isabella of Angouleme
gender(henry_iii, male).
gender(richard_king_of_the_romans, male).


% House PLantagenet - Females
gender(alienor_d_aquitaine, female).        % Henry Plantagenet's Queen

% daughters of Henry Plantagenet
gender(matilda_duchesse_de_saxe, female).
gender(eleanor_reine_de_castille, female).
gender(joanne_reine_de_sicile, female).

gender(isabella_d_angouleme, female).

% daughters of John and Isabella
gender(joanne_reine_de_scotland, female).
gender(empress_isabella, female).
gender(alienor_d_pembroke, female).



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



% === FAMILIAL RELATIONS ===

parent_of(rollo, william_longsword).
parent_of(poppa, william_longsword).


parent_of(william_longsword, richard_the_fearless).
parent_of(sprota, richard_the_fearless).


parent_of(richard_the_fearless, emma_de_normandie).
parent_of(richard_the_fearless, richard_the_good).
parent_of(richard_the_fearless, robert_archeveque_de_rouen).
parent_of(richard_the_fearless, mauger_de_corbeil).

parent_of(gunner, emma_de_normandie).
parent_of(gunner, richard_the_good).
parent_of(gunner, robert_archeveque_de_rouen).
parent_of(gunner, mauger_de_corbeil).


parent_of(richard_the_good, richard_iii_de_normandie).
