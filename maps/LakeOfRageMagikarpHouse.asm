	object_const_def ; object_event constants
	const LAKEOFRAGEMAGIKARPHOUSE_FISHING_GURU

LakeOfRageMagikarpHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MagikarpLengthRaterScript:
	faceplayer
	opentext
	checkevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	iftrue .GetReward
	checkevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	iftrue .AskedForMagikarp
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	checkevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	iftrue .ExplainedHistory
	writetext MagikarpLengthRaterText_LakeOfRageHistory
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_EXPLAINED_WEIRD_MAGIKARP
	end

.ExplainedHistory:
	writetext MagikarpLengthRaterText_MenInBlack
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext MagikarpLengthRaterText_WorldsLargestMagikarp
	waitbutton
	closetext
	setevent EVENT_LAKE_OF_RAGE_ASKED_FOR_MAGIKARP
	end

.AskedForMagikarp:
	setval MAGIKARP
	special FindPartyMonThatSpecies
	iffalse .ClearedRocketHideout
	writetext MagikarpLengthRaterText_YouHaveAMagikarp
	waitbutton
	special CheckMagikarpLength
	ifequal MAGIKARPLENGTH_NOT_MAGIKARP, .NotMagikarp
	ifequal MAGIKARPLENGTH_REFUSED, .Refused
	ifequal MAGIKARPLENGTH_TOO_SHORT, .TooShort
	; MAGIKARPLENGTH_BEAT_RECORD
	sjump .GetReward

.GetReward:
	writetext MagikarpLengthRaterText_Memento
	buttonsound
	verbosegiveitem ELIXER
	iffalse .NoRoom
	writetext MagikarpLengthRaterText_Bonus
	waitbutton
	closetext
	clearevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.NoRoom:
	closetext
	setevent EVENT_LAKE_OF_RAGE_ELIXIR_ON_STANDBY
	end

.TooShort:
	writetext MagikarpLengthRaterText_TooShort
	waitbutton
	closetext
	end

.NotMagikarp:
	writetext MagikarpLengthRaterText_NotMagikarp
	waitbutton
	closetext
	end

.Refused:
	writetext MagikarpLengthRaterText_Refused
	waitbutton
	closetext
	end

LakeOfRageMagikarpHouseUnusedRecordSign:
; unused
	jumptext LakeOfRageMagikarpHouseUnusedRecordText

MagikarpHouseBookshelf:
	jumpstd difficultbookshelf

MagikarpLengthRaterText_LakeOfRageHistory:
	text "Il LAGO D'IRA ?? un"
	line "cratere creato da"

	para "alcuni GYARADOS"
	line "furiosi."

	para "Poi il cratere"
	line "si riemp?? d'acqua"

	para "e si form?? il"
	line "LAGO."

	para "?? una storia che"
	line "si tramanda di"

	para "generazione in"
	line "generazione."

	para "Un tempo vi si"
	line "potevano pescare"

	para "i MAGIKARP, ma"
	line "adesso???"

	para "Non capisco cosa"
	line "stia accadendo."
	done

MagikarpLengthRaterText_MenInBlack:
	text "Il LAGO non ?? pi??"
	line "lo stesso da"

	para "quando ci sono"
	line "quei tizi vestiti"
	cont "di nero."
	done

MagikarpLengthRaterText_WorldsLargestMagikarp:
	text "Il LAGO D'IRA ??"
	line "tornato alla nor-"
	cont "malit??. I MAGIKARP"
	cont "sono tornati."

	para "Ora posso realiz-"
	line "zare il mio sogno"
	cont "di trovare il MA-"
	cont "GIKARP pi?? grande"
	cont "del mondo."

	para "Hai un AMO? Se ce"
	line "l'hai, mi daresti"
	cont "una mano?"
	done

MagikarpLengthRaterText_YouHaveAMagikarp:
	text "Ah, vedo che hai"
	line "un MAGIKARP!"

	para "Vediamo un po'"
	line "quant'?? grosso!"
	done

MagikarpLengthRaterText_Memento:
	text "Uauh, ma questo"
	line "?? enorme!"

	para "Mi inchino alla"
	line "tua classe!"

	para "Prendi questo come"
	line "ricordo!"
	done

MagikarpLengthRaterText_Bonus:
	text "?? importante"
	line "battere il record."

	para "?? una specie di"
	line "bonus, capisci?"
	done

MagikarpLengthRaterText_TooShort:
	text "Uauh! Ma questo ??"
	line "enorme!"

	para "???Mi piacerebbe"
	line "poter dire cos??,"

	para "ma ne ho visti di"
	line "pi?? grossi."
	done

MagikarpLengthRaterText_NotMagikarp:
	text "Come? Ma non ?? un"
	line "MAGIKARP!"
	done

MagikarpLengthRaterText_Refused:
	text "Oh??? Non riesci"
	line "a prenderne uno"

	para "abbastanza grande?"
	line "Sar?? per un'altra"
	cont "volta."
	done

LakeOfRageMagikarpHouseUnusedRecordText:
	text "RECORD ATTUALE"

	para "@"
	text_ram wStringBuffer3
	text " cm preso da"
	line "@"
	text_ram wStringBuffer4
	text "."

	text_end ; unused

LakeOfRageMagikarpHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAKE_OF_RAGE, 2
	warp_event  3,  7, LAKE_OF_RAGE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, MagikarpHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MagikarpHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MagikarpLengthRaterScript, -1
