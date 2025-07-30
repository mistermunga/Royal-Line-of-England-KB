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

% House de Normandie

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
parent_of(richard_the_good, william_de_talou).
parent_of(richard_the_good, robert_le_magnifique).

parent_of(judith_de_rennes, richard_iii_de_normandie).
parent_of(judith_de_rennes, william_de_talou).
parent_of(judith_de_rennes, robert_le_magnifique).


parent_of(robert_le_magnifique, adelaide_comtesse_de_aumale).
parent_of(robert_le_magnifique, william_the_conqueror).

parent_of(herleva, adelaide_comtesse_de_aumale).
parent_of(herleva, william_the_conqueror).


parent_of(william_the_conqueror, william_rufus).
parent_of(william_the_conqueror, robert_courtheuse).
parent_of(william_the_conqueror, richard_de_normandie).
parent_of(william_the_conqueror, henry_beauclerc).
parent_of(william_the_conqueror, adela_comtesse_de_blois).
parent_of(william_the_conqueror, cecilia_abbesse).
parent_of(william_the_conqueror, constance_duchesse_de_bretagne).

parent_of(matilda_de_flandre, william_rufus).
parent_of(matilda_de_flandre, robert_courtheuse).
parent_of(matilda_de_flandre, richard_de_normandie).
parent_of(matilda_de_flandre, henry_beauclerc).
parent_of(matilda_de_flandre, adela_comtesse_de_blois).
parent_of(matilda_de_flandre, cecilia_abbesse).
parent_of(matilda_de_flandre, constance_duchesse_de_bretagne).


parent_of(henry_beauclerc, empress_maud).

parent_of(edith_of_scotland, empress_maud).


% House de Blois

parent_of(adela_comtesse_de_blois, william_comte_de_sully).
parent_of(adela_comtesse_de_blois, odo_de_blois).
parent_of(adela_comtesse_de_blois, theobald_ii_comte_de_champagne).
parent_of(adela_comtesse_de_blois, stephen_de_blois).

parent_of(stephen_comte_de_blois, william_comte_de_sully).
parent_of(stephen_comte_de_blois, odo_de_blois).
parent_of(stephen_comte_de_blois, theobald_ii_comte_de_champagne).
parent_of(stephen_comte_de_blois, stephen_de_blois).


parent_of(stephen_de_blois, eustace_iv_comte_de_boulogne).
parent_of(stephen_de_blois, william_i_comte_de_boulogne).

parent_of(matilda_i_comtesse_de_boulogne, eustace_iv_comte_de_boulogne).
parent_of(matilda_i_comtesse_de_boulogne, william_i_comte_de_boulogne).


% House Plantagenet

parent_of(empress_maud, henry_plantagenet).
parent_of(empress_maud, geoffrey_comte_de_nantes).
parent_of(empress_maud, william_fitzempress).

parent_of(geoffrey_de_anjou, henry_plantagenet).
parent_of(geoffrey_de_anjou, geoffrey_comte_de_nantes).
parent_of(geoffrey_de_anjou, william_fitzempress).


parent_of(henry_plantagenet, william_ix_comte_de_poitiers).
parent_of(henry_plantagenet, henry_jeune_roi).
parent_of(henry_plantagenet, richard_coeur_de_lion).
parent_of(henry_plantagenet, geoffrey_ii_duc_de_bretagne).
parent_of(henry_plantagenet, king_john).
parent_of(henry_plantagenet, matilda_duchesse_de_saxe).
parent_of(henry_plantagenet, eleanor_reine_de_castille).
parent_of(henry_plantagenet, joanne_reine_de_sicile).

parent_of(alienor_d_aquitaine, william_ix_comte_de_poitiers).
parent_of(alienor_d_aquitaine, henry_jeune_roi).
parent_of(alienor_d_aquitaine, richard_coeur_de_lion).
parent_of(alienor_d_aquitaine, geoffrey_ii_duc_de_bretagne).
parent_of(alienor_d_aquitaine, king_john).
parent_of(alienor_d_aquitaine, matilda_duchesse_de_saxe).
parent_of(alienor_d_aquitaine, eleanor_reine_de_castille).
parent_of(alienor_d_aquitaine, joanne_reine_de_sicile).


parent_of(king_john, henry_iii).
parent_of(king_john, richard_king_of_the_romans).
parent_of(king_john, joanne_reine_d_ecosse).
parent_of(king_john, empress_isabella).
parent_of(king_john, alienor_de_pembroke).

parent_of(isabella_d_angouleme, henry_iii).
parent_of(isabella_d_angouleme, richard_king_of_the_romans).
parent_of(isabella_d_angouleme, joanne_reine_d_ecosse).
parent_of(isabella_d_angouleme, empress_isabella).
parent_of(isabella_d_angouleme, alienor_de_pembroke).