	object_const_def ; object_event constants
	const OLIVINELIGHTHOUSE1F_SAILOR
	const OLIVINELIGHTHOUSE1F_POKEFAN_F

OlivineLighthouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineLighthouse1FSailorScript:
	jumptextfaceplayer OlivineLighthouse1FSailorText

OlivineLighthouse1FPokefanFScript:
	jumptextfaceplayer OlivineLighthouse1FPokefanFText

OlivineLighthouse1FSailorText:
	text "La gente si allena"
	line "in questo FARO."

	para "Non è facile"
	line "salire a causa dei"
	cont "molti allenatori."
	done

OlivineLighthouse1FPokefanFText:
	text "In passato i #-"
	line "MON illuminavano"

	para "il mare intorno a"
	line "OLIVINOPOLI"
	cont "di notte."

	para "Il FARO è stato"
	line "dedicato a quei"
	cont "#MON."
	done

OlivineLighthouse1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 10, 17, OLIVINE_CITY, 9
	warp_event 11, 17, OLIVINE_CITY, 9
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_2F, 1
	warp_event 16, 13, OLIVINE_LIGHTHOUSE_2F, 3
	warp_event 17, 13, OLIVINE_LIGHTHOUSE_2F, 4

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  8,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FSailorScript, -1
	object_event 16,  9, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FPokefanFScript, -1
