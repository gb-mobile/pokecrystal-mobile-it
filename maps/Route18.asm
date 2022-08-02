	object_const_def ; object_event constants
	const ROUTE18_YOUNGSTER1
	const ROUTE18_YOUNGSTER2

Route18_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperBoris:
	trainer BIRD_KEEPER, BORIS, EVENT_BEAT_BIRD_KEEPER_BORIS, BirdKeeperBorisSeenText, BirdKeeperBorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBorisAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperBob:
	trainer BIRD_KEEPER, BOB, EVENT_BEAT_BIRD_KEEPER_BOB, BirdKeeperBobSeenText, BirdKeeperBobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperBobAfterBattleText
	waitbutton
	closetext
	end

Route18Sign:
	jumptext Route18SignText

BirdKeeperBorisSeenText:
	text "Se vuoi trovare"
	line "dei #MON devi"

	para "cercare nell'erba"
	line "alta."
	done

BirdKeeperBorisBeatenText:
	text "Ehi!!!"
	done

BirdKeeperBorisAfterBattleText:
	text "Se sei così forte"
	line "chissà come ti"
	cont "diverti a lottare."
	done

BirdKeeperBobSeenText:
	text "La PISTA CICLABILE"
	line "è una scorciatoia"
	cont "per AZZURROPOLI."
	done

BirdKeeperBobBeatenText:
	text "…Ohi!"
	done

BirdKeeperBobAfterBattleText:
	text "Senza una BICI-"
	line "CLETTA non puoi"

	para "passare per la"
	line "scorciatoia."
	done

Route18SignText:
	text "PERCORSO 18"

	para "AZZURROPOLI -"
	line "FUCSIAPOLI"
	done

Route18_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  6, ROUTE_17_ROUTE_18_GATE, 3
	warp_event  2,  7, ROUTE_17_ROUTE_18_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9,  5, BGEVENT_READ, Route18Sign

	db 2 ; object events
	object_event  9, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBoris, -1
	object_event 13,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperBob, -1
