	object_const_def ; object_event constants
	const INDIGOPLATEAUPOKECENTER1F_NURSE
	const INDIGOPLATEAUPOKECENTER1F_CLERK
	const INDIGOPLATEAUPOKECENTER1F_COOLTRAINER_M
	const INDIGOPLATEAUPOKECENTER1F_SILVER
	const INDIGOPLATEAUPOKECENTER1F_GRAMPS
	const INDIGOPLATEAUPOKECENTER1F_ABRA

IndigoPlateauPokecenter1F_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .PrepareElite4

.DummyScene:
	end

.PrepareElite4:
	setmapscene WILLS_ROOM, SCENE_DEFAULT
	setmapscene KOGAS_ROOM, SCENE_DEFAULT
	setmapscene BRUNOS_ROOM, SCENE_DEFAULT
	setmapscene KARENS_ROOM, SCENE_DEFAULT
	setmapscene LANCES_ROOM, SCENE_DEFAULT
	setmapscene HALL_OF_FAME, SCENE_DEFAULT
	clearevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_WILLS_ROOM_EXIT_OPEN
	clearevent EVENT_KOGAS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KOGAS_ROOM_EXIT_OPEN
	clearevent EVENT_BRUNOS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_BRUNOS_ROOM_EXIT_OPEN
	clearevent EVENT_KARENS_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_KARENS_ROOM_EXIT_OPEN
	clearevent EVENT_LANCES_ROOM_ENTRANCE_CLOSED
	clearevent EVENT_LANCES_ROOM_EXIT_OPEN
	clearevent EVENT_BEAT_ELITE_4_WILL
	clearevent EVENT_BEAT_ELITE_4_KOGA
	clearevent EVENT_BEAT_ELITE_4_BRUNO
	clearevent EVENT_BEAT_ELITE_4_KAREN
	clearevent EVENT_BEAT_CHAMPION_LANCE
	setevent EVENT_LANCES_ROOM_OAK_AND_MARY
	return

PlateauRivalBattle1:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse PlateauRivalScriptDone
	checkflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
	iftrue PlateauRivalScriptDone
	readvar VAR_WEEKDAY
	ifequal SUNDAY, PlateauRivalScriptDone
	ifequal TUESDAY, PlateauRivalScriptDone
	ifequal THURSDAY, PlateauRivalScriptDone
	ifequal FRIDAY, PlateauRivalScriptDone
	ifequal SATURDAY, PlateauRivalScriptDone
	moveobject INDIGOPLATEAUPOKECENTER1F_SILVER, 17, 9
	appear INDIGOPLATEAUPOKECENTER1F_SILVER
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement INDIGOPLATEAUPOKECENTER1F_SILVER, PlateauRivalMovement1
	playmusic MUSIC_RIVAL_ENCOUNTER
	turnobject PLAYER, RIGHT
	sjump PlateauRivalBattleCommon

PlateauRivalBattle2:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iffalse PlateauRivalScriptDone
	checkflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
	iftrue PlateauRivalScriptDone
	readvar VAR_WEEKDAY
	ifequal SUNDAY, PlateauRivalScriptDone
	ifequal TUESDAY, PlateauRivalScriptDone
	ifequal THURSDAY, PlateauRivalScriptDone
	ifequal FRIDAY, PlateauRivalScriptDone
	ifequal SATURDAY, PlateauRivalScriptDone
	appear INDIGOPLATEAUPOKECENTER1F_SILVER
	turnobject PLAYER, DOWN
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	pause 15
	applymovement INDIGOPLATEAUPOKECENTER1F_SILVER, PlateauRivalMovement2
	playmusic MUSIC_RIVAL_ENCOUNTER
	turnobject PLAYER, LEFT
PlateauRivalBattleCommon:
	opentext
	writetext PlateauRivalText1
	waitbutton
	closetext
	setevent EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .Totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .Chikorita
	; Cyndaquil
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_SILVER
	loadtrainer RIVAL2, RIVAL2_2_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump PlateauRivalPostBattle

.Totodile:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_SILVER
	loadtrainer RIVAL2, RIVAL2_2_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump PlateauRivalPostBattle

.Chikorita:
	winlosstext PlateauRivalWinText, PlateauRivalLoseText
	setlasttalked INDIGOPLATEAUPOKECENTER1F_SILVER
	loadtrainer RIVAL2, RIVAL2_2_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump PlateauRivalPostBattle

PlateauRivalPostBattle:
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext PlateauRivalText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement INDIGOPLATEAUPOKECENTER1F_SILVER, PlateauRivalLeavesMovement
	disappear INDIGOPLATEAUPOKECENTER1F_SILVER
	setscene SCENE_DEFAULT
	playmapmusic
	setflag ENGINE_INDIGO_PLATEAU_RIVAL_FIGHT
PlateauRivalScriptDone:
	end

IndigoPlateauPokecenter1FNurseScript:
	jumpstd pokecenternurse

IndigoPlateauPokecenter1FClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_INDIGO_PLATEAU
	closetext
	end

IndigoPlateauPokecenter1FCooltrainerMScript:
	jumptextfaceplayer IndigoPlateauPokecenter1FCooltrainerMText

TeleportGuyScript:
	faceplayer
	opentext
	writetext TeleportGuyText1
	yesorno
	iffalse .No
	writetext TeleportGuyYesText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	special FadeOutPalettes
	waitsfx
	warp NEW_BARK_TOWN, 13, 6
	end

.No:
	writetext TeleportGuyNoText
	waitbutton
	closetext
	end

AbraScript:
	opentext
	writetext AbraText
	cry ABRA
	waitbutton
	closetext
	end

PlateauRivalMovement1:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

PlateauRivalMovement2:
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

PlateauRivalLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

IndigoPlateauPokecenter1FCooltrainerMText:
	text "Alla LEGA #MON"
	line "i SUPERQUATTRO ti"

	para "metteranno alla"
	line "prova."

	para "Dovrai batterli"
	line "tutti. Se perdi"

	para "dovrai ripartire"
	line "dal primo."
	done

PlateauRivalText1:
	text "Aspetta."

	para "Vuoi già sfidare"
	line "la LEGA #MON?"

	para "Questo non accadrà"
	line "mai."

	para "I miei #MON"
	line "superallenati"

	para "stanno per"
	line "distruggerti!"

	para "<PLAYER>!"
	line "Ti sfido!"
	done

PlateauRivalWinText:
	text "…"

	para "Ok: ho perso…"
	done

PlateauRivalText2:
	text "… Acc… Sono"
	line "ancora debole…"

	para "Io… Devo pensare"
	line "di più ai miei"
	cont "#MON…"

	para "Vedi di non"
	line "perdere!"
	done

PlateauRivalLoseText:
	text "…"

	para "Ehi…"
	line "Con la mia squadra"

	para "diventerò il"
	line "CAMPIONE!"
	done

TeleportGuyText1:
	text "Ah! Vuoi sfidare"
	line "i SUPERQUATTRO?"

	para "Pensi davvero di"
	line "essere in grado?"

	para "Se vuoi ancora"
	line "allenarti, il mio"

	para "ABRA può esserti"
	line "d'aiuto."

	para "Con TELETRASPORTO"
	line "può mandarti a"
	cont "casa."

	para "Vuoi andare a"
	line "casa ora?"
	done

TeleportGuyYesText:
	text "Ok, ok. Cerca di"
	line "visualizzare casa"
	cont "tua…"
	done

TeleportGuyNoText:
	text "Come vuoi. Buona"
	line "fortuna!"
	done

AbraText:
	text "ABRA: Aabra…"
	done

IndigoPlateauPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 13, ROUTE_23, 1
	warp_event  6, 13, ROUTE_23, 2
	warp_event  0, 13, POKECENTER_2F, 1
	warp_event 14,  3, WILLS_ROOM, 1

	db 2 ; coord events
	coord_event 16,  4, SCENE_DEFAULT, PlateauRivalBattle1
	coord_event 17,  4, SCENE_DEFAULT, PlateauRivalBattle2

	db 0 ; bg events

	db 6 ; object events
	object_event  3,  7, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FNurseScript, -1
	object_event 11,  7, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FClerkScript, -1
	object_event 11, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IndigoPlateauPokecenter1FCooltrainerMScript, -1
	object_event 16,  9, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_INDIGO_PLATEAU_POKECENTER_RIVAL
	object_event  1,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TeleportGuyScript, EVENT_TELEPORT_GUY
	object_event  0,  9, SPRITE_JYNX, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, AbraScript, EVENT_TELEPORT_GUY
