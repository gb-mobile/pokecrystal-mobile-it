	object_const_def ; object_event constants
	const CELADONPOKECENTER1F_NURSE
	const CELADONPOKECENTER1F_GENTLEMAN
	const CELADONPOKECENTER1F_PHARMACIST
	const CELADONPOKECENTER1F_COOLTRAINER_F
	const CELADONPOKECENTER1F_EUSINE

CeladonPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonPokecenter1FNurseScript:
	jumpstd pokecenternurse

CeladonPokecenter1FGentlemanScript:
	jumpstd happinesschecknpc

CeladonPokecenter1FCooltrainerFScript:
	jumptextfaceplayer CeladonPokecenter1FCooltrainerFText

CeladonPokecenter1FPharmacistScript:
	jumptextfaceplayer CeladonPokecenter1FPharmacistText

CeladonEusine:
	faceplayer
	opentext
	writetext CeladonEusineText1
	buttonsound
	setval SUICUNE
	special MonCheck
	iffalse .NoSuicune
	special BeastsCheck
	iftrue .HoOh
	writetext NoBeastsText
	waitbutton
.NoSuicune:
	closetext
	end

.HoOh:
	writetext EusineLeavesCeladonText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal UP, .Location1
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement1
	sjump .Continue

.Location1:
	applymovement CELADONPOKECENTER1F_EUSINE, .Movement2
.Continue:
	disappear CELADONPOKECENTER1F_EUSINE
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

.Movement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

.Movement1:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

CeladonPokecenter1FCooltrainerFText:
	text "ERIKA è la regina"
	line "dei #MON"
	cont "di tipo erba."

	para "Stai in guardia, o"
	line "la pagherai cara."
	done

CeladonPokecenter1FPharmacistText:
	text "Il nascondiglio di"
	line "TEAM ROCKET è"

	para "nell'interrato del"
	line "CASINÒ."

	para "Anzi, era così tre"
	line "anni fa."
	done

CeladonEusineText1:
	text "EUGENIUS: Ciao!"

	para "Sono venuto a"
	line "visitare la città"

	para "dove abitavo: era"
	line "tanto che mancavo!"
	done

EusineLeavesCeladonText:
	text "<PLAYER>, hai"
	line "sentito?"

	para "Ci sono nuove"
	line "notizie sul"

	para "#MON con i"
	line "colori dell'arco-"
	cont "baleno, apparso"
	cont "alla TORRE DI"
	cont "LATTA."

	para "Ho appena rimesso"
	line "in sesto i miei"

	para "#MON, per"
	line "andare ad"
	cont "AMARANTOPOLI."

	para "Ci vediamo,"
	line "<PLAYER>!"
	done

NoBeastsText:
	text "A proposito,"
	line "<PLAYER>!"

	para "Hai già catturato"
	line "i #MON"

	para "leggendari RAIKOU"
	line "ed ENTEI?"

	para "<……><……><……>"

	para "Ok…"

	para "Anche se ne trovi"
	line "uno, informami"
	cont "subito!"

	para "Conto su di te,"
	line "<PLAYER>!"
	done

CeladonPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CELADON_CITY, 5
	warp_event  4,  7, CELADON_CITY, 5
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FGentlemanScript, -1
	object_event  0,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FPharmacistScript, -1
	object_event  8,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonPokecenter1FCooltrainerFScript, -1
	object_event  4,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonEusine, EVENT_SET_WHEN_FOUGHT_HO_OH
