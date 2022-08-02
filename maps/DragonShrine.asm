	object_const_def ; object_event constants
	const DRAGONSHRINE_ELDER1
	const DRAGONSHRINE_ELDER2
	const DRAGONSHRINE_ELDER3
	const DRAGONSHRINE_CLAIR

DragonShrine_MapScripts:
	db 2 ; scene scripts
	scene_script .DragonShrineTest ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.DragonShrineTest:
	prioritysjump .DragonShrineTestScript
	end

.DummyScene:
	end

.DragonShrineTestScript:
	applymovement PLAYER, DragonShrinePlayerWalkInMovement
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderStepDownMovement
	opentext
	writetext DragonShrineElderGreetingText
	buttonsound
.Question1:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	writetext DragonShrineQuestion1Text
	buttonsound
	loadmenu DragonShrineQuestion1_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
	end

.Question2:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	writetext DragonShrineQuestion2Text
	buttonsound
	loadmenu DragonShrineQuestion2_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.Question3:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	writetext DragonShrineQuestion3Text
	buttonsound
	loadmenu DragonShrineQuestion3_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .RightAnswer
.Question4:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	writetext DragonShrineQuestion4Text
	buttonsound
	loadmenu DragonShrineQuestion4_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
.Question5:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	writetext DragonShrineQuestion5Text
	buttonsound
	loadmenu DragonShrineQuestion5_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.RightAnswer:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .PassedTheTest
	writetext DragonShrineRightAnswerText
	buttonsound
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question2
.WrongAnswer:
	closetext
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineWrongAnswerText1
	waitbutton
	closetext
	turnobject DRAGONSHRINE_ELDER1, DOWN
	opentext
	writetext DragonShrineWrongAnswerText2
	waitbutton
	closetext
	setevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question1
.PassedTheTest:
	writetext DragonShrinePassedTestText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_CLAIR
	appear DRAGONSHRINE_CLAIR
	waitsfx
	turnobject PLAYER, DOWN
	pause 30
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkInMovement
	turnobject DRAGONSHRINE_CLAIR, RIGHT
	turnobject PLAYER, LEFT
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineClairYouPassedText
	waitbutton
	closetext
	special FadeOutMusic
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairBigStepLeftMovement
	opentext
	writetext DragonShrineClairThatCantBeText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairSlowStepLeftMovement
	opentext
	writetext DragonShrineClairYoureLyingText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkToClairMovement
	turnobject DRAGONSHRINE_CLAIR, UP
	opentext
	writetext DragonShrineMustIInformLanceText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, DRAGONSHRINE_CLAIR, 15
	opentext
	writetext DragonShrineIUnderstandText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairTwoSlowStepsRightMovement
	opentext
	writetext DragonShrineHereRisingBadgeText
	waitbutton
	setflag ENGINE_RISINGBADGE
	playsound SFX_GET_BADGE
	waitsfx
	special RestartMapMusic
	specialphonecall SPECIALCALL_MASTERBALL
	setscene SCENE_FINISHED
	setmapscene DRAGONS_DEN_B1F, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM
	writetext DragonShrinePlayerReceivedRisingBadgeText
	buttonsound
	writetext DragonShrineRisingBadgeExplanationText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway1Movement
	turnobject DRAGONSHRINE_CLAIR, UP
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway2Movement
	turnobject PLAYER, UP
	opentext
	writetext DragonShrineElderScoldsClairText
	waitbutton
	closetext
	opentext
	writetext DragonShrineSpeechlessText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkOutMovement
	playsound SFX_ENTER_DOOR
	disappear DRAGONSHRINE_CLAIR
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

DragonShrineElder1Script:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .DontGiveDratiniYet
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .ReceivedDratini
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratini
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .BeatRivalInMtMoon
	writetext DragonShrineClairsGrandfatherText
	waitbutton
	closetext
	end

.GiveDratini:
	writetext DragonShrineTakeThisDratiniText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext DragonShrinePlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

.PartyFull:
	writetext DragonShrinePartyFullText
	waitbutton
	closetext
	end

.BeatRivalInMtMoon:
	writetext DragonShrineSilverIsInTrainingText
	waitbutton
	closetext
	end

.DontGiveDratiniYet:
	writetext DragonShrineComeAgainText
	waitbutton
	closetext
	end

.ReceivedDratini:
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

DragonShrineElder2Script:
	faceplayer
	opentext
	writetext DragonShrineElder2Text
	waitbutton
	closetext
	end

DragonShrineElder3Script:
	faceplayer
	opentext
	writetext DragonShrineElder3Text
	waitbutton
	closetext
	end

DragonShrineQuestion1_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Pal@"
	db "Underling@"
	db "Friend@"

DragonShrineQuestion2_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Strategy@"
	db "Raising@"
	db "Cheating@"

DragonShrineQuestion3_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 5, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Weak person@"
	db "Tough person@"
	db "Anybody@"

DragonShrineQuestion4_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 8, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Love@"
	db "Violence@"
	db "Knowledge@"

DragonShrineQuestion5_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 12, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Tough@"
	db "Both@"
	db "Weak@"

DragonShrinePlayerWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineElderStepDownMovement:
	slow_step DOWN
	step_end

DragonShrineElderWalkToClairMovement:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	turn_head DOWN
	step_end

DragonShrineElderWalkAway1Movement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineElderWalkAway2Movement:
	slow_step RIGHT
	turn_head DOWN
	step_end

DragonShrineClairWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineClairBigStepLeftMovement:
	fix_facing
	big_step LEFT
	step_end

DragonShrineClairSlowStepLeftMovement:
	slow_step LEFT
	remove_fixed_facing
	step_end

DragonShrineClairTwoSlowStepsRightMovement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineClairWalkOutMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DragonShrineElderGreetingText:
	text "Ah… Mi fa"
	line "piacere vederti."

	para "No, non dire una"
	line "parola."

	para "So chi ti manda:"
	line "SANDRA, vero?"

	para "Ah, quella"
	line "ragazza…"

	para "Mi spiace, ma devo"
	line "metterti alla"
	cont "prova."

	para "Dovrai soltanto"
	line "rispondere ad"
	cont "alcune domande."

	para "Iniziamo?"
	done

DragonShrineQuestion1Text:
	text "Cosa sono i"
	line "#MON per te?"
	done

DragonShrineQuestion2Text:
	text "Che cosa ti può"
	line "aiutare a vincere?"
	done

DragonShrineQuestion3Text:
	text "Quali allenatori"
	line "preferisci"
	cont "sfidare?"
	done

DragonShrineQuestion4Text:
	text "Qual è la cosa più"
	line "importante per"
	cont "allevare un"
	cont "#MON?"
	done

DragonShrineQuestion5Text:
	text "Ci sono #MON"
	line "forti e #MON"
	cont "deboli."

	para "Quali sono i più"
	line "importanti?"
	done

DragonShrinePassedTestText:
	text "Bene… Capisco…"

	para "Vedo che conosci"
	line "bene i #MON."

	para "Molto ammirevole."

	para "La convinzione è"
	line "ciò che più conta!"

	para "<PLAYER>, non devi"
	line "mai perdere la tua"
	cont "convinzione!"

	para "Solo così potrai"
	line "superare la LEGA"
	cont "#MON."
	done

DragonShrineMustIInformLanceText:
	text "SANDRA!"

	para "La convinzione e"
	line "l'abilità di"
	cont "questa persona"
	cont "sono impeccabili!"

	para "Ammetti la tua"
	line "sconfitta e"
	cont "conferisci la"
	cont "MEDAGLIA LEVANTE."

	para "…Altrimenti lo"
	line "dirò a LANCE!"
	done

DragonShrineElderScoldsClairText:
	text "SANDRA…"

	para "Ora dovrai capire"
	line "in che cosa il tuo"

	para "avversario è stato"
	line "migliore di te!"
	done

DragonShrineComeAgainText:
	text "Torna a trovarmi"
	line "quando vuoi!"
	done

DragonShrineTakeThisDratiniText:
	text "Bene… Che"
	line "bello vederti!"

	para "Arrivi proprio nel"
	line "momento adatto!"

	para "Ho qui qualcosa"
	line "per te."

	para "Prendi questo"
	line "DRATINI, in segno"

	para "della mia stima"
	line "per te."
	done

DragonShrinePlayerReceivedDratiniText:
	text "<PLAYER> riceve"
	line "DRATINI!"
	done

DragonShrinePartyFullText:
	text "La tua squadra è"
	line "già completa."
	done

DragonShrineSymbolicDragonText:
	text "I #MON drago"
	line "sono il simbolo"
	cont "del nostro gruppo."

	para "Te ne regaliamo"
	line "uno perché hai"

	para "dimostrato di"
	line "meritartelo."
	done

DragonShrineClairsGrandfatherText:
	text "Credo che SANDRA"
	line "abbia imparato una"

	para "bella lezione da"
	line "te."

	para "Io sono suo nonno,"
	line "quindi te ne sono"
	cont "grato."
	done

DragonShrineSilverIsInTrainingText:
	text "Qui si sta"
	line "allenando un"
	cont "bambino che ha più"
	cont "o meno la tua età."

	para "Somiglia molto a"
	line "SANDRA quand'era"

	para "più giovane, e ciò"
	line "mi preoccupa…"
	done

DragonShrineWrongAnswerText1:
	text "Come? Non ho"
	line "capito nulla…"
	done

DragonShrineWrongAnswerText2:
	text "Cos'hai detto?"
	done

DragonShrineRightAnswerText:
	text "Ah, capisco…"
	done

DragonShrineElder2Text:
	text "È passato molto"
	line "tempo da quando un"

	para "allenatore ha"
	line "ottenuto"
	cont "l'approvazione del"
	cont "MAESTRO."

	para "L'ultimo è stato"
	line "LANCE."
	done

DragonShrineElder3Text:
	text "Conosci il Maestro"
	line "LANCE?"

	para "Somiglia molto"
	line "al MAESTRO da"
	cont "giovane."

	para "Sono fatti della"
	line "stessa pasta."
	done

DragonShrineClairYouPassedText:
	text "Com'è andata?"

	para "Credo che non ci"
	line "sia bisogno di"
	cont "chiedertelo."

	para "Hai fallito, vero?"

	para "<……><……><……><……><……><……>"

	para "…Cosa?! Hai"
	line "superato la prova?"
	done

DragonShrineClairThatCantBeText:
	text "Non posso"
	line "crederci!!!"
	done

DragonShrineClairYoureLyingText:
	text "Stai mentendo!"

	para "Neppure io ho"
	line "ottenuto"
	cont "l'approvazione!"
	done

DragonShrineIUnderstandText:
	text "C-c-capisco…"
	done

DragonShrineHereRisingBadgeText:
	text "Ecco la MEDAGLIA"
	line "LEVANTE…"

	para "Dai, prendila!"
	done

DragonShrinePlayerReceivedRisingBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA LEVANTE."
	done

DragonShrineRisingBadgeExplanationText:
	text "Con la MEDAGLIA"
	line "LEVANTE, i tuoi"

	para "#MON potranno"
	line "usare la mossa per"
	cont "attraversare le"
	cont "cascate."

	para "Inoltre, tutti i "
	line "#MON"

	para "riconosceranno la"
	line "tua autorità e"

	para "ti obbediranno"
	line "senz'altro."
	done

DragonShrineSpeechlessText:
	text "<……><……><……><……><……><……>"
	done

DragonShrine_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  9, DRAGONS_DEN_B1F, 2
	warp_event  5,  9, DRAGONS_DEN_B1F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  5,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder1Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  2,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder2Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  7,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder3Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  4,  8, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGON_SHRINE_CLAIR
