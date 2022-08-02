	object_const_def ; object_event constants
	const GOLDENRODBIKESHOP_CLERK

GoldenrodBikeShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

GoldenrodBikeShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BICYCLE
	iftrue .GotBicycle
	writetext GoldenrodBikeShopClerkIntroText
	yesorno
	iffalse .Refused
	writetext GoldenrodBikeShopClerkAgreedText
	buttonsound
	waitsfx
	giveitem BICYCLE
	writetext BorrowedABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_GOT_BICYCLE
.GotBicycle:
	writetext GoldenrodBikeShopClerkFirstRateBikesText
	waitbutton
	closetext
	end

.Refused:
	writetext GoldenrodBikeShopClerkRefusedText
	waitbutton
	closetext
	end

GoldenrodBikeShopJustReleasedCompactBike:
; unused
	jumptext GoldenrodBikeShopJustReleasedCompactBikeText

GoldenrodBikeShopBicycle:
	jumptext GoldenrodBikeShopBicycleText

GoldenrodBikeShopClerkIntroText:
	text "… Sigh… Dopo"
	line "aver spostato il"

	para "negozio qui, non"
	line "vendo più nulla."

	para "Puoi andare un po'"
	line "in BICICLETTA per"
	cont "farmi pubblicità?"
	done

GoldenrodBikeShopClerkAgreedText:
	text "Davvero? Grande!"

	para "Dammi nome e"
	line "numero telefonico,"

	para "ti presterò una"
	line "BICICLETTA!"
	done

BorrowedABicycleText:
	text "<PLAYER> prende una"
	line "BICICLETTA in"
	cont "prestito."
	done

GoldenrodBikeShopClerkFirstRateBikesText:
	text "Le mie BICICLETTE"
	line "sono di prima"

	para "qualità! Puoi"
	line "andarci ovunque!"
	done

GoldenrodBikeShopClerkRefusedText:
	text "…Sigh… Oh, se la"
	line "gente fosse"
	cont "gentile…"
	done

GoldenrodBikeShopJustReleasedCompactBikeText:
	text "Ultimo modello!"

	para "Una BICICLETTA"
	line "richiudibile di"
	cont "prima qualità!"
	done

GoldenrodBikeShopBicycleText:
	text "È una BICICLETTA"
	line "nuova di zecca!"
	done

GoldenrodBikeShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 2
	warp_event  3,  7, GOLDENROD_CITY, 2

	db 0 ; coord events

	db 9 ; bg events
	bg_event  1,  2, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  3, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  5, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  0,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  1,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  6,  6, BGEVENT_READ, GoldenrodBikeShopBicycle
	bg_event  7,  6, BGEVENT_READ, GoldenrodBikeShopBicycle

	db 1 ; object events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodBikeShopClerkScript, -1
