	object_const_def ; object_event constants
	const ROUTE21_SWIMMER_GIRL
	const ROUTE21_SWIMMER_GUY
	const ROUTE21_FISHER

Route21_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end

SwimmermSethSeenText:
	text "Terra in vista!"
	line "Ancora avanti!"
	done

SwimmermSethBeatenText:
	text "Ops…"
	done

SwimmermSethAfterBattleText:
	text "C'era un tipo"
	line "arrogante al"
	cont "vulcano dell'ISOLA"
	cont "CANNELLA."
	done

SwimmerfNikkiSeenText:
	text "Se vinco dovrai"
	line "aiutarmi con"
	cont "l'abbronzante!"
	done

SwimmerfNikkiBeatenText:
	text "Non vorrei mai"
	line "scottarmi…"
	done

SwimmerfNikkiAfterBattleText:
	text "Non voglio avere"
	line "quelle macchie"
	cont "causate dal sole."
	done

FisherArnoldSeenText:
	text "Che noia pescare!"
	line "Dai, lottiamo!"
	done

FisherArnoldBeatenText:
	text "Ho fallito…"
	done

FisherArnoldAfterBattleText:
	text "Penso che tornerò"
	line "a pescare…"
	done

Route21_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event 11, 16, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  2, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	object_event 14, 22, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
