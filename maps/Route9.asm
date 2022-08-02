	object_const_def ; object_event constants
	const ROUTE9_YOUNGSTER1
	const ROUTE9_LASS1
	const ROUTE9_YOUNGSTER2
	const ROUTE9_LASS2
	const ROUTE9_POKEFAN_M1
	const ROUTE9_POKEFAN_M2

Route9_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCamperDean:
	trainer CAMPER, DEAN, EVENT_BEAT_CAMPER_DEAN, CamperDeanSeenText, CamperDeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperDeanAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerHeidi:
	trainer PICNICKER, HEIDI, EVENT_BEAT_PICNICKER_HEIDI, PicnickerHeidiSeenText, PicnickerHeidiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerHeidiAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperSid:
	trainer CAMPER, SID, EVENT_BEAT_CAMPER_SID, CamperSidSeenText, CamperSidBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSidAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerEdna:
	trainer PICNICKER, EDNA, EVENT_BEAT_PICNICKER_EDNA, PicnickerEdnaSeenText, PicnickerEdnaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerEdnaAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerTim:
	trainer HIKER, TIM, EVENT_BEAT_HIKER_TIM, HikerTimSeenText, HikerTimBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerSidney:
	trainer HIKER, SIDNEY, EVENT_BEAT_HIKER_SIDNEY, HikerSidneySeenText, HikerSidneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerSidneyAfterBattleText
	waitbutton
	closetext
	end

Route9Sign:
	jumptext Route9SignText

Route9HiddenEther:
	hiddenitem ETHER, EVENT_ROUTE_9_HIDDEN_ETHER

CamperDeanSeenText:
	text "Voglio esplorare"
	line "il TUNNELROCCIOSO."
	done

CamperDeanBeatenText:
	text "Sei un pericolo!"
	done

CamperDeanAfterBattleText:
	text "I miei #MON"
	line "non potrebbero"

	para "neppure entrare"
	line "nel TUNNEL."

	para "Farò meglio a"
	line "portarli ad un"
	cont "CENTRO #MON."
	done

PicnickerHeidiSeenText:
	text "Hai mai fatto un"
	line "picnic?"

	para "È così"
	line "divertente!"
	done

PicnickerHeidiBeatenText:
	text "Ohhhh!"
	done

PicnickerHeidiAfterBattleText:
	text "Facciamo tanti"
	line "dolci e poi ce"

	para "li scambiamo."
	done

CamperSidSeenText:
	text "Ehi, tu! Non"
	line "lasciare cartacce"
	cont "in giro!"
	done

CamperSidBeatenText:
	text "Volevo solo darti"
	line "un consiglio…"
	done

CamperSidAfterBattleText:
	text "Scusa, non stavi"
	line "lasciando"
	cont "spazzatura in"
	cont "giro."
	done

PicnickerEdnaSeenText:
	text "Non si deve la-"
	line "sciare spazzatura"
	cont "in giro."
	done

PicnickerEdnaBeatenText:
	text "Oooh… Ho perso…"
	done

PicnickerEdnaAfterBattleText:
	text "Preservare energia"
	line "è importante, ma"

	para "l'ambiente lo è"
	line "ancora di più."
	done

HikerTimSeenText:
	text "Arriverà presso"
	line "MONTE ARGENTO,"
	cont "quando arriverà…"

	para "MONTE ARGENTO è"
	line "a JOHTO, no?"
	done

HikerTimBeatenText:
	text "Ero troppo intento"
	line "a cantare…"
	done

HikerTimAfterBattleText:
	text "Nelle lotte serve"
	line "concentrazione."
	done

HikerSidneySeenText:
	text "Ti dirò un"
	line "segreto."

	para "Ma prima,"
	line "lottiamo!"
	done

HikerSidneyBeatenText:
	text "Che male!"
	line "Ho perso…"
	done

HikerSidneyAfterBattleText:
	text "La CENTRALE"
	line "ELETTRICA si trova"
	cont "presso un piccolo"
	cont "fiume."
	done

Route9SignText:
	text "PERCORSO 9"

	para "CELESTOPOLI -"
	line "TUNNELROCCIOSO"
	done

Route9_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 48, 15, ROCK_TUNNEL_1F, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 15,  7, BGEVENT_READ, Route9Sign
	bg_event 41, 15, BGEVENT_ITEM, Route9HiddenEther

	db 6 ; object events
	object_event 23, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperDean, -1
	object_event 39,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerHeidi, -1
	object_event 11,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperSid, -1
	object_event 12, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerEdna, -1
	object_event 28,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerTim, -1
	object_event 36, 15, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerHikerSidney, -1
