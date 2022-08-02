	object_const_def ; object_event constants
	const CIANWOODCITY_STANDING_YOUNGSTER
	const CIANWOODCITY_POKEFAN_M
	const CIANWOODCITY_LASS
	const CIANWOODCITY_ROCK1
	const CIANWOODCITY_ROCK2
	const CIANWOODCITY_ROCK3
	const CIANWOODCITY_ROCK4
	const CIANWOODCITY_ROCK5
	const CIANWOODCITY_ROCK6
	const CIANWOODCITY_POKEFAN_F
	const CIANWOODCITY_EUSINE
	const CIANWOODCITY_SUICUNE

CianwoodCity_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CIANWOODCITY_NOTHING
	scene_script .DummyScene1 ; SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPointAndSuicune

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPointAndSuicune:
	setflag ENGINE_FLYPOINT_CIANWOOD
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	checkevent EVENT_FOUGHT_EUSINE
	iffalse .Done
	disappear CIANWOODCITY_EUSINE
.Done:
	return

CianwoodCitySuicuneAndEusine:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneApproachMovement
	turnobject PLAYER, DOWN
	pause 15
	playsound SFX_WARP_FROM
	applymovement CIANWOODCITY_SUICUNE, CianwoodCitySuicuneDepartMovement
	disappear CIANWOODCITY_SUICUNE
	pause 10
	setscene SCENE_CIANWOODCITY_NOTHING
	clearevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setmapscene ROUTE_42, SCENE_ROUTE42_SUICUNE
	checkevent EVENT_FOUGHT_EUSINE
	iftrue .Done
	setevent EVENT_FOUGHT_EUSINE
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	appear CIANWOODCITY_EUSINE
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineApproachMovement
	opentext
	writetext EusineSuicuneText
	waitbutton
	closetext
	winlosstext EusineBeatenText, 0
	setlasttalked CIANWOODCITY_EUSINE
	loadtrainer MYSTICALMAN, EUSINE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_MYSTICALMAN_ENCOUNTER
	opentext
	writetext EusineAfterText
	waitbutton
	closetext
	applymovement CIANWOODCITY_EUSINE, CianwoodCityEusineDepartMovement
	disappear CIANWOODCITY_EUSINE
	pause 20
	special FadeOutMusic
	playmapmusic
	pause 10
.Done:
	end

CianwoodCityChucksWife:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM02_FLY
	iftrue .GotFly
	writetext ChucksWifeEasierToFlyText
	buttonsound
	checkevent EVENT_BEAT_CHUCK
	iftrue .BeatChuck
	writetext ChucksWifeBeatChuckText
	waitbutton
	closetext
	end

.BeatChuck:
	writetext ChucksWifeGiveHMText
	buttonsound
	verbosegiveitem HM_FLY
	iffalse .Done
	setevent EVENT_GOT_HM02_FLY
	writetext ChucksWifeFlySpeechText
	buttonsound
.GotFly:
	writetext ChucksWifeChubbyText
	waitbutton
.Done:
	closetext
	end

CianwoodCityYoungster:
	jumptextfaceplayer CianwoodCityYoungsterText

CianwoodCityPokefanM:
	jumptextfaceplayer CianwoodCityPokefanMText

CianwoodCityLass:
	jumptextfaceplayer CianwoodCityLassText

CianwoodCityUnusedScript:
; unreferenced
	jumptextfaceplayer CianwoodCityUnusedText

CianwoodCitySign:
	jumptext CianwoodCitySignText

CianwoodGymSign:
	jumptext CianwoodGymSignText

CianwoodPharmacySign:
	jumptext CianwoodPharmacySignText

CianwoodPhotoStudioSign:
	jumptext CianwoodPhotoStudioSignText

CianwoodPokeSeerSign:
	jumptext CianwoodPokeSeerSignText

CianwoodPokecenterSign:
	jumpstd pokecentersign

CianwoodCityRock:
	jumpstd smashrock

CianwoodCityHiddenRevive:
	hiddenitem REVIVE, EVENT_CIANWOOD_CITY_HIDDEN_REVIVE

CianwoodCityHiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_CIANWOOD_CITY_HIDDEN_MAX_ETHER

CianwoodCitySuicuneApproachMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCitySuicuneDepartMovement:
	set_sliding
	fast_jump_step RIGHT
	fast_jump_step UP
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

CianwoodCityEusineApproachMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

CianwoodCityEusineDepartMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

ChucksWifeEasierToFlyText:
	text "Hai attraversato"
	line "il mare per venire"

	para "fin qui? Sarà"
	line "stata dura!"

	para "Sarebbe più facile"
	line "se i tuoi #MON"

	para "sapessero alzarsi"
	line "in VOLO…"
	done

ChucksWifeBeatChuckText:
	text "Ma non puoi usare"
	line "VOLO senza la"
	cont "MEDAGLIA di questa"
	cont "PALESTRA."

	para "Se batti il"
	line "CAPOPALESTRA,"
	cont "vieni a trovarmi."

	para "Ho un bel regalo"
	line "per te."
	done

ChucksWifeGiveHMText:
	text "È la MEDAGLIA di"
	line "FIORLISOPOLI!"

	para "Prendi anche"
	line "questa MN."
	done

ChucksWifeFlySpeechText:
	text "Insegna VOLO ai"
	line "tuoi #MON!"

	para "Così potrai andare"
	line "in VOLO in ogni"

	para "luogo che hai già"
	line "visitato."
	done

ChucksWifeChubbyText:
	text "Hai battuto mio"
	line "marito: ora dovrà"
	cont "impegnarsi!"

	para "Meglio così: stava"
	line "diventando un po'"
	cont "pigro!"
	done

CianwoodCityYoungsterText:
	text "Con VOLO puoi"
	line "tornare a"

	para "OLIVINOPOLI in un"
	line "secondo."
	done

CianwoodCityPokefanMText:
	text "I massi a nord"
	line "della città si"
	cont "possono"
	cont "frantumare."

	para "Potrebbero nascon-"
	line "dere qualcosa."

	para "Con SPACCAROCCIA i"
	line "tuoi #MON"
	cont "possono romperli."
	done

CianwoodCityLassText:
	text "Il CAPOPALESTRA"
	line "FURIO s'allena"

	para "con i suoi"
	line "#MON lotta."
	done

CianwoodCityUnusedText:
; unused
	text "Ci sono diverse"
	line "isole tra qui e"
	cont "OLIVINOPOLI."

	para "Pare che vi dimori"
	line "un mitico mostro"
	cont "marino."
	done

EusineSuicuneText:
	text "EUGENIUS: Ciao,"
	line "<PLAYER>."

	para "Ma quello non era"
	line "SUICUNE?"

	para "L'ho visto solo di"
	line "sfuggita, ma mi è"

	para "parso che fosse"
	line "proprio un"
	cont "SUICUNE!"

	para "SUICUNE è bello e"
	line "maestoso."

	para "Corre per i"
	line "sentieri e le"

	para "città ad una"
	line "velocità"
	cont "spaventosa."

	para "È meraviglioso…"

	para "Voglio vederlo più"
	line "da vicino…"

	para "Ho deciso!"

	para "Ti sfiderò, così"
	line "potrò guadagnarmi"
	cont "il rispetto di"
	cont "SUICUNE!"

	para "Dai, <PLAYER>!"
	line "Lottiamo!"
	done

EusineBeatenText:
	text "Devo ammetterlo,"
	line "hai vinto!"
	done

EusineAfterText:
	text "Sei strabiliante,"
	line "<PLAYER>!"

	para "Capisco perché i"
	line "#MON ti sono"
	cont "così amici!"

	para "Ora capisco."

	para "Continuerò a"
	line "cercare SUICUNE."

	para "Ma sono certo che"
	line "ci rivedremo."

	para "A presto!"
	done

CianwoodCitySignText:
	text "FIORLISOPOLI"

	para "Un porto tra le"
	line "acque impetuose."
	done

CianwoodGymSignText:
	text "FIORLISOPOLI"

	para "CAPOPALESTRA:"
	line "FURIO"

	para "I pugni roboanti"
	line "parlano per lui"
	done

CianwoodPharmacySignText:
	text "FARMACIA di"
	line "FIORLISOPOLI"

	para "Una tradizione di"
	line "cinque secoli"

	para "Risolviamo ogni"
	line "esigenza medica"
	done

CianwoodPhotoStudioSignText:
	text "STUDIO FOTOGRAFICO"
	line "FIORLISOPOLI"

	para "Una foto è il"
	line "ricordo più bello"
	done

CianwoodPokeSeerSignText:
	text "Per la CASA DELLA"
	line "#VEGGENTE"
	done

CianwoodCity_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 17, 41, MANIAS_HOUSE, 1
	warp_event  8, 43, CIANWOOD_GYM, 1
	warp_event 23, 43, CIANWOOD_POKECENTER_1F, 1
	warp_event 15, 47, CIANWOOD_PHARMACY, 1
	warp_event  9, 31, CIANWOOD_PHOTO_STUDIO, 1
	warp_event 15, 37, CIANWOOD_LUGIA_SPEECH_HOUSE, 1
	warp_event  5, 17, POKE_SEERS_HOUSE, 1

	db 1 ; coord events
	coord_event 11, 16, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE, CianwoodCitySuicuneAndEusine

	db 8 ; bg events
	bg_event 20, 34, BGEVENT_READ, CianwoodCitySign
	bg_event  7, 45, BGEVENT_READ, CianwoodGymSign
	bg_event 24, 43, BGEVENT_READ, CianwoodPokecenterSign
	bg_event 19, 47, BGEVENT_READ, CianwoodPharmacySign
	bg_event  8, 32, BGEVENT_READ, CianwoodPhotoStudioSign
	bg_event  8, 24, BGEVENT_READ, CianwoodPokeSeerSign
	bg_event  4, 19, BGEVENT_ITEM, CianwoodCityHiddenRevive
	bg_event  5, 29, BGEVENT_ITEM, CianwoodCityHiddenMaxEther

	db 12 ; object events
	object_event 21, 37, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CianwoodCityYoungster, -1
	object_event 17, 33, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityPokefanM, -1
	object_event 14, 42, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityLass, -1
	object_event  8, 16, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  9, 17, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 25, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  5, 29, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 27, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event  4, 19, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityRock, -1
	object_event 10, 46, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodCityChucksWife, -1
	object_event 11, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CIANWOOD_CITY_EUSINE
	object_event 10, 14, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
