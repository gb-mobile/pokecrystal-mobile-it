	object_const_def ; object_event constants
	const DAYOFWEEKSIBLINGSHOUSE_POKEDEX

DayOfWeekSiblingsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DayOfWeekSiblingsHousePokedexScript:
	opentext
	writetext DayOfWeekSiblingsHousePokedexText1
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText2
	yesorno
	iffalse .End
	writetext DayOfWeekSiblingsHousePokedexText3
	waitbutton
.End:
	closetext
	end

DayOfWeekSiblingsHousePokedexText1:
	text "Qui c'è scritto"
	line "qualcosa!"

	para "Vuoi leggerlo?"
	done

DayOfWeekSiblingsHousePokedexText2:
	text "Fratelli e"
	line "sorelle:"

	para "È un onore per"
	line "noi servire gli"
	cont "allenatori di"
	cont "#MON."

	para "Quando gli allena-"
	line "tori si rivolgono"
	cont "a voi, date loro"
	cont "qualcosa di utile!"

	para "Con affetto,"
	line "LUANA"

	para "Continui?"
	done

DayOfWeekSiblingsHousePokedexText3:
	text "Lunedì, LUANA"
	line "PERCORSO 40"

	para "Martedì, MARTA"
	line "PERCORSO 29"

	para "Mercoledì, ERCOLE"
	line "LAGO D'IRA"

	para "Giovedì, GIORGIO"
	line "PERCORSO 36"

	para "Venerdì, VERONICA"
	line "PERCORSO 32"

	para "Sabato, SABATINO"
	line "EBANOPOLI"

	para "Domenica, DORINO"
	line "PERCORSO 37"
	done

DayOfWeekSiblingsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_26, 3
	warp_event  3,  7, ROUTE_26, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayOfWeekSiblingsHousePokedexScript, -1
