	object_const_def ; object_event constants
	const RADIOTOWER2F_SUPER_NERD
	const RADIOTOWER2F_TEACHER
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET2
	const RADIOTOWER2F_ROCKET3
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_BLACK_BELT1
	const RADIOTOWER2F_BLACK_BELT2
	const RADIOTOWER2F_JIGGLYPUFF
	const RADIOTOWER2F_BUENA
	const RADIOTOWER2F_RECEPTIONIST

RadioTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower2FUnusedDummyScene:
; unused
	end

RadioTower2FSuperNerdScript:
	jumptextfaceplayer RadioTower2FSuperNerdText

RadioTower2FTeacherScript:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	writetext RadioTower2FTeacherText
	waitbutton
	closetext
	end

.Rockets:
	writetext RadioTower2FTeacherText_Rockets
	waitbutton
	closetext
	end

RadioTowerJigglypuff:
	opentext
	writetext RadioTowerJigglypuffText
	cry JIGGLYPUFF
	waitbutton
	closetext
	end

RadioTower2FBlackBelt1Script:
	jumptextfaceplayer RadioTower2FBlackBelt1Text

RadioTower2FBlackBelt2Script:
	jumptextfaceplayer RadioTower2FBlackBelt2Text

TrainerGruntM4:
	trainer GRUNTM, GRUNTM_4, EVENT_BEAT_ROCKET_GRUNTM_4, GruntM4SeenText, GruntM4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM4AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM5:
	trainer GRUNTM, GRUNTM_5, EVENT_BEAT_ROCKET_GRUNTM_5, GruntM5SeenText, GruntM5BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM5AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM6:
	trainer GRUNTM, GRUNTM_6, EVENT_BEAT_ROCKET_GRUNTM_6, GruntM6SeenText, GruntM6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM6AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF2:
	trainer GRUNTF, GRUNTF_2, EVENT_BEAT_ROCKET_GRUNTF_2, GruntF2SeenText, GruntF2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF2AfterBattleText
	waitbutton
	closetext
	end

Buena:
	faceplayer
	opentext
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .MidRocketTakeover
	checkevent EVENT_MET_BUENA
	iffalse .Introduction
	checkflag ENGINE_BUENAS_PASSWORD_2
	iftrue .PlayedAlready
	readvar VAR_HOUR
	ifless 18, .TooEarly
	checkflag ENGINE_BUENAS_PASSWORD
	iffalse .TuneIn
	checkitem BLUE_CARD
	iffalse .NoBlueCard
	readvar VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped0
	playmusic MUSIC_BUENAS_PASSWORD
	writetext RadioTower2FBuenaDoYouKnowPasswordText
	special AskRememberPassword
	iffalse .ForgotPassword
	writetext RadioTower2FBuenaJoinTheShowText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	readvar VAR_FACING
	ifnotequal RIGHT, .DontNeedToMove
	applymovement PLAYER, RadioTower2FPlayerWalksToMicrophoneMovement
.DontNeedToMove:
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower2FBuenaEveryoneSayPasswordText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, DOWN
	refreshscreen
	special BuenasPassword
	closetext
	iffalse .WrongAnswer
	opentext
	writetext RadioTower2FBuenaCorrectAnswerText
	waitbutton
	closetext
	readvar VAR_BLUECARDBALANCE
	addval 1
	writevar VAR_BLUECARDBALANCE
	waitsfx
	playsound SFX_TRANSACTION
	setflag ENGINE_BUENAS_PASSWORD_2
	pause 20
	turnobject RADIOTOWER2F_BUENA, RIGHT
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	readvar VAR_BLUECARDBALANCE
	ifequal 30, .BlueCardCapped1
	end

.Introduction:
	writetext RadioTower2FBuenaShowIntroductionText
	buttonsound
	setevent EVENT_MET_BUENA
	verbosegiveitem BLUE_CARD
.TuneIn:
	writetext RadioTower2FBuenaTuneInToMyShowText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered0
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered0:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.ForgotPassword:
	writetext RadioTower2FBuenaComeBackAfterListeningText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.PlayedAlready:
	writetext RadioTower2FBuenaAlreadyPlayedText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered1
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered1:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 10
	end

.WrongAnswer:
	setflag ENGINE_BUENAS_PASSWORD_2
	opentext
	writetext RadioTower2FBuenaDidYouForgetText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	pause 20
	opentext
	writetext RadioTower2FBuenaThanksForComingText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	special FadeOutMusic
	pause 20
	special RestartMapMusic
	end

.MidRocketTakeover:
	writetext RadioTower2FBuenaPasswordIsHelpText
	waitbutton
	closetext
	end

.NoBlueCard:
	writetext RadioTower2FBuenaNoBlueCardText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered2
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered2:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.BlueCardCapped0:
	writetext RadioTower2FBuenaCardIsFullText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered3
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
.Registered3:
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.TooEarly:
	writetext RadioTower2FBuenaTuneInAfterSixText
	waitbutton
	closetext
	checkcellnum PHONE_BUENA
	iftrue .Registered4
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	iftrue .OfferedNumberBefore
.Registered4:
	end

.BlueCardCapped1:
	checkcellnum PHONE_BUENA
	iftrue .HasNumber
	pause 20
	turnobject RADIOTOWER2F_BUENA, DOWN
	pause 15
	turnobject PLAYER, UP
	pause 15
	checkevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	iftrue .OfferedNumberBefore
	showemote EMOTE_SHOCK, RADIOTOWER2F_BUENA, 15
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER_NO_BLUE_CARD
	setevent EVENT_BUENA_OFFERED_HER_PHONE_NUMBER
	opentext
	writetext RadioTower2FBuenaOfferPhoneNumberText
	sjump .AskForNumber

.OfferedNumberBefore:
	opentext
	writetext RadioTower2FBuenaOfferNumberAgainText
.AskForNumber:
	askforphonenumber PHONE_BUENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	writetext RadioTower2FRegisteredBuenasNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
	writetext RadioTower2FBuenaCallMeText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	addcellnum PHONE_BUENA
	end

.NumberDeclined:
	writetext RadioTower2FBuenaSadRejectedText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
	end

.PhoneFull:
	writetext RadioTower2FBuenaYourPhoneIsFullText
	waitbutton
	closetext
	turnobject RADIOTOWER2F_BUENA, RIGHT
.HasNumber:
	end

RadioTowerBuenaPrizeReceptionist:
	faceplayer
	opentext
	checkitem BLUE_CARD
	iffalse .NoCard
	writetext RadioTower2FBuenaReceptionistPointsForPrizesText
	buttonsound
	special BuenaPrize
	closetext
	end

.NoCard:
	writetext RadioTower2FBuenaReceptionistNoCardText
	buttonsound
	closetext
	end

RadioTower2FSalesSign:
	jumptext RadioTower2FSalesSignText

RadioTower2FOaksPKMNTalkSign:
	jumptext RadioTower2FOaksPKMNTalkSignText

RadioTower2FPokemonRadioSign:
	jumptext RadioTower2FPokemonRadioSignText

RadioTower2FBookshelf:
	jumpstd magazinebookshelf

RadioTower2FPlayerWalksToMicrophoneMovement:
	slow_step DOWN
	slow_step RIGHT
	step_end

RadioTower2FSuperNerdText:
	text "La radio si può"
	line "ascoltare ovunque."
	cont "Sintonizzati!"
	done

RadioTower2FTeacherText:
	text "Le ninnananne"
	line "alla radio fanno"
	cont "addormentare i"
	cont "#MON."
	done

RadioTower2FTeacherText_Rockets:
	text "Perché hanno"
	line "voluto prendere"
	cont "possesso della"
	cont "TORRE RADIO?"
	done

RadioTowerJigglypuffText:
	text "JIGGLYPUFF:"
	line "Jiggly…"
	done

RadioTower2FBlackBelt1Text:
	text "Mi dispiace, qui è"
	line "ammesso solo il"
	cont "personale"
	cont "autorizzato."

	para "Prima non era"
	line "così."

	para "Sembra che il"
	line "DIRETTORE sia un"
	cont "po' nervoso…"
	done

RadioTower2FBlackBelt2Text:
	text "Ora puoi andare"
	line "dove desideri."

	para "Il DIRETTORE è"
	line "di nuovo affabile"
	cont "come prima."
	done

GruntM4SeenText:
	text "Tre anni fa TEAM"
	line "ROCKET è stato"
	cont "costretto a"
	cont "sciogliersi."

	para "Ma ora siamo"
	line "tornati!"
	done

GruntM4BeatenText:
	text "Ora non gasarti"
	line "però!"
	done

GruntM4AfterBattleText:
	text "Non riuscirai a"
	line "rovinare il"
	cont "nostro ritorno!"
	done

GruntM5SeenText:
	text "Siamo TEAM ROCKET,"
	line "gli sfruttatori"
	cont "dei #MON!"

	para "Noi amiamo essere"
	line "crudeli!"
	cont "Hai paura, eh?"
	done

GruntM5BeatenText:
	text "Pensi di essere"
	line "chissà chi, vero?"
	done

GruntM5AfterBattleText:
	text "Non siamo sempre"
	line "malvagi. È che"
	cont "facciamo soltanto"
	cont "ciò che ci pare!"
	done

GruntM6SeenText:
	text "Ehi! Togliti di"
	line "mezzo!"
	done

GruntM6BeatenText:
	text "Basta, mi arrendo!"
	done

GruntM6AfterBattleText:
	text "I nostri GENERALI"
	line "tentano di"
	cont "prendere possesso"
	cont "di questo posto."

	para "Hanno un grande"
	line "piano in mente."
	cont "Vorrei sapere"
	cont "quale!"
	done

GruntF2SeenText:
	text "Uffa!"

	para "Che noia! È stato"
	line "troppo facile"

	para "impossessarsi di"
	line "questo posto!"

	para "Avanti, fammi un"
	line "po' divertire!"
	done

GruntF2BeatenText:
	text "Ma tu c-c-chi sei?"
	done

GruntF2AfterBattleText:
	text "Mi hai battuto, e"
	line "non lo scorderò!"
	done

RadioTower2FBuenaShowIntroductionText:
	text "BUENA: Ciao!"
	line "Sono BUENA!"

	para "Conosci il"
	line "programma radio"
	cont "PASSWORD SHOW?"

	para "Se sai ripetere la"
	line "password che hai"

	para "sentito nel"
	line "programma guadagni"
	cont "dei punti!"

	para "Conserva i punti e"
	line "consegnali alla"
	cont "ragazza qui"

	para "vicino."
	line "Potrai ottenere"

	para "fantastici premi"
	line "in cambio!"

	para "Ecco qui!"

	para "Questa è la tua"
	line "scheda"
	cont "raccogli-punti."
	done

RadioTower2FBuenaTuneInToMyShowText:
	text "BUENA:"
	line "Sintonizzati sul"
	cont "mio PASSWORD SHOW!"
	done

RadioTower2FBuenaDoYouKnowPasswordText:
	text "BUENA: Ciao!"
	line "Hai ascoltato la"
	cont "mia trasmissione?"

	para "Ricordi la"
	line "password di oggi?"
	done

RadioTower2FBuenaJoinTheShowText:
	text "BUENA: Oh!"
	line "Grazie!"

	para "Come hai detto che"
	line "ti chiami?"

	para "Bene, <PLAY_G>!"

	para "Sarai ospite nella"
	line "trasmissione di"
	cont "oggi!"
	done

RadioTower2FBuenaEveryoneSayPasswordText:
	text "BUENA: Siete"
	line "pronti?"

	para "Voglio sentirvi"
	line "urlare la password"

	para "di oggi per"
	line "<PLAY_G>!"
	done

RadioTower2FBuenaComeBackAfterListeningText:
	text "BUENA: Torna dopo"
	line "aver ascoltato il"

	para "mio show, va bene?"
	line "Ci vediamo dopo!"
	done

RadioTower2FBuenaAlreadyPlayedText:
	text "BUENA: Mi spiace…"

	para "Puoi fare un solo"
	line "tentativo al"
	cont "giorno."

	para "Torna domani e"
	line "riprova!"
	done

RadioTower2FBuenaCorrectAnswerText:
	text "BUENA: Benissimo!"
	line "Risposta esatta!"

	para "Vuol dire che hai"
	line "ascoltato lo show!"

	para "Hai vinto un"
	line "punto!"
	cont "Complimenti!"
	done

RadioTower2FBuenaDidYouForgetText:
	text "BUENA: Nooo…"
	line "Risposta errata…"

	para "Hai scordato la"
	line "password?"
	done

RadioTower2FBuenaThanksForComingText:
	text "BUENA: Oggi ha"
	line "partecipato allo"

	para "show <PLAY_G>."
	line "Grazie per la"
	cont "visita!"

	para "Ehi, ascoltatori,"
	line "che aspettate a"

	para "partecipare?"
	line "Vi aspetto!"
	done

RadioTower2FBuenaPasswordIsHelpText:
	text "BUENA: Come?"
	line "La password di"
	cont "oggi?"

	para "AIUTO, ovviamente!"
	done

RadioTower2FBuenaCardIsFullText:
	text "BUENA: La tua"
	line "CARTA BLU è piena."

	para "Scambia i punti"
	line "con un fantastico"
	cont "regalo!"
	done

RadioTower2FBuenaTuneInAfterSixText:
	text "BUENA: Ascolta"
	line "il PASSWORD SHOW,"

	para "ogni sera dalle"
	line "sei a mezzanotte!"

	para "E dopo, vieni a"
	line "trovarmi!"
	done

RadioTower2FBuenaNoBlueCardText:
	text "BUENA: Come?! Non"
	line "hai con te la"
	cont "CARTA BLU?"

	para "Senza la CARTA BLU"
	line "come faccio a"
	cont "darti i punti?"
	done

RadioTower2FBuenaOfferPhoneNumberText:
	text "BUENA: Grande! Hai"
	line "raccolto 30 punti"

	para "nella CARTA BLU!"
	line "Fantastico!"

	para "Ehm… Non esiste"
	line "un premio per 30"
	cont "punti ma…"

	para "…per la tua"
	line "fedeltà, <PLAY_G>,"

	para "ti darò qualcosa"
	line "di speciale!"

	para "Che ne dici del"
	line "mio numero di"
	cont "telefono?"
	done

RadioTower2FBuenaOfferNumberAgainText:
	text "BUENA: <PLAY_G>,"
	line "vuoi registrare il"

	para "mio numero di"
	line "telefono?"
	done

RadioTower2FRegisteredBuenasNumberText:
	text "<PLAYER> registra"
	line "il numero di"
	cont "BUENA."
	done

RadioTower2FBuenaCallMeText:
	text "BUENA: Non vedo"
	line "l'ora di sentirti"
	cont "al telefono!"
	done

RadioTower2FBuenaSadRejectedText:
	text "BUENA: Ehi… Era un"
	line "premio speciale…"
	done

RadioTower2FBuenaYourPhoneIsFullText:
	text "BUENA: <PLAY_G>,"
	line "nella memoria del"

	para "telefono non c'è"
	line "più posto…"
	done

RadioTower2FBuenaReceptionistPointsForPrizesText:
	text "Puoi scambiare i"
	line "punti raccolti con"

	para "il premio che"
	line "preferisci!"
	done

RadioTower2FBuenaReceptionistNoCardText:
	text "Senza la CARTA BLU"
	line "non puoi"
	cont "raccogliere punti."

	para "Non scordare mai"
	line "la CARTA BLU!"
	done

RadioTower2FSalesSignText:
	text "1ºP VENDITA"
	done

RadioTower2FOaksPKMNTalkSignText:
	text "Il #MON TALK"
	line "del PROF.OAK"

	para "Il programma radio"
	line "più spumeggiante!"
	done

RadioTower2FPokemonRadioSignText:
	text "Ovunque, comunque:"
	line "Radio #MON"
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_3F, 1
	warp_event 15,  0, RADIO_TOWER_1F, 3

	db 0 ; coord events

	db 6 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower2FSalesSign
	bg_event  5,  0, BGEVENT_READ, RadioTower2FOaksPKMNTalkSign
	bg_event  9,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 10,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 11,  1, BGEVENT_READ, RadioTower2FBookshelf
	bg_event 13,  0, BGEVENT_READ, RadioTower2FPokemonRadioSign

	db 11 ; object events
	object_event  6,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower2FSuperNerdScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17,  2, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower2FTeacherScript, -1
	object_event  1,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  8,  4, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM5, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM6, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 10,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGruntF2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  0,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt1Script, EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	object_event  1,  1, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FBlackBelt2Script, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 12,  1, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTowerJigglypuff, -1
	object_event 14,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Buena, -1
	object_event 12,  7, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTowerBuenaPrizeReceptionist, EVENT_GOLDENROD_CITY_CIVILIANS
