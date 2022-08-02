	object_const_def ; object_event constants
	const CIANWOODPOKECENTER1F_NURSE
	const CIANWOODPOKECENTER1F_LASS
	const CIANWOODPOKECENTER1F_GYM_GUY
	const CIANWOODPOKECENTER1F_SUPER_NERD

CianwoodPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodPokecenter1FNurseScript:
	jumpstd pokecenternurse

CianwoodPokecenter1FLassScript:
	jumptextfaceplayer CianwoodPokecenter1FLassText

CianwoodGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_CHUCK
	iftrue .CianwoodGymGuyWinScript
	opentext
	writetext CianwoodGymGuyText
	waitbutton
	closetext
	end

.CianwoodGymGuyWinScript:
	opentext
	writetext CianwoodGymGuyWinText
	waitbutton
	closetext
	end

CianwoodPokecenter1FSuperNerdScript:
	jumptextfaceplayer CianwoodPokecenter1FSuperNerdText

CianwoodPokecenter1FLassText:
	text "Hai visto il"
	line "#FANATICO?"

	para "Sta sempre a"
	line "vantarsi dei suoi"
	cont "#MON rari."
	done

CianwoodGymGuyText:
	text "Gli allenatori di"
	line "questa PALESTRA"
	cont "sono prepotenti."

	para "Se mi vedono in"
	line "giro potrebbero"
	cont "attaccarmi."

	para "Un consiglio: il"
	line "CAPOPALESTRA usa"

	para "#MON di tipo"
	line "lotta."

	para "Perciò, confondilo"
	line "con #MON di"
	cont "tipo psico."

	para "Togli di mezzo i"
	line "suoi #MON prima"

	para "che possano usare"
	line "la forza fisica."

	para "Inoltre, dovrai"
	line "spostare in modo"
	cont "corretto i massi"
	cont "che si trovano"
	cont "nella PALESTRA."

	para "Se fai un errore,"
	line "esci e rientra."
	done

CianwoodGymGuyWinText:
	text "Hai vinto,"
	line "<PLAYER>! Te lo si"
	cont "legge in faccia!"
	done

CianwoodPokecenter1FUnusedText1:
; unreferenced
	text "Non hai voglia di"
	line "mostrare i #MON"

	para "a tutti i tuoi"
	line "amici?"

	para "Vorrei mostrare il"
	line "#MON che ho"

	para "catturato ad un"
	line "mio amico di"
	cont "VIOLAPOLI."
	done

CianwoodPokecenter1FUnusedText2:
; unreferenced
	text "I've been battling"
	line "my pal in VIOLET"

	para "using a MOBILE"
	line "ADAPTER link."

	para "I'm down 5-7"
	line "against him. I've"
	cont "gotta crank it up!"
	done

CianwoodPokecenter1FSuperNerdText:
	text "Mi piace mostrare"
	line "i #MON che ho"

	para "fatto crescere."
	line "Anche a te?"

	para "Penso che mostrerò"
	line "i miei #MON in"

	para "un bel po' di"
	line "lotte!"
	done

CianwoodPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CIANWOOD_CITY, 3
	warp_event  4,  7, CIANWOOD_CITY, 3
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FNurseScript, -1
	object_event  1,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FLassScript, -1
	object_event  5,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodGymGuyScript, -1
	object_event  8,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPokecenter1FSuperNerdScript, -1
