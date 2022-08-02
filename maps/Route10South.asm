	object_const_def ; object_event constants
	const ROUTE10SOUTH_POKEFAN_M1
	const ROUTE10SOUTH_POKEFAN_M2

Route10South_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerHikerJim:
	trainer HIKER, JIM, EVENT_BEAT_HIKER_JIM, HikerJimSeenText, HikerJimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerJimAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmRobert:
	trainer POKEFANM, ROBERT, EVENT_BEAT_POKEFANM_ROBERT, PokefanmRobertSeenText, PokefanmRobertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmRobertAfterBattleText
	waitbutton
	closetext
	end

Route10Sign:
	jumptext Route10SignText

HikerJimSeenText:
	text "Eheheh!"
	done

HikerJimBeatenText:
	text "Eheh-etciù!"
	done

HikerJimAfterBattleText:
	text "L'allergia mi"
	line "fa starnutire."
	cont "Eheheh-ecciù!"
	done

PokefanmRobertSeenText:
	text "Ti piacciono i"
	line "#MON, vero?"

	para "Anche a me!"
	done

PokefanmRobertBeatenText:
	text "È una"
	line "catastrofe."
	done

PokefanmRobertAfterBattleText:
	text "Guarda cosa hai"
	line "fatto al mio"
	cont "#MON…"

	para "Non lo"
	line "dimenticherò…"
	done

Route10SignText:
	text "PERCORSO 10"

	para "CELESTOPOLI -"
	line "LAVANDONIA"
	done

Route10South_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6,  1, ROCK_TUNNEL_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  3, BGEVENT_READ, Route10Sign

	db 2 ; object events
	object_event 17,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerJim, -1
	object_event  8, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmRobert, -1
