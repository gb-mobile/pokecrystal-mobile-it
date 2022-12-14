	object_const_def ; object_event constants
	const OLIVINEPOKECENTER1F_NURSE
	const OLIVINEPOKECENTER1F_FISHING_GURU
	const OLIVINEPOKECENTER1F_FISHER
	const OLIVINEPOKECENTER1F_TEACHER

OlivinePokecenter1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivinePokecenter1FNurseScript:
	jumpstd pokecenternurse

OlivinePokecenter1FFishingGuruScript:
	jumpstd happinesschecknpc

OlivinePokecenter1FFisherScript:
	jumptextfaceplayer OlivinePokecenter1FFisherText

OlivinePokecenter1FTeacherScript:
	jumptextfaceplayer OlivinePokecenter1FTeacherText

OlivinePokecenter1FFisherText:
	text "Nell'OLIVIN BAR,"
	line "qui vicino, c'è un"

	para "MARINAIO davvero"
	line "generoso."

	para "Ha insegnato FORZA"
	line "al mio #MON."

	para "Così ora può"
	line "spostare i massi."
	done

OlivinePokecenter1FTeacherText:
	text "C'era un tipo a"
	line "FIORLISOPOLI, di"
	cont "là dal mare."

	para "L'ho sentito"
	line "vantarsi dei suoi"
	cont "#MON rari."
	done

OlivinePokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, OLIVINE_CITY, 1
	warp_event  4,  7, OLIVINE_CITY, 1
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FNurseScript, -1
	object_event  8,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FFishingGuruScript, -1
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FFisherScript, -1
	object_event  7,  1, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePokecenter1FTeacherScript, -1
