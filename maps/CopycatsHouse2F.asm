	object_const_def ; object_event constants
	const COPYCATSHOUSE2F_COPYCAT1 ; if player is male
	const COPYCATSHOUSE2F_DODRIO
	const COPYCATSHOUSE2F_FAIRYDOLL ; lost item
	const COPYCATSHOUSE2F_MONSTERDOLL
	const COPYCATSHOUSE2F_BIRDDOLL
	const COPYCATSHOUSE2F_COPYCAT2 ; if player is female

CopycatsHouse2F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Callback

.Callback:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	disappear COPYCATSHOUSE2F_COPYCAT2
	appear COPYCATSHOUSE2F_COPYCAT1
	sjump .Done
.Female:
	disappear COPYCATSHOUSE2F_COPYCAT1
	appear COPYCATSHOUSE2F_COPYCAT2
.Done:
	return

Copycat:
	faceplayer
	checkevent EVENT_GOT_PASS_FROM_COPYCAT
	iftrue .GotPass
	checkevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	iftrue .TryGivePassAgain
	checkitem LOST_ITEM
	iftrue .ReturnLostItem
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_1
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	sjump .Default_Merge_1

.Default_Female_1:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
.Default_Merge_1:
	special LoadUsedSpritesGFX
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .TalkAboutLostItem
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_2a
	writetext CopycatText_Male_1
	sjump .Default_Merge_2a

.Default_Female_2a:
	writetext CopycatText_Female_1
.Default_Merge_2a:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_3a
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	sjump .Default_Merge_3a

.Default_Female_3a:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.Default_Merge_3a:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_QuickMimicking
	waitbutton
	closetext
	end

.TalkAboutLostItem:
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_2b
	writetext CopycatText_Male_2
	sjump .Default_Merge_2b

.Default_Female_2b:
	writetext CopycatText_Female_2
.Default_Merge_2b:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Default_Female_3b
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	sjump .Default_Merge_3b

.Default_Female_3b:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.Default_Merge_3b:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_Worried
	waitbutton
	closetext
	setevent EVENT_MET_COPYCAT_FOUND_OUT_ABOUT_LOST_ITEM
	end

.ReturnLostItem:
	opentext
	writetext CopycatText_GiveDoll
	buttonsound
	takeitem LOST_ITEM
	setevent EVENT_RETURNED_LOST_ITEM_TO_COPYCAT
	clearevent EVENT_COPYCATS_HOUSE_2F_DOLL
	sjump .GivePass

.TryGivePassAgain:
	opentext
.GivePass:
	writetext CopycatText_GivePass
	buttonsound
	verbosegiveitem PASS
	iffalse .Cancel
	setevent EVENT_GOT_PASS_FROM_COPYCAT
	writetext CopycatText_ExplainPass
	waitbutton
	closetext
	end

.GotPass:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_1
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_CHRIS
	sjump .GotPass_Merge_1

.GotPass_Female_1:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_KRIS
.GotPass_Merge_1:
	special LoadUsedSpritesGFX
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_2
	writetext CopycatText_Male_3
	sjump .GotPass_Merge_2

.GotPass_Female_2:
	writetext CopycatText_Female_3
.GotPass_Merge_2:
	waitbutton
	closetext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .GotPass_Female_3
	applymovement COPYCATSHOUSE2F_COPYCAT1, CopycatSpinAroundMovementData
	sjump .GotPass_Merge_3

.GotPass_Female_3:
	applymovement COPYCATSHOUSE2F_COPYCAT2, CopycatSpinAroundMovementData
.GotPass_Merge_3:
	faceplayer
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	special LoadUsedSpritesGFX
	opentext
	writetext CopycatText_ItsAScream
	waitbutton
.Cancel:
	closetext
	end

CopycatsDodrio:
	opentext
	writetext CopycatsDodrioText1
	cry DODRIO
	buttonsound
	writetext CopycatsDodrioText2
	waitbutton
	closetext
	end

CopycatsHouse2FDoll:
	jumptext CopycatsHouse2FDollText

CopycatsHouse2FBookshelf:
	jumpstd picturebookshelf

CopycatSpinAroundMovementData:
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

CopycatText_Male_1:
	text "<PLAYER>: Ti piac-"
	line "ciono i #MON?"

	para "<PLAYER>: No, era"
	line "tanto per parlare."

	para "<PLAYER>: Come?"
	line "Non ti capisco!"
	done

CopycatText_QuickMimicking:
	text "COPIONA: Perché"
	line "dovrei smettere?"

	para "Mimare è la mia"
	line "passione!"
	done

CopycatText_Male_2:
	text "<PLAYER>: Ciao!"
	line "Ho sentito che hai"

	para "perso la tua #"
	line "BAMBOLA preferita."

	para "<PLAYER>: Se te la"
	line "trovo mi dai un"
	cont "ABBONAMENTO del"
	cont "treno?"

	para "<PLAYER>: Te la"
	line "cercherò!"

	para "Pensi di averla"
	line "persa ad"
	cont "ARANCIOPOLI?"
	done

CopycatText_Worried:
	text "COPIONA: Lo so!"

	para "Non devo essere io"
	line "a decidere cosa"
	cont "devi fare!"

	para "Ma sono preoccupa-"
	line "ta, capisci?! E se"
	cont "la trova qualcuno?"
	done

CopycatText_GiveDoll:
	text "COPIONA: Ehi, ma"
	line "è la mia # BAM-"
	cont "BOLA di CLEFAIRY!"

	para "La riconosco"
	line "da questo strappo"

	para "all'attaccatura"
	line "della gamba!"
	done

CopycatText_GivePass:
	text "Bene! Ti darò"
	line "l'ABBONAMENTO del"
	cont "SUPERTRENO,"
	cont "come promesso."
	done

CopycatText_ExplainPass:
	text "COPIONA: Questo è"
	line "l'ABBONAMENTO del"
	cont "SUPERTRENO."

	para "Me l'ha regalato"
	line "la società ferro-"
	cont "viaria quando"
	cont "ha abbattuto"
	cont "casa mia per farci"
	cont "la STAZIONE."
	done

CopycatText_Male_3:
	text "<PLAYER>: Ciao!"
	line "Grazie per"
	cont "L'ABBONAMENTO!"

	para "<PLAYER>: Come?"

	para "<PLAYER>: È così"
	line "divertente mimare"
	cont "tutti i miei"
	cont "movimenti?"
	done

CopycatText_ItsAScream:
	text "COPIONA: Puoi"
	line "scommetterci! È"
	cont "grandioso!"
	done

CopycatText_Female_1:
	text "<PLAYER>: Ciao,"
	line "ti piacciono i"
	cont "#MON?"

	para "<PLAYER>: No, non"
	line "io: ho chiesto a"
	cont "te!"

	para "<PLAYER>: Come,"
	line "scusa? Che"
	cont "confusione!"
	done

CopycatText_Female_2:
	text "<PLAYER>: Ciao."
	line "Davvero hai perso"
	cont "la tua #"
	cont "BAMBOLA?"

	para "<PLAYER>: Davvero"
	line "mi darai un"

	para "ABBONAMENTO per il"
	line "treno se te la"
	cont "ritrovo?"

	para "<PLAYER>: Certo,"
	line "la cercherò io!"

	para "Credi di averla"
	line "persa ad"
	cont "ARANCIOPOLI?"
	done

CopycatText_Female_3:
	text "<PLAYER>: Grazie"
	line "per l'ABBONAMENTO!"

	para "<PLAYER>: …Scusa?"

	para "<PLAYER>: Ti piace"
	line "davvero imitarmi"
	cont "in questo modo?"
	done

CopycatsDodrioText1:
	text "DODRIO: Gii giii!"
	done

CopycatsDodrioText2:
	text "SPECCHIO DELLE MIE"
	line "BRAME, CHI È LA"

	para "PIÙ BELLA DEL"
	line "REAME?"
	done

CopycatsHouse2FDollText:
	text "È un #MON"
	line "raro! Ah, no!"

	para "È una bambola…"
	done

CopycatsHouse2F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  3,  0, COPYCATS_HOUSE_1F, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CopycatsHouse2FBookshelf
	bg_event  1,  1, BGEVENT_READ, CopycatsHouse2FBookshelf

	db 6 ; object events
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Copycat, EVENT_COPYCAT_1
	object_event  6,  4, SPRITE_MOLTRES, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CopycatsDodrio, -1
	object_event  6,  1, SPRITE_FAIRY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, EVENT_COPYCATS_HOUSE_2F_DOLL
	object_event  2,  1, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  7,  1, SPRITE_BIRD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopycatsHouse2FDoll, -1
	object_event  4,  3, SPRITE_COPYCAT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Copycat, EVENT_COPYCAT_2
