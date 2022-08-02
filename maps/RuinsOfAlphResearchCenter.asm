	object_const_def ; object_event constants
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST1
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST2
	const RUINSOFALPHRESEARCHCENTER_SCIENTIST3

RuinsOfAlphResearchCenter_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	scene_script .GetUnownDex ; SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.GetUnownDex:
	prioritysjump .GetUnownDexScript
	end

.ScientistCallback:
	checkscene
	ifequal SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX, .ShowScientist
	return

.ShowScientist:
	moveobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, 3, 7
	appear RUINSOFALPHRESEARCHCENTER_SCIENTIST3
	return

.GetUnownDexScript:
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x5926f
	playsound SFX_BOOT_PC
	pause 60
	playsound SFX_SWITCH_POKEMON
	pause 30
	playsound SFX_TALLY
	pause 30
	playsound SFX_TRANSACTION
	pause 30
	turnobject RUINSOFALPHRESEARCHCENTER_SCIENTIST3, DOWN
	opentext
	writetext RuinsOfAlphResearchCenterModifiedDexText
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x59274
	opentext
	writetext RuinsOfAlphResearchCenterDexUpgradedText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_UNOWN_DEX
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	applymovement RUINSOFALPHRESEARCHCENTER_SCIENTIST3, MovementData_0x59276
	setscene SCENE_RUINSOFALPHRESEARCHCENTER_NOTHING
	special RestartMapMusic
	end

RuinsOfAlphResearchCenterScientist3Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
	writetext RuinsOfAlphResearchCenterScientist3Text
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterScientist3_PrinterAvailable
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterScientist1Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkflag ENGINE_UNOWN_DEX
	iftrue .GotUnownDex
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist1Text
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist1Text_UnownAppeared
	waitbutton
	closetext
	end

.GotUnownDex:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotUnownDex
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	clearevent EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	end

RuinsOfAlphResearchCenterScientist2Script:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .UnownAppeared
	writetext RuinsOfAlphResearchCenterScientist2Text ; 50D2
	waitbutton
	closetext
	end

.UnownAppeared:
	writetext RuinsOfAlphResearchCenterScientist2Text_UnownAppeared ; 50FC
	waitbutton
	closetext
	end

.GotAllUnown:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	writetext RuinsOfAlphResearchCenterUnusedText1 ; 5141
	waitbutton
	closetext
	end

.mobile
	writetext RuinsOfAlphResearchCenterUnusedText2 ; 517F
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterComputer:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .GotAllUnown
.SkipChecking:
	writetext RuinsOfAlphResearchCenterComputerText
	waitbutton
	closetext
	end

.GotAllUnown:
	writetext RuinsOfAlphResearchCenterComputerText_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphResearchCenterPrinter:
	opentext
	checkevent EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
	iftrue .SkipChecking
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .PrinterAvailable
.SkipChecking:
	writetext RuinsOfAlphResearchCenterPrinterText_DoesntWork
	waitbutton
	closetext
	end

.PrinterAvailable:
	writetext RuinsOfAlphResearchCenterUnownPrinterText
	waitbutton
	special UnownPrinter
	closetext
	end

RuinsOfAlphResearchCenterPhoto: ; 5208
; unreferenced
	jumptext RuinsOfAlphResearchCenterProfSilktreePhotoText

RuinsOfAlphResearchCenterBookshelf:
	jumptext RuinsOfAlphResearchCenterAcademicBooksText

MovementData_0x5926f:
	step UP
	step UP
	step LEFT
	turn_head UP
	step_end

MovementData_0x59274:
	step DOWN
	step_end

MovementData_0x59276:
	step UP
	step_end

RuinsOfAlphResearchCenterModifiedDexText:
	text "Ecco fatto!"

	para "Ho modificato il"
	line "tuo #DEX."

	para "Ho aggiunto un"
	line "#DEX opzionale"

	para "per registrare i"
	line "dati degli UNOWN."

	para "Li registra nell'"
	line "ordine in cui sono"
	cont "stati catturati."
	done

RuinsOfAlphResearchCenterDexUpgradedText:
	text "Il #DEX di"
	line "<PLAYER> è stato"
	cont "modificato."
	done

RuinsOfAlphResearchCenterScientist3Text:
	text "Ogni UNOWN che"
	line "catturi sarà"
	cont "registrato."

	para "Vedrai quanti tipi"
	line "ne esistono!"
	done

RuinsOfAlphResearchCenterScientist3_PrinterAvailable:
	text "Hai catturato"
	line "tutti i tipi di"
	cont "UNOWN?"

	para "È un grande"
	line "risultato!"

	para "Ho impostato la"
	line "stampante per"
	cont "gli UNOWN."

	para "Usala quando"
	line "ne hai voglia."
	done

RuinsOfAlphResearchCenterScientist1Text:
	text "Le ROVINE hanno"
	line "circa 1500 anni."

	para "Ma nessuno sa né"
	line "quando né da chi"
	cont "furono costruite."
	done

RuinsOfAlphResearchCenterScientist1Text_GotUnownDex:
	text "Chissà quanti tipi"
	line "di #MON ci"
	cont "sono nelle ROVINE!"
	done

RuinsOfAlphResearchCenterScientist1Text_UnownAppeared:
	text "Sono apparsi dei"
	line "#MON nelle"
	cont "ROVINE?"

	para "Ma è una notizia"
	line "sensazionale!"

	para "Dobbiamo assoluta-"
	line "mente indagare!"
	done

RuinsOfAlphResearchCenterScientist1Text_GotAllUnown:
	text "Con il tuo aiuto,"
	line "le nostre indagini"

	para "stanno svelando"
	line "molti misteri"
	cont "sulle ROVINE."

	para "Pare che le ROVINE"
	line "costituiscano un"

	para "habitat naturale"
	line "per i #MON."
	done

RuinsOfAlphResearchCenterScientist2Text:
	text "Sulle pareti delle"
	line "ROVINE ci sono"

	para "degli strani"
	line "segni."

	para "Quei disegni"
	line "devono essere la"
	cont "chiave per svelare"
	cont "il mistero delle"
	cont "ROVINE."
	done

RuinsOfAlphResearchCenterScientist2Text_UnownAppeared:
	text "Gli strani #MON"
	line "che hai visto"
	cont "nelle ROVINE?"

	para "Somigliano molto"
	line "ai disegni che si"

	para "trovano sulle"
	line "pareti."

	para "Quindi…"

	para "Ciò significa che"
	line "ne esistono molti"
	cont "tipi diversi…"
	done

RuinsOfAlphResearchCenterUnusedText1:
; unused
	text "We think something"
	line "caused the cryptic"

	para "patterns to appear"
	line "in the RUINS."

	para "We've focused our"
	line "studies on that."
	done

RuinsOfAlphResearchCenterUnusedText2:
; unused
	text "According to my"
	line "research…"

	para "Those mysterious"
	line "patterns appeared"

	para "when the #COM"
	line "CENTER was built."

	para "It must mean that"
	line "radio waves have"

	para "some sort of a"
	line "link…"
	done

RuinsOfAlphResearchCenterScientist2Text_GotAllUnown:
	text "Perché sono"
	line "apparsi questi"

	para "antichi segni"
	line "sulle pareti? Il"

	para "mistero si fa"
	line "sempre più fitto…"
	done

RuinsOfAlphResearchCenterComputerText:
	text "ROVINE D'ALFA"

	para "Esplorazione"
	line "Anno 10"
	done

RuinsOfAlphResearchCenterComputerText_GotAllUnown:
	text "#MON misterioso"
	line "Nome: UNOWN"

	para "Trovati 26"
	line "in totale."
	done

RuinsOfAlphResearchCenterPrinterText_DoesntWork:
	text "Pare che non"
	line "funzioni ancora."
	done

RuinsOfAlphResearchCenterUnownPrinterText:
	text "UNOWN può essere"
	line "stampato."
	done

RuinsOfAlphResearchCenterProfSilktreePhotoText:
; unused
	text "È una foto del"
	line "fondatore del"

	para "CENTRO RICERCHE,"
	line "PROF.SILKTREE."
	done

RuinsOfAlphResearchCenterAcademicBooksText:
	text "Ci sono molti"
	line "libri accademici."

	para "Rovine Antiche…"
	line "Misteri degli"
	cont "Antichi…"
	done

RuinsOfAlphResearchCenter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, RUINS_OF_ALPH_OUTSIDE, 6
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 6

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphResearchCenterBookshelf
	bg_event  3,  4, BGEVENT_READ, RuinsOfAlphResearchCenterComputer
	bg_event  7,  1, BGEVENT_READ, RuinsOfAlphResearchCenterPrinter

	db 3 ; object events
	object_event  4,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist1Script, -1
	object_event  5,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist2Script, -1
	object_event  2,  5, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphResearchCenterScientist3Script, EVENT_RUINS_OF_ALPH_RESEARCH_CENTER_SCIENTIST
