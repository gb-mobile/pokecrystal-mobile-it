	object_const_def ; object_event constants
	const CELADONGAMECORNER_CLERK
	const CELADONGAMECORNER_RECEPTIONIST
	const CELADONGAMECORNER_POKEFAN_M
	const CELADONGAMECORNER_TEACHER
	const CELADONGAMECORNER_FISHING_GURU
	const CELADONGAMECORNER_FISHER1
	const CELADONGAMECORNER_FISHER2
	const CELADONGAMECORNER_GYM_GUY
	const CELADONGAMECORNER_GRAMPS

CeladonGameCorner_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonGameCornerClerkScript:
	jumpstd gamecornercoinvendor

CeladonGameCornerReceptionistScript:
	jumptextfaceplayer CeladonGameCornerReceptionistText

CeladonGameCornerPokefanMScript:
	faceplayer
	opentext
	writetext CeladonGameCornerPokefanMText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_POKEFAN_M, LEFT
	end

CeladonGameCornerTeacherScript:
	faceplayer
	opentext
	writetext CeladonGameCornerTeacherText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_TEACHER, RIGHT
	end

CeladonGameCornerFishingGuruScript:
	faceplayer
	opentext
	writetext CeladonGameCornerFishingGuruText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_FISHING_GURU, RIGHT
	end

CeladonGameCornerFisherScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
	iftrue .GotCoins
	writetext CeladonGameCornerFisherText1
	buttonsound
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins MAX_COINS - 1
	ifequal HAVE_MORE, .FullCoinCase
	getstring STRING_BUFFER_4, .coinname
	scall .GiveCoins
	givecoins 18
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
.GotCoins:
	writetext CeladonGameCornerFisherText2
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.GiveCoins:
	jumpstd receiveitem
	end

.coinname
	db "COIN@"

.NoCoinCase:
	writetext CeladonGameCornerFisherNoCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

.FullCoinCase:
	writetext CeladonGameCornerFisherFullCoinCaseText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

CeladonGymGuyScript:
	jumptextfaceplayer CeladonGymGuyText

CeladonGameCornerGrampsScript:
	faceplayer
	opentext
	writetext CeladonGameCornerGrampsText
	waitbutton
	closetext
	turnobject CELADONGAMECORNER_GRAMPS, LEFT
	end

CeladonGameCornerPoster1Script:
	jumptext CeladonGameCornerPoster1Text

CeladonGameCornerPoster2Script:
	jumptext CeladonGameCornerPoster2Text

CeladonGameCornerLuckySlotMachineScript:
	random 6
	ifequal 0, CeladonGameCornerSlotMachineScript
	refreshscreen
	setval FALSE
	special SlotMachine
	closetext
	end

CeladonGameCornerSlotMachineScript:
	refreshscreen
	setval TRUE
	special SlotMachine
	closetext
	end

CeladonGameCornerCardFlipScript:
	refreshscreen
	special CardFlip
	closetext
	end

CeladonGameCornerLighterScript:
	jumptext CeladonGameCornerLighterText

CeladonGameCornerSodaCanScript:
	opentext
	writetext CeladonGameCornerSodaCanText
	waitbutton
	special CardFlip
	closetext
	end

CeladonGameCornerUnusedMovementData:
; unreferenced
	step RIGHT
	turn_head LEFT
	step_end

CeladonGameCornerReceptionistText:
	text "Ti do il"
	line "benvenuto!"

	para "Qui vicino puoi"
	line "scambiare i tuoi"

	para "gettoni con"
	line "fantastici premi."
	done

CeladonGameCornerPokefanMText:
	text "Sono tutte slot"
	line "machine"
	cont "modernissime."
	done

CeladonGameCornerTeacherText:
if DEF(_CRYSTAL_AU)
	text "The weather"
	line "outside is very"
	cont "nice."
	done
else
	text "È questa la mia"
	line "slot fortunata."

	para "Ieri mi ha"
	line "ripulito, quindi"

	para "oggi mi dovrà far"
	line "vincere!"
	done
endc

CeladonGameCornerFishingGuruText:
if DEF(_CRYSTAL_AU)
	text "This machine looks"
	line "the same as the"
	cont "others."
	done
else
	text "Con questa slot"
	line "penso di poter"
	cont "vincere…"

	para "Le probabilità"
	line "variano secondo"
	cont "la slot."
	done
endc

CeladonGameCornerFisherText1:
if DEF(_CRYSTAL_AU)
	text "Cosa?"

	para "What? You want to"
	line "play this machine?"

	para "Here, take my"
	line "coins."
	done
else
	text "Sììì!"

	para "Continuano a"
	line "scendere gettoni!"

	para "Come? Vuoi"
	line "giocare?"

	para "Ti darò un po'"
	line "della mia vincita!"
	done
endc

CeladonGameCornerFisherText2:
	text "Ahahahah!"

	para "Fare buone azioni"
	line "per il prossimo mi"

	para "fa sentire proprio"
	line "bene!"
	done

CeladonGameCornerFisherNoCoinCaseText:
	text "Ma ti manca il"
	line "SALVADANAIO."

	para "Come faccio a"
	line "darti i gettoni?"
	done

CeladonGameCornerFisherFullCoinCaseText:
if DEF(_CRYSTAL_AU)
	text "Your COIN CASE is"
	line "full."
	done
else
	text "Ehi, il tuo"
	line "SALVADANAIO è"
	cont "pieno."

	para "Pare che anche"
	line "tu stia vincendo"
	cont "parecchio!"
	done
endc

CeladonGymGuyText:
	text "Ehi, CAMPIONE in"
	line "erba!"

	para "Anche tu giochi"
	line "alle slot?"

	para "Spero di riuscire"
	line "a vincere un"
	cont "#MON!"

	para "Ma dovrei avere"
	line "più gettoni…"
	done

CeladonGameCornerGrampsText:
if DEF(_CRYSTAL_AU)
	text "Is there any"
	line "difference between"
	cont "these lines?"
	done
else
	text "Vediamo… Sembra"
	line "probabile che esca"

	para "una fila di"
	line "PIKACHU, ma…"
	done
endc

CeladonGameCornerPoster1Text:
	text "Ehi!"

	para "Sotto a questo"
	line "poster…"

	para "Non c'è nulla!"
	done

CeladonGameCornerPoster2Text:
	text "Ehi!"

	para "Sotto a questo"
	line "poster…"

	para "Non c'è nulla!"
	done

CeladonGameCornerLighterText:
	text "C'è un accendino."
	done

CeladonGameCornerSodaCanText:
	text "Una lattina…"

	para "Dev'essere di"
	line "qualcuno…"

	para "Ehi, è vuota!"
	done

CeladonGameCorner_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 14, 13, CELADON_CITY, 6
	warp_event 15, 13, CELADON_CITY, 6

	db 0 ; coord events

	db 38 ; bg events
	bg_event  1,  6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1,  7, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1,  8, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1,  9, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1, 10, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  1, 11, BGEVENT_LEFT, CeladonGameCornerCardFlipScript
	bg_event  6,  6, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6,  7, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6,  8, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6,  9, BGEVENT_READ, CeladonGameCornerSodaCanScript
	bg_event  6, 10, BGEVENT_READ, CeladonGameCornerCardFlipScript
	bg_event  6, 11, BGEVENT_RIGHT, CeladonGameCornerCardFlipScript
	bg_event  7,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event  7, 10, BGEVENT_READ, CeladonGameCornerSlotMachineScript
	bg_event  7, 11, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  8, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 13, 11, BGEVENT_LEFT, CeladonGameCornerLuckySlotMachineScript
	bg_event 18,  6, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18,  7, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18,  8, BGEVENT_READ, CeladonGameCornerLighterScript
	bg_event 18,  9, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 10, BGEVENT_READ, CeladonGameCornerLuckySlotMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, CeladonGameCornerLuckySlotMachineScript
	bg_event 15,  0, BGEVENT_READ, CeladonGameCornerPoster1Script
	bg_event  9,  0, BGEVENT_READ, CeladonGameCornerPoster2Script

	db 9 ; object events
	object_event  5,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerClerkScript, -1
	object_event  3,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerReceptionistScript, -1
	object_event 14, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerPokefanMScript, -1
	object_event 17,  7, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerTeacherScript, -1
	object_event 11,  7, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFishingGuruScript, -1
	object_event  8, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event  8, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerFisherScript, -1
	object_event 11,  3, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonGymGuyScript, -1
	object_event  2,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGameCornerGrampsScript, -1
