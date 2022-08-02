	object_const_def ; object_event constants
	const EARLSPOKEMONACADEMY_EARL
	const EARLSPOKEMONACADEMY_YOUNGSTER1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID1
	const EARLSPOKEMONACADEMY_GAMEBOY_KID2
	const EARLSPOKEMONACADEMY_YOUNGSTER2
	const EARLSPOKEMONACADEMY_POKEDEX

EarlsPokemonAcademy_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AcademyEarl:
	applymovement EARLSPOKEMONACADEMY_EARL, AcademyEarlSpinMovement
	faceplayer
	opentext
	writetext AcademyEarlIntroText
	yesorno
	iffalse .Part1
	writetext AcademyEarlTeachHowToWinText
	yesorno
	iffalse .Done
.Part1:
	writetext AcademyEarlTeachMoreText
	yesorno
	iffalse .Done
	writetext AcademyEarlTeachHowToRaiseWellText
	waitbutton
	closetext
	end

.Done:
	writetext AcademyEarlNoMoreToTeachText
	waitbutton
	closetext
	end

EarlsPokemonAcademyYoungster1Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster1Text

EarlsPokemonAcademyGameboyKid1Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid1Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID1, DOWN
	end

EarlsPokemonAcademyGameboyKid2Script:
	faceplayer
	opentext
	writetext EarlsPokemonAcademyGameboyKid2Text
	waitbutton
	closetext
	turnobject EARLSPOKEMONACADEMY_GAMEBOY_KID2, DOWN
	end

EarlsPokemonAcademyYoungster2Script:
	jumptextfaceplayer EarlsPokemonAcademyYoungster2Text

AcademyBlackboard:
	opentext
	writetext AcademyBlackboardText
.Loop:
	loadmenu .BlackboardMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Poison
	ifequal 2, .Paralysis
	ifequal 3, .Sleep
	ifequal 4, .Burn
	ifequal 5, .Freeze
	closetext
	end

.Poison:
	writetext AcademyPoisonText
	waitbutton
	sjump .Loop

.Paralysis:
	writetext AcademyParalysisText
	waitbutton
	sjump .Loop

.Sleep:
	writetext AcademySleepText
	waitbutton
	sjump .Loop

.Burn:
	writetext AcademyBurnText
	waitbutton
	sjump .Loop

.Freeze:
	writetext AcademyFreezeText
	waitbutton
	sjump .Loop

.BlackboardMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 11, 8
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	dn 3, 2 ; rows, columns
	db 5 ; spacing
	dba .Text
	dbw BANK(AcademyBlackboard), 0

.Text:
	db "PSN@"
	db "PAR@"
	db "SLP@"
	db "BRN@"
	db "FRZ@"
	db "QUIT@"

AcademyNotebook:
	opentext
	writetext AcademyNotebookText
	yesorno
	iffalse .Done
	writetext AcademyNotebookText1
	yesorno
	iffalse .Done
	writetext AcademyNotebookText2
	yesorno
	iffalse .Done
	writetext AcademyNotebookText3
	waitbutton
.Done:
	closetext
	end

AcademyStickerMachine:
; unused
	jumptext AcademyStickerMachineText

AcademyBookshelf:
	jumpstd difficultbookshelf

AcademyEarlSpinMovement:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

AcademyEarlIntroText:
	text "Sono PRIMO!"

	para "Deliziosi i #-"
	line "MON, nevvero?"

	para "Mi delizierò d'"
	line "insegnarti l'arte"
	cont "dell'allenatore."

	para "Se ti piacerà d'"
	line "ascoltarmi, di te"
	cont "farò un vincitore."
	done

AcademyEarlTeachHowToWinText:
	text "Bene, veniamo"
	line "orsù al dunque:"

	para "il #MON in"
	line "cima alla lista"
	cont "è il primo a"
	cont "lottare comunque."

	para "Se l'ordine provi"
	line "a cambiare, magari"
	cont "potrai migliorare."

	para "Qualcos'altro da"
	line "me vuoi sapere?"
	done

AcademyEarlTeachMoreText:
	text "Non vuoi sapere"
	line "come allenare i"
	cont "#MON in modo"
	cont "perfetto?"
	done

AcademyEarlTeachHowToRaiseWellText:
	text "Bene, è presto"
	line "detto!"

	para "Un #MON"
	line "guadagna ESP. se"

	para "entra in battaglia"
	line "anche per poco."

	para "Manda in campo per"
	line "primo un #MON,"

	para "e cambialo subito"
	line "dopo!"

	para "Se il #MON"
	line "debole diventerà"
	cont "forte, migliore"
	cont "sarà la tua sorte."
	done

AcademyEarlNoMoreToTeachText:
	text "Veramente tu sei"
	line "intelligente."
	cont "Nient'altro ti"
	cont "devo insegnare!"

	para "I tuoi #MON"
	line "dovrai rispettare!"
	done

EarlsPokemonAcademyYoungster1Text:
	text "Prendo appunti"
	line "sulla lezione del"
	cont "maestro."

	para "Dovrò anche"
	line "copiare ciò che è"
	cont "scritto alla"
	cont "lavagna."
	done

EarlsPokemonAcademyGameboyKid1Text:
	text "Ho scambiato il"
	line "mio #MON"
	cont "migliore con il"
	cont "ragazzo vicino."
	done

EarlsPokemonAcademyGameboyKid2Text:
	text "Eh? Il #MON che"
	line "ho appena preso ha"
	cont "qualcosa con sé."
	done

EarlsPokemonAcademyYoungster2Text:
	text "Un #MON che"
	line "tiene una BACCA"
	cont "può curarsi nella"
	cont "lotta."

	para "I #MON possono"
	line "tenere molti altri"
	cont "strumenti…"

	para "È davvero dura"
	line "prendere appunti…"
	done

AcademyBlackboardText:
	text "Sulla lavagna sono"
	line "descritte le modi-"
	cont "fiche di stato dei"
	cont "#MON durante"
	cont "la lotta."
	done

AcademyBlackboardText2:
; unused
	text "Che argomento vuoi"
	line "leggere?"
	done

AcademyPoisonText:
	text "Un #MON perde"
	line "costantemente"
	cont "PS."

	para "Il veleno agisce"
	line "anche dopo la"

	para "lotta, continuando"
	line "a far perdere PS."

	para "Contro il veleno"
	line "serve un ANTIDOTO."
	done

AcademyParalysisText:
	text "La paralisi riduce"
	line "la velocità e può"
	cont "impedire il"
	cont "movimento."

	para "Permane anche"
	line "dopo la lotta:"
	cont "usa ANTIPARALISI!"
	done

AcademySleepText:
	text "Un #MON che"
	line "dorme non può"
	cont "muoversi."

	para "Un #MON"
	line "addormentato non"
	cont "si sveglierà dopo"
	cont "la lotta."

	para "Sveglialo con la"
	line "SVEGLIA!"
	done

AcademyBurnText:
	text "Le scottature"
	line "continuano a"

	para "ridurre i PS."
	line "Inoltre, riducono"

	para "la potenza"
	line "dell'attacco."

	para "Le scottature"
	line "persistono anche"
	cont "dopo la lotta."

	para "Curale con"
	line "ANTISCOTTATURA."
	done

AcademyFreezeText:
	text "Se il tuo #MON"
	line "è congelato non"
	cont "può fare nulla."

	para "Il congelamento"
	line "resta anche dopo"
	cont "la lotta."

	para "Usa l'ANTIGELO"
	line "per guarirlo."
	done

AcademyNotebookText:
	text "Sono gli appunti"
	line "di un bambino…"

	para "Cattura i #MON"
	line "con le # BALL."

	para "Ne puoi avere fino"
	line "a sei in squadra."

	para "Leggi ancora?"
	done

AcademyNotebookText1:
	text "Indebolisci"
	line "l'avversario prima"
	cont "di tirare una"
	cont "# BALL."

	para "Un #MON"
	line "avvelenato o scot-"
	cont "tato si cattura"
	cont "più facilmente."

	para "Leggi ancora?"
	done

AcademyNotebookText2:
	text "Certe mosse cau-"
	line "sano confusione."

	para "Un #MON confuso"
	line "può attaccare se"
	cont "stesso. Ma la"

	para "confusione termina"
	line "se è ritirato"
	cont "dalla lotta."

	para "Leggi ancora?"
	done

AcademyNotebookText3:
	text "Chi cattura e"
	line "fa lottare i "

	para "#MON si chiama"
	line "allenatore."

	para "Un allenatore"
	line "visita le PALESTRE"

	para "#MON per"
	line "sfidare altri"
	cont "allenatori."

	para "La pagina dopo"
	line "è… vuota!"

	para "Scolaro: Eh eh eh…"

	para "Non ho scritto"
	line "altro…"
	done

AcademyStickerMachineText:
	text "Questa super-"
	line "macchina stampa i"
	cont "dati come"

	para "figurine."
	done

EarlsPokemonAcademy_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3, 15, VIOLET_CITY, 3
	warp_event  4, 15, VIOLET_CITY, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  1,  1, BGEVENT_READ, AcademyBookshelf
	bg_event  3,  0, BGEVENT_READ, AcademyBlackboard
	bg_event  4,  0, BGEVENT_READ, AcademyBlackboard

	db 6 ; object events
	object_event  4,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AcademyEarl, EVENT_EARLS_ACADEMY_EARL
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster1Script, -1
	object_event  3, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid1Script, -1
	object_event  4, 11, SPRITE_GAMEBOY_KID, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyGameboyKid2Script, -1
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EarlsPokemonAcademyYoungster2Script, -1
	object_event  2,  4, SPRITE_POKEDEX, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, AcademyNotebook, -1
