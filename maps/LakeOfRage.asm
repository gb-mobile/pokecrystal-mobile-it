	object_const_def ; object_event constants
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_GRAMPS
	const LAKEOFRAGE_SUPER_NERD1
	const LAKEOFRAGE_COOLTRAINER_F1
	const LAKEOFRAGE_FISHER1
	const LAKEOFRAGE_FISHER2
	const LAKEOFRAGE_COOLTRAINER_M
	const LAKEOFRAGE_COOLTRAINER_F2
	const LAKEOFRAGE_GYARADOS
	const LAKEOFRAGE_WESLEY
	const LAKEOFRAGE_POKE_BALL1
	const LAKEOFRAGE_POKE_BALL2

LakeOfRage_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; unusable
	scene_script .DummyScene1 ; unusable

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Wesley

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	return

.Wesley:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	return

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	return

LakeOfRageLanceScript:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftrue .AskAgainForHelp
	opentext
	writetext UnknownText_0x70157
	buttonsound
	faceplayer
	writetext UnknownText_0x701b4
	yesorno
	iffalse .RefusedToHelp
.AgreedToHelp:
	writetext UnknownText_0x702c6
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement LAKEOFRAGE_LANCE, MovementData_0x70155
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	setmapscene MAHOGANY_MART_1F, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	end

.RefusedToHelp:
	writetext UnknownText_0x70371
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	end

.AskAgainForHelp:
	faceplayer
	opentext
	writetext UnknownText_0x703a5
	yesorno
	iffalse .RefusedToHelp
	sjump .AgreedToHelp

RedGyarados:
	opentext
	writetext UnknownText_0x703cb
	pause 15
	cry GYARADOS
	closetext
	loadwildmon GYARADOS, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear LAKEOFRAGE_GYARADOS
.NotBeaten:
	reloadmapafterbattle
	opentext
	giveitem RED_SCALE
	waitsfx
	writetext UnknownText_0x703df
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setscene 0 ; Lake of Rage does not have a scene variable
	appear LAKEOFRAGE_LANCE
	end

LakeOfRageGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext LakeOfRageGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext LakeOfRageGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

LakeOfRageSuperNerdScript:
	jumptextfaceplayer LakeOfRageSuperNerdText

LakeOfRageCooltrainerFScript:
	jumptextfaceplayer LakeOfRageCooltrainerFText

LakeOfRageSign:
	jumptext LakeOfRageSignText

MagikarpHouseSignScript:
	opentext
	writetext FishingGurusHouseSignText
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .MagikarpLengthRecord
	waitbutton
	closetext
	end

.MagikarpLengthRecord:
	buttonsound
	special MagikarpHouseSign
	closetext
	end

TrainerFisherAndre:
	trainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAndreAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherRaymond:
	trainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRaymondAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLois:
	trainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, CooltrainerfLoisSeenText, CooltrainerfLoisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLoisAfterBattleText
	waitbutton
	closetext
	end

WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	buttonsound
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	buttonsound
	verbosegiveitem BLACKBELT
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end

LakeOfRageElixer:
	itemball ELIXER

LakeOfRageTMDetect:
	itemball TM_DETECT

LakeOfRageHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE

LakeOfRageHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY

LakeOfRageHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION

MovementData_0x70155:
	teleport_from
	step_end

UnknownText_0x70157:
	text "Questo lago è"
	line "pieno soltanto di"
	cont "GYARADOS…"

	para "Così i MAGIKARP"
	line "sono costretti ad"
	cont "evolversi…"
	done

UnknownText_0x701b4:
	text "Sei qui per quello"
	line "che si dice in"
	cont "giro?"

	para "Sei <PLAYER>?"
	line "Mi chiamo LANCE,"
	cont "sono anch'io un"
	cont "allenatore."

	para "Sono qui per vede-"
	line "re se è vero ciò"
	cont "che ho sentito"
	cont "dire…"

	para "Prima ho visto"
	line "come lottavi,"
	cont "<PLAY_G>."

	para "Posso dire che le"
	line "tue capacità sono"

	para "davvero"
	line "eccezionali."

	para "Potresti aiutarmi"
	line "nelle mie"
	cont "indagini?"
	done

UnknownText_0x702c6:
	text "LANCE: Eccellente!"

	para "Pare che i MAGI-"
	line "KARP del LAGO"

	para "siano costretti"
	line "ad evolversi."

	para "La causa sembra"
	line "essere uno strano"

	para "programma radio"
	line "che proviene da"
	cont "MOGANIA."

	para "Ti aspetterò là,"
	line "<PLAY_G>."
	done

UnknownText_0x70371:
	text "Oh… Come vuoi."
	line "Se cambi idea, il"
	cont "tuo aiuto è sempre"
	cont "necessario."
	done

UnknownText_0x703a5:
	text "LANCE: Allora mi"
	line "aiuterai?"
	done

UnknownText_0x703cb:
	text "GYARADOS: Giaraaa!"
	done

UnknownText_0x703df:
	text "<PLAYER> ottiene"
	line "una SQUAMA ROSSA."
	done

LakeOfRageGrampsText:
	text "I GYARADOS sono"
	line "arrabbiati!"

	para "Non è un bel"
	line "segno."
	done

LakeOfRageGrampsText_ClearedRocketHideout:
	text "Ehi! I MAGIKARP"
	line "abboccano!"
	done

LakeOfRageSuperNerdText:
	text "Si dice che questo"
	line "lago sia stato"
	cont "fatto da GYARADOS"
	cont "infuriati."

	para "Ci sarà un colle-"
	line "gamento con questa"

	para "esplosione di"
	line "rabbia?"
	done

LakeOfRageCooltrainerFText:
	text "Se i miei occhi"
	line "non mi hanno"

	para "ingannato ho visto"
	line "un GYARADOS rosso…"

	para "Io pensavo che i"
	line "GYARADOS fossero"
	cont "soltanto blu!"
	done

FisherAndreSeenText:
	text "Ti sfido con il"
	line "#MON che ho"
	cont "appena preso!"
	done

FisherAndreBeatenText:
	text "Sarò anche un"
	line "buon pescatore,"

	para "ma come allenatore"
	line "di #MON non"
	cont "valgo un granché…"
	done

FisherAndreAfterBattleText:
	text "Nella pesca sono"
	line "più forte io:"
	cont "pesco #MON"
	cont "tutto il giorno."
	done

FisherRaymondSeenText:
	text "Per quanto"
	line "m'ingegni, pesco"

	para "sempre gli stessi"
	line "#MON…"
	done

FisherRaymondBeatenText:
	text "La mia lenza è"
	line "aggrovigliata…"
	done

FisherRaymondAfterBattleText:
	text "Perché non prendo"
	line "dei buoni #MON?"
	done

CooltrainermAaronSeenText:
	text "Se due allenatori"
	line "si vedono, sono"

	para "obbligati a"
	line "sfidarsi."

	para "È il nostro"
	line "destino."
	done

CooltrainermAaronBeatenText:
	text "Grande…"
	line "Bella lotta."
	done

CooltrainermAaronAfterBattleText:
	text "Lottando, i #-"
	line "MON e gli allena-"
	cont "tori si rinforzano"
	cont "continuamente."
	done

CooltrainerfLoisSeenText:
	text "Che è accaduto al"
	line "GYARADOS rosso?"

	para "Non c'è più?"

	para "No! Ho fatto un"
	line "viaggio a vuoto!"

	para "Pazienza; lottiamo"
	line "un po'?"
	done

CooltrainerfLoisBeatenText:
	text "Ben fatto!"
	done

CooltrainerfLoisAfterBattleText:
	text "Ora che ci penso,"
	line "ho visto un"
	cont "BUTTERFREE rosa."
	done

MeetWesleyText:
	text "ERCOLE: Come te"
	line "la passi?"

	para "Oggi è mercoledì,"
	line "e guarda caso, io"

	para "sono ERCOLE del"
	line "mercoledì."
	done

WesleyGivesGiftText:
	text "Piacere di"
	line "conoscerti. Eccoti"
	cont "un ricordino."
	done

WesleyGaveGiftText:
	text "ERCOLE: CINTURA-"
	line "NERA potenzia le"
	cont "mosse di tipo"
	cont "lotta."
	done

WesleyWednesdayText:
	text "ERCOLE: Se hai"
	line "trovato me, avrai"

	para "conosciuto i miei"
	line "fratelli e"
	cont "sorelle."

	para "O mi hai trovato"
	line "per caso?"
	done

WesleyNotWednesdayText:
	text "ERCOLE: Oggi non è"
	line "mercoledì."
	cont "Peccato."
	done

LakeOfRageSignText:
	text "LAGO D'IRA,"
	line "detto anche LAGO"
	cont "dei GYARADOS."
	done

FishingGurusHouseSignText:
	text "CASA DEL GURU"
	line "PESCATORE"
	done

LakeOfRage_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event 21, 27, BGEVENT_READ, LakeOfRageSign
	bg_event 25, 31, BGEVENT_READ, MagikarpHouseSignScript
	bg_event 11, 28, BGEVENT_ITEM, LakeOfRageHiddenFullRestore
	bg_event  4,  4, BGEVENT_ITEM, LakeOfRageHiddenRareCandy
	bg_event 35,  5, BGEVENT_ITEM, LakeOfRageHiddenMaxPotion

	db 12 ; object events
	object_event 21, 28, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageLanceScript, EVENT_LAKE_OF_RAGE_LANCE
	object_event 20, 26, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageGrampsScript, -1
	object_event 36, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageSuperNerdScript, -1
	object_event 25, 29, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageCooltrainerFScript, -1
	object_event 30, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherAndre, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 24, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event  4, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 36,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerCooltrainerfLois, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 18, 22, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedGyarados, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	object_event  4,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event  7, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageElixer, EVENT_LAKE_OF_RAGE_ELIXER
	object_event 35,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
