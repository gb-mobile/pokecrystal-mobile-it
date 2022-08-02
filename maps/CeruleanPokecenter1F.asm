	object_const_def ; object_event constants
	const CERULEANPOKECENTER1F_NURSE
	const CERULEANPOKECENTER1F_SUPER_NERD
	const CERULEANPOKECENTER1F_GYM_GUY

CeruleanPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanPokecenter1FNurseScript:
	jumpstd pokecenternurse

CeruleanPokecenter1FSuperNerdScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer CeruleanPokecenter1FSuperNerdText

.mobile
	jumptextfaceplayer CeruleanPokecenter1FSuperNerdText_Mobile

CeruleanPokecenter1FGymGuyScript:
	jumptextfaceplayer CeruleanPokecenter1FGymGuyText

CeruleanPokecenter1FSuperNerdText:
	text "Nelle lotte uso"
	line "più volentieri i"

	para "#MON che ho"
	line "allevato io, anche"

	para "se sono più deboli"
	line "di altri che ho"
	cont "appena catturato."
	done

CeruleanPokecenter1FSuperNerdText_Mobile:
	text "Do you battle by"
	line "mobile phone?"

	para "If time runs out"
	line "during a battle,"

	para "waiting to see who"
	line "won is really"
	cont "nerve wracking."
	done

CeruleanPokecenter1FGymGuyText:
	text "Il SUPERTRENO"
	line "tocca i "

	para "550 km/h! Va da"
	line "KANTO a JOHTO"

	para "in un batter"
	line "d'occhio."

	para "Così, raggiungere"
	line "JOHTO è diventato"
	cont "facilissimo."
	done

CeruleanPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, CERULEAN_CITY, 4
	warp_event  4,  7, CERULEAN_CITY, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FSuperNerdScript, -1
	object_event  1,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanPokecenter1FGymGuyScript, -1
