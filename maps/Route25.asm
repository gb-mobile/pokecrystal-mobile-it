	object_const_def ; object_event constants
	const ROUTE25_MISTY
	const ROUTE25_COOLTRAINER_M1
	const ROUTE25_YOUNGSTER1
	const ROUTE25_LASS1
	const ROUTE25_YOUNGSTER2
	const ROUTE25_LASS2
	const ROUTE25_YOUNGSTER3
	const ROUTE25_LASS3
	const ROUTE25_SUPER_NERD
	const ROUTE25_COOLTRAINER_M2
	const ROUTE25_POKE_BALL

Route25_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE25_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE25_MISTYS_DATE

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

Route25MistyDate1Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, MovementData_0x19efe8
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, MovementData_0x19efed
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ROUTE25_MISTY, MovementData_0x19effa
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, MovementData_0x19f000
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOTHING
	special RestartMapMusic
	end

Route25MistyDate2Script:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	turnobject ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, MovementData_0x19efea
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	turnobject ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, MovementData_0x19eff4
	opentext
	writetext Route25MistyDateText
	waitbutton
	closetext
	turnobject PLAYER, UP
	applymovement ROUTE25_MISTY, MovementData_0x19effd
	turnobject PLAYER, LEFT
	applymovement ROUTE25_MISTY, MovementData_0x19f000
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene SCENE_ROUTE25_NOTHING
	special RestartMapMusic
	end

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassEllen:
	trainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassEllenAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdPatAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermKevin:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_KEVIN
	iftrue .AfterBattle
	checkevent EVENT_CLEARED_NUGGET_BRIDGE
	iftrue .AfterNuggetBridge
	writetext CooltrainermKevinNuggetText
	buttonsound
	verbosegiveitem NUGGET
	iffalse .NoRoomForNugget
	setevent EVENT_CLEARED_NUGGET_BRIDGE
.AfterNuggetBridge:
	writetext CooltrainermKevinSeenText
	waitbutton
	closetext
	winlosstext CooltrainermKevinBeatenText, 0
	loadtrainer COOLTRAINERM, KEVIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_KEVIN
	opentext
.AfterBattle:
	writetext CooltrainermKevinAfterBattleText
	waitbutton
.NoRoomForNugget:
	closetext
	end

BillsHouseSign:
	jumptext BillsHouseSignText

Route25Protein:
	itemball PROTEIN

Route25HiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_25_HIDDEN_POTION

MovementData_0x19efe8:
	big_step DOWN
	step_end

MovementData_0x19efea:
	big_step DOWN
	big_step DOWN
	step_end

MovementData_0x19efed:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x19eff4:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x19effa:
	step DOWN
	step LEFT
	step_end

MovementData_0x19effd:
	step UP
	step LEFT
	step_end

MovementData_0x19f000:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route25MistyDateText:
	text "MISTY: Ah! Perché"
	line "mai vieni ad"

	para "importunarci"
	line "adesso?"

	para "Sai come si chiama"
	line "una persona come"
	cont "te?"

	para "Una peste! Sì, sei"
	line "una vera peste!"

	para "…"

	para "… Eh? Quelle sono"
	line "MEDAGLIE delle"
	cont "PALESTRE DI JOHTO?"

	para "Ne hai otto, devi"
	line "essere in gamba."

	para "Ok, vieni alla"
	line "PALESTRA di"
	cont "CELESTOPOLI."

	para "Sarò felice di"
	line "sfidarti."

	para "Sono MISTY,"
	line "CAPOPALESTRA di"
	cont "CELESTOPOLI."
	done

SchoolboyDudleySeenText:
	text "Se ci batti tutti"
	line "avrai un premio"
	cont "fantastico!"

	para "Pensi di potercela"
	line "fare?"
	done

SchoolboyDudleyBeatenText:
	text "Uauh! Non male!"
	done

SchoolboyDudleyAfterBattleText:
	text "Ho fatto del mio"
	line "meglio! Pazienza!"
	done

LassEllenSeenText:
	text "Sono la seconda,"
	line "ora si fa sul"
	cont "serio!"
	done

LassEllenBeatenText:
	text "Come ho potuto"
	line "perdere?!"
	done

LassEllenAfterBattleText:
	text "Ho fatto del mio"
	line "meglio! Pazienza!"
	done

SchoolboyJoeSeenText:
	text "Ecco il numero 3!"
	line "Non sarà facile!"
	done

SchoolboyJoeBeatenText:
	text "Ehi, mi hai steso!"
	done

SchoolboyJoeAfterBattleText:
	text "Ho fatto del mio"
	line "meglio! Pazienza!"
	done

LassLauraSeenText:
	text "Sono la numero 4!"
	line "Non ce la fai più?"
	done

LassLauraBeatenText:
	text "Ho perso anch'io…"
	done

LassLauraAfterBattleText:
	text "Ho fatto del mio"
	line "meglio! Pazienza!"
	done

CamperLloydSeenText:
	text "Ok! Sono il numero"
	line "5 e ti stenderò!"
	done

CamperLloydBeatenText:
	text "Questo è troppo!"
	done

CamperLloydAfterBattleText:
	text "Ho fatto del mio"
	line "meglio! Pazienza!"
	done

LassShannonSeenText:
	text "Sono l'ultima,"
	line "ma sarà dura,"
	cont "te lo assicuro!"
	done

LassShannonBeatenText:
	text "Mi prendi in giro?"
	done

LassShannonAfterBattleText:
	text "Ho fatto del mio"
	line "meglio! Pazienza!"
	done

SupernerdPatSeenText:
	text "Ah ah ah…"

	para "Non c'entro niente"
	line "con gli altri sei"
	cont "allenatori."

	para "Ho aspettato che"
	line "ti stancassi"

	para "un po' prima di"
	line "affrontarti."
	done

SupernerdPatBeatenText:
	text "Non hai neppure"
	line "un po' di"
	cont "stanchezza?"
	done

SupernerdPatAfterBattleText:
	text "Scusa… Non"
	line "imbroglierò più…"
	done

CooltrainermKevinNuggetText:
	text "Le lotte sono"
	line "state più di"

	para "quelle che"
	line "credevi ma hai"
	cont "vinto ugualmente."

	para "Eccoti un premio,"
	line "come promesso."
	done

CooltrainermKevinSeenText:
	text "Dopo averti visto"
	line "lottare, voglio"

	para "vedere come"
	line "me la cavo."

	para "Che ne dici"
	line "di sfidarmi?"
	done

CooltrainermKevinBeatenText:
	text "Non ricordo una"
	line "lotta così bella!"
	done

CooltrainermKevinAfterBattleText:
	text "È stata una"
	line "lotta stupenda!"

	para "Tu e i tuoi #-"
	line "MON siete davvero"
	cont "eccellenti!"
	done

BillsHouseSignText:
	text "MIRAMARE"
	line "CASA DI BILL"
	done

; unused
	text "CASA DI BILL"
	done

Route25_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 47,  5, BILLS_HOUSE, 1

	db 2 ; coord events
	coord_event 42,  6, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate1Script
	coord_event 42,  7, SCENE_ROUTE25_MISTYS_DATE, Route25MistyDate2Script

	db 2 ; bg events
	bg_event 45,  5, BGEVENT_READ, BillsHouseSign
	bg_event  4,  5, BGEVENT_ITEM, Route25HiddenPotion

	db 11 ; object events
	object_event 46,  9, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 46, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 12,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	object_event 16, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassEllen, -1
	object_event 21,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyJoe, -1
	object_event 22,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 25,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event 28, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassShannon, -1
	object_event 31,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSupernerdPat, -1
	object_event 37,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerCooltrainermKevin, -1
	object_event 32,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route25Protein, EVENT_ROUTE_25_PROTEIN
