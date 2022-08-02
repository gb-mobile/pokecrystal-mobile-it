	object_const_def ; object_event constants
	const CELADONMANSIONROOFHOUSE_PHARMACIST

CeladonMansionRoofHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonMansionRoofHousePharmacistScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM03_CURSE
	iftrue .GotCurse
	writetext CeladonMansionRoofHousePharmacistIntroText
	buttonsound
	checktime NITE
	iftrue .Night
	writetext CeladonMansionRoofHousePharmacistNotNightText
	waitbutton
	closetext
	end

.Night:
	writetext CeladonMansionRoofHousePharmacistStoryText
	buttonsound
	verbosegiveitem TM_CURSE
	iffalse .NoRoom
	setevent EVENT_GOT_TM03_CURSE
.GotCurse:
	writetext CeladonMansionRoofHousePharmacistCurseText
	waitbutton
.NoRoom:
	closetext
	end

CeladonMansionRoofHousePharmacistIntroText:
	text "Ti racconto una"
	line "storia spaventosa…"
	done

CeladonMansionRoofHousePharmacistNotNightText:
	text "Ora però non ti"
	line "farebbe abbastanza"

	para "paura perché fuori"
	line "è ancora chiaro."

	para "Torna dopo il"
	line "tramonto, va bene?"
	done

CeladonMansionRoofHousePharmacistStoryText:
	text "C'era una volta un"
	line "ragazzino, che"

	para "ricevette una"
	line "BICICLETTA nuova…"

	para "Volle subito"
	line "provarla…"

	para "Si divertiva così"
	line "tanto da non"

	para "vedere che il sole"
	line "stava calando…"

	para "Si fece buio, e"
	line "mentre tornava"

	para "a casa,"
	line "improvvisamente"
	cont "la bici rallentò."

	para "I pedali si fecero"
	line "pesantissimi."

	para "Quando non poté"
	line "più pedalare, la"

	para "bici iniziò ad"
	line "andare indietro!"

	para "La bici era come"
	line "segnata da una"

	para "maledizione, che"
	line "l'attirava verso"
	cont "il nulla!"

	para "…"

	para "…"

	para "Ad un certo punto"
	line "s'accorse d'essere"
	cont "in cima alla"
	cont "PISTA CICLABILE!"

	para "…"
	line "Agghiacciante, eh?"

	para "Per aver ascoltato"
	line "con tanta pazienza"
	cont "meriti una MT03!"
	done

CeladonMansionRoofHousePharmacistCurseText:
	text "MT03 è"
	line "MALEDIZIONE."

	para "È una terribile"
	line "mossa, che lenta-"
	cont "mente prosciuga i"
	cont "PS della vittima."
	done

CeladonMansionRoofHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CELADON_MANSION_ROOF, 3
	warp_event  3,  7, CELADON_MANSION_ROOF, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  2, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonMansionRoofHousePharmacistScript, -1
