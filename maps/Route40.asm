	object_const_def ; object_event constants
	const ROUTE40_OLIVINE_RIVAL1
	const ROUTE40_OLIVINE_RIVAL2
	const ROUTE40_SWIMMER_GIRL1
	const ROUTE40_SWIMMER_GIRL2
	const ROUTE40_ROCK1
	const ROUTE40_ROCK2
	const ROUTE40_ROCK3
	const ROUTE40_LASS1
	const ROUTE40_MONICA
	const ROUTE40_POKEFAN_M
	const ROUTE40_LASS2
	const ROUTE40_STANDING_YOUNGSTER

Route40_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MonicaCallback

.MonicaCallback:
	special Mobile_DummyReturnFalse
	iffalse .nomobile
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR

.nomobile
	readvar VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	return

.MonicaAppears:
	appear ROUTE40_MONICA
	return

TrainerSwimmerfElaine:
	trainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfElaineAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfPaulaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermSimon:
	trainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSimonAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end

Route40Lass1Script:
	jumptextfaceplayer Route40Lass1Text

Route40PokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer Route40PokefanMText

.mobile
	jumptextfaceplayer Route40PokefanMText_Mobile

Route40Lass2Script:
	jumptextfaceplayer Route40Lass2Text

Route40StandingYoungsterScript:
	jumptextfaceplayer Route40StandingYoungsterText

MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .Monday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	buttonsound
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	buttonsound
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
.done:
	closetext
	end

.NotMonday:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route40Sign:
	jumptext Route40SignText

Route40Rock:
	jumpstd smashrock

Route40HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

MovementData_0x1a621c:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a6224:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a622a:
	step UP
	step UP
	step UP
	step UP
	step_end

SwimmermSimonSeenText:
	text "Devi riscaldarti"
	line "prima di entrare"
	cont "in acqua."

	para "È fondamentale."
	done

SwimmermSimonBeatenText:
	text "Ok, mi arrendo!"
	done

SwimmermSimonAfterBattleText:
	text "FIORLISOPOLI è"
	line "piuttosto lontana"
	cont "da qui."
	done

SwimmermRandallSeenText:
	text "Sei giovane e in"
	line "piena salute!"

	para "Perché non nuoti"
	line "anziché fare SURF"
	cont "su un #MON."
	done

SwimmermRandallBeatenText:
	text "No… Ho perso…"
	done

SwimmermRandallAfterBattleText:
	text "Nuotare tonifica"
	line "il fisico."
	cont "È tutta salute."
	done

SwimmerfElaineSeenText:
	text "Stai andando a"
	line "FIORLISOPOLI?"

	para "Che ne dici di"
	line "una lotta?"
	done

SwimmerfElaineBeatenText:
	text "Ho perso!"
	done

SwimmerfElaineAfterBattleText:
	text "Penso proprio di"
	line "nuotare meglio di"
	cont "te... Sì!"
	done

SwimmerfPaulaSeenText:
	text "Non mi serve il"
	line "salvagente!"

	para "Mi aggrappo ad un"
	line "#MON d'acqua!"
	done

SwimmerfPaulaBeatenText:
	text "Oooh, che"
	line "sensazione!"
	done

SwimmerfPaulaAfterBattleText:
	text "Vedi, in questo"
	line "modo mi faccio"
	cont "trasportare dalle"
	cont "onde!"
	done

Route40Lass1Text:
	text "Da qui non si"
	line "vede, ma"

	para "FIORLISOPOLI è"
	line "proprio al di là"
	cont "del mare."
	done

Route40PokefanMText:
	text "Qui avanti c'è un"
	line "grande edificio!"

	para "Di che si tratta?"
	done

Route40PokefanMText_Mobile:
	text "Guarda tutti"
	line "quegli allenatori"
	cont "che stanno"
	cont "entrando."

	para "Che succede?"
	done

Route40Lass2Text:
	text "Sono giunta a"
	line "OLIVINOPOLI con la"

	para "nave, per visitare"
	line "e respirare l'aria"
	cont "di questa città."

	para "I porti sono così"
	line "diversi dalle"
	cont "altre città!"
	done

Route40StandingYoungsterText:
	text "Hai già visitato"
	line "la TORRE LOTTA?"

	para "So che ci vanno"
	line "alcuni tra i più"
	cont "forti allenatori."

	para "Ma con tutte le"
	line "MEDAGLIE che hai,"

	para "dovresti cavartela"
	line "bene."
	done

MeetMonicaText:
	text "LUANA: Felice di"
	line "incontrarti, sono"

	para "LUANA del lunedì."
	done

MonicaGivesGiftText:
	text "In segno della"
	line "nostra amicizia,"
	cont "ti darò un regalo!"
	done

MonicaGaveGiftText:
	text "LUANA: È uno"
	line "strumento che"

	para "aumenta"
	line "l'efficacia delle"
	cont "mosse di tipo"
	cont "volante."

	para "Dovresti darlo ad"
	line "un #MON"
	cont "uccello."
	done

MonicaMondayText:
	text "LUANA: I miei"
	line "fratelli e le"

	para "mie sorelle sono"
	line "tutti in giro."

	para "Vedi se riesci"
	line "a trovarli!"
	done

MonicaNotMondayText:
	text "LUANA: Non mi"
	line "pare che sia"
	cont "lunedì, peccato!"
	done

Route40SignText:
	text "PERCORSO 40"

	para "FIORLISOPOLI -"
	line "OLIVINOPOLI"
	done

Route40_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9,  5, ROUTE_40_BATTLE_TOWER_GATE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 14, 10, BGEVENT_READ, Route40Sign
	bg_event  7,  8, BGEVENT_ITEM, Route40HiddenHyperPotion

	db 12 ; object events
	object_event 14, 15, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event 18, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerSwimmermRandall, -1
	object_event  3, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfElaine, -1
	object_event 10, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfPaula, -1
	object_event  7, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  6,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  7,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event 11, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Lass1Script, -1
	object_event  8, 10, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 13,  4, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40Lass2Script, -1
	object_event 12,  9, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40StandingYoungsterScript, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
