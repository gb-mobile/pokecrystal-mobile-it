	object_const_def ; object_event constants
	const MAHOGANYPOKECENTER1F_NURSE
	const MAHOGANYPOKECENTER1F_POKEFAN_M
	const MAHOGANYPOKECENTER1F_YOUNGSTER
	const MAHOGANYPOKECENTER1F_COOLTRAINER_F

MahoganyPokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyPokecenter1FNurseScript:
	jumpstd pokecenternurse

MahoganyPokecenter1FPokefanMScript:
	jumptextfaceplayer MahoganyPokecenter1FPokefanMText

MahoganyPokecenter1FYoungsterScript:
	jumptextfaceplayer MahoganyPokecenter1FYoungsterText

MahoganyPokecenter1FCooltrainerFScript:
	jumptextfaceplayer MahoganyPokecenter1FCooltrainerFText

MahoganyPokecenter1FPokefanMText:
	text "Che succede? TEAM"
	line "ROCKET è"
	cont "ritornato?"

	para "Al LAGO D'IRA ho"
	line "visto degli uomini"
	cont "in nero…"
	done

MahoganyPokecenter1FYoungsterText:
	text "Cerco di impedire"
	line "che i #MON si"
	cont "evolvano troppo"
	cont "presto."

	para "Prima che si evol-"
	line "vano voglio inse-"
	cont "gnare loro certe"
	cont "mosse."
	done

MahoganyPokecenter1FCooltrainerFText:
	text "I #MON sono più"
	line "forti dopo"

	para "l'evoluzione, ma"
	line "imparano le mosse"
	cont "più lentamente."
	done

MahoganyPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, MAHOGANY_TOWN, 4
	warp_event  4,  7, MAHOGANY_TOWN, 4
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FNurseScript, -1
	object_event  7,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FYoungsterScript, -1
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MahoganyPokecenter1FCooltrainerFScript, -1
