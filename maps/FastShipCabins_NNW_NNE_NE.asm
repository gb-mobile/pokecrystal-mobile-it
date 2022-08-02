	object_const_def ; object_event constants
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_M
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_F
	const FASTSHIPCABINS_NNW_NNE_NE_SUPER_NERD
	const FASTSHIPCABINS_NNW_NNE_NE_POKEFAN_M
	const FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	const FASTSHIPCABINS_NNW_NNE_NE_GENTLEMAN
	const FASTSHIPCABINS_NNW_NNE_NE_PHARMACIST

FastShipCabins_NNW_NNE_NE_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCooltrainermSean:
	trainer COOLTRAINERM, SEAN, EVENT_BEAT_COOLTRAINERM_SEAN, CooltrainermSeanSeenText, CooltrainermSeanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermSeanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCarol:
	trainer COOLTRAINERF, CAROL, EVENT_BEAT_COOLTRAINERF_CAROL, CooltrainerfCarolSeenText, CooltrainerfCarolBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCarolAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacEthan:
	trainer POKEMANIAC, ETHAN, EVENT_BEAT_POKEMANIAC_ETHAN, PokemaniacEthanSeenText, PokemaniacEthanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacEthanAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerNoland:
	trainer HIKER, NOLAND, EVENT_BEAT_HIKER_NOLAND, HikerNolandSeenText, HikerNolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerNolandAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanEdward:
	trainer GENTLEMAN, EDWARD, EVENT_BEAT_GENTLEMAN_EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanEdwardAfterBattleText
	waitbutton
	closetext
	end

TrainerBurglarCorey:
	trainer BURGLAR, COREY, EVENT_BEAT_BURGLAR_COREY, BurglarCoreySeenText, BurglarCoreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BurglarCoreyAfterBattleText
	waitbutton
	closetext
	end

FastShipLazySailorScript:
	playmusic MUSIC_HIKER_ENCOUNTER
	faceplayer
	opentext
	writetext SailorStanlySeenText
	waitbutton
	closetext
	winlosstext SailorStanlyBeatenText, 0
	loadtrainer SAILOR, STANLY
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	opentext
	writetext SailorStanlyAfterBattleText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_LAZY_SAILOR
	setmapscene FAST_SHIP_B1F, SCENE_FINISHED
	readvar VAR_FACING
	ifequal RIGHT, .Movement2
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement1
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

.Movement2:
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, FastShipLazySailorLeavesMovement2
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

FastShipCabins_NNW_NNE_NETrashcan:
	jumpstd trashcan

FastShipLazySailorLeavesMovement1:
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

FastShipLazySailorLeavesMovement2:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
	step_end

CooltrainermSeanSeenText:
	text "A KANTO metterò"
	line "alla prova le mie"
	cont "capacità."
	done

CooltrainermSeanBeatenText:
	text "Volevo vincere!"
	done

CooltrainermSeanAfterBattleText:
	text "Gli allenatori di"
	line "JOHTO possono"

	para "lottare con i"
	line "CAPOPALESTRA di"
	cont "KANTO."
	done

CooltrainerfCarolSeenText:
	text "Mi alleno per"
	line "diventare"
	cont "CAMPIONE!"
	done

CooltrainerfCarolBeatenText:
	text "Cos'hai che a me"
	line "manca?"
	done

CooltrainerfCarolAfterBattleText:
	text "Prima o poi ti"
	line "batterò!"
	done

PokemaniacEthanSeenText:
	text "Conosci SILVIA?"
	line "È una grande"
	cont "DJ di KANTO."
	done

PokemaniacEthanBeatenText:
	text "Aaaaah!"
	done

PokemaniacEthanAfterBattleText:
	text "SILVIA è carina,"
	line "ma il top è LORI!"

	para "Voglio ascoltare"
	line "un po' le stazioni"
	cont "radio di JOHTO!"
	done

HikerNolandSeenText:
	text "T'annoi?"
	line "Allora lottiamo!"
	done

HikerNolandBeatenText:
	text "È troppo per me!"
	done

HikerNolandAfterBattleText:
	text "Sai se ci sono"
	line "montagne degne"

	para "d'essere scalate"
	line "a KANTO?"
	done

SailorStanlySeenText:
	text "Sì, sono un"
	line "marinaio."

	para "Ma non mi stavo"
	line "nascondendo!"

	para "Questa cabina era"
	line "vuota e così ho"
	cont "fatto un pisolino."

	para "Ma che importa,"
	line "lottiamo!"
	done

SailorStanlyBeatenText:
	text "Scusa, è stata"
	line "tutta colpa mia."
	done

SailorStanlyAfterBattleText:
	text "Sai, i marinai"
	line "fanno molto lavoro"
	cont "fisico. È"
	cont "estenuante!"
	done

GentlemanEdwardSeenText:
	text "Oh, no. Ho perso"
	line "qualcosa di molto"
	cont "importante."
	done

GentlemanEdwardBeatenText:
	text "Non… Non la trovo"
	line "da nessuna parte…"
	done

GentlemanEdwardAfterBattleText:
	text "Mi arrendo. Non"
	line "perdere tempo a"

	para "cercare, non"
	line "importa!"
	done

BurglarCoreySeenText:
	text "Ehi!"
	line "Che fortuna!"
	done

BurglarCoreyBeatenText:
	text "Che sfortuna!"
	line "Ho perso!"
	done

BurglarCoreyAfterBattleText:
	text "Ho trovato una"
	line "bella moneta. Deve"

	para "averla persa"
	line "qualcuno…"
	done

FastShipCabins_NNW_NNE_NE_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2,  0, FAST_SHIP_1F, 2
	warp_event  2, 12, FAST_SHIP_1F, 3
	warp_event  2, 24, FAST_SHIP_1F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  6, 13, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 19, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan
	bg_event  7, 31, BGEVENT_READ, FastShipCabins_NNW_NNE_NETrashcan

	db 7 ; object events
	object_event  4,  3, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  1,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacEthan, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  4, 17, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  4, 26, SPRITE_SAILOR, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipLazySailorScript, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	object_event  7, 30, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2, 30, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
