	object_const_def ; object_event constants
	const ROUTE17_BIKER1
	const ROUTE17_BIKER2
	const ROUTE17_BIKER3
	const ROUTE17_BIKER4

Route17_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .AlwaysOnBike

.AlwaysOnBike:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	return

TrainerBikerCharles:
	trainer BIKER, CHARLES, EVENT_BEAT_BIKER_CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerRiley:
	trainer BIKER, RILEY, EVENT_BEAT_BIKER_RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRileyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerJoel:
	trainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJoelAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerGlenn:
	trainer BIKER, GLENN, EVENT_BEAT_BIKER_GLENN, BikerGlennSeenText, BikerGlennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerGlennAfterBattleText
	waitbutton
	closetext
	end

Route17HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_17_HIDDEN_MAX_ETHER

Route17HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_17_HIDDEN_MAX_ELIXER

BikerRileySeenText:
	text "Ehi, tu! Sei di"
	line "JOHTO, vero?"
	done

BikerRileyBeatenText:
	text "Ehi, fai male!"
	done

BikerRileyAfterBattleText:
	text "Ora non gasarti,"
	line "canaglia di"
	cont "JOHTO!"
	done

BikerJoelSeenText:
	text "Ehi, hai una BICI-"
	line "CLETTA stupenda!"
	done

BikerJoelBeatenText:
	text "Sì, però non"
	line "sembri un granché…"
	done

BikerJoelAfterBattleText:
	text "Sono debole, dopo"
	line "tutto. Non si può"
	cont "dire che sia"
	cont "eccezionale."

	para "Devo allenarmi"
	line "di più…"
	done

BikerGlennSeenText:
	text "Ehi, vediamo chi è"
	line "più veloce?"
	done

BikerGlennBeatenText:
	text "Ehi! Sembri avere"
	line "un motore!"
	done

BikerGlennAfterBattleText:
	text "I più bravi vanno"
	line "in bici senza mani"
	cont "sulla PISTA"
	cont "CICLABILE."
	done

BikerCharlesSeenText:
	text "Sono un asso"
	line "della strada!"
	done

BikerCharlesBeatenText:
	text "Acc! Che brutto"
	line "incidente!"
	done

BikerCharlesAfterBattleText:
	text "L'imprudenza"
	line "causa incidenti."
	cont "Vai piano!"
	done

Route17_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 82, ROUTE_17_ROUTE_18_GATE, 1
	warp_event 17, 83, ROUTE_17_ROUTE_18_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  9, 54, BGEVENT_ITEM, Route17HiddenMaxEther
	bg_event  8, 77, BGEVENT_ITEM, Route17HiddenMaxElixer

	db 4 ; object events
	object_event  4, 17, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, -1
	object_event  9, 68, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBikerJoel, -1
	object_event  3, 53, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBikerGlenn, -1
	object_event  6, 80, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerCharles, -1
