	object_const_def ; object_event constants
	const UNIONCAVE1F_POKEFAN_M1
	const UNIONCAVE1F_SUPER_NERD
	const UNIONCAVE1F_POKEFAN_M2
	const UNIONCAVE1F_FISHER1
	const UNIONCAVE1F_FISHER2
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_POKE_BALL4

UnionCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerPokemaniacLarry:
	trainer POKEMANIAC, LARRY, EVENT_BEAT_POKEMANIAC_LARRY, PokemaniacLarrySeenText, PokemaniacLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacLarryAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerRussell:
	trainer HIKER, RUSSELL, EVENT_BEAT_HIKER_RUSSELL, HikerRussellSeenText, HikerRussellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerRussellAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerDaniel:
	trainer HIKER, DANIEL, EVENT_BEAT_HIKER_DANIEL, HikerDanielSeenText, HikerDanielBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerDanielAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBill:
	trainer FIREBREATHER, BILL, EVENT_BEAT_FIREBREATHER_BILL, FirebreatherBillSeenText, FirebreatherBillBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBillAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherRay:
	trainer FIREBREATHER, RAY, EVENT_BEAT_FIREBREATHER_RAY, FirebreatherRaySeenText, FirebreatherRayBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherRayAfterBattleText
	waitbutton
	closetext
	end

UnionCave1FGreatBall:
	itemball GREAT_BALL

UnionCave1FXAttack:
	itemball X_ATTACK

UnionCave1FPotion:
	itemball POTION

UnionCave1FAwakening:
	itemball AWAKENING

UnionCave1FUnusedSign:
; unused
	jumptext UnionCave1FUnusedSignText

HikerRussellSeenText:
	text "Vai ad AZALINA,"
	line "vero?"

	para "I miei #MON"
	line "vogliono vedere"
	cont "come sai lottare."
	done

HikerRussellBeatenText:
	text "Oh, oh, oh!"
	done

HikerRussellAfterBattleText:
	text "E va bene, me"
	line "ne vado."

	para "Tornerò quando"
	line "i miei #MON"
	cont "saranno più forti!"
	done

PokemaniacLarrySeenText:
	text "Cammino molto per"
	line "catturare dei"
	cont "#MON."

	para "Sei anche tu in"
	line "cerca di #MON?"

	para "Beh, allora siamo"
	line "rivali!"
	done

PokemaniacLarryBeatenText:
	text "Il mio povero"
	line "#MON…"
	done

PokemaniacLarryAfterBattleText:
	text "Ogni venerdì"
	line "dal fondo della"

	para "grotta provengono"
	line "versi di #MON."
	done

HikerDanielSeenText:
	text "Ehi, ma che"
	line "sorpresa!"

	para "Non pensavo che"
	line "avrei trovato"
	cont "qualcuno qui."
	done

HikerDanielBeatenText:
	text "Mi hai dato una"
	line "bella lezione!"
	done

HikerDanielAfterBattleText:
	text "Mi hanno rifilato"
	line "questa "
	cont "CODASLOWPOKE."

	para "Ora ho i rimorsi"
	line "per il povero"
	cont "#MON."
	done

FirebreatherBillSeenText:
	text "SUPERSUONO di"
	line "ZUBAT continua a"
	cont "confondere i miei"
	cont "#MON."

	para "Questo mi manda"
	line "in bestia!"
	done

FirebreatherBillBeatenText:
	text "Sono fritto!"
	done

FirebreatherBillAfterBattleText:
	text "Verso la fine"
	line "della settimana"

	para "dal fondo della"
	line "grotta provengono"
	cont "strani versi."
	done

FirebreatherRaySeenText:
	text "Una grotta non fa"
	line "paura se è"
	cont "illuminata."

	para "E se sei forte,"
	line "nessun #MON"
	cont "può farti paura."
	done

FirebreatherRayBeatenText:
	text "FLASH!"
	done

FirebreatherRayAfterBattleText:
	text "Il fuoco del mio"
	line "#MON illumina"
	cont "la grotta."
	done

UnionCave1FUnusedSignText:
	text "GROTTA DI MEZZO"
	done

UnionCave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 19, UNION_CAVE_B1F, 3
	warp_event  3, 33, UNION_CAVE_B1F, 4
	warp_event 17, 31, ROUTE_33, 1
	warp_event 17,  3, ROUTE_32, 4

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event  3,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerDaniel, -1
	object_event  4, 21, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacLarry, -1
	object_event 11,  8, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerRussell, -1
	object_event 15, 27, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherRay, -1
	object_event 14, 19, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBill, -1
	object_event 17, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FGreatBall, EVENT_UNION_CAVE_1F_GREAT_BALL
	object_event  4,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FXAttack, EVENT_UNION_CAVE_1F_X_ATTACK
	object_event  4, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FPotion, EVENT_UNION_CAVE_1F_POTION
	object_event 12, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FAwakening, EVENT_UNION_CAVE_1F_AWAKENING
