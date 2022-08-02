	object_const_def ; object_event constants
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_GROWLITHE
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST

RadioTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower4FFisherScript:
	jumptextfaceplayer RadioTower4FFisherText

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue .GotPinkBow
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRockets
	writetext RadioTower4FDJMaryText
	waitbutton
	closetext
	end

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	buttonsound
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	writetext RadioTower4FDJMaryText_GivePinkBow
	waitbutton
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MARY
	end

.GotPinkBow:
	writetext RadioTower4FDJMaryText_After
	waitbutton
.NoRoom:
	closetext
	end

RadioTowerMeowth:
	opentext
	writetext RadioTowerMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end

TrainerExecutivem2:
	trainer EXECUTIVEM, EXECUTIVEM_2, EVENT_BEAT_ROCKET_EXECUTIVEM_2, Executivem2SeenText, Executivem2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivem2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF4:
	trainer GRUNTF, GRUNTF_4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF4AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

RadioTower4FProductionSign:
	jumptext RadioTower4FProductionSignText

RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText

RadioTower4FFisherText:
	text "Alle ROVINE stavo"
	line "ascoltando la"
	cont "radio."

	para "C'era una strana"
	line "trasmissione."
	done

RadioTower4FDJMaryText:
	text "LORI: Perché?"
	line "Perché devo"
	cont "soffrire così?"

	para "MEOWTH, aiutami!"
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "LORI: Oh! Tu mi"
	line "hai salvata!"

	para "Voglio darti"
	line "questo per"
	cont "ringraziarti."
	done

RadioTower4FDJMaryText_GivePinkBow:
	text "LORI: È per"
	line "i #MON"

	para "che usano mosse"
	line "di tipo normale."
	done

RadioTower4FDJMaryText_After:
	text "LORI: Sintonizzati"
	line "sul #MON TALK,"

	para "il programma del"
	line "PROF.OAK."
	done

RadioTowerMeowthText:
	text "MEOWTH: Meowth…"
	done

GruntM10SeenText:
	text "Vuoi salvare il"
	line "DIRETTORE?"

	para "Non credo sia"
	line "possibile, perché"
	cont "ti distruggerò!"
	done

GruntM10BeatenText:
	text "Non ci credo!"
	done

GruntM10AfterBattleText:
	text "Incredibile! Mi"
	line "hai battuto!"
	done

Executivem2SeenText:
	text "Non ti muovere!"
	line "Mi chiamano la"
	cont "fortezza di"
	cont "TEAM ROCKET!"

	para "La tua corsa è"
	line "finita!"
	done

Executivem2BeatenText:
	text "Ehi, la fortezza"
	line "è crollata!"
	done

Executivem2AfterBattleText:
	text "Hai guadagnato il"
	line "mio rispetto,"
	cont "perciò ti darò un"
	cont "consiglio."

	para "Non è troppo"
	line "tardi, sei ancora"
	cont "in tempo per"
	cont "tornare indietro."
	done

GruntF4SeenText:
	text "I miei #MON"
	line "sono carini?"

	para "Penserò che i miei"
	line "#MON sono"

	para "carini dopo che"
	line "avranno battuto"
	cont "i tuoi!"
	done

GruntF4BeatenText:
	text "Oh, no! Ma allora"
	line "sono inutili!"
	done

GruntF4AfterBattleText:
	text "Adoro la mia"
	line "bellezza!"

	para "Che m'importa dei"
	line "#MON?"
	done

ScientistRichSeenText:
	text "Eccellente!"

	para "Da questa TORRE"
	line "RADIO realizzeremo"
	cont "il nostro grande"
	cont "progetto!"
	done

ScientistRichBeatenText:
	text "Ehm…"

	para "Anche i grandi"
	line "piani hanno degli"
	cont "intoppi!"
	done

ScientistRichAfterBattleText:
	text "Credi davvero di"
	line "poter fermare"
	cont "TEAM ROCKET?"
	done

RadioTower4FProductionSignText:
	text "3ºP PRODUZIONE"
	done

RadioTower4FStudio2SignText:
	text "3ºP STUDIO 2"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  7,  0, BGEVENT_READ, RadioTower4FProductionSign
	bg_event 15,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	db 7 ; object events
	object_event  6,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FFisherScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	object_event 12,  7, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerExecutivem2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
