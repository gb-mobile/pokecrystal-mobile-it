	object_const_def ; object_event constants
	const ECRUTEAKITEMFINDERHOUSE_COOLTRAINER_M
	const ECRUTEAKITEMFINDERHOUSE_POKEDEX

EcruteakItemfinderHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

EcruteakItemfinderGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_ITEMFINDER
	iftrue .itemfinder
	writetext EcruteakItemfinderAdventureText
	yesorno
	iffalse .no
	writetext EcruteakItemfinderTrueSpiritText
	buttonsound
	verbosegiveitem ITEMFINDER
	setevent EVENT_GOT_ITEMFINDER
.itemfinder:
	writetext ItemfinderExplanationText
	waitbutton
	closetext
	end

.no:
	writetext EcruteakItemfinderToEachHisOwnText
	waitbutton
	closetext
	end

EcruteakHistoryBook:
	opentext
	writetext EcruteakHistoryBookText
	yesorno
	iftrue .ReadBook
	closetext
	end

.ReadBook:
	writetext EcruteakTwoTowersText
	yesorno
	iftrue .KeepReading
	closetext
	end

.KeepReading:
	writetext EcruteakThreeMonText
	waitbutton
	closetext
	end

ItemFinderHouseRadio:
	jumpstd radio2

EcruteakItemfinderAdventureText:
	text "Stai vivendo un'"
	line "avventura con i"
	cont "tuoi #MON?"

	para "Ma che avventura"
	line "è senza un tesoro"
	cont "da trovare?"

	para "Ho ragione o non"
	line "ho ragione?!"
	done

EcruteakItemfinderTrueSpiritText:
	text "Bene, vedo che"
	line "comprendi il vero"

	para "spirito dell'"
	line "avventura."

	para "Mi piace! Voglio"
	line "darti questo!"
	done

ItemfinderExplanationText:
	text "Molti strumenti"
	line "per terra non sono"

	para "facilissimi da"
	line "vedere."

	para "Con DETECTOR puoi"
	line "trovare uno stru-"
	cont "mento per terra"
	cont "nelle vicinanze."

	para "Non ti dice il"
	line "punto preciso:"

	para "quello devi"
	line "trovarlo tu!"

	para "Ho sentito dire"
	line "che ci sono molti"

	para "strumenti nella"
	line "TORRE BRUCIATA"
	cont "di AMARANTOPOLI."
	done

EcruteakItemfinderToEachHisOwnText:
	text "Oh… A ciascuno"
	line "il suo…"
	done

EcruteakHistoryBookText:
	text "STORIA di"
	line "AMARANTOPOLI."

	para "Vuoi leggerla?"
	done

EcruteakTwoTowersText:
	text "Ad AMARANTOPOLI"
	line "ci sono due torri."

	para "Su ogni torre si"
	line "posava un forte"
	cont "#MON volante."

	para "Ma una delle torri"
	line "è stata bruciata"
	cont "da un incendio."

	para "Da allora, i due"
	line "#MON non si"
	cont "sono più visti…"

	para "Leggi ancora?"
	done

EcruteakThreeMonText:
	text "Ad AMARANTOPOLI"
	line "vivevano anche tre"

	para "#MON che"
	line "correvano per la"
	cont "città."

	para "Pare che fossero"
	line "nati dall'acqua,"

	para "dal fulmine e dal"
	line "fuoco."

	para "Avevano una"
	line "potenza"
	cont "incontrollabile."

	para "Perciò correvano"
	line "nelle praterie,"

	para "più veloci del"
	line "vento."
	done

EcruteakItemfinderHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 11
	warp_event  4,  7, ECRUTEAK_CITY, 11

	db 0 ; coord events

	db 1 ; bg events
	bg_event  2,  1, BGEVENT_READ, ItemFinderHouseRadio

	db 2 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakItemfinderGuy, -1
	object_event  3,  3, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHistoryBook, -1
