	object_const_def ; object_event constants
	const RUINSOFALPHKABUTOCHAMBER_RECEPTIONIST
	const RUINSOFALPHKABUTOCHAMBER_SCIENTIST

RuinsOfAlphKabutoChamber_MapScripts:
	db 2 ; scene scripts
	scene_script .CheckWall ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	prioritysjump .WallOpenScript
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	return

.WallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_FINISHED
	closetext
	end

RuinsOfAlphKabutoChamberReceptionistScript:
	jumptextfaceplayer RuinsOfAlphKabutoChamberReceptionistText

RuinsOfAlphKabutoChamberPuzzle:
	refreshscreen
	setval UNOWNPUZZLE_KABUTO
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_KABUTO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_K
	setevent EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, RuinsOfAlphKabutoChamberSkyfallTopMovement
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphKabutoChamberScientistScript:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .AllUnownCaught
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .PuzzleIncomplete
	writetext UnknownText_0x589b8
	buttonsound
.PuzzleIncomplete:
	writetext UnknownText_0x588f5
	waitbutton
	closetext
	turnobject RUINSOFALPHKABUTOCHAMBER_SCIENTIST, UP
	end

.WallOpen:
	writetext UnknownText_0x5897c
	waitbutton
	closetext
	end

.AllUnownCaught:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberAncientReplica:
	jumptext RuinsOfAlphKabutoChamberAncientReplicaText

RuinsOfAlphKabutoChamberDescriptionSign:
	jumptext RuinsOfAlphKabutoChamberDescriptionText

RuinsOfAlphKabutoChamberWallPatternLeft:
	opentext
	writetext RuinsOfAlphKabutoChamberWallPatternLeftText
	setval UNOWNWORDS_ESCAPE
	special DisplayUnownWords
	closetext
	end

RuinsOfAlphKabutoChamberWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	opentext
	writetext RuinsOfAlphKabutoChamberWallPatternRightText
	setval UNOWNWORDS_ESCAPE
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext RuinsOfAlphKabutoChamberWallHoleText
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberSkyfallTopMovement:
	skyfall_top
	step_end

RuinsOfAlphKabutoChamberReceptionistText:
	text "Ti do il benvenuto"
	line "in questa sala."

	para "Questi pannelli"
	line "mobili formano un"

	para "#MON disegnato"
	line "nell'antichità."

	para "Spostando i"
	line "pannelli come un"
	cont "puzzle, formerai"
	cont "un'immagine."

	para "A destra vi è la"
	line "descrizione del"
	cont "#MON."

	para "Qui dietro, degli"
	line "scienziati stanno"

	para "esaminando dei"
	line "segni appena"
	cont "trovati."
	done

UnknownText_0x588f5:
	text "Recentemente sono"
	line "apparsi dei segni"
	cont "incomprensibili."

	para "È strano: fino a"
	line "poco tempo fa non"
	cont "c'erano…"

	para "Dai un'occhiata"
	line "alle pareti!"
	done

UnknownText_0x5897c:
	text "Ah! Ecco un altro"
	line "buco!"

	para "Ci si può passare"
	line "attraverso!"
	done

UnknownText_0x589b8:
	text "Quel tremito è"
	line "stato spaventoso!"

	para "Ma mi interessa"
	line "di più questa"
	cont "parete…"
	done

RuinsOfAlphKabutoChamberUnusedText:
; unused
	text "Pare che i segni"
	line "sulla parete"
	cont "formino parole!"

	para "E quei pannelli"
	line "mobili sembrano"

	para "essere un qualche"
	line "segnale."

	para "Credo che facciano"
	line "apparire i #MON"

	para "ma devo studiarci"
	line "ancora su…"
	done

RuinsOfAlphKabutoChamberWallPatternLeftText:
	text "Sono apparsi dei"
	line "segni sulle"
	cont "pareti…"
	done

RuinsOfAlphKabutoChamberUnownText:
; unused
	text "È un testo scritto"
	line "con gli UNOWN!"
	done

RuinsOfAlphKabutoChamberWallPatternRightText:
	text "Sono apparsi dei"
	line "segni sulle"
	cont "pareti…"
	done

RuinsOfAlphKabutoChamberWallHoleText:
	text "C'è un grosso buco"
	line "nella parete!"
	done

RuinsOfAlphKabutoChamberAncientReplicaText:
	text "È la riproduzione"
	line "di un #MON"
	cont "antico."
	done

RuinsOfAlphKabutoChamberDescriptionText:
	text "Un #MON che"
	line "viveva sul fondo"
	cont "del mare. Con gli"

	para "occhi sul dorso"
	line "si guardava"
	cont "attorno."
	done

RuinsOfAlphKabutoChamber_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 4
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 5
	warp_event  4,  0, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphKabutoChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphKabutoChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphKabutoChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphKabutoChamberDescriptionSign
	bg_event  3,  0, BGEVENT_UP, RuinsOfAlphKabutoChamberWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, RuinsOfAlphKabutoChamberWallPatternRight

	db 2 ; object events
	object_event  5,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberReceptionistScript, EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberScientistScript, -1
