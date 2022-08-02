	object_const_def ; object_event constants
	const RADIOTOWER1F_RECEPTIONIST
	const RADIOTOWER1F_LASS
	const RADIOTOWER1F_YOUNGSTER
	const RADIOTOWER1F_ROCKET
	const RADIOTOWER1F_LUCKYNUMBERMAN
	const RADIOTOWER1F_CARD_WOMAN

RadioTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower1FReceptionistScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower1FReceptionistWelcomeText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower1FReceptionistNoToursText
	waitbutton
	closetext
	end

RadioTower1FLuckyNumberManScript:
	faceplayer
	opentext
	writetext RadioTower1FLuckyNumberManAskToPlayText
	buttonsound
	special CheckLuckyNumberShowFlag
	iffalse .skip
	special ResetLuckyNumberShowFlag
.skip
	special PrintTodaysLuckyNumber
	checkflag ENGINE_LUCKY_NUMBER_SHOW
	iftrue .GameOver
	writetext RadioTower1FLuckyNumberManThisWeeksIdIsText
	buttonsound
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManGoToPCMovement
	opentext
	writetext RadioTower1FLuckyNumberManCheckIfMatchText
	buttonsound
	waitsfx
	writetext RadioTower1FLuckyNumberManDotDotDotText
	playsound SFX_DEX_FANFARE_20_49
	waitsfx
	buttonsound
	special CheckForLuckyNumberWinners
	closetext
	applymovement RADIOTOWER1F_LUCKYNUMBERMAN, RadioTower1FLuckyNumberManReturnToPlayerMovement
	opentext
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	sjump .NoPrize

.GameOver:
	writetext RadioTower1FLuckyNumberManComeAgainText
	waitbutton
	closetext
	end

.FirstPlace:
	writetext RadioTower1FLuckyNumberManPerfectMatchText
	playsound SFX_1ST_PLACE
	waitsfx
	buttonsound
	giveitem MASTER_BALL
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.SecondPlace:
	writetext RadioTower1FLuckyNumberManOkayMatchText
	playsound SFX_2ND_PLACE
	waitsfx
	buttonsound
	giveitem EXP_SHARE
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.ThirdPlace:
	writetext RadioTower1FLuckyNumberManWeakMatchText
	playsound SFX_3RD_PLACE
	waitsfx
	buttonsound
	giveitem PP_UP
	iffalse .BagFull
	itemnotify
	setflag ENGINE_LUCKY_NUMBER_SHOW
	sjump .GameOver

.NoPrize:
	writetext RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText
	waitbutton
	closetext
	end

.BagFull:
	writetext RadioTower1FLuckyNumberManNoRoomForYourPrizeText
	waitbutton
	closetext
	end

RadioTower1FRadioCardWomanScript:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotCard
	writetext RadioTower1FRadioCardWomanOfferQuizText
	yesorno
	iffalse .NoQuiz
	writetext RadioTower1FRadioCardWomanQuestion1Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion2Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion3Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion4Text
	yesorno
	iffalse .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanQuestion5Text
	yesorno
	iftrue .WrongAnswer
	playsound SFX_ELEVATOR_END
	waitsfx
	writetext RadioTower1FRadioCardWomanYouWinText
	buttonsound
	getstring STRING_BUFFER_4, .RadioCardText
	scall .ReceiveItem
	writetext RadioTower1FPokegearIsARadioText
	buttonsound
	setflag ENGINE_RADIO_CARD
.GotCard:
	writetext RadioTower1FRadioCardWomanTuneInText
	waitbutton
	closetext
	end

.RadioCardText:
	db "RADIO CARD@"

.ReceiveItem:
	jumpstd receiveitem
	end

.WrongAnswer:
	playsound SFX_WRONG
	writetext RadioTower1FRadioCardWomanWrongAnswerText
	waitbutton
	closetext
	end

.NoQuiz:
	writetext RadioTower1FRadioCardWomanNotTakingQuizText
	waitbutton
	closetext
	end

RadioTower1FLassScript:
	jumptextfaceplayer RadioTower1FLassText

RadioTower1FYoungsterScript:
	jumptextfaceplayer RadioTower1FYoungsterText

TrainerGruntM3:
	trainer GRUNTM, GRUNTM_3, EVENT_BEAT_ROCKET_GRUNTM_3, GruntM3SeenText, GruntM3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM3AfterBattleText
	waitbutton
	closetext
	end

RadioTower1FDirectory:
	jumptext RadioTower1FDirectoryText

RadioTower1FLuckyChannelSign:
	jumptext RadioTower1FLuckyChannelSignText

RadioTower1FLuckyNumberManGoToPCMovement:
	step RIGHT
	turn_head UP
	step_end

RadioTower1FLuckyNumberManReturnToPlayerMovement:
	step LEFT
	turn_head UP
	step_end

RadioTower1FReceptionistWelcomeText:
	text "Ti do il"
	line "benvenuto!"
	done

RadioTower1FReceptionistNoToursText:
	text "Salve. Sono"
	line "spiacente, ma oggi"
	cont "non ci sono"
	cont "visite guidate."
	done

RadioTower1FLuckyNumberManAskToPlayText:
	text "Ciao, sei qui per"
	line "lo SHOW del NUMERO"
	cont "FORTUNATO?"

	para "Puoi vincere con i"
	line "Numeri d'Identità"
	cont "dei tuoi #MON."

	para "Se hai fortuna"
	line "puoi vincere"
	cont "un bel premio."
	done

RadioTower1FLuckyNumberManThisWeeksIdIsText:
	text "Il Numero d'Iden-"
	line "tità di questa"
	cont "settimana è"
	cont "@"
	text_ram wStringBuffer3
	text "."
	done

RadioTower1FLuckyNumberManCheckIfMatchText:
	text "Vediamo se"
	line "corrisponde."
	done

RadioTower1FLuckyNumberManDotDotDotText:
	text "…"
	line "…"
	done

RadioTower1FLuckyNumberManComeAgainText:
	text "Torna la prossima"
	line "settimana, per il"
	cont "prossimo NUMERO"
	cont "FORTUNATO."
	done

RadioTower1FLuckyNumberManPerfectMatchText:
	text "Incredibile! Tutti"
	line "i cinque numeri"
	cont "corrispondono!"

	para "Hai vinto il primo"
	line "premio!"

	para "Hai vinto una"
	line "MASTER BALL!"
	done

RadioTower1FLuckyNumberManOkayMatchText:
	text "Grande! Gli ultimi"
	line "tre numeri"
	cont "corrispondono!"

	para "Hai vinto il"
	line "secondo premio,"
	cont "CONDIV.ESP.!"
	done

RadioTower1FLuckyNumberManWeakMatchText:
	text "Oh, i due ultimi"
	line "numeri"
	cont "corrispondono."

	para "Hai vinto il terzo"
	line "premio, PP-SU."
	done

RadioTower1FLuckyNumberManNoneOfYourIDNumbersMatchText:
	text "Peccato, non hai"
	line "vinto nulla."
	done

RadioTower1FLuckyNumberManNoRoomForYourPrizeText:
	text "Non hai posto per"
	line "ricevere"
	cont "il premio."

	para "Libera uno spazio"
	line "e poi torna qui."
	done

RadioTower1FRadioCardWomanOfferQuizText:
	text "Partecipa al quiz"
	line "che si sta svol-"
	cont "gendo proprio ora!"

	para "Se rispondi"
	line "correttamente a"
	cont "5 domande vinci"
	cont "una SCHEDA RADIO."

	para "Se la inserisci"
	line "nel #GEAR,"

	para "puoi ascoltare la"
	line "radio quando vuoi."

	para "Vuoi partecipare"
	line "al quiz?"
	done

RadioTower1FRadioCardWomanQuestion1Text:
	text "Domanda 1:"

	para "C'è un #MON"
	line "che appare solo"
	cont "di mattina?"
	done

RadioTower1FRadioCardWomanQuestion2Text:
	text "Esatto!"
	line "Domanda 2:"

	para "È vero che non si"
	line "possono comprare"

	para "BACCHE al MARKET?"
	done

RadioTower1FRadioCardWomanQuestion3Text:
	text "Che classe!"
	line "Domanda 3:"

	para "La MN01 contiene"
	line "FLASH?"
	done

RadioTower1FRadioCardWomanQuestion4Text:
	text "Ancora esatto!"
	line "Domanda 4:"

	para "È VALERIO il"
	line "CAPOPALESTRA di"

	para "VIOLAPOLI, quello"
	line "che usa i #MON"
	cont "di tipo volante?"
	done

RadioTower1FRadioCardWomanQuestion5Text:
	text "Un'altra risposta"
	line "corretta! E ora"
	cont "l'ultima domanda:"

	para "Tra i simboli"
	line "delle slot machine"

	para "nel CASINÒ di"
	line "FIORDOROPOLI può"
	cont "comparire anche"
	cont "CHARMANDER?"
	done

RadioTower1FRadioCardWomanYouWinText:
	text "Ce l'hai fatta!!!"
	line "Complimenti!"

	para "Hai vinto una"
	line "SCHEDA RADIO!"
	done

RadioTower1FPokegearIsARadioText:
	text "Il #GEAR di"
	line "<PLAYER> ora può"
	cont "funzionare come"
	cont "una radio!"
	done

RadioTower1FRadioCardWomanTuneInText:
	text "Ascolta i nostri"
	line "programmi!"
	done

RadioTower1FRadioCardWomanWrongAnswerText:
	text "Peccato!"
	line "Mi dispiace, hai"

	para "sbagliato."
	line "Riprova!"
	done

RadioTower1FRadioCardWomanNotTakingQuizText:
	text "Come vuoi. Se"
	line "cambi idea, noi"
	cont "siamo qui."
	done

RadioTower1FLassText:
	text "TIMMI è un DJ"
	line "favoloso."

	para "La sua voce"
	line "può addolcire"
	cont "qualsiasi cosa."
	done

RadioTower1FYoungsterText:
	text "Adoro LORI del"
	line "#MON TALK."

	para "Purtroppo la cono-"
	line "sco solo di voce."
	done

GruntM3SeenText:
	text "Finalmente abbiamo"
	line "il controllo della"
	cont "TORRE RADIO!"

	para "Ora chiunque"
	line "vivrà con il"

	para "terrore di "
	line "TEAM ROCKET!"

	para "Vedrai quanto"
	line "possiamo essere"
	cont "spaventosi!"
	done

GruntM3BeatenText:
	text "Sei forte! Dovremo"
	line "stare attenti…"
	done

GruntM3AfterBattleText:
	text "Sei troppo forte."

	para "Potresti rovinare"
	line "il nostro piano."
	cont "Devo avvertire"
	cont "gli altri…"
	done

RadioTower1FDirectoryText:
	text "PT  RECEPTION"
	line "1ºP VENDITA"

	para "2ºP PERSONALE"
	line "3ºP PRODUZIONE"

	para "4ºP UFFICIO DEL"
	line "    DIRETTORE"
	done

RadioTower1FLuckyChannelSignText:
	text "RADIO FORTUNA!"

	para "Vinci con i Numeri"
	line "d'Identità dei"
	cont "tuoi #MON!"

	para "Scambia i #MON"
	line "per avere più"
	cont "Numeri d'Identità!"
	done

RadioTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 11
	warp_event  3,  7, GOLDENROD_CITY, 11
	warp_event 15,  0, RADIO_TOWER_2F, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower1FDirectory
	bg_event 13,  0, BGEVENT_READ, RadioTower1FLuckyChannelSign

	db 6 ; object events
	object_event  5,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FReceptionistScript, -1
	object_event 16,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower1FLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 15,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FYoungsterScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM3, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower1FLuckyNumberManScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower1FRadioCardWomanScript, EVENT_GOLDENROD_CITY_CIVILIANS
