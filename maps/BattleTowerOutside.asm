	object_const_def ; object_event constants
	const BATTLETOWEROUTSIDE_STANDING_YOUNGSTER
	const BATTLETOWEROUTSIDE_BUENA
	const BATTLETOWEROUTSIDE_SAILOR
	const BATTLETOWEROUTSIDE_LASS

BattleTowerOutside_MapScripts: ; 67cd3
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .Callback1
	callback MAPCALLBACK_OBJECTS, .Callback2

.Callback1:
	special Mobile_DummyReturnFalse
	iftrue .doorsopen;$7CE6
	changeblock 8, 8, $2C
	return

.doorsopen
	changeblock 8, 8, $12
	return

.Callback2:
	special Mobile_DummyReturnFalse
	iffalse .nomobile
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR

.nomobile
	return

BattleTowerOutsideYoungsterScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer BattleTowerOutsideYoungsterText_NotYetOpen

.mobile
	jumptextfaceplayer BattleTowerOutsideYoungsterText_Mobile

BattleTowerOutsideBuenaScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer BattleTowerOutsideBuenaText_NotYetOpen

.mobile
	jumptextfaceplayer BattleTowerOutsideBuenaText

BattleTowerOutsideSailorScript:
	jumptextfaceplayer BattleTowerOutsideSailorText_Mobile

BattleTowerOutsideSign:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptext BattleTowerOutsideSignText_NotYetOpen

.mobile
	jumptext BattleTowerOutsideSignText

BattleTowerOutsideDoor:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptext BattleTowerOutsideText_DoorsClosed

.mobile
	jumptext BattleTowerOutsideText_DoorsOpen

BattleTowerOutsideYoungsterText_NotYetOpen:
; unreferenced
	text "Wow, the BATTLE"
	line "TOWER is huge! My"

	para "neck is tired from"
	line "looking up at it."
	done

BattleTowerOutsideYoungsterText_Mobile:
; unreferenced
	text "Wow, the BATTLE"
	line "TOWER is huge!"

	para "Since there are a"
	line "whole bunch of"

	para "trainers inside,"
	line "there must also be"

	para "a wide variety of"
	line "#MON."
	done

BattleTowerOutsideYoungsterText:
	text "Ehi, la TORRE"
	line "LOTTA è enorme!"

	para "Chissà quanti"
	line "#MON ci sono"
	cont "là dentro!"
	done

BattleTowerOutsideBuenaText_NotYetOpen:
; unreferenced
	text "What on earth do"
	line "they do here?"

	para "If the name says"
	line "anything, I guess"

	para "it must be for"
	line "#MON battles."
	done

BattleTowerOutsideBuenaText:
	text "Puoi usare solo"
	line "tre #MON."

	para "Non è facile"
	line "decidere quali"

	para "utilizzare nella"
	line "lotta…"
	done

BattleTowerOutsideSailorText_Mobile:
; unreferenced
	text "Ehehehe…"
	line "I sneaked out of"
	cont "work to come here."

	para "I'm never giving"
	line "up until I become"
	cont "a LEADER!"
	done

BattleTowerOutsideSailorText:
	text "Dovrei essere al"
	line "lavoro…"

	para "Ma non me ne vado"
	line "finché non vinco."

	para "Devo vincerle"
	line "tutte!"
	done

BattleTowerOutsideSignText_NotYetOpen:
; unused; originally shown when the Battle Tower was closed
	text "BATTLE TOWER"
	done

BattleTowerOutsideSignText:
	text "TORRE LOTTA"

	para "La grande sfida"
	line "tra Allenatori!"
	done

BattleTowerOutsideText_DoorsClosed:
; unused; originally shown when the Battle Tower was closed
	text "The BATTLE TOWER's"
	line "doors are closed…"
	done

BattleTowerOutsideText_DoorsOpen:
; unused; originally shown after the Battle Tower opened
	text "È aperta!"
	done

BattleTowerOutside_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  8, 21, ROUTE_40_BATTLE_TOWER_GATE, 3
	warp_event  9, 21, ROUTE_40_BATTLE_TOWER_GATE, 4
	warp_event  8,  9, BATTLE_TOWER_1F, 1
	warp_event  9,  9, BATTLE_TOWER_1F, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 10, 10, BGEVENT_READ, BattleTowerOutsideSign
	bg_event  8,  9, BGEVENT_READ, BattleTowerOutsideDoor; 67e8f
	bg_event  9,  9, BGEVENT_READ, BattleTowerOutsideDoor

	db 4 ; object events
	object_event  6, 12, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideYoungsterScript, -1
	object_event 13, 11, SPRITE_BUENA, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideBuenaScript, -1
	object_event 12, 18, SPRITE_SAILOR, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTowerOutsideSailorScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	object_event 12, 24, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, -1
