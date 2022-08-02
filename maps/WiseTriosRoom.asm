	object_const_def ; object_event constants
	const WISETRIOSROOM_SAGE1
	const WISETRIOSROOM_SAGE2
	const WISETRIOSROOM_SAGE3
	const WISETRIOSROOM_SAGE4
	const WISETRIOSROOM_SAGE5
	const WISETRIOSROOM_SAGE6

WiseTriosRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .WiseTrioCallback

.DummyScene0:
	end

.DummyScene1:
	end

.WiseTrioCallback:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .NoWiseTrio
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .WiseTrio2
	checkitem CLEAR_BELL
	iftrue .WiseTrio2
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.WiseTrio2:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	clearevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

.NoWiseTrio:
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	setevent EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	return

WiseTriosRoomSage1Script:
	jumptextfaceplayer WiseTriosRoomSage1Text

WiseTriosRoomSage2Script:
	jumptextfaceplayer WiseTriosRoomSage2Text

WiseTriosRoomSage3Script:
	jumptextfaceplayer WiseTriosRoomSage3Text

WiseTriosRoom_CannotEnterTinTowerScript:
	turnobject WISETRIOSROOM_SAGE3, UP
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE3, 20
	follow PLAYER, WISETRIOSROOM_SAGE3
	applymovement PLAYER, MovementData_0x98622
	stopfollow
	turnobject PLAYER, RIGHT
	opentext
	writetext WiseTriosRoomSage3BlocksExitText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE3, MovementData_0x98625
	turnobject WISETRIOSROOM_SAGE3, LEFT
	end

TrainerSageGaku:
	trainer SAGE, GAKU, EVENT_BEAT_SAGE_GAKU, SageGakuSeenText, SageGakuBeatenText, 0, .Script

.Script:
	opentext
	writetext SageGakuAfterBattleText
	waitbutton
	closetext
	end

TrainerSageMasa:
	trainer SAGE, MASA, EVENT_BEAT_SAGE_MASA, SageMasaSeenText, SageMasaBeatenText, 0, .Script

.Script:
	opentext
	writetext SageMasaAfterBattleText
	waitbutton
	closetext
	end

TrainerSageKoji:
	trainer SAGE, KOJI, EVENT_BEAT_SAGE_KOJI, SageKojiSeenText, SageKojiBeatenText, 0, .Script

.Script:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .KojiAllowsPassage
	pause 10
	showemote EMOTE_SHOCK, WISETRIOSROOM_SAGE6, 20
	opentext
	writetext SageKojiAfterBattleQuestionText
	buttonsound
	writetext SageKojiAfterBattleSpeechText
	waitbutton
	closetext
	applymovement WISETRIOSROOM_SAGE6, MovementData_0x98628
	turnobject WISETRIOSROOM_SAGE6, UP
	setevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	setscene SCENE_FINISHED
	end

.KojiAllowsPassage:
	opentext
	writetext SageKojiAfterBattleFinalText
	waitbutton
	closetext
	end

MovementData_0x98622:
	step LEFT
	step LEFT
	step_end

MovementData_0x98625:
	step RIGHT
	step DOWN
	step_end

MovementData_0x98628:
	step RIGHT
	step DOWN
	step_end

WiseTriosRoomSage1Text:
	text "Straordinario…"

	para "SUICUNE, ENTEI e"
	line "RAIKOU si sono"
	cont "risvegliati…"

	para "La leggenda si sta"
	line "forse avverando?!"
	done

WiseTriosRoomSage2Text:
	text "Ci alleniamo alla"
	line "TORRE BRUCIATA, ma"

	para "non abbiamo mai"
	line "notato che ci"

	para "fosse un buco."
	line "Qualcuno deve"

	para "averlo scavato per"
	line "chissà che motivo."
	done

WiseTriosRoomSage3BlocksExitText:
	text "Chi possiede la"
	line "MEDAGLIA di"

	para "AMARANTOPOLI può"
	line "entrare nella"
	cont "TORRE DI LATTA."

	para "Tuttavia, poiché"
	line "SUICUNE, RAIKOU"

	para "ed ENTEI si sono"
	line "svegliati, devo"

	para "chiederti di non"
	line "entrare."
	done

WiseTriosRoomSage3Text:
	text "Siamo i TRE SAGGI,"
	line "protettori dei"

	para "#MON"
	line "leggendari."
	done

SageGakuSeenText:
	text "Dice la leggenda"
	line "che quando un"

	para "allenatore saprà"
	line "entrare in"

	para "sintonia con il"
	line "cuore dei #MON,"

	para "un #MON metterà"
	line "alla prova quell'"
	cont "allenatore alla"
	cont "TORRE DI LATTA."

	para "Ora, la leggenda"
	line "s'è avverata!"

	para "Il #MON"
	line "leggendario"
	cont "SUICUNE è qui!"

	para "Ora noi, i TRE"
	line "SAGGI, valuteremo"

	para "se sei in grado"
	line "di entrare."
	done

SageGakuBeatenText:
	text "Più forte di"
	line "quanto pensassimo…"
	done

SageGakuAfterBattleText:
	text "Ah, allora sei tu"
	line "che dici di aver"

	para "visto SUICUNE,"
	line "ENTEI e RAIKOU"
	cont "addormentati?"

	para "È incredibile!"

	para "La leggenda dice"
	line "che non possono"
	cont "essere visti"
	cont "mentre dormono…"
	done

SageMasaSeenText:
	text "Potremo rivelarti"
	line "la verità?"

	para "Ora proverò la tua"
	line "affidabilità."
	done

SageMasaBeatenText:
	text "…Ora ti dirò"
	line "la verità…"
	done

SageMasaAfterBattleText:
	text "In passato v'erano"
	line "due torri di nove"
	cont "piani qui."

	para "La TORRE D'OTTONE,"
	line "che svegliava i"

	para "#MON, e la"
	line "TORRE DI LATTA,"

	para "dove i #MON"
	line "riposavano."

	para "Dalla cima delle"
	line "TORRI si godeva di"

	para "un panorama"
	line "meraviglioso."

	para "Pare che a quel"
	line "tempo un #MON"

	para "argentato vivesse"
	line "in cima alla TORRE"
	cont "D'OTTONE."

	para "Poi, un giorno…"

	para "Circa 150 anni fa,"
	line "una delle TORRI fu"

	para "distrutta da un"
	line "lampo."

	para "Fuoco e fiamme"
	line "divamparono per"
	cont "tre interi giorni."

	para "Poi, una forte"
	line "pioggia pose fine"
	cont "all'incendio."

	para "E dai resti di"
	line "quell'incendio"
	cont "rimase la TORRE"
	cont "BRUCIATA."
	done

SageKojiSeenText:
	text "Dimostrami quanto"
	line "vali!"
	done

SageKojiBeatenText:
	text "Troppo forte! Ma"
	line "perché?"
	done

SageKojiAfterBattleQuestionText:
	text "Sei tu la persona"
	line "che è attesa dal"

	para "#MON"
	line "leggendario?"
	done

SageKojiAfterBattleSpeechText:
	text "Bene…"

	para "Noi, i TRE SAGGI,"
	line "abbiamo la"

	para "responsabilità di"
	line "proteggere i #-"
	cont "MON leggendari."

	para "Solo chi possiede"
	line "la forza della"

	para "verità e l'anima"
	line "pura possono"
	cont "passare."

	para "Prego, ti è stato"
	line "concesso di"
	cont "entrare nella"
	cont "TORRE DI LATTA."

	para "Ora SUICUNE ti"
	line "metterà alla"
	cont "prova."
	done

SageKojiAfterBattleFinalText:
	text "Prego, puoi"
	line "entrare."

	para "Ora SUICUNE ti"
	line "metterà alla"
	cont "prova."
	done

WiseTriosRoom_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  4, ECRUTEAK_CITY, 4
	warp_event  7,  5, ECRUTEAK_CITY, 5
	warp_event  1,  4, ECRUTEAK_TIN_TOWER_ENTRANCE, 5

	db 1 ; coord events
	coord_event  7,  4, SCENE_DEFAULT, WiseTriosRoom_CannotEnterTinTowerScript

	db 0 ; bg events

	db 6 ; object events
	object_event  6,  2, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage1Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  6,  7, SPRITE_SAGE, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage2Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  7,  5, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WiseTriosRoomSage3Script, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_1
	object_event  4,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageGaku, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  4,  6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageMasa, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
	object_event  6,  4, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSageKoji, EVENT_WISE_TRIOS_ROOM_WISE_TRIO_2
