	object_const_def ; object_event constants
	const SAFFRONCITY_LASS1
	const SAFFRONCITY_POKEFAN_M
	const SAFFRONCITY_COOLTRAINER_M
	const SAFFRONCITY_COOLTRAINER_F
	const SAFFRONCITY_FISHER
	const SAFFRONCITY_YOUNGSTER1
	const SAFFRONCITY_YOUNGSTER2
	const SAFFRONCITY_LASS2

SaffronCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_SAFFRON
	return

SaffronCityLass1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityLass1Text
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityLass1Text_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityPokefanMScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityPokefanMText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityPokefanMText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityCooltrainerMScript:
	jumptextfaceplayer SaffronCityCooltrainerMText

SaffronCityCooltrainerFScript:
	jumptextfaceplayer SaffronCityCooltrainerFText

SaffronCityFisherScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext SaffronCityFisherText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext SaffronCityFisherText_ReturnedMachinePart
	waitbutton
	closetext
	end

SaffronCityYoungster1Script:
	jumptextfaceplayer SaffronCityYoungster1Text

SaffronCityYoungster2Script:
	jumptextfaceplayer SaffronCityYoungster2Text

SaffronCityLass2Script:
	jumptextfaceplayer SaffronCityLass2Text

SaffronCitySign:
	jumptext SaffronCitySignText

SaffronGymSign:
	jumptext SaffronGymSignText

FightingDojoSign:
	jumptext FightingDojoSignText

SilphCoSign:
	jumptext SilphCoSignText

MrPsychicsHouseSign:
	jumptext MrPsychicsHouseSignText

SaffronCityMagnetTrainStationSign:
	jumptext SaffronCityMagnetTrainStationSignText

SaffronCityPokecenterSign:
	jumpstd pokecentersign

SaffronCityMartSign:
	jumpstd martsign

SaffronCityLass1Text:
	text "Qui abita una"
	line "ragazzina che sa"

	para "fare le"
	line "imitazioni."

	para "Sa persino mimare"
	line "la gente con cui"

	para "sta parlando,"
	line "confondendola."
	done

SaffronCityLass1Text_ReturnedMachinePart:
	text "Ho visto COPIONA"
	line "molto triste per"

	para "aver perso la sua"
	line "# BAMBOLA"
	cont "preferita,"
	cont "CLEFAIRY."
	done

SaffronCityPokefanMText:
	text "Da dove arrivi, da"
	line "JOHTO?"

	para "Puoi tornare a"
	line "casa in un lampo"
	cont "se funziona il"
	cont "SUPERTRENO."
	done

SaffronCityPokefanMText_ReturnedMachinePart:
	text "Da dove arrivi? Da"
	line "JOHTO?"

	para "Puoi tornare a"
	line "casa in un lampo"
	cont "con il SUPERTRENO."
	done

SaffronCityCooltrainerMText:
	text "Sono andato alla"
	line "PALESTRA per"
	cont "sfidare gli"
	cont "allenatori…"

	para "E sai che è"
	line "successo? Sono"

	para "finito nella"
	line "PALESTRA non più"
	cont "utilizzata."

	para "È davvero"
	line "imbarazzante."
	done

SaffronCityCooltrainerFText:
	text "Questa è SILPH"
	line "SPA, famosa per"
	cont "la merce dedicata"
	cont "ai #MON."

	para "Per questo, in"
	line "passato TEAM"

	para "ROCKET ha tentato"
	line "di impadronirsene."
	done

SaffronCityFisherText:
	text "Gnam… gnam…"

	para "Ho sentito di un"
	line "grosso problema"
	cont "alla CENTRALE"
	cont "ELETTRICA."

	para "Gnam… gnam…"
	done

SaffronCityFisherText_ReturnedMachinePart:
	text "Gnam… gnam…"

	para "Ho sentito di un"
	line "grosso problema"
	cont "alla CENTRALE"
	cont "ELETTRICA."

	para "Gnam… gnam…"
	line "Aaah, sono pieno!"
	done

SaffronCityYoungster1Text:
	text "Mi rende un po'"
	line "ansioso entrare"

	para "in un vicolo per"
	line "la prima volta."
	done

SaffronCityYoungster2Text:
	text "A SMERALDOPOLI"
	line "c'è la CASA"
	cont "ALLENATORE, dove"
	cont "s'incontrano alle-"
	cont "natori provenienti"
	cont "da tutto il mondo."
	done

SaffronCityLass2Text:
	text "Hanno parlato"
	line "della nostra città"
	cont "alla radio."

	para "È bello sentir"
	line "lodare la tua"

	para "città, ma è anche"
	line "un po'"
	cont "imbarazzante."
	done

SaffronCitySignText:
	text "ZAFFERANOPOLI"

	para "Dorata terra"
	line "del commercio"
	done

SaffronGymSignText:
	text "ZAFFERANOPOLI"
	line "CAPOPALESTRA:"
	cont "SABRINA"

	para "Maestra dei"
	line "#MON psico!"
	done

FightingDojoSignText:
	text "Sono tutti"
	line "benvenuti!"
	cont "DOJO KARATE"
	done

SilphCoSignText:
	text "SILPH SPA"
	line "UFFICI"
	done

MrPsychicsHouseSignText:
	text "CASA DEL"
	line "SIG.PSICHE"
	done

SaffronCityMagnetTrainStationSignText:
	text "ZAFFERANOPOLI"
	line "STAZIONE del"
	cont "SUPERTRENO"
	done

SaffronCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event 26,  3, FIGHTING_DOJO, 1
	warp_event 34,  3, SAFFRON_GYM, 1
	warp_event 25, 11, SAFFRON_MART, 2
	warp_event  9, 29, SAFFRON_POKECENTER_1F, 1
	warp_event 27, 29, MR_PSYCHICS_HOUSE, 1
	warp_event  8,  3, SAFFRON_MAGNET_TRAIN_STATION, 2
	warp_event 18, 21, SILPH_CO_1F, 1
	warp_event  9, 11, COPYCATS_HOUSE_1F, 1
	warp_event 18,  3, ROUTE_5_SAFFRON_GATE, 3
	warp_event  0, 24, ROUTE_7_SAFFRON_GATE, 3
	warp_event  0, 25, ROUTE_7_SAFFRON_GATE, 4
	warp_event 16, 33, ROUTE_6_SAFFRON_GATE, 1
	warp_event 17, 33, ROUTE_6_SAFFRON_GATE, 2
	warp_event 39, 22, ROUTE_8_SAFFRON_GATE, 1
	warp_event 39, 23, ROUTE_8_SAFFRON_GATE, 2

	db 0 ; coord events

	db 8 ; bg events
	bg_event 21,  5, BGEVENT_READ, SaffronCitySign
	bg_event 33,  5, BGEVENT_READ, SaffronGymSign
	bg_event 25,  5, BGEVENT_READ, FightingDojoSign
	bg_event 15, 21, BGEVENT_READ, SilphCoSign
	bg_event 25, 29, BGEVENT_READ, MrPsychicsHouseSign
	bg_event 11,  5, BGEVENT_READ, SaffronCityMagnetTrainStationSign
	bg_event 10, 29, BGEVENT_READ, SaffronCityPokecenterSign
	bg_event 26, 11, BGEVENT_READ, SaffronCityMartSign

	db 8 ; object events
	object_event  7, 14, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityLass1Script, -1
	object_event 19, 30, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SaffronCityPokefanMScript, -1
	object_event 32,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerMScript, -1
	object_event 20, 24, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityCooltrainerFScript, -1
	object_event 27, 12, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityFisherScript, -1
	object_event 15, 19, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster1Script, -1
	object_event 35, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronCityYoungster2Script, -1
	object_event 19,  8, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SaffronCityLass2Script, -1
