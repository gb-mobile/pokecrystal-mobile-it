	object_const_def ; object_event constants
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET1
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET2
	const GOLDENRODUNDERGROUNDWAREHOUSE_ROCKET3
	const GOLDENRODUNDERGROUNDWAREHOUSE_GENTLEMAN
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL1
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL2
	const GOLDENRODUNDERGROUNDWAREHOUSE_POKE_BALL3

GoldenrodUndergroundWarehouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ResetSwitches

.ResetSwitches:
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_4
	clearevent EVENT_SWITCH_5
	clearevent EVENT_SWITCH_6
	clearevent EVENT_SWITCH_7
	clearevent EVENT_SWITCH_8
	clearevent EVENT_SWITCH_9
	clearevent EVENT_SWITCH_10
	clearevent EVENT_SWITCH_11
	clearevent EVENT_SWITCH_12
	clearevent EVENT_SWITCH_13
	clearevent EVENT_SWITCH_14
	setval 0
	writemem wUndergroundSwitchPositions
	return

TrainerGruntM24:
	trainer GRUNTM, GRUNTM_24, EVENT_BEAT_ROCKET_GRUNTM_24, GruntM24SeenText, GruntM24BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM24AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM14:
	trainer GRUNTM, GRUNTM_14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM14AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM15:
	trainer GRUNTM, GRUNTM_15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM15AfterBattleText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseDirectorScript:
	faceplayer
	opentext
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	writetext DirectorIntroText
	buttonsound
	verbosegiveitem CARD_KEY
	setevent EVENT_RECEIVED_CARD_KEY
	setevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_1
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	clearevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	writetext DirectorCardKeyText
	buttonsound
.GotCardKey:
	writetext DirectorAfterText
	waitbutton
	closetext
	end

GoldenrodUndergroundWarehouseMaxEther:
	itemball MAX_ETHER

GoldenrodUndergroundWarehouseTMSleepTalk:
	itemball TM_SLEEP_TALK

GoldenrodUndergroundWarehouseUltraBall:
	itemball ULTRA_BALL

GruntM24SeenText:
	text "Come hai fatto"
	line "ad arrivare qui?"

	para "Non ho scelta:"
	line "dovrò sbarazzarmi"
	cont "di te!"
	done

GruntM24BeatenText:
	text "Sei tu che mi hai"
	line "liquidato…"
	done

GruntM24AfterBattleText:
	text "TEAM ROCKET andrà"
	line "avanti, aspettando"
	cont "il ritorno di"
	cont "GIOVANNI."

	para "Faremo ciò che"
	line "dovremo."
	done

GruntM14SeenText:
	text "Dove credi di"
	line "andare?"

	para "Non ho pietà per"
	line "i nemici, neppure"
	cont "per i ragazzini!"
	done

GruntM14BeatenText:
	text "Maledizione!"
	done

GruntM14AfterBattleText:
	text "Ho perso…"

	para "Perdonami"
	line "GIOVANNI!"
	done

GruntM15SeenText:
	text "Hi hi hi!"
	line "Mi ricordo di te!"

	para "Te la sei cavata"
	line "bene nel rifugio!"
	done

GruntM15BeatenText:
	text "Hi hi hi!"
	line "Impossibile!"
	done

GruntM15AfterBattleText:
	text "Hi hi hi!"
	line "Dannazione! Mi"
	cont "ricorderò di te!"
	done

DirectorIntroText:
	text "DIRETTORE: Chi è?"
	line "Che succede? Sei"
	cont "qui per salvarmi?"

	para "Grazie!"

	para "E la TORRE RADIO?"

	para "Che sta accadendo"
	line "lassù?"

	para "TEAM ROCKET se ne"
	line "è impadronito?"

	para "Ecco qui. Prendi"
	line "l'APRIPORTA."
	done

DirectorCardKeyText:
	text "DIRETTORE: Usalo"
	line "per aprire la"
	cont "porta del 2ºP."
	done

DirectorAfterText:
	text "Ti prego di"
	line "aiutarmi!"

	para "Nessuno sa cosa"
	line "potranno fare se"

	para "prenderanno il"
	line "controllo del"
	cont "trasmettitore."

	para "Potrebbero persino"
	line "controllare i"

	para "#MON con uno"
	line "speciale segnale!"

	para "Posso contare solo"
	line "su di te."

	para "Salva la TORRE"
	line "RADIO, ti prego…"

	para "E tutti i #MON"
	line "del paese!"
	done

GoldenrodUndergroundWarehouse_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 2
	warp_event  3, 12, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 3
	warp_event 17,  2, GOLDENROD_DEPT_STORE_B1F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  9,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM24, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM14, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  3, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerGruntM15, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodUndergroundWarehouseDirectorScript, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 18, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseMaxEther, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_MAX_ETHER
	object_event 13,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseTMSleepTalk, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_TM_SLEEP_TALK
	object_event  2,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodUndergroundWarehouseUltraBall, EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_ULTRA_BALL
