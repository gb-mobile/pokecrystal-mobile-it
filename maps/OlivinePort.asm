	object_const_def ; object_event constants
	const OLIVINEPORT_SAILOR1
	const OLIVINEPORT_SAILOR2
	const OLIVINEPORT_SAILOR3
	const OLIVINEPORT_FISHING_GURU1
	const OLIVINEPORT_FISHING_GURU2
	const OLIVINEPORT_YOUNGSTER
	const OLIVINEPORT_COOLTRAINER_F

OlivinePort_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .LeaveFastShip ; SCENE_OLIVINEPORT_LEAVE_SHIP

	db 0 ; callbacks

.DummyScene0:
	end

.LeaveFastShip:
	prioritysjump .LeaveFastShipScript
	end

.LeaveFastShipScript:
	applymovement PLAYER, MovementData_0x74a32
	appear OLIVINEPORT_SAILOR1
	setscene SCENE_DEFAULT
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	blackoutmod OLIVINE_CITY
	end

OlivinePortSailorAtGangwayScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue OlivinePortAlreadyRodeScript
	writetext UnknownText_0x74a55
	waitbutton
	closetext
	turnobject OLIVINEPORT_SAILOR1, DOWN
	pause 10
	playsound SFX_EXIT_BUILDING
	disappear OLIVINEPORT_SAILOR1
	waitsfx
	applymovement PLAYER, MovementData_0x74a30
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	clearevent EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	setevent EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	clearevent EVENT_BEAT_COOLTRAINERM_SEAN
	clearevent EVENT_BEAT_COOLTRAINERF_CAROL
	clearevent EVENT_BEAT_GENTLEMAN_EDWARD
	clearevent EVENT_BEAT_BEAUTY_CASSIE
	clearevent EVENT_BEAT_PSYCHIC_RODNEY
	clearevent EVENT_BEAT_SUPER_NERD_SHAWN
	clearevent EVENT_BEAT_SAILOR_GARRETT
	clearevent EVENT_BEAT_FISHER_JONAH
	clearevent EVENT_BEAT_BLACKBELT_WAI
.FirstTime:
	clearevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	appear OLIVINEPORT_SAILOR1
	setmapscene FAST_SHIP_1F, SCENE_FASTSHIP1F_ENTER_SHIP
	warp FAST_SHIP_1F, 25, 1
	end

OlivinePortAlreadyRodeScript:
	writetext UnknownText_0x74a80
	waitbutton
	closetext
	end

OlivinePortWalkUpToShipScript:
	turnobject OLIVINEPORT_SAILOR3, RIGHT
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .skip
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .skip
	turnobject PLAYER, LEFT
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .NextShipMonday
	ifequal SATURDAY, .NextShipMonday
	ifequal TUESDAY, .NextShipFriday
	ifequal WEDNESDAY, .NextShipFriday
	ifequal THURSDAY, .NextShipFriday
.FirstTime:
	writetext UnknownText_0x74a9c
	yesorno
	iffalse OlivinePortNotRidingMoveAwayScript
	writetext UnknownText_0x74ada
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext UnknownText_0x74b11
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	applymovement PLAYER, MovementData_0x74a37
	sjump OlivinePortSailorAtGangwayScript

.NoTicket:
	writetext UnknownText_0x74b41
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.NextShipMonday:
	writetext UnknownText_0x74ba8
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.NextShipFriday:
	writetext UnknownText_0x74bce
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

.skip:
	end

OlivinePortNotRidingScript:
	writetext UnknownText_0x74af6
	waitbutton
	closetext
	end

OlivinePortNotRidingMoveAwayScript:
	writetext UnknownText_0x74af6
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x74a34
	end

OlivinePortSailorAfterHOFScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue OlivinePortAlreadyRodeScript
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iffalse .FirstTime
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .NextShipMonday
	ifequal SATURDAY, .NextShipMonday
	ifequal TUESDAY, .NextShipFriday
	ifequal WEDNESDAY, .NextShipFriday
	ifequal THURSDAY, .NextShipFriday
.FirstTime:
	writetext UnknownText_0x74a9c
	yesorno
	iffalse OlivinePortNotRidingScript
	writetext UnknownText_0x74ada
	buttonsound
	checkitem S_S_TICKET
	iffalse .NoTicket
	writetext UnknownText_0x74b11
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	readvar VAR_FACING
	ifequal RIGHT, .Right
	applymovement PLAYER, MovementData_0x74a3f
	sjump OlivinePortSailorAtGangwayScript

.Right:
	applymovement PLAYER, MovementData_0x74a49
	sjump OlivinePortSailorAtGangwayScript

.NoTicket:
	writetext UnknownText_0x74b41
	waitbutton
	closetext
	end

.NextShipMonday:
	writetext UnknownText_0x74ba8
	waitbutton
	closetext
	end

.NextShipFriday:
	writetext UnknownText_0x74bce
	waitbutton
	closetext
	end

OlivinePortSailorBeforeHOFScript:
	jumptextfaceplayer OlivinePortSailorBeforeHOFText

OlivinePortFishingGuru1Script:
	faceplayer
	opentext
	writetext OlivinePortFishingGuru1Text
	waitbutton
	closetext
	turnobject OLIVINEPORT_FISHING_GURU1, UP
	end

OlivinePortFishingGuru2Script:
	faceplayer
	opentext
	writetext OlivinePortFishingGuru2Text
	waitbutton
	closetext
	turnobject OLIVINEPORT_FISHING_GURU2, UP
	end

OlivinePortYoungsterScript:
	faceplayer
	opentext
	writetext OlivinePortYoungsterText
	waitbutton
	closetext
	turnobject OLIVINEPORT_YOUNGSTER, DOWN
	end

OlivinePortCooltrainerFScript:
	faceplayer
	opentext
	writetext OlivinePortCooltrainerFText
	waitbutton
	closetext
	turnobject OLIVINEPORT_COOLTRAINER_F, DOWN
	end

OlivinePortHiddenProtein:
	hiddenitem PROTEIN, EVENT_OLIVINE_PORT_HIDDEN_PROTEIN

MovementData_0x74a30:
	step DOWN
	step_end

MovementData_0x74a32:
	step UP
	step_end

MovementData_0x74a34:
	step RIGHT
	turn_head LEFT
	step_end

MovementData_0x74a37:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74a3f:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x74a49:
	step UP
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

UnknownText_0x74a55:
	text "Siamo in partenza."
	line "Sali a bordo!"
	done

UnknownText_0x74a80:
	text "Mi spiace, ora non"
	line "puoi imbarcarti."
	done

UnknownText_0x74a9c:
	text "Questa è la NAVE"
	line "VELOCE M/N ACQUA."

	para "Vuoi imbarcarti"
	line "ora?"
	done

UnknownText_0x74ada:
	text "Posso vedere il"
	line "BIGLIETTO NAVE?"
	done

UnknownText_0x74af6:
	text "Arrivederci!"
	done

UnknownText_0x74b11:
	text "<PLAYER> mostra"
	line "il BIGL.NAVE."

	para "Benissimo, grazie."
	done

UnknownText_0x74b41:
	text "<PLAYER> vuole"
	line "mostrare il BIGL."
	cont "NAVE…"

	para "…Ma non ce l'ha!"

	para "Spiacente!"
	line "Puoi imbarcarti"

	para "soltanto se hai"
	line "un BIGL.NAVE."
	done

UnknownText_0x74ba8:
	text "La NAVE VELOCE"
	line "salperà lunedì"
	cont "prossimo."
	done

UnknownText_0x74bce:
	text "La NAVE VELOCE"
	line "salperà"
	cont "venerdì prossimo."
	done

OlivinePortFishingGuru1Text:
	text "Qui si trovano"
	line "molti SHELLDER."

	para "Altrove sono"
	line "piuttosto rari."
	done

OlivinePortFishingGuru2Text:
	text "Quanti tipi di"
	line "AMI possiedi?"

	para "Con i vari tipi di"
	line "AMI si catturano"
	cont "#MON diversi."
	done

OlivinePortYoungsterText:
	text "La M/N ACQUA vola"
	line "a pelo d'acqua con"
	cont "i suoi motori"
	cont "a jet."
	done

OlivinePortCooltrainerFText:
	text "Ci sono così tanti"
	line "#MON a KANTO!"

	para "Come vorrei"
	line "andarci…"
	done

OlivinePortSailorBeforeHOFText:
	text "Non vorremmo che"
	line "cadessi in acqua,"

	para "perciò non puoi"
	line "passare."
	done

OlivinePort_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 11,  7, OLIVINE_PORT_PASSAGE, 5
	warp_event  7, 23, FAST_SHIP_1F, 1

	db 1 ; coord events
	coord_event  7, 15, SCENE_DEFAULT, OlivinePortWalkUpToShipScript

	db 1 ; bg events
	bg_event  1, 22, BGEVENT_ITEM, OlivinePortHiddenProtein

	db 7 ; object events
	object_event  7, 23, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortSailorAtGangwayScript, EVENT_OLIVINE_PORT_SAILOR_AT_GANGWAY
	object_event  7, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortSailorBeforeHOFScript, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  6, 15, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortSailorAfterHOFScript, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event  4, 14, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortFishingGuru1Script, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event 13, 14, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortFishingGuru2Script, EVENT_OLIVINE_PORT_SPRITES_BEFORE_HALL_OF_FAME
	object_event  4, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortYoungsterScript, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
	object_event 11, 15, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortCooltrainerFScript, EVENT_OLIVINE_PORT_SPRITES_AFTER_HALL_OF_FAME
