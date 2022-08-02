	object_const_def ; object_event constants
	const OLIVINELIGHTHOUSE3F_SAILOR
	const OLIVINELIGHTHOUSE3F_GENTLEMAN
	const OLIVINELIGHTHOUSE3F_YOUNGSTER
	const OLIVINELIGHTHOUSE3F_POKE_BALL

OlivineLighthouse3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperTheo:
	trainer BIRD_KEEPER, THEO, EVENT_BEAT_BIRD_KEEPER_THEO, BirdKeeperTheoSeenText, BirdKeeperTheoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperTheoAfterBattleText
	waitbutton
	closetext
	end

TrainerGentlemanPreston:
	trainer GENTLEMAN, PRESTON, EVENT_BEAT_GENTLEMAN_PRESTON, GentlemanPrestonSeenText, GentlemanPrestonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanPrestonAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorTerrell:
	trainer SAILOR, TERRELL, EVENT_BEAT_SAILOR_TERRELL, SailorTerrellSeenText, SailorTerrellBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorTerrellAfterBattleText
	waitbutton
	closetext
	end

OlivineLighthouse3FEther:
	itemball ETHER

BirdKeeperTheoSeenText:
	text "Che ci fai qui?"
	line "Vuoi solo ficcare"

	para "il naso? Allora è"
	line "meglio che sloggi!"
	done

BirdKeeperTheoBeatenText:
	text "Vedo che fai"
	line "sul serio!"
	done

BirdKeeperTheoAfterBattleText:
	text "Come diavolo si fa"
	line "a salire lassù?"

	para "Voglio andare a"
	line "trovare il #MON"

	para "ammalato, ma non"
	line "so arrivarci…"
	done

SailorTerrellSeenText:
	text "I marinai sono"
	line "forti e gentili."
	cont "E tu come sei?"
	done

SailorTerrellBeatenText:
	text "Anche tu sei forte"
	line "e gentile…"
	done

SailorTerrellAfterBattleText:
	text "Ogni volta che"
	line "torno a "
	cont "OLIVINOPOLI visito"
	cont "sempre la"
	cont "PALESTRA."

	para "Il tipo di #MON"
	line "usato dal"
	cont "CAPOPALESTRA è"

	para "cambiato senza che"
	line "me ne accorgessi."
	done

GentlemanPrestonSeenText:
	text "Viaggio per il"
	line "mondo per allenare"
	cont "i miei #MON."
	cont "Vuoi lottare?"
	done

GentlemanPrestonBeatenText:
	text "…Sigh… Devo"
	line "allenarmi ancora!"
	done

GentlemanPrestonAfterBattleText:
	text "JASMINE usava"
	line "sempre #MON"
	cont "roccia come ONIX."
	done

OlivineLighthouse3F_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event 13,  3, OLIVINE_LIGHTHOUSE_4F, 1
	warp_event  5,  3, OLIVINE_LIGHTHOUSE_2F, 2
	warp_event  9,  5, OLIVINE_LIGHTHOUSE_4F, 4
	warp_event 16, 11, OLIVINE_LIGHTHOUSE_2F, 5
	warp_event 17, 11, OLIVINE_LIGHTHOUSE_2F, 6
	warp_event 16,  9, OLIVINE_LIGHTHOUSE_4F, 5
	warp_event 17,  9, OLIVINE_LIGHTHOUSE_4F, 6
	warp_event  8,  3, OLIVINE_LIGHTHOUSE_4F, 7
	warp_event  9,  3, OLIVINE_LIGHTHOUSE_4F, 8

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  9,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSailorTerrell, -1
	object_event 13,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanPreston, -1
	object_event  3,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperTheo, -1
	object_event  8,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, OlivineLighthouse3FEther, EVENT_OLIVINE_LIGHTHOUSE_3F_ETHER
