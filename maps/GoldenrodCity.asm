	object_const_def ; object_event constants
	const GOLDENRODCITY_POKEFAN_M1
	const GOLDENRODCITY_YOUNGSTER1
	const GOLDENRODCITY_COOLTRAINER_F1
	const GOLDENRODCITY_COOLTRAINER_F2
	const GOLDENRODCITY_YOUNGSTER2
	const GOLDENRODCITY_LASS
	const GOLDENRODCITY_GRAMPS
	const GOLDENRODCITY_ROCKETSCOUT
	const GOLDENRODCITY_ROCKET1
	const GOLDENRODCITY_ROCKET2
	const GOLDENRODCITY_ROCKET3
	const GOLDENRODCITY_ROCKET4
	const GOLDENRODCITY_ROCKET5
	const GOLDENRODCITY_ROCKET6
	const GOLDENRODCITY_MOVETUTOR

GoldenrodCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPointAndFloria
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.FlyPointAndFloria:
	setflag ENGINE_FLYPOINT_GOLDENROD
	setflag ENGINE_REACHED_GOLDENROD
	checkevent EVENT_MET_FLORIA
	iftrue .FloriaDone
	clearevent EVENT_FLORIA_AT_SUDOWOODO
.FloriaDone:
	return

.MoveTutor:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .MoveTutorDone
	checkitem COIN_CASE
	iffalse .MoveTutorDisappear
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .MoveTutorAppear
	ifequal SATURDAY, .MoveTutorAppear
.MoveTutorDisappear:
	disappear GOLDENRODCITY_MOVETUTOR
	return

.MoveTutorAppear:
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .MoveTutorDone
	appear GOLDENRODCITY_MOVETUTOR
.MoveTutorDone:
	return

MoveTutorScript:
	faceplayer
	opentext
	writetext GoldenrodCityMoveTutorAskTeachAMoveText
	yesorno
	iffalse .Refused
	special DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorAsk4000CoinsOkayText
	yesorno
	iffalse .Refused2
	checkcoins 4000
	ifequal HAVE_LESS, .NotEnoughMoney
	writetext GoldenrodCityMoveTutorWhichMoveShouldITeachText
	loadmenu .MoveMenuHeader
	verticalmenu
	closewindow
	ifequal MOVETUTOR_FLAMETHROWER, .Flamethrower
	ifequal MOVETUTOR_THUNDERBOLT, .Thunderbolt
	ifequal MOVETUTOR_ICE_BEAM, .IceBeam
	sjump .Incompatible

.Flamethrower:
	setval MOVETUTOR_FLAMETHROWER
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.Thunderbolt:
	setval MOVETUTOR_THUNDERBOLT
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.IceBeam:
	setval MOVETUTOR_ICE_BEAM
	writetext UnknownText_0x1991cf
	special MoveTutor
	ifequal FALSE, .TeachMove
	sjump .Incompatible

.MoveMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "LANCIAFIAMME@"
	db "FULMINE@"
	db "GELORAGGIO@"
	db "CANCEL@"

.Refused:
	writetext GoldenrodCityMoveTutorAwwButTheyreAmazingText
	waitbutton
	closetext
	end

.Refused2:
	writetext GoldenrodCityMoveTutorHmTooBadText
	waitbutton
	closetext
	end

.TeachMove:
	writetext GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText
	buttonsound
	takecoins 4000
	waitsfx
	playsound SFX_TRANSACTION
	special DisplayCoinCaseBalance
	writetext GoldenrodCityMoveTutorFarewellKidText
	waitbutton
	closetext
	readvar VAR_FACING
	ifequal LEFT, .WalkAroundPlayer
	applymovement GOLDENRODCITY_MOVETUTOR, GoldenrodCityMoveTutorEnterGameCornerMovement
	sjump .GoInside

.WalkAroundPlayer:
	applymovement GOLDENRODCITY_MOVETUTOR, GoldenrodCityMoveTutorWalkAroundPlayerThenEnterGameCornerMovement
.GoInside:
	playsound SFX_ENTER_DOOR
	disappear GOLDENRODCITY_MOVETUTOR
	clearevent EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
	setflag ENGINE_DAILY_MOVE_TUTOR
	waitsfx
	end

.Incompatible:
	writetext GoldenrodCityMoveTutorBButText
	waitbutton
	closetext
	end

.NotEnoughMoney:
	writetext GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText
	waitbutton
	closetext
	end

GoldenrodCityPokefanMScript:
	jumptextfaceplayer GoldenrodCityPokefanMText

GoldenrodCityYoungster1Script:
	jumptextfaceplayer GoldenrodCityYoungster1Text

GoldenrodCityCooltrainerF1Script:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext GoldenrodCityCooltrainerF1Text
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext GoldenrodCityCooltrainerF1Text_ClearedRadioTower
	waitbutton
	closetext
	end

GoldenrodCityCooltrainerF2Script:
	faceplayer
	opentext
	checkflag ENGINE_RADIO_CARD
	iftrue .GotRadioCard
	writetext GoldenrodCityCooltrainerF2Text
	waitbutton
	closetext
	end

.GotRadioCard:
	writetext GoldenrodCityCooltrainerF2Text_GotRadioCard
	waitbutton
	closetext
	end

GoldenrodCityYoungster2Script:
	jumptextfaceplayer GoldenrodCityYoungster2Text

GoldenrodCityLassScript:
	jumptextfaceplayer GoldenrodCityLassText

GoldenrodCityGrampsScript:
	jumptextfaceplayer GoldenrodCityGrampsText

GoldenrodCityRocketScoutScript:
	opentext
	writetext GoldenrodCityRocketScoutText1
	buttonsound
	faceplayer
	writetext GoldenrodCityRocketScoutText2
	waitbutton
	closetext
	turnobject GOLDENRODCITY_ROCKETSCOUT, UP
	end

GoldenrodCityRocket1Script:
	jumptextfaceplayer GoldenrodCityRocket1Text

GoldenrodCityRocket2Script:
	jumptextfaceplayer GoldenrodCityRocket2Text

GoldenrodCityRocket3Script:
	jumptextfaceplayer GoldenrodCityRocket3Text

GoldenrodCityRocket4Script:
	jumptextfaceplayer GoldenrodCityRocket4Text

GoldenrodCityRocket5Script:
	jumptextfaceplayer GoldenrodCityRocket5Text

GoldenrodCityRocket6Script:
	jumptextfaceplayer GoldenrodCityRocket6Text

GoldenrodCityStationSign:
	jumptext GoldenrodCityStationSignText

GoldenrodCityRadioTowerSign:
	jumptext GoldenrodCityRadioTowerSignText

GoldenrodDeptStoreSign:
	jumptext GoldenrodDeptStoreSignText

GoldenrodGymSign:
	jumptext GoldenrodGymSignText

GoldenrodCitySign:
	jumptext GoldenrodCitySignText

GoldenrodCityBikeShopSign:
	jumptext GoldenrodCityBikeShopSignText

GoldenrodCityGameCornerSign:
	jumptext GoldenrodCityGameCornerSignText

GoldenrodCityNameRaterSign:
	jumptext GoldenrodCityNameRaterSignText

GoldenrodCityUndergroundSignNorth:
	jumptext GoldenrodCityUndergroundSignNorthText

GoldenrodCityUndergroundSignSouth:
	jumptext GoldenrodCityUndergroundSignSouthText

GoldenrodCityPokecenterSign:
	jumptext GoldenrodCityPokeComCenterSignText

GoldenrodCityFlowerShopSign:
	jumptext GoldenrodCityFlowerShopSignText

GoldenrodCityMoveTutorEnterGameCornerMovement:
	step RIGHT
	step RIGHT
	step UP
	step_end

GoldenrodCityMoveTutorWalkAroundPlayerThenEnterGameCornerMovement:
	step DOWN
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

GoldenrodCityPokefanMText:
	text "La nuova TORRE"
	line "RADIO ha sostitui-"
	cont "to la vecchia, che"
	cont "cadeva a pezzi."
	done

GoldenrodCityYoungster1Text:
	text "So che c'è un"
	line "nuovo NEGOZIO"

	para "BICI, ma non lo"
	line "trovo."
	done

GoldenrodCityCooltrainerF1Text:
	text "Quel tipo si veste"
	line "in nero, come uno"

	para "di TEAM ROCKET!"
	line "Che sciocco!"
	done

GoldenrodCityCooltrainerF1Text_ClearedRadioTower:
	text "Davvero quell'uomo"
	line "in nero era uno di"

	para "TEAM ROCKET? Ma"
	line "è incredibile!"
	done

GoldenrodCityCooltrainerF2Text:
	text "La TORRE RADIO a"
	line "FIORDOROPOLI è"
	cont "un punto di rife-"
	cont "rimento."

	para "Ora stanno facendo"
	line "una campagna"
	cont "promozionale."

	para "Ti modificano il"
	line "#GEAR perché"

	para "si possa usare"
	line "anche come radio."
	done

GoldenrodCityCooltrainerF2Text_GotRadioCard:
	text "Vedo che il tuo "
	line "#GEAR funziona"
	cont "anche da radio!"
	done

GoldenrodCityYoungster2Text:
	text "E-eh-eh-eh…"

	para "Si sono lamentati"
	line "perché ho giocato"

	para "nei sotterranei"
	line "del CENTRO"
	cont "COMMERCIALE."
	done

GoldenrodCityLassText:
	text "Un uomo in quella"
	line "casa valuta i nomi"
	cont "dei tuoi #MON."

	para "Può anche cambiare"
	line "nome ai #MON."
	done

GoldenrodCityGrampsText:
	text "Ehi, ma questa"
	line "città non è"

	para "affatto piccola."
	line "Non mi ci ritrovo."
	done

GoldenrodCityRocketScoutText1:
	text "Dunque questa è la"
	line "TORRE RADIO…"
	done

GoldenrodCityRocketScoutText2:
	text "Che vuoi,"
	line "mosca? Smamma!"
	done

GoldenrodCityRocket1Text:
	text "Stammi alla larga!"
	line "Via!"
	done

GoldenrodCityRocket2Text:
	text "Impadronirsi della"
	line "TORRE RADIO…"

	para "Ehi, tu! Fatti gli"
	line "affari tuoi!"
	done

GoldenrodCityRocket3Text:
	text "I #MON? Sono"
	line "soltanto uno"

	para "strumento per fare"
	line "soldi!"
	done

GoldenrodCityRocket4Text:
	text "Presto il nostro"
	line "sogno si avvererà…"

	para "Abbiamo lavorato"
	line "molto…"
	done

GoldenrodCityRocket5Text:
	text "Ehi, microbo!"
	line "Fuori dai piedi,"
	cont "sparisci!"
	done

GoldenrodCityRocket6Text:
	text "Vieni a provare il"
	line "vero terrore di"
	cont "TEAM ROCKET!"
	done

GoldenrodCityStationSignText:
	text "STAZIONE"
	line "di FIORDOROPOLI"
	done

GoldenrodCityRadioTowerSignText:
	text "TORRE RADIO"
	line "di FIORDOROPOLI"
	done

GoldenrodDeptStoreSignText:
	text "Una completa sele-"
	line "zione di articoli"
	cont "sui #MON!"

	para "CENTRO COMMERCIALE"
	line "di FIORDOROPOLI"
	done

GoldenrodGymSignText:
	text "FIORDOROPOLI"
	line "CAPOPALESTRA:"
	cont "CHIARA"

	para "Carina, troppo"
	line "carina!"
	done

GoldenrodCitySignText:
	text "FIORDOROPOLI"

	para "Il festoso fascino"
	line "dell'opulenza"
	done

GoldenrodCityBikeShopSignText:
	text "Il mondo è una"
	line "pista ciclabile!"
	cont "NEGOZIO BICI"
	done

GoldenrodCityGameCornerSignText:
	text "Il Paese dei"
	line "Balocchi!"

	para "CASINÒ di"
	line "FIORDOROPOLI"
	done

GoldenrodCityNameRaterSignText:
	text "GIUDICE ONOMASTICO"

	para "Fate valutare i"
	line "nomi dei vostri"
	cont "#MON!"
	done

GoldenrodCityUndergroundSignNorthText:
	text "INGRESSO"
	line "SOTTERRANEI"
	done

GoldenrodCityUndergroundSignSouthText:
	text "INGRESSO"
	line "SOTTERRANEI"
	done

GoldenrodCityPokeComCenterSignText:
; unused
	text "For Mobile Tips!"
	line "#COM CENTER"
	done

GoldenrodCityFlowerShopSignText:
	text "Un mondo di fiori"
	line "NEGOZIO FIORISTA"
	done

GoldenrodCityMoveTutorAskTeachAMoveText:
	text "Se vuoi, posso"
	line "insegnare ai tuoi"

	para "#MON mosse"
	line "eccezionali!"

	para "Vuoi una mossa?"
	done

GoldenrodCityMoveTutorAsk4000CoinsOkayText:
	text "Ti costerà 4000"
	line "gettoni. Va bene?"
	done

GoldenrodCityMoveTutorAwwButTheyreAmazingText:
	text "Ma… Guarda che"
	line "sono eccezionali…"
	done

GoldenrodCityMoveTutorWhichMoveShouldITeachText:
	text "Benone! Non te ne"
	line "pentirai!"

	para "Quale mossa"
	line "preferisci?"
	done

GoldenrodCityMoveTutorHmTooBadText:
	text "Male… Penso"
	line "che dovrò andare a"
	cont "prendere dei soldi"
	cont "a casa…"
	done

GoldenrodCityMoveTutorIfYouUnderstandYouveMadeItText:
	text "Se ci sai davvero"
	line "fare con i #MON"

	para "capirai perché"
	line "questa mossa è"
	cont "così eccezionale."
	done

GoldenrodCityMoveTutorFarewellKidText:
	text "Ahahah!"
	line "Addio!"
	done

GoldenrodCityMoveTutorBButText:
	text "M-m-ma…"
	done

GoldenrodCityMoveTutorYouDontHaveEnoughCoinsText:
	text "…Non hai"
	line "abbastanza"
	cont "gettoni…"
	done

UnknownText_0x1991cf:
	text_start
	done

GoldenrodCity_MapEvents:
	db 0, 0 ; filler

	db 15 ; warp events
	warp_event 24,  7, GOLDENROD_GYM, 1
	warp_event 29, 29, GOLDENROD_BIKE_SHOP, 1
	warp_event 31, 21, GOLDENROD_HAPPINESS_RATER, 1
	warp_event  5, 25, BILLS_FAMILYS_HOUSE, 1
	warp_event  9, 13, GOLDENROD_MAGNET_TRAIN_STATION, 2
	warp_event 29,  5, GOLDENROD_FLOWER_SHOP, 1
	warp_event 33,  9, GOLDENROD_PP_SPEECH_HOUSE, 1
	warp_event 15,  7, GOLDENROD_NAME_RATER, 1
	warp_event 24, 27, GOLDENROD_DEPT_STORE_1F, 1
	warp_event 14, 21, GOLDENROD_GAME_CORNER, 1
	warp_event  5, 15, RADIO_TOWER_1F, 1
	warp_event 19,  1, ROUTE_35_GOLDENROD_GATE, 3
	warp_event  9,  5, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 8
	warp_event 11, 29, GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, 5
	warp_event 14, 27, GOLDENROD_POKECENTER_1F, 1

	db 0 ; coord events

	db 12 ; bg events
	bg_event 10, 14, BGEVENT_READ, GoldenrodCityStationSign
	bg_event  4, 17, BGEVENT_READ, GoldenrodCityRadioTowerSign
	bg_event 26, 27, BGEVENT_READ, GoldenrodDeptStoreSign
	bg_event 26,  9, BGEVENT_READ, GoldenrodGymSign
	bg_event 22, 18, BGEVENT_READ, GoldenrodCitySign
	bg_event 28, 30, BGEVENT_READ, GoldenrodCityBikeShopSign
	bg_event 16, 22, BGEVENT_READ, GoldenrodCityGameCornerSign
	bg_event 12,  7, BGEVENT_READ, GoldenrodCityNameRaterSign
	bg_event  8,  6, BGEVENT_READ, GoldenrodCityUndergroundSignNorth
	bg_event 12, 30, BGEVENT_READ, GoldenrodCityUndergroundSignSouth
	bg_event 17, 27, BGEVENT_UP, GoldenrodCityPokecenterSign
	bg_event 30,  6, BGEVENT_READ, GoldenrodCityFlowerShopSign

	db 15 ; object events
	object_event  7, 18, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityPokefanMScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 30, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 12, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF1Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 20, 26, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityCooltrainerF2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 19, 17, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodCityYoungster2Script, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 17, 10, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodCityLassScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event 11, 27, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityGrampsScript, EVENT_GOLDENROD_CITY_CIVILIANS
	object_event  4, 16, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocketScoutScript, EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	object_event 28, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket1Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event  8, 15, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket2Script, EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	object_event 16, 23, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket3Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29, 20, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket4Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 29,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket5Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 31, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodCityRocket6Script, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorScript, EVENT_GOLDENROD_CITY_MOVE_TUTOR
