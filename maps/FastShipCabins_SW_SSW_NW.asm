	object_const_def ; object_event constants
	const FASTSHIPCABINS_SW_SSW_NW_FISHER
	const FASTSHIPCABINS_SW_SSW_NW_BUG_CATCHER
	const FASTSHIPCABINS_SW_SSW_NW_BUENA
	const FASTSHIPCABINS_SW_SSW_NW_ROCKER

FastShipCabins_SW_SSW_NW_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFirebreatherLyle:
	trainer FIREBREATHER, LYLE, EVENT_BEAT_FIREBREATHER_LYLE, FirebreatherLyleSeenText, FirebreatherLyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherLyleAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherKen:
	trainer BUG_CATCHER, KEN, EVENT_BEAT_BUG_CATCHER_KEN, BugCatcherKenSeenText, BugCatcherKenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherKenAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyCassie:
	trainer BEAUTY, CASSIE, EVENT_BEAT_BEAUTY_CASSIE, BeautyCassieSeenText, BeautyCassieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyCassieAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristClyde:
	trainer GUITARIST, CLYDE, EVENT_BEAT_GUITARIST_CLYDE, GuitaristClydeSeenText, GuitaristClydeBeatenText, 0, .Script

.Script:
	endifjustbattled
	special Mobile_DummyReturnFalse
	iftrue .mobile
	opentext
	writetext GuitaristClydeAfterBattleText
	waitbutton
	closetext
	end

.mobile
	opentext
	writetext GuitaristClydeAfterBattleMobileText
	waitbutton
	closetext
	end

FastShipBed:
	opentext
	writetext FastShipBedText1
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_HEAL
	pause 60
	special RestartMapMusic
	special FadeInQuickly
	opentext
	writetext FastShipBedText2
	waitbutton
	closetext
	checkevent EVENT_FAST_SHIP_HAS_ARRIVED
	iftrue .AlreadyArrived
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iftrue .CanArrive
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .CanArrive
.AlreadyArrived:
	end

.CanArrive:
	playsound SFX_ELEVATOR_END
	pause 30
	checkevent EVENT_FAST_SHIP_DESTINATION_OLIVINE
	iftrue .ArrivedOlivine
	opentext
	writetext FastShipArrivedVermilionText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

.ArrivedOlivine:
	opentext
	writetext FastShipArrivedOlivineText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	end

FastShipCabinsNorthwestCabinTrashcan:
	jumpstd trashcan

FirebreatherLyleSeenText:
	text "Vado a KANTO per"
	line "partecipare agli"
	cont "spettacoli dei"
	cont "mangiafuoco!"
	done

FirebreatherLyleBeatenText:
	text "Che fiasco… La mia"
	line "fiamma è debole…"
	done

FirebreatherLyleAfterBattleText:
	text "Il fuoco è debole"
	line "sul mare."

	para "Non importa? Dici"
	line "davvero?"
	done

BugCatcherKenSeenText:
	text "Faccio visita alla"
	line "nonna per prendere"
	cont "qualche insetto!"
	done

BugCatcherKenBeatenText:
	text "Ooh, ma allora sei"
	line "forte!"
	done

BugCatcherKenAfterBattleText:
	text "Tra gli alberi di"
	line "JOHTO puoi trovare"
	cont "molti #MON!"
	done

BeautyCassieSeenText:
	text "Voglio dimenticare"
	line "il mio dolore."
	cont "Dai, lottiamo!"
	done

BeautyCassieBeatenText:
	text "Il mio cuore"
	line "piange…"
	done

BeautyCassieAfterBattleText:
	text "Un bel viaggio è"
	line "la miglior cura"
	cont "per un cuore"
	cont "infranto."

	para "Ma un viaggio"
	line "sulla NAVE VELOCE"
	cont "è troppo breve!"
	done

GuitaristClydeSeenText:
	text "Ho un'audizione"
	line "alla STAZIONE"

	para "RADIO di"
	line "FIORDOROPOLI per"
	cont "le mie canzoni."
	done

GuitaristClydeBeatenText:
	text "Ehi!"
	line "Che distorsione!"
	done

GuitaristClydeAfterBattleMobileText:
	text "Pensa che volevo"
	line "andare alla TORRE"
	cont "LOTTA…"

	para "Ma ora penso di"
	line "tornare ad"
	cont "ARANCIOPOLI, per"
	cont "allenarmi…"
	done

GuitaristClydeAfterBattleText:
	text "A proposito della"
	line "STAZIONE RADIO,"

	para "qual è il numero"
	line "fortunato di"
	cont "questa settimana?"
	done

FastShipBedText1:
	text "Che bel letto!"
	line "Fatti una dormita!"
	done

FastShipBedText2:
	text "Ora sei in piena"
	line "forma!"
	done

FastShipArrivedOlivineText:
	text "La NAVE VELOCE M/N"
	line "ACQUA è approdata"
	cont "a OLIVINOPOLI."
	done

FastShipArrivedVermilionText:
	text "La NAVE VELOCE M/N"
	line "ACQUA è approdata"
	cont "ad ARANCIOPOLI."
	done

FastShipCabins_SW_SSW_NW_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  2,  0, FAST_SHIP_1F, 5
	warp_event  2, 19, FAST_SHIP_1F, 6
	warp_event  3, 19, FAST_SHIP_1F, 6
	warp_event  2, 31, FAST_SHIP_1F, 7
	warp_event  3, 31, FAST_SHIP_1F, 7

	db 0 ; coord events

	db 3 ; bg events
	bg_event  7,  1, BGEVENT_READ, FastShipBed
	bg_event  7,  2, BGEVENT_READ, FastShipBed
	bg_event  7,  7, BGEVENT_READ, FastShipCabinsNorthwestCabinTrashcan

	db 4 ; object events
	object_event  1, 15, SPRITE_FISHER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerFirebreatherLyle, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6, 15, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherKen, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 26, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyCassie, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  3, 28, SPRITE_ROCKER, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerGuitaristClyde, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
