	object_const_def ; object_event constants
	const CIANWOODLUGIASPEECHHOUSE_TEACHER
	const CIANWOODLUGIASPEECHHOUSE_LASS
	const CIANWOODLUGIASPEECHHOUSE_TWIN

CianwoodLugiaSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodLugiaSpeechHouseTeacherScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTeacherText

CianwoodLugiaSpeechHouseLassScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseLassText

CianwoodLugiaSpeechHouseTwinScript:
	jumptextfaceplayer CianwoodLugiaSpeechHouseTwinText

CianwoodLugiaSpeechHouseBookshelf:
	jumpstd picturebookshelf

CianwoodLugiaSpeechHouseTeacherText:
	text "Vieni da"
	line "OLIVINOPOLI?"

	para "Hai notato le"
	line "quattro isole?"

	para "Si dice che vi si"
	line "nasconda una"
	cont "mitica creatura"
	cont "marina."
	done

CianwoodLugiaSpeechHouseLassText:
	text "Pare che si possa"
	line "vedere solo se si"

	para "possiede un'"
	line "ALADARGENTO."

	para "Forse perché ha lo"
	line "stesso profumo di"
	cont "quella creatura."
	done

CianwoodLugiaSpeechHouseTwinText:
	text "Ho sentito dire"
	line "che i mulinelli"

	para "intorno alle isole"
	line "sono causati da"
	cont "creature marine."

	para "Credo che occorra"
	line "una mossa speciale"
	cont "per superarli."
	done

CianwoodLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 6
	warp_event  3,  7, CIANWOOD_CITY, 6

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodLugiaSpeechHouseBookshelf

	db 3 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTeacherScript, -1
	object_event  6,  5, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseLassScript, -1
	object_event  0,  2, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodLugiaSpeechHouseTwinScript, -1
