	object_const_def ; object_event constants
	const UNIONCAVEB1F_POKEFAN_M1
	const UNIONCAVEB1F_POKEFAN_M2
	const UNIONCAVEB1F_SUPER_NERD1
	const UNIONCAVEB1F_SUPER_NERD2
	const UNIONCAVEB1F_POKE_BALL1
	const UNIONCAVEB1F_BOULDER
	const UNIONCAVEB1F_POKE_BALL2

UnionCaveB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokemaniacAndrew:
	trainer POKEMANIAC, ANDREW, EVENT_BEAT_POKEMANIAC_ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacAndrewAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacCalvin:
	trainer POKEMANIAC, CALVIN, EVENT_BEAT_POKEMANIAC_CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacCalvinAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerPhillip:
	trainer HIKER, PHILLIP, EVENT_BEAT_HIKER_PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerPhillipAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerLeonard:
	trainer HIKER, LEONARD, EVENT_BEAT_HIKER_LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerLeonardAfterBattleText
	waitbutton
	closetext
	end

UnionCaveB1FTMSwift:
	itemball TM_SWIFT

UnionCaveB1FXDefend:
	itemball X_DEFEND

UnionCaveB1FBoulder:
	jumpstd strengthboulder

HikerPhillipSeenText:
	text "È un po' che non"
	line "si vede nessuno"
	cont "da queste parti."

	para "Non farti pregare!"
	line "Dai, lottiamo!"
	done

HikerPhillipBeatenText:
	text "Urca…"
	done

HikerPhillipAfterBattleText:
	text "È da un po' che"
	line "non trovo"
	cont "la strada…"

	para "Non ho paura,"
	line "ma ho una fame!"
	done

HikerLeonardSeenText:
	text "Ma guarda un po'!"
	line "Abbiamo visite!"
	done

HikerLeonardBeatenText:
	text "Uaaah! Ma sei un"
	line "tipo aggressivo!"
	done

HikerLeonardAfterBattleText:
	text "Io vivo qui."

	para "Puoi viverci anche"
	line "tu, se vuoi."

	para "C'è così tanto"
	line "spazio!"
	done

PokemaniacAndrewSeenText:
	text "Chi va là?"

	para "Lascia in pace me"
	line "e i miei #MON!"
	done

PokemaniacAndrewBeatenText:
	text "Via…"
	line "Vattene!"
	done

PokemaniacAndrewAfterBattleText:
	text "Qui, solo con i"
	line "miei #MON. Sono"
	cont "al settimo cielo!"
	done

PokemaniacCalvinSeenText:
	text "Ho fatto tutta"
	line "questa strada per"
	cont "una ricerca sui"
	cont "#MON."

	para "Lottiamo, così ti"
	line "mostrerò ciò"
	cont "che ho scoperto!"
	done

PokemaniacCalvinBeatenText:
	text "Sei tu che mi hai"
	line "dato una lezione!"
	done

PokemaniacCalvinAfterBattleText:
	text "Dovrei raccogliere"
	line "e pubblicare le"
	cont "mie scoperte."

	para "Magari diventerò"
	line "famoso come il"
	cont "PROF.ELM."
	done

UnionCaveB1F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  3, RUINS_OF_ALPH_OUTSIDE, 7
	warp_event  3, 11, RUINS_OF_ALPH_OUTSIDE, 8
	warp_event  7, 19, UNION_CAVE_1F, 1
	warp_event  3, 33, UNION_CAVE_1F, 2
	warp_event 17, 31, UNION_CAVE_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 7 ; object events
	object_event  9,  4, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerPhillip, -1
	object_event 16,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerHikerLeonard, -1
	object_event  5, 32, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacAndrew, -1
	object_event 17, 30, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacCalvin, -1
	object_event  2, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB1FTMSwift, EVENT_UNION_CAVE_B1F_TM_SWIFT
	object_event  7, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, UnionCaveB1FBoulder, -1
	object_event 17, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCaveB1FXDefend, EVENT_UNION_CAVE_B1F_X_DEFEND
