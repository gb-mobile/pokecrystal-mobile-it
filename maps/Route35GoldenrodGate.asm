	object_const_def ; object_event constants
	const ROUTE35GOLDENRODGATE_RANDY
	const ROUTE35GOLDENRODGATE_POKEFAN_F
	const ROUTE35GOLDENRODGATE_FISHER

Route35GoldenrodGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RandyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_RANDY
	iftrue .gothpup
	checkevent EVENT_GAVE_KENYA
	iftrue .questcomplete
	checkevent EVENT_GOT_KENYA
	iftrue .alreadyhavekenya
	writetext Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText
	yesorno
	iffalse .refused
	writetext Route35GoldenrodGateRandyThanksKidText
	buttonsound
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .partyfull
	writetext Route35GoldenrodGatePlayerReceivedAMonWithMailText
	playsound SFX_KEY_ITEM
	waitsfx
	givepoke SPEAROW, 10, NO_ITEM, TRUE, GiftSpearowName, GiftSpearowOTName
	givepokemail GiftSpearowMail
	setevent EVENT_GOT_KENYA
.alreadyhavekenya
	writetext Route35GoldenrodGateRandyWeirdTreeBlockingRoadText
	waitbutton
	closetext
	end

.partyfull
	writetext Route35GoldenrodGateRandyCantCarryAnotherMonText
	waitbutton
	closetext
	end

.refused
	writetext Route35GoldenrodGateRandyOhNeverMindThenText
	waitbutton
	closetext
	end

.questcomplete
	writetext Route35GoldenrodGateRandySomethingForYourTroubleText
	buttonsound
	verbosegiveitem HP_UP
	iffalse .bagfull
	setevent EVENT_GOT_HP_UP_FROM_RANDY
.gothpup
	writetext Route35GoldenrodGateRandyMyPalWasSnoozingRightText
	waitbutton
.bagfull
	closetext
	end

GiftSpearowMail:
	db FLOWER_MAIL
	db   "DARK CAVE leads"
	next "to another road@"

GiftSpearowName:
	db "KENYA@"

GiftSpearowOTName:
	db "RANDY@"

	db 0 ; filler

Route35GoldenrodGatePokefanFScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText
	waitbutton
	closetext
	end

.FoughtSudowoodo
	writetext Route35GoldenrodGatePokefanFText_FoughtSudowoodo
	waitbutton
	closetext
	end

Route35GoldenrodGateFisherScript:
	jumptextfaceplayer Route35GoldenrodGateFisherText

Route35GoldenrodGateRandyAskTakeThisMonToMyFriendText:
	text "Ehi, tu! Mi"
	line "faresti un"
	cont "favore?"

	para "Puoi portare"
	line "questo #MON"
	cont "con un MESSAGGIO"
	cont "ad un mio amico?"

	para "È al PERCORSO 31."
	done

Route35GoldenrodGateRandyThanksKidText:
	text "Sì? Perfetto!"
	line "Grazie!"

	para "Il mio amico è uno"
	line "un po' paffuto che"
	cont "sonnecchia sempre."

	para "Lo riconoscerai"
	line "certamente!"
	done

Route35GoldenrodGatePlayerReceivedAMonWithMailText:
	text "<PLAYER> riceve"
	line "#MON con MESS."
	done

Route35GoldenrodGateRandyWeirdTreeBlockingRoadText:
	text "Leggilo pure, ma"
	line "non perderlo!"
	cont "PERCORSO 31!"

	para "C'era uno strano"
	line "albero che bloc-"
	cont "cava la strada."

	para "Chissà se l'hanno"
	line "tolto?"
	done

Route35GoldenrodGateRandyCantCarryAnotherMonText:
	text "Non puoi portare"
	line "altri #MON…"
	done

Route35GoldenrodGateRandyOhNeverMindThenText:
	text "Ah… Allora come"
	line "non detto…"
	done

Route35GoldenrodGateRandySomethingForYourTroubleText:
	text "Grazie per aver"
	line "fatto quella"
	cont "consegna!"

	para "Ho qualcosa da"
	line "darti, tieni!"
	done

Route35GoldenrodGateRandyMyPalWasSnoozingRightText:
	text "Stava sonnec-"
	line "chiando, vero?"
	cont "Te l'avevo detto!"
	done

Route35GoldenrodGatePokefanFText:
	text "Uno strano albero"
	line "blocca la strada."

	para "Si contorce tutto"
	line "se gli si parla."

	para "Pare che se gli si"
	line "dà dell'acqua con"

	para "l'ANNAFFIATOIO"
	line "esca di testa."
	done

Route35GoldenrodGatePokefanFText_FoughtSudowoodo:
	text "Mi piace la Ninna-"
	line "nanna #MON che"
	cont "sento alla radio."
	done

Route35GoldenrodGateFisherText:
	text "Chissà quante"
	line "specie di #MON"

	para "esistono al"
	line "mondo!"

	para "Tre anni fa, il"
	line "PROF.OAK ne aveva"
	cont "calcolato 150."
	done

Route35GoldenrodGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, ROUTE_35, 1
	warp_event  5,  0, ROUTE_35, 2
	warp_event  4,  7, GOLDENROD_CITY, 12
	warp_event  5,  7, GOLDENROD_CITY, 12

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RandyScript, -1
	object_event  6,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGatePokefanFScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35GoldenrodGateFisherScript, -1
