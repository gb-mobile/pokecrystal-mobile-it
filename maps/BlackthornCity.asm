	object_const_def ; object_event constants
	const BLACKTHORNCITY_SUPER_NERD1
	const BLACKTHORNCITY_SUPER_NERD2
	const BLACKTHORNCITY_GRAMPS1
	const BLACKTHORNCITY_GRAMPS2
	const BLACKTHORNCITY_BLACK_BELT
	const BLACKTHORNCITY_COOLTRAINER_F1
	const BLACKTHORNCITY_YOUNGSTER1
	const BLACKTHORNCITY_SANTOS
	const BLACKTHORNCITY_COOLTRAINER_F2

BlackthornCity_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint
	callback MAPCALLBACK_OBJECTS, .Santos

.FlyPoint:
	setflag ENGINE_FLYPOINT_BLACKTHORN
	return

.Santos:
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .SantosAppears
	disappear BLACKTHORNCITY_SANTOS
	return

.SantosAppears:
	appear BLACKTHORNCITY_SANTOS
	return

BlackthornSuperNerdScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BeatClair
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext Text_ClairIsOut
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext Text_ClairIsIn
	waitbutton
	closetext
	end

.BeatClair:
	writetext Text_ClairIsBeaten
	waitbutton
	closetext
	end

BlackthornGramps1Script:
	jumptextfaceplayer BlackthornGrampsRefusesEntryText

BlackthornGramps2Script:
	jumptextfaceplayer BlackthornGrampsGrantsEntryText

BlackthornBlackBeltScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRadioTower
	writetext BlackBeltText_WeirdRadio
	waitbutton
	closetext
	end

.ClearedRadioTower:
	writetext BlackBeltText_VoicesInMyHead
	waitbutton
	closetext
	end

BlackthornCooltrainerF1Script:
	jumptextfaceplayer BlackthornCooltrainerF1Text

BlackthornYoungsterScript:
	jumptextfaceplayer BlackthornYoungsterText

BlackthornCooltrainerF2Script:
	jumptextfaceplayer BlackthornCooltrainerF2Text

SantosScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue .Saturday
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	buttonsound
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos:
	writetext SantosGivesGiftText
	buttonsound
	verbosegiveitem SPELL_TAG
	iffalse .Done
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	waitbutton
	closetext
	end

.Saturday:
	writetext SantosSaturdayText
	waitbutton
.Done:
	closetext
	end

.NotSaturday:
	writetext SantosNotSaturdayText
	waitbutton
	closetext
	end

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
	jumptext BlackthornGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityTrainerTips:
	jumptext BlackthornCityTrainerTipsText

BlackthornCityPokecenterSign:
	jumpstd pokecentersign

BlackthornCityMartSign:
	jumpstd martsign

Text_ClairIsOut:
	text "Mi dispiace."

	para "SANDRA, il nostro"
	line "CAPOPALESTRA, è"

	para "andata nella TANA"
	line "DEL DRAGO, dietro"
	cont "alla PALESTRA."

	para "Non ho idea di"
	line "quando tornerà."
	done

Text_ClairIsIn:
	text "SANDRA, il nostro"
	line "CAPOPALESTRA, ti"
	cont "aspetta."

	para "Ma non è certo"
	line "possibile vincere"

	para "per un allenatore"
	line "improvvisato."
	done

Text_ClairIsBeaten:
	text "Hai battuto"
	line "SANDRA?"

	para "È straordinario!"

	para "Non credo che"
	line "abbia mai perso,"

	para "se non contro"
	line "LANCE."
	done

BlackthornGrampsRefusesEntryText:
	text "Solo i migliori"
	line "allenatori possono"

	para "entrare qui."
	line "Mi spiace, ma devi"
	cont "andartene."
	done

BlackthornGrampsGrantsEntryText:
	text "Se va bene per"
	line "SANDRA, anche suo"
	cont "nonno, il MAESTRO,"
	cont "ti farà entrare."
	cont "Accomodati."
	done

BlackBeltText_WeirdRadio:
	text "La mia radio sarà"
	line "guasta? Da un po'"
	cont "ricevo solo questo"
	cont "strano segnale."
	done

BlackBeltText_VoicesInMyHead:
	text "Come? Sento delle"
	line "voci! Ah, sto"

	para "ascoltando la mia"
	line "radio!"
	done

BlackthornCooltrainerF1Text:
	text "Vuoi far scordare"
	line "delle mosse ai"
	cont "tuoi #MON?"
	done

BlackthornYoungsterText:
	text "Tutti i campioni"
	line "del tipo drago"
	cont "provengono da"
	cont "EBANOPOLI."
	done

MeetSantosText:
	text "SABATINO: …"

	para "Oggi è sabato…"

	para "E io sono SABATINO"
	line "del sabato…"
	done

SantosGivesGiftText:
	text "Prendi questo…"
	done

SantosGaveGiftText:
	text "SABATINO: …"

	para "SPETTROTARGA…"

	para "Potenzia le mosse"
	line "di tipo spettro…"

	para "Ti terrorizzerà,"
	line "vedrai…"
	done

SantosSaturdayText:
	text "SABATINO: …"

	para "Ci vediamo qualche"
	line "altro sabato…"

	para "Anche se non potrò"
	line "regalarti altro…"
	done

SantosNotSaturdayText:
	text "SABATINO: Oggi non"
	line "è mica sabato…"
	done

BlackthornCooltrainerF2Text:
	text "Uauh, vieni dalla"
	line "VIA GELATA?"

	para "Devi essere grande"
	line "con i #MON!"
	done

BlackthornCitySignText:
	text "EBANOPOLI"

	para "Placida località"
	line "di montagna"
	done

BlackthornGymSignText:
	text "EBANOPOLI"
	line "CAPOPALESTRA:"
	cont "SANDRA"

	para "Con i #MON"
	line "drago è divina"
	done

MoveDeletersHouseSignText:
	text "CASA DELL'"
	line "ELIMINAMOSSE"
	done

DragonDensSignText:
	text "Per la TANA DEL"
	line "DRAGO"
	done

BlackthornCityTrainerTipsText:
	text "CONSIGLI UTILI"

	para "Un #MON che"
	line "tiene una BACCA"

	para "MIRACOLO potrà"
	line "risolvere ogni"
	cont "problema di stato."
	done

BlackthornCity_MapEvents:
	db 0, 0 ; filler

	db 8 ; warp events
	warp_event 18, 11, BLACKTHORN_GYM_1F, 1
	warp_event 13, 21, BLACKTHORN_DRAGON_SPEECH_HOUSE, 1
	warp_event 29, 23, BLACKTHORN_EMYS_HOUSE, 1
	warp_event 15, 29, BLACKTHORN_MART, 2
	warp_event 21, 29, BLACKTHORN_POKECENTER_1F, 1
	warp_event  9, 31, MOVE_DELETERS_HOUSE, 1
	warp_event 36,  9, ICE_PATH_1F, 2
	warp_event 20,  1, DRAGONS_DEN_1F, 1

	db 0 ; coord events

	db 7 ; bg events
	bg_event 34, 24, BGEVENT_READ, BlackthornCitySign
	bg_event 17, 13, BGEVENT_READ, BlackthornGymSign
	bg_event  7, 31, BGEVENT_READ, MoveDeletersHouseSign
	bg_event 21,  3, BGEVENT_READ, DragonDensSign
	bg_event  5, 25, BGEVENT_READ, BlackthornCityTrainerTips
	bg_event 16, 29, BGEVENT_READ, BlackthornCityMartSign
	bg_event 22, 29, BGEVENT_READ, BlackthornCityPokecenterSign

	db 9 ; object events
	object_event 18, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	object_event 19, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornSuperNerdScript, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	object_event 20,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps1Script, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	object_event 21,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornGramps2Script, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	object_event 24, 31, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornBlackBeltScript, -1
	object_event  9, 25, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF1Script, -1
	object_event 13, 15, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornYoungsterScript, -1
	object_event 22, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	object_event 35, 19, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornCooltrainerF2Script, -1
