	object_const_def ; object_event constants
	const CIANWOODPHARMACY_PHARMACIST

CianwoodPharmacy_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

CianwoodPharmacist:
	faceplayer
	opentext
	checkevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	iftrue .Mart
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iffalse .Mart
	writetext PharmacistGiveSecretpotionText
	buttonsound
	giveitem SECRETPOTION
	writetext ReceivedSecretpotionText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	writetext PharmacistDescribeSecretpotionText
	waitbutton
	closetext
	end

.Mart:
	pokemart MARTTYPE_PHARMACY, MART_CIANWOOD
	closetext
	end

CianwoodPharmacyBookshelf:
	jumpstd difficultbookshelf

PharmacistGiveSecretpotionText:
	text "I tuoi #MON"
	line "sembrano in forma."

	para "Come posso esserti"
	line "utile?"

	para "…"

	para "Come? Il #MON"
	line "del FARO è in"
	cont "pericolo?"

	para "So cosa ci vuole!"

	para "Questo dovrebbe"
	line "fare al caso suo."
	done

ReceivedSecretpotionText:
	text "<PLAYER> riceve"
	line "POZ.SEGRETA."
	done

PharmacistDescribeSecretpotionText:
	text "La POZ.SEGRETA è"
	line "molto forte. La do"

	para "soltanto per le"
	line "emergenze."
	done

CianwoodPharmacy_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 4
	warp_event  3,  7, CIANWOOD_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CianwoodPharmacyBookshelf
	bg_event  1,  1, BGEVENT_READ, CianwoodPharmacyBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPharmacist, -1
