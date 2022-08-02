	object_const_def ; object_event constants
	const ROUTE13_YOUNGSTER1
	const ROUTE13_YOUNGSTER2
	const ROUTE13_POKEFAN_M1
	const ROUTE13_POKEFAN_M2
	const ROUTE13_POKEFAN_M3

Route13_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokefanmAlex:
	trainer POKEFANM, ALEX, EVENT_BEAT_POKEFANM_ALEX, PokefanmAlexSeenText, PokefanmAlexBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmAlexAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJoshua:
	trainer POKEFANM, JOSHUA, EVENT_BEAT_POKEFANM_JOSHUA, PokefanmJoshuaSeenText, PokefanmJoshuaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJoshuaAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperPerry:
	trainer BIRD_KEEPER, PERRY, EVENT_BEAT_BIRD_KEEPER_PERRY, BirdKeeperPerrySeenText, BirdKeeperPerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPerryAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBret:
	trainer BIRD_KEEPER, BRET, EVENT_BEAT_BIRD_KEEPER_BRET, BirdKeeperBretSeenText, BirdKeeperBretBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBretAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerKenny:
	trainer HIKER, KENNY, EVENT_BEAT_HIKER_KENNY, HikerKennySeenText, HikerKennyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerKennyAfterBattleText
	waitbutton
	closetext
	end

Route13TrainerTips:
	jumptext Route13TrainerTipsText

Route13Sign:
	jumptext Route13SignText

Route13DirectionsSign:
	jumptext Route13DirectionsSignText

Route13HiddenCalcium:
	hiddenitem CALCIUM, EVENT_ROUTE_13_HIDDEN_CALCIUM

PokefanmAlexSeenText:
	text "Incantati davanti"
	line "ai miei #MON"
	cont "regali!"
	done

PokefanmAlexBeatenText:
	text "Come… osi"
	line "prenderti gioco"
	cont "della regalità!"
	done

PokefanmAlexAfterBattleText:
	text "Chiunque vorrebbe"
	line "diventare re."
	done

PokefanmJoshuaSeenText:
	text "Ehi! Ti andrebbe"
	line "di sfidare la"
	cont "mia banda PIKACHU?"
	done

PokefanmJoshuaBeatenText:
	text "PI-PIKACHU!"
	done

PokefanmJoshuaAfterBattleText:
	text "Dai l'idea di"
	line "avere molti"

	para "#MON, ma"
	line "PIKACHU è il"
	cont "migliore."
	done

BirdKeeperPerrySeenText:
	text "L'agilità è la"
	line "qualità principale"
	cont "dei #MON"
	cont "uccello."
	done

BirdKeeperPerryBeatenText:
	text "Mi hai battuto"
	line "perché sei veloce…"
	done

BirdKeeperPerryAfterBattleText:
	text "I tuoi #MON"
	line "sono proprio ben"
	cont "allenati."
	done

BirdKeeperBretSeenText:
	text "Guarda i miei"
	line "#MON. Visto che"

	para "colore e che"
	line "belle piume?"
	done

BirdKeeperBretBeatenText:
	text "No! Non ci siamo"
	line "ancora!"
	done

BirdKeeperBretAfterBattleText:
	text "I #MON sono"
	line "felici se li"
	cont "spazzoli."
	done

HikerKennySeenText:
	text "Devo andare al"
	line "TUNNELROCCIOSO"
	cont "e catturare un"
	cont "ONIX."
	done

HikerKennyBeatenText:
	text "Ho perso…"
	done

HikerKennyAfterBattleText:
	text "Le condizioni"
	line "geologiche"
	cont "sembrano"
	cont "immutabili."

	para "Ma in realtà"
	line "si evolvono"
	cont "molto lentamente."
	done

Route13TrainerTipsText:
	text "CONSIGLI UTILI"

	para "Guarda bene lì,"
	line "a sinistra del"
	cont "palo."
	done

Route13SignText:
	text "PERCORSO 13"

	para "PONTE SILENZIO"
	line "a nord."
	done

Route13DirectionsSignText:
	text "LAVANDONIA"
	line "a nord"

	para "FUCSIAPOLI"
	line "a ovest"
	done

Route13_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 4 ; bg events
	bg_event 29, 13, BGEVENT_READ, Route13TrainerTips
	bg_event 41, 11, BGEVENT_READ, Route13Sign
	bg_event 17, 13, BGEVENT_READ, Route13DirectionsSign
	bg_event 30, 13, BGEVENT_ITEM, Route13HiddenCalcium

	db 5 ; object events
	object_event 42,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperPerry, -1
	object_event 43,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperBret, -1
	object_event 32,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJoshua, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerHikerKenny, -1
	object_event 25,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmAlex, -1
