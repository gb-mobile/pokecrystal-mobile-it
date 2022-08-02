	object_const_def ; object_event constants
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN

Route40BattleTowerGate_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ShowSailor

.ShowSailor:
	special Mobile_DummyReturnFalse
	iffalse .nomobile
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR

.nomobile
	return

Route40BattleTowerGateRockerScript:
	jumptextfaceplayer UnknownText_0x9f783

Route40BattleTowerGateTwinScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer UnknownText_0x9f66f

.mobile
	jumptextfaceplayer UnknownText_0x9f6ba

UnknownText_0x9f66f:
	text "Did you come to"
	line "see the BATTLE"
	cont "TOWER too?"

	para "But I guess you"
	line "can't go in yet."
	done

UnknownText_0x9f6ba:
	text "BATTLE TOWER has"
	line "opened."

	para "I want to go, but"
	line "I haven't thought"

	para "up a cool line for"
	line "when I win."
	done

Route40BattleTowerGateRockerText:
	text "Stai andando alla"
	line "TORRE LOTTA?"

	para "Non dirlo in giro,"
	line "ma se vinci molte"

	para "lotte ricevi"
	line "regali speciali."
	done

UnknownText_0x9f783:
	text "I'm going to train"
	line "my #MON so I'll"

	para "be all ready for"
	line "the BATTLE TOWER."
	done

Route40BattleTowerGateTwinText:
	text "I #MON che"
	line "voglio usare hanno"

	para "tutti livelli"
	line "diversi."

	para "Quindi, prima devo"
	line "allenarli!"
	done

Route40BattleTowerGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  7, ROUTE_40, 1
	warp_event  5,  7, ROUTE_40, 1
	warp_event  4,  0, BATTLE_TOWER_OUTSIDE, 1
	warp_event  5,  0, BATTLE_TOWER_OUTSIDE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateRockerScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event  7,  5, SPRITE_TWIN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route40BattleTowerGateTwinScript, -1
