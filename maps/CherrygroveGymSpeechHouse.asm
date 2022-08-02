	object_const_def ; object_event constants
	const CHERRYGROVEGYMSPEECHHOUSE_POKEFAN_M
	const CHERRYGROVEGYMSPEECHHOUSE_BUG_CATCHER

CherrygroveGymSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CherrygroveGymSpeechHousePokefanMScript:
	jumptextfaceplayer CherrygroveGymSpeechHousePokefanMText

CherrygroveGymSpeechHouseBugCatcherScript:
	jumptextfaceplayer CherrygroveGymSpeechHouseBugCatcherText

CherrygroveGymSpeechHouseBookshelf:
	jumpstd picturebookshelf

CherrygroveGymSpeechHousePokefanMText:
	text "Vuoi testare le"
	line "tue abilità come"

	para "Allenatore di "
	line "#MON?"

	para "Allora, sfida le"
	line "PALESTRE #MON"

	para "di JOHTO per"
	line "vincere le"
	cont "MEDAGLIE."
	done

CherrygroveGymSpeechHouseBugCatcherText:
	text "Da grande"
	line "diventerò"
	cont "CAPOPALESTRA!"

	para "Faccio lottare i"
	line "miei #MON con"

	para "quelli del mio"
	line "amico per"
	cont "rinforzarli."
	done

CherrygroveGymSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CHERRYGROVE_CITY, 3
	warp_event  3,  7, CHERRYGROVE_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CherrygroveGymSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CherrygroveGymSpeechHouseBookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CherrygroveGymSpeechHousePokefanMScript, -1
	object_event  5,  5, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveGymSpeechHouseBugCatcherScript, -1
