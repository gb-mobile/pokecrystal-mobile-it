	object_const_def ; object_event constants
	const GOLDENRODPPSPEECHHOUSE_FISHER
	const GOLDENRODPPSPEECHHOUSE_LASS

GoldenrodPPSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodPPSpeechHouseFisherScript:
	jumptextfaceplayer GoldenrodPPSpeechHouseFisherText

GoldenrodPPSpeechHouseLassScript:
	jumptextfaceplayer GoldenrodPPSpeechHouseLassText

GoldenrodPPSpeechHouseBookshelf2:
	jumpstd difficultbookshelf

GoldenrodPPSpeechHouseBookshelf1:
	jumpstd magazinebookshelf

GoldenrodPPSpeechHouseRadio:
	jumpstd radio2

GoldenrodPPSpeechHouseFisherText:
	text "Una volta, durante"
	line "una lotta, il mio"

	para "#MON non poteva"
	line "più fare nessuna"
	cont "mossa."

	para "I PUNTI POTENZA, o"
	line "PP delle sue mosse"

	para "erano esauriti"
	line "completamente."
	done

GoldenrodPPSpeechHouseLassText:
	text "A volte un #MON"
	line "sano può non"

	para "essere in"
	line "grado di usare"
	cont "le sue mosse."

	para "In questo caso,"
	line "rimettilo in sesto"
	cont "in un CENTRO #-"
	cont "MON o usando uno"
	cont "strumento."
	done

GoldenrodPPSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 7
	warp_event  3,  7, GOLDENROD_CITY, 7

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, GoldenrodPPSpeechHouseBookshelf1
	bg_event  1,  1, BGEVENT_READ, GoldenrodPPSpeechHouseBookshelf2
	bg_event  7,  1, BGEVENT_READ, GoldenrodPPSpeechHouseRadio

	db 2 ; object events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPPSpeechHouseFisherScript, -1
	object_event  5,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPPSpeechHouseLassScript, -1
