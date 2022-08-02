	object_const_def ; object_event constants
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf:
; unused
	jumpstd picturebookshelf

FishingDudeText:
	text "Sono il PESCATORE"
	line "GENTILE, il più"
	cont "vecchio dei FRA-"
	cont "TELLI PESCATORI."

	para "Hai visto il GURU"
	line "PESCATORE al LAGO"
	cont "D'IRA?"

	para "Sogna di vedere il"
	line "MAGIKARP più"
	cont "grande del mondo."

	para "Perché non gli"
	line "mostri uno dei"

	para "MAGIKARP che hai"
	line "catturato?"

	para "Chissà, magari"
	line "catturi il"
	cont "MAGIKARP dei suoi"
	cont "sogni!"
	done

FishingDudesHousePhotoText:
	text "Nella foto c'è"
	line "gente che pesca…"

	para "Sembra che si"
	line "divertano…"
	done

VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
