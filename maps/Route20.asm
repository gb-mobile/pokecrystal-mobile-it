	object_const_def ; object_event constants
	const ROUTE20_SWIMMER_GIRL1
	const ROUTE20_SWIMMER_GIRL2
	const ROUTE20_SWIMMER_GUY

Route20_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .ClearRocks

.ClearRocks:
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	return

TrainerSwimmerfNicole:
	trainer SWIMMERF, NICOLE, EVENT_BEAT_SWIMMERF_NICOLE, SwimmerfNicoleSeenText, SwimmerfNicoleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNicoleAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfLori:
	trainer SWIMMERF, LORI, EVENT_BEAT_SWIMMERF_LORI, SwimmerfLoriSeenText, SwimmerfLoriBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfLoriAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCameron:
	trainer SWIMMERM, CAMERON, EVENT_BEAT_SWIMMERM_CAMERON, SwimmermCameronSeenText, SwimmermCameronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCameronAfterBattleText
	waitbutton
	closetext
	end

CinnabarGymSign:
	jumptext CinnabarGymSignText

SwimmerfNicoleSeenText:
	text "In acqua il mio"
	line "corpo è così"
	cont "leggero!"
	done

SwimmerfNicoleBeatenText:
	text "Oh, no!"
	done

SwimmerfNicoleAfterBattleText:
	text "Nuotare rinforza"
	line "tutto il corpo."

	para "Fa davvero bene."
	done

SwimmerfLoriSeenText:
	text "Che serie impres-"
	line "sionante di"

	para "MEDAGLIE. Dobbiamo"
	line "proprio lottare!"
	done

SwimmerfLoriBeatenText:
	text "No!"
	done

SwimmerfLoriAfterBattleText:
	text "SURF non è più"
	line "l'unica MN da"
	cont "usare in acqua."
	done

SwimmermCameronSeenText:
	text "Non credo che sia"
	line "possibile nuotare"

	para "fino a JOHTO."
	done

SwimmermCameronBeatenText:
	text "Ahiahi!"
	done

SwimmermCameronAfterBattleText:
	text "Oltre che in mare,"
	line "posso nuotare"
	cont "anche nei fiumi e"
	cont "nei laghetti."
	done

CinnabarGymSignText:
	text "Cosa dice il"
	line "cartello?"

	para "CAPOPALESTRA dell'"
	line "ISOLA CANNELLA:"
	cont "BLAINE"
	done

Route20_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 38,  7, SEAFOAM_GYM, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 37, 11, BGEVENT_READ, CinnabarGymSign

	db 3 ; object events
	object_event 52,  8, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNicole, -1
	object_event 45, 13, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfLori, -1
	object_event 12, 13, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCameron, -1
