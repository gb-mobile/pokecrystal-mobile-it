	object_const_def ; object_event constants
	const VERMILIONCITY_TEACHER
	const VERMILIONCITY_GRAMPS
	const VERMILIONCITY_MACHOP
	const VERMILIONCITY_SUPER_NERD
	const VERMILIONCITY_BIG_SNORLAX
	const VERMILIONCITY_POKEFAN_M

VermilionCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VERMILION
	return

VermilionCityTeacherScript:
	jumptextfaceplayer VermilionCityTeacherText

VermilionMachopOwner:
	jumptextfaceplayer VermilionMachopOwnerText

VermilionMachop:
	opentext
	writetext VermilionMachopText1
	cry MACHOP
	waitbutton
	closetext
	earthquake 30
	opentext
	writetext VermilionMachopText2
	waitbutton
	closetext
	end

VermilionCitySuperNerdScript:
	jumptextfaceplayer VermilionCitySuperNerdText

VermilionSnorlax:
	opentext
	special SnorlaxAwake
	iftrue .Awake
	writetext UnknownText_0x1aab64
	waitbutton
	closetext
	end

.Awake:
	writetext UnknownText_0x1aab84
	pause 15
	cry SNORLAX
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_FORCEITEM
	loadwildmon SNORLAX, 50
	startbattle
	disappear VERMILIONCITY_BIG_SNORLAX
	setevent EVENT_FOUGHT_SNORLAX
	reloadmapafterbattle
	end

VermilionGymBadgeGuy:
	faceplayer
	opentext
	checkevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
	iftrue .AlreadyGotItem
	readvar VAR_BADGES
	ifequal NUM_BADGES, .AllBadges
	ifgreater 13, .MostBadges
	ifgreater 9, .SomeBadges
	writetext UnknownText_0x1aabc8
	waitbutton
	closetext
	end

.SomeBadges:
	writetext UnknownText_0x1aac2b
	waitbutton
	closetext
	end

.MostBadges:
	writetext UnknownText_0x1aac88
	waitbutton
	closetext
	end

.AllBadges:
	writetext UnknownText_0x1aacf3
	buttonsound
	verbosegiveitem HP_UP
	iffalse .Done
	setevent EVENT_GOT_HP_UP_FROM_VERMILION_GUY
.AlreadyGotItem:
	writetext UnknownText_0x1aad4a
	waitbutton
.Done:
	closetext
	end

VermilionCitySign:
	jumptext VermilionCitySignText

VermilionGymSign:
	jumptext VermilionGymSignText

PokemonFanClubSign:
	jumptext PokemonFanClubSignText

VermilionCityDiglettsCaveSign:
	jumptext VermilionCityDiglettsCaveSignText

VermilionCityPortSign:
	jumptext VermilionCityPortSignText

VermilionCityPokecenterSign:
	jumpstd pokecentersign

VermilionCityMartSign:
	jumpstd martsign

VermilionCityHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_VERMILION_CITY_HIDDEN_FULL_HEAL

VermilionCityTeacherText:
	text "Il PORTO di"
	line "ARANCIOPOLI è la"
	cont "finestra sul mare"
	cont "di KANTO."

	para "Di qui partono"
	line "navi di lusso per"
	cont "tutto il mondo."
	done

VermilionMachopOwnerText:
	text "Il mio #MON"
	line "sta preparando il"
	cont "terreno per la"
	cont "costruzione."

	para "Ma non ho soldi"
	line "per far partire"
	cont "il progetto…"
	done

VermilionMachopText1:
	text "MACHOP: Guoo"
	line "gogogo!"
	done

VermilionMachopText2:
	text "C'è un MACHOP che"
	line "pesta il terreno,"
	cont "borbottando."
	done

VermilionCitySuperNerdText:
	text "A KANTO ci sono"
	line "otto PALESTRE."

	para "Il grande edificio"
	line "ad ARANCIOPOLI è"
	cont "la PALESTRA di"
	cont "qui."
	done

UnknownText_0x1aab64:
	text "SNORLAX sonnecchia"
	line "in pace…"
	done

UnknownText_0x1aab84:
	text "Avvicina il #-"
	line "GEAR allo SNORLAX"
	cont "addormentato…"

	para "…"

	para "Si sta svegliando!"
	done

UnknownText_0x1aabc8:
	text "A KANTO ci sono"
	line "ottimi allenatori."

	para "I CAPOPALESTRA"
	line "sono fortissimi."

	para "Non è davvero"
	line "facile batterli."
	done

UnknownText_0x1aac2b:
	text "Hai già qualche"
	line "MEDAGLIA di"
	cont "KANTO?"

	para "Hai visto come"
	line "sono forti i"
	cont "CAPOPALESTRA?"
	done

UnknownText_0x1aac88:
	text "Presto avrai con-"
	line "quistato tutte le"

	para "MEDAGLIE delle"
	line "PALESTRE di KANTO."

	para "Fammi sapere"
	line "quando le avrai"
	cont "tutte!"
	done

UnknownText_0x1aacf3:
	text "Complimenti!"

	para "Hai tutte le"
	line "MEDAGLIE di KANTO!"

	para "Meriti un premio"
	line "per questo!"
	done

UnknownText_0x1aad4a:
	text "Possedere diversi"
	line "tipi di #MON"

	para "può avvantaggiarti"
	line "nelle lotte."

	para "Certamente anche"
	line "le MEDAGLIE di"
	cont "KANTO ti"
	cont "saranno utili."
	done

VermilionCitySignText:
	text "ARANCIOPOLI"

	para "Porto dagli"
	line "squisiti tramonti"
	done

VermilionGymSignText:
	text "ARANCIOPOLI"
	line "CAPOPALESTRA:"
	cont "LT.SURGE"

	para "L'Americano"
	line "Illuminato"
	done

PokemonFanClubSignText:
	text "#MON FAN CLUB"

	para "Benvenuti tutti i"
	line "fan dei #MON!"
	done

VermilionCityDiglettsCaveSignText:
	text "GROTTA DIGLETT"
	done

VermilionCityPortSignText:
	text "ARANCIOPOLI, PORTO"
	line "INGRESSO"
	done

VermilionCity_MapEvents:
	db 0, 0 ; filler

	db 10 ; warp events
	warp_event  5,  5, VERMILION_FISHING_SPEECH_HOUSE, 1
	warp_event  9,  5, VERMILION_POKECENTER_1F, 1
	warp_event  7, 13, POKEMON_FAN_CLUB, 1
	warp_event 13, 13, VERMILION_MAGNET_TRAIN_SPEECH_HOUSE, 1
	warp_event 21, 13, VERMILION_MART, 2
	warp_event 21, 17, VERMILION_DIGLETTS_CAVE_SPEECH_HOUSE, 1
	warp_event 10, 19, VERMILION_GYM, 1
	warp_event 19, 31, VERMILION_PORT_PASSAGE, 1
	warp_event 20, 31, VERMILION_PORT_PASSAGE, 2
	warp_event 34,  7, DIGLETTS_CAVE, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event 25,  3, BGEVENT_READ, VermilionCitySign
	bg_event  5, 19, BGEVENT_READ, VermilionGymSign
	bg_event  5, 13, BGEVENT_READ, PokemonFanClubSign
	bg_event 33,  9, BGEVENT_READ, VermilionCityDiglettsCaveSign
	bg_event 27, 15, BGEVENT_READ, VermilionCityPortSign
	bg_event 10,  5, BGEVENT_READ, VermilionCityPokecenterSign
	bg_event 22, 13, BGEVENT_READ, VermilionCityMartSign
	bg_event 12, 19, BGEVENT_ITEM, VermilionCityHiddenFullHeal

	db 6 ; object events
	object_event 18,  9, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionCityTeacherScript, -1
	object_event 23,  6, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMachopOwner, -1
	object_event 26,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VermilionMachop, -1
	object_event 14, 16, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionCitySuperNerdScript, -1
	object_event 34,  8, SPRITE_BIG_SNORLAX, SPRITEMOVEDATA_BIGDOLLSYM, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionSnorlax, EVENT_VERMILION_CITY_SNORLAX
	object_event 31, 12, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionGymBadgeGuy, -1
