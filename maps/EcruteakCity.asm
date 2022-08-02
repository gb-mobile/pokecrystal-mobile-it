	object_const_def ; object_event constants
	const ECRUTEAKCITY_GRAMPS1
	const ECRUTEAKCITY_GRAMPS2
	const ECRUTEAKCITY_LASS1
	const ECRUTEAKCITY_LASS2
	const ECRUTEAKCITY_FISHER
	const ECRUTEAKCITY_YOUNGSTER
	const ECRUTEAKCITY_GRAMPS3

EcruteakCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_ECRUTEAK
	return

EcruteakCityGramps1Script:
	jumptextfaceplayer EcruteakCityGramps1Text

EcruteakCityGramps2Script:
	jumptextfaceplayer EcruteakCityGramps2Text

EcruteakCityGramps3Script:
	jumptextfaceplayer EcruteakCityGramps3Text

EcruteakCityLass1Script:
	jumptextfaceplayer EcruteakCityLass1Text

EcruteakCityLass2Script:
	faceplayer
	opentext
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .ReleasedBeasts
	writetext EcruteakCityLass2Text
	waitbutton
	closetext
	end

.ReleasedBeasts:
	writetext EcruteakCityLass2Text_ReleasedBeasts
	waitbutton
	closetext
	end

EcruteakCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iftrue .JasmineReturned
	writetext EcruteakCityFisherText
	waitbutton
	closetext
	end

.JasmineReturned:
	writetext EcruteakCityFisherText_JasmineReturned
	waitbutton
	closetext
	end

EcruteakCityYoungsterScript:
	jumptextfaceplayer EcruteakCityYoungsterText

EcruteakCitySign:
	jumptext EcruteakCitySignText

TinTowerSign:
	jumptext TinTowerSignText

EcruteakGymSign:
	jumptext EcruteakGymSignText

EcruteakDanceTheaterSign:
	jumptext EcruteakDanceTheaterSignText

BurnedTowerSign:
	jumptext BurnedTowerSignText

EcruteakCityPokecenterSign:
	jumpstd pokecentersign

EcruteakCityMartSign:
	jumpstd martsign

EcruteakCityHiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ECRUTEAK_CITY_HIDDEN_HYPER_POTION

UnusedMissingDaughterText:
; unused
	text "Oh, no. Oh, no…"

	para "Ho perso mia"
	line "figlia."

	para "No… Non può"
	line "essere andata alla"
	cont "TORRE BRUCIATA!"

	para "Le ho detto di"
	line "stare lontana da"

	para "lì… Pare che vi"
	line "sia scomparsa"
	cont "della gente…"

	para "E adesso, che"
	line "faccio?"
	done

EcruteakCityGramps1Text:
	text "Ad AMARANTOPOLI c'"
	line "erano due torri:"

	para "una ad est ed una"
	line "ad ovest."
	done

EcruteakCityGramps2Text:
	text "Ehi, tu! Hai"
	line "imparato a danzare"

	para "come le KIMONO"
	line "GIRL?"

	para "Pare che se"
	line "le visiti nel"

	para "loro TEATRO DI"
	line "DANZA, un signore"
	cont "ti dia un regalo."
	done

EcruteakCityLass1Text:
	text "Vado ad allenarmi"
	line "al TEATRO DI"

	para "DANZA: ci vai"
	line "anche tu?"
	done

EcruteakCityLass2Text:
	text "La torre che era"
	line "qui prima…"

	para "Mia nonna mi ha"
	line "detto che era"
	cont "molto più alta."
	done

EcruteakCityLass2Text_ReleasedBeasts:
	text "Tre grandi #MON"
	line "correvano in tre"
	cont "direzioni diverse!"
	cont "Che #MON erano?"
	done

EcruteakCityFisherText:
	text "Hai sentito cosa"
	line "è successo al FARO"
	cont "di OLIVINOPOLI?"

	para "Il #MON che"
	line "illumina il FARO"

	para "è ammalato. Pare"
	line "che siano tutti"
	cont "preoccupati."
	done

EcruteakCityFisherText_JasmineReturned:
	text "Il #MON del"
	line "FARO di OLIVINOPO-"
	cont "LI è guarito!"

	para "Ora le barche"
	line "possono di nuovo"
	cont "uscire in mare la"
	cont "notte."
	done

EcruteakCityYoungsterText:
	text "Pare che dei #-"
	line "MON furiosi"

	para "s'aggirino per il"
	line "LAGO D'IRA."
	done

EcruteakCityGramps3Text:
	text "Nel lontano"
	line "passato…"

	para "La torre bruciò e"
	line "vi morirono tre"

	para "#MON senza"
	line "nome."

	para "Ma un #MON dai"
	line "colori dell'arco-"
	cont "baleno discese dal"
	cont "cielo per farli"
	cont "risuscitare…"

	para "È una leggenda che"
	line "i CAPOPALESTRA di"

	para "AMARANTOPOLI si"
	line "tramandano da"
	cont "secoli."

	para "Chi sono io?"

	para "Un tempo ero un"
	line "allenatore."
	done

EcruteakCitySignText:
	text "AMARANTOPOLI"
	line "La città dove"

	para "s'incontrano pas-"
	line "sato e presente."
	done

TinTowerSignText:
	text "TORRE DI LATTA"

	para "Pare che vi si"
	line "posi un #MON"
	cont "leggendario."
	done

EcruteakGymSignText:
	text "AMARANTOPOLI"
	line "CAPOPALESTRA:"
	cont "ANGELO"

	para "Il magico veggente"
	done

EcruteakDanceTheaterSignText:
	text "TEATRO DI DANZA di"
	line "AMARANTOPOLI"
	done

BurnedTowerSignText:
	text "TORRE BRUCIATA"

	para "Fu distrutta da un"
	line "misterioso"
	cont "incendio."

	para "È pericolante:"
	line "non entrare!"
	done

EcruteakCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event 35, 26, ROUTE_42_ECRUTEAK_GATE, 1
	warp_event 35, 27, ROUTE_42_ECRUTEAK_GATE, 2
	warp_event 18, 11, ECRUTEAK_TIN_TOWER_ENTRANCE, 1
	warp_event 20,  2, WISE_TRIOS_ROOM, 1
	warp_event 20,  3, WISE_TRIOS_ROOM, 2
	warp_event 23, 27, ECRUTEAK_POKECENTER_1F, 1
	warp_event  5, 21, ECRUTEAK_LUGIA_SPEECH_HOUSE, 1
	warp_event 23, 21, DANCE_THEATRE, 1
	warp_event 29, 21, ECRUTEAK_MART, 2
	warp_event  6, 27, ECRUTEAK_GYM, 1
	warp_event 13, 27, ECRUTEAK_ITEMFINDER_HOUSE, 1
	warp_event 37,  7, TIN_TOWER_1F, 1
	warp_event  5,  5, BURNED_TOWER_1F, 1
	warp_event  0, 18, ROUTE_38_ECRUTEAK_GATE, 3
	warp_event  0, 19, ROUTE_38_ECRUTEAK_GATE, 4

	db 0 ; coord events

	db 8 ; bg events
	bg_event 15, 21, BGEVENT_READ, EcruteakCitySign
	bg_event 38, 10, BGEVENT_READ, TinTowerSign
	bg_event  8, 28, BGEVENT_READ, EcruteakGymSign
	bg_event 21, 21, BGEVENT_READ, EcruteakDanceTheaterSign
	bg_event  2, 10, BGEVENT_READ, BurnedTowerSign
	bg_event 24, 27, BGEVENT_READ, EcruteakCityPokecenterSign
	bg_event 30, 21, BGEVENT_READ, EcruteakCityMartSign
	bg_event 23, 14, BGEVENT_ITEM, EcruteakCityHiddenHyperPotion

	db 7 ; object events
	object_event 18, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps1Script, -1
	object_event 20, 21, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps2Script, -1
	object_event 21, 29, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass1Script, -1
	object_event  3,  9, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakCityLass2Script, -1
	object_event  9, 22, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityFisherScript, -1
	object_event 10, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakCityYoungsterScript, -1
	object_event  3,  7, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakCityGramps3Script, EVENT_ECRUTEAK_CITY_GRAMPS
