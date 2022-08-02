	object_const_def ; object_event constants
	const RUINSOFALPHOUTSIDE_YOUNGSTER1
	const RUINSOFALPHOUTSIDE_SCIENTIST
	const RUINSOFALPHOUTSIDE_FISHER
	const RUINSOFALPHOUTSIDE_YOUNGSTER2
	const RUINSOFALPHOUTSIDE_YOUNGSTER3

RuinsOfAlphOutside_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_RUINSOFALPHOUTSIDE_NOTHING
	scene_script .DummyScene1 ; SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ScientistCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ScientistCallback:
	checkflag ENGINE_UNOWN_DEX
	iftrue .NoScientist
	checkevent EVENT_MADE_UNOWN_APPEAR_IN_RUINS
	iftrue .MaybeScientist
	sjump .NoScientist

.MaybeScientist:
	readvar VAR_UNOWNCOUNT
	ifgreater 2, .YesScientist
	sjump .NoScientist

.YesScientist:
	appear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX
	return

.NoScientist:
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	setscene SCENE_RUINSOFALPHOUTSIDE_NOTHING
	return

RuinsOfAlphOutsideScientistScene1:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, UP
	turnobject PLAYER, DOWN
	sjump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScene2:
	turnobject RUINSOFALPHOUTSIDE_SCIENTIST, LEFT
	turnobject PLAYER, RIGHT
	sjump RuinsOfAlphOutsideScientistSceneContinue

RuinsOfAlphOutsideScientistScript:
	faceplayer
RuinsOfAlphOutsideScientistSceneContinue:
	opentext
	writetext RuinsOfAlphOutsideScientistText
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow RUINSOFALPHOUTSIDE_SCIENTIST, PLAYER
	applymovement RUINSOFALPHOUTSIDE_SCIENTIST, MovementData_0x580ba
	disappear RUINSOFALPHOUTSIDE_SCIENTIST
	stopfollow
	applymovement PLAYER, MovementData_0x580c5
	setmapscene RUINS_OF_ALPH_RESEARCH_CENTER, SCENE_RUINSOFALPHRESEARCHCENTER_GET_UNOWN_DEX
	warpcheck
	end

RuinsOfAlphOutsideFisherScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_RUINS_COWARD
	iftrue .Next
	setevent EVENT_TALKED_TO_RUINS_COWARD
	writetext RuinsOfAlphOutsideFisherText1
	buttonsound
.Next:
	writetext RuinsOfAlphOutsideFisherText2
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster1Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster1Text
	waitbutton
	closetext
	end

RuinsOfAlphOutsideYoungster2Script:
	faceplayer
	opentext
	writetext RuinsOfAlphOutsideYoungster2Text
	waitbutton
	closetext
	turnobject RUINSOFALPHOUTSIDE_YOUNGSTER3, UP
	end

TrainerPsychicNathan:
	trainer PSYCHIC_T, NATHAN, EVENT_BEAT_PSYCHIC_NATHAN, PsychicNathanSeenText, PsychicNathanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNathanAfterBattleText
	waitbutton
	closetext
	end

TrainerSuperNerdStan:
	trainer SUPER_NERD, STAN, EVENT_BEAT_SUPER_NERD_STAN, SuperNerdStanSeenText, SuperNerdStanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdStanAfterBattleText
	waitbutton
	closetext
	end

RuinsOfAlphOutsideMysteryChamberSign:
	jumptext RuinsOfAlphOutsideMysteryChamberSignText

RuinsOfAlphSign:
	jumptext RuinsOfAlphSignText

RuinsOfAlphResearchCenterSign:
	jumptext RuinsOfAlphResearchCenterSignText

MovementData_0x580ba:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

MovementData_0x580c5:
	step UP
	step_end

RuinsOfAlphOutsideScientistText:
	text "Ehi, ma questo è"
	line "un #DEX!"
	cont "Posso vederlo?"

	para "Ci sono così tanti"
	line "tipi di #MON!"

	para "E questo cos'è?"

	para "Che #MON"
	line "è questo qui?"

	para "Somiglia alle"
	line "strane iscrizioni"

	para "sulle pareti delle"
	line "ROVINE."

	para "Se questi disegni"
	line "sono davvero #-"
	cont "MON, devono"
	cont "essercene molti"
	cont "altri."

	para "Ho capito! Ora ti"
	line "modifico il #-"
	cont "DEX. Seguimi."
	done

SuperNerdStanSeenText:
	text "Che vuoi? Sto"
	line "studiando, non"
	cont "disturbarmi!"
	done

SuperNerdStanBeatenText:
	text "Scusa…"
	line "È frustrante"

	para "pensare a quanto"
	line "poco sappiamo…"
	done

SuperNerdStanAfterBattleText:
	text "Le ROVINE"
	line "risalgono a 1500"
	cont "anni fa."

	para "Non si sa chi le"
	line "abbia costruite."

	para "Non si sa neppure"
	line "se le statue dei"
	cont "#MON abbiano"
	cont "un significato."

	para "È davvero un"
	line "grande mistero…"
	done

PsychicNathanSeenText:
	text "Hmmm… È"
	line "proprio uno"
	cont "strano posto."
	done

PsychicNathanBeatenText:
	text "…"
	done

PsychicNathanAfterBattleText:
	text "Mi piace pensare"
	line "qui."
	done

RuinsOfAlphOutsideMysteryChamberSignText:
	text "MASSO MISTERO"
	line "CAMERA PANNELLI"
	done

RuinsOfAlphSignText:
	text "ROVINE D'ALFA"
	line "Benvenuti"
	done

RuinsOfAlphResearchCenterSignText:
	text "ROVINE D'ALFA"
	line "CENTRO RICERCHE"

	para "L'Autorità delle"
	line "ROVINE D'ALFA"
	done

RuinsOfAlphOutsideFisherText1:
	text "Esplorando le"
	line "ROVINE, abbiamo"

	para "avvertito una"
	line "strana presenza."

	para "Siamo fuggiti"
	line "spaventati."

	para "Fa attenzione,"
	line "mi raccomando."
	done

RuinsOfAlphOutsideFisherText2:
	text "Le ROVINE"
	line "custodiscono un"
	cont "enorme segreto!"

	para "…Almeno credo…"
	done

RuinsOfAlphOutsideYoungster1Text:
	text "Ci sono molti tipi"
	line "di UNOWN, perciò"

	para "li impieghiamo per"
	line "i codici segreti."
	done

RuinsOfAlphOutsideYoungster2Text:
	text "A… V… A… N… T… I…"
	line "Uhmmm…"

	para "Che c'è?"

	para "Sto decifrando"
	line "questo messaggio!"
	done

RuinsOfAlphOutside_MapEvents:
	db 0, 0 ; filler

	db 11 ; warp events
	warp_event  2, 17, RUINS_OF_ALPH_HO_OH_CHAMBER, 1
	warp_event 14,  7, RUINS_OF_ALPH_KABUTO_CHAMBER, 1
	warp_event  2, 29, RUINS_OF_ALPH_OMANYTE_CHAMBER, 1
	warp_event 16, 33, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 1
	warp_event 10, 13, RUINS_OF_ALPH_INNER_CHAMBER, 1
	warp_event 17, 11, RUINS_OF_ALPH_RESEARCH_CENTER, 1
	warp_event  6, 19, UNION_CAVE_B1F, 1
	warp_event  6, 27, UNION_CAVE_B1F, 2
	warp_event  7,  5, ROUTE_36_RUINS_OF_ALPH_GATE, 3
	warp_event 13, 20, ROUTE_32_RUINS_OF_ALPH_GATE, 1
	warp_event 13, 21, ROUTE_32_RUINS_OF_ALPH_GATE, 2

	db 2 ; coord events
	coord_event 11, 14, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene1
	coord_event 10, 15, SCENE_RUINSOFALPHOUTSIDE_GET_UNOWN_DEX, RuinsOfAlphOutsideScientistScene2

	db 3 ; bg events
	bg_event 16,  8, BGEVENT_READ, RuinsOfAlphOutsideMysteryChamberSign
	bg_event 12, 16, BGEVENT_READ, RuinsOfAlphSign
	bg_event 18, 12, BGEVENT_READ, RuinsOfAlphResearchCenterSign

	db 5 ; object events
	object_event  4, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerPsychicNathan, -1
	object_event 11, 15, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideScientistScript, EVENT_RUINS_OF_ALPH_OUTSIDE_SCIENTIST
	object_event 13, 17, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideFisherScript, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_FISHER
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster1Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
	object_event 12,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphOutsideYoungster2Script, EVENT_RUINS_OF_ALPH_OUTSIDE_TOURIST_YOUNGSTERS
