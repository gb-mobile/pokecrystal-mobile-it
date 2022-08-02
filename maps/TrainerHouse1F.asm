	object_const_def ; object_event constants
	const TRAINERHOUSE1F_RECEPTIONIST
	const TRAINERHOUSE1F_COOLTRAINER_M
	const TRAINERHOUSE1F_COOLTRAINER_F
	const TRAINERHOUSE1F_YOUNGSTER
	const TRAINERHOUSE1F_GENTLEMAN

TrainerHouse1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerHouse1FReceptionistScript:
	jumptextfaceplayer TrainerHouse1FReceptionistText

TrainerHouse1FCooltrainerMScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerMText

TrainerHouse1FCooltrainerFScript:
	jumptextfaceplayer TrainerHouse1FCooltrainerFText

TrainerHouse1FYoungsterScript:
	jumptextfaceplayer TrainerHouse1FYoungsterText

TrainerHouse1FGentlemanScript:
	jumptextfaceplayer TrainerHouse1FGentlemanText

TrainerHouseSign1:
	jumptext TrainerHouseSign1Text

TrainerHouseSign2:
	jumptext TrainerHouseSign2Text

TrainerHouseIllegibleBook:
	jumptext TrainerHouseIllegibleText

TrainerHouse1FReceptionistText:
	text "La CASA ALLENATORE"
	line "è il luogo più"

	para "alla moda di"
	line "SMERALDOPOLI."

	para "Siamo aperti solo"
	line "agli allenatori."

	para "Qui sotto potrai"
	line "sfidare semplice-"
	cont "mente il meglio"
	cont "del meglio."
	done

TrainerHouse1FCooltrainerMText:
	text "SMERALDOPOLI è la"
	line "città più vicina"
	cont "all'ALTOPIANO BLU."

	para "Di qui passano"
	line "molti allenatori"

	para "diretti all'"
	line "ALTOPIANO BLU. Per"

	para "questo hanno aper-"
	line "to questo posto!"
	done

TrainerHouse1FCooltrainerFText:
	text "Qui sotto ci sono"
	line "sempre molte"
	cont "battaglie."

	para "Mi piacerebbe"
	line "vedere cosa sa"

	para "fare un Allenatore"
	line "di #MON di"
	cont "JOHTO come te!"
	done

TrainerHouse1FYoungsterText:
	text "Non puoi diventare"
	line "CAMPIONE se non"

	para "vai in giro"
	line "sfidando tutti"

	para "gli allenatori che"
	line "trovi."

	para "Il CAMPIONE di"
	line "BIANCAVILLA è"

	para "stato ovunque a"
	line "KANTO."
	done

TrainerHouse1FGentlemanText:
	text "Ohi ohi… Per un"
	line "po', basta con le"
	cont "lotte di #MON!"
	done

TrainerHouseSign1Text:
	text "Gli allenamenti si"
	line "svolgono nella"

	para "SALA ALLENAMENTI,"
	line "qui sotto."

	para "Solo gli"
	line "allenatori esperti"
	cont "vi partecipano."
	done

TrainerHouseSign2Text:
	text "Non ci sono regole"
	line "particolari per le"

	para "lotte"
	line "d'allenamento: è"

	para "come in qualsiasi"
	line "altra lotta."
	done

TrainerHouseIllegibleText:
	text "… Cos'è, un"
	line "piano strategico?"

	para "La scrittura"
	line "somiglia alle orme"

	para "di un ONIX… È"
	line "illeggibile…"
	done

TrainerHouse1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  2, 13, VIRIDIAN_CITY, 3
	warp_event  3, 13, VIRIDIAN_CITY, 3
	warp_event  8,  2, TRAINER_HOUSE_B1F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event  5,  0, BGEVENT_READ, TrainerHouseSign1
	bg_event  7,  0, BGEVENT_READ, TrainerHouseSign2
	bg_event  7, 10, BGEVENT_READ, TrainerHouseIllegibleBook

	db 5 ; object events
	object_event  0, 11, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FReceptionistScript, -1
	object_event  7, 11, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerMScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FCooltrainerFScript, -1
	object_event  4,  8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FYoungsterScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TrainerHouse1FGentlemanScript, -1
