	object_const_def ; object_event constants
	const SPROUTTOWER2F_SAGE1
	const SPROUTTOWER2F_SAGE2
	const SPROUTTOWER2F_POKE_BALL

SproutTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSageNico:
	trainer SAGE, NICO, EVENT_BEAT_SAGE_NICO, SageNicoSeenText, SageNicoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNicoAfterBattleText
	waitbutton
	closetext
	end

TrainerSageEdmond:
	trainer SAGE, EDMOND, EVENT_BEAT_SAGE_EDMOND, SageEdmondSeenText, SageEdmondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageEdmondAfterBattleText
	waitbutton
	closetext
	end

SproutTower2FStatue:
	jumptext SproutTower2FStatueText

SproutTower2FXAccuracy:
	itemball X_ACCURACY

SageNicoSeenText:
	text "Per quanto"
	line "violente siano"
	cont "le lotte, la torre"
	cont "non cadrà mai."
	done

SageNicoBeatenText:
	text "Mi sono impegnato,"
	line "ma sono debole."
	done

SageNicoAfterBattleText:
	text "Le oscillazioni"
	line "del pilastro"

	para "proteggono la"
	line "TORRE persino"
	cont "dai terremoti."
	done

SageEdmondSeenText:
	text "… Oscilla come"
	line "foglie al vento…"
	done

SageEdmondBeatenText:
	text "Oh, sono debole!"
	done

SageEdmondAfterBattleText:
	text "Ho provato a"
	line "copiare gli"

	para "eleganti movimenti"
	line "di BELLSPROUT"
	cont "nella lotta…"

	para "Ma l'allenamento"
	line "non è bastato."
	done

SproutTower2FStatueText:
	text "La statua di un"
	line "#MON…"

	para "Ha un aspetto"
	line "solenne."
	done

SproutTower2F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  6,  4, SPROUT_TOWER_1F, 3
	warp_event  2,  6, SPROUT_TOWER_1F, 4
	warp_event 17,  3, SPROUT_TOWER_1F, 5
	warp_event 10, 14, SPROUT_TOWER_3F, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 12, 15, BGEVENT_READ, SproutTower2FStatue

	db 3 ; object events
	object_event 12,  3, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSageNico, -1
	object_event  9, 14, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSageEdmond, -1
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower2FXAccuracy, EVENT_SPROUT_TOWER2F_X_ACCURACY
