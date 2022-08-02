	object_const_def ; object_event constants
	const PEWTERCITY_COOLTRAINER_F
	const PEWTERCITY_BUG_CATCHER
	const PEWTERCITY_GRAMPS
	const PEWTERCITY_FRUIT_TREE1
	const PEWTERCITY_FRUIT_TREE2

PewterCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_PEWTER
	return

PewterCityCooltrainerFScript:
	jumptextfaceplayer PewterCityCooltrainerFText

PewterCityBugCatcherScript:
	jumptextfaceplayer PewterCityBugCatcherText

PewterCityGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SILVER_WING
	iftrue .GotSilverWing
	writetext PewterCityGrampsText
	buttonsound
	verbosegiveitem SILVER_WING
	setevent EVENT_GOT_SILVER_WING
	closetext
	end

.GotSilverWing:
	writetext PewterCityGrampsText_GotSilverWing
	waitbutton
	closetext
	end

PewterCitySign:
	jumptext PewterCitySignText

PewterGymSign:
	jumptext PewterGymSignText

PewterMuseumSign:
	jumptext PewterMuseumSignText

PewterCityMtMoonGiftShopSign:
	jumptext PewterCityMtMoonGiftShopSignText

PewterCityWelcomeSign:
	jumptext PewterCityWelcomeSignText

PewterCityPokecenterSign:
	jumpstd pokecentersign

PewterCityMartSign:
	jumpstd martsign

PewterCityFruitTree1:
	fruittree FRUITTREE_PEWTER_CITY_1

PewterCityFruitTree2:
	fruittree FRUITTREE_PEWTER_CITY_2

PewterCityCooltrainerFText:
	text "Hai già visitato"
	line "la PALESTRA di"
	cont "PLUMBEOPOLI?"

	para "Il CAPOPALESTRA"
	line "usa #MON"
	cont "roccia."
	done

PewterCityBugCatcherText:
	text "A MONTELUNA, di"
	line "notte, i CLEFAIRY"
	cont "escono a giocare!"

	para "Ma non tutte le"
	line "notti."
	done

PewterCityGrampsText:
	text "Da dove arrivi?"
	line "Da JOHTO?"

	para "Una volta, da"
	line "giovane, andai"

	para "fino a JOHTO ad"
	line "allenarmi!"

	para "Guardandoti, mi"
	line "sembra di vedere"

	para "me quando avevo la"
	line "tua età!"

	para "A JOHTO trovai uno"
	line "strumento: tieni,"
	cont "ora è tuo!"
	done

PewterCityGrampsText_GotSilverWing:
	text "Conoscere nuovi"
	line "luoghi e nuove"
	cont "persone…"

	para "È questo il bello"
	line "dei viaggi!"
	done

PewterCitySignText:
	text "PLUMBEOPOLI"
	line "Città grigia"
	cont "come il piombo"
	done

PewterGymSignText:
	text "PLUMBEOPOLI"
	line "CAPOPALESTRA:"
	cont "BROCK"

	para "L'Allenatore di "
	line "#MON più forte"
	cont "di una roccia!"
	done

PewterMuseumSignText:
	text "Un avviso:"
	line "c'è scritto…"

	para "Il MUSEO della"
	line "SCIENZA è chiuso"
	cont "per lavori…"
	done

PewterCityMtMoonGiftShopSignText:
	text "Un avviso:"
	line "c'è scritto…"

	para "Aperto NEGOZIO"
	line "REGALI MONTELUNA!"
	done

PewterCityWelcomeSignText:
	text "Ti do il benvenuto"
	line "a PLUMBEOPOLI!"
	done

PewterCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 29, 13, PEWTER_NIDORAN_SPEECH_HOUSE, 1
	warp_event 16, 17, PEWTER_GYM, 1
	warp_event 23, 17, PEWTER_MART, 2
	warp_event 13, 25, PEWTER_POKECENTER_1F, 1
	warp_event  7, 29, PEWTER_SNOOZE_SPEECH_HOUSE, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 25, 23, BGEVENT_READ, PewterCitySign
	bg_event 11, 17, BGEVENT_READ, PewterGymSign
	bg_event 15,  9, BGEVENT_READ, PewterMuseumSign
	bg_event 33, 19, BGEVENT_READ, PewterCityMtMoonGiftShopSign
	bg_event 19, 29, BGEVENT_READ, PewterCityWelcomeSign
	bg_event 14, 25, BGEVENT_READ, PewterCityPokecenterSign
	bg_event 24, 17, BGEVENT_READ, PewterCityMartSign

	db 5 ; object events
	object_event 19, 11, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterCityCooltrainerFScript, -1
	object_event 14, 29, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterCityBugCatcherScript, -1
	object_event 29, 17, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterCityGrampsScript, -1
	object_event 32,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree1, -1
	object_event 30,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, PewterCityFruitTree2, -1
