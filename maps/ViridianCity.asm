	object_const_def ; object_event constants
	const VIRIDIANCITY_GRAMPS1
	const VIRIDIANCITY_GRAMPS2
	const VIRIDIANCITY_FISHER
	const VIRIDIANCITY_YOUNGSTER

ViridianCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_VIRIDIAN
	return

ViridianCityCoffeeGramps:
	faceplayer
	opentext
	writetext ViridianCityCoffeeGrampsQuestionText
	yesorno
	iffalse .no
	writetext ViridianCityCoffeeGrampsBelievedText
	waitbutton
	closetext
	end

.no:
	writetext ViridianCityCoffeeGrampsDoubtedText
	waitbutton
	closetext
	end

ViridianCityGrampsNearGym:
	faceplayer
	opentext
	checkevent EVENT_BLUE_IN_CINNABAR
	iftrue .BlueReturned
	writetext ViridianCityGrampsNearGymText
	waitbutton
	closetext
	end

.BlueReturned:
	writetext ViridianCityGrampsNearGymBlueReturnedText
	waitbutton
	closetext
	end

ViridianCityDreamEaterFisher:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM42_DREAM_EATER
	iftrue .GotDreamEater
	writetext ViridianCityDreamEaterFisherText
	buttonsound
	verbosegiveitem TM_DREAM_EATER
	iffalse .NoRoomForDreamEater
	setevent EVENT_GOT_TM42_DREAM_EATER
.GotDreamEater:
	writetext ViridianCityDreamEaterFisherGotDreamEaterText
	waitbutton
.NoRoomForDreamEater:
	closetext
	end

ViridianCityYoungsterScript:
	jumptextfaceplayer ViridianCityYoungsterText

ViridianCitySign:
	jumptext ViridianCitySignText

ViridianGymSign:
	jumptext ViridianGymSignText

ViridianCityWelcomeSign:
	jumptext ViridianCityWelcomeSignText

TrainerHouseSign:
	jumptext TrainerHouseSignText

ViridianCityPokecenterSign:
	jumpstd pokecentersign

ViridianCityMartSign:
	jumpstd martsign

ViridianCityCoffeeGrampsQuestionText:
	text "Ehi, tu!"
	line "Ho appena bevuto"

	para "un doppio espresso"
	line "e vado a mille!"

	para "Devo assolutamente"
	line "parlare con qual-"
	cont "cuno, cioè con te!"

	para "Ora non si"
	line "direbbe, ma ero"

	para "un buon cacciatore"
	line "di #MON."

	para "Non mi credi?"
	done

ViridianCityCoffeeGrampsBelievedText:
	text "Bene, bene."
	line "Credimi, ero"

	para "davvero fuori dal"
	line "comune."
	done

ViridianCityCoffeeGrampsDoubtedText:
	text "Come? Che razza di"
	line "impertinente!"

	para "Se solo fossi un"
	line "po' più giovane,"

	para "ti mostrerei un"
	line "paio di giochetti!"
	done

ViridianCityGrampsNearGymText:
	text "Fino a poco fa la"
	line "PALESTRA è rimasta"
	cont "senza CAPO."

	para "Poi è diventato"
	line "CAPO un tipo di"

	para "BIANCAVILLA,"
	line "ma non c'è mai."
	done

ViridianCityGrampsNearGymBlueReturnedText:
	text "Vuoi sfidare il"
	line "CAPO?"

	para "Buona fortuna,"
	line "ne avrai bisogno."
	done

ViridianCityDreamEaterFisherText:
	text "Gulp!"

	para "Devo aver preso"
	line "troppo sole."

	para "… Ho sognato"
	line "che un DROWZEE mi"

	para "stava mangiando un"
	line "sogno! Pazzesco!"

	para "Eh?"
	line "E questo cos'è?"

	para "Da dove arriva"
	line "questa MT?"

	para "Da brividi!"
	line "Tieni, puoi averla"
	cont "tu."
	done

ViridianCityDreamEaterFisherGotDreamEaterText:
	text "MT42 contiene"
	line "MANGIASOGNI…"

	para "… Zzzzz…"
	done

ViridianCityYoungsterText:
	text "Dicono che a"
	line "BOSCOSMERALDO ci"

	para "siano molti stru-"
	line "menti per terra."
	done

ViridianCitySignText:
	text "SMERALDOPOLI"

	para "Eterno paradiso"
	line "verde"
	done

ViridianGymSignText:
	text "SMERALDOPOLI"
	line "PALESTRA #MON"
	cont "CAPO: …"

	para "Il resto è"
	line "illeggibile…"
	done

ViridianCityWelcomeSignText:
	text "Benvenuti a"
	line "SMERALDOPOLI,"

	para "la Porta dell'"
	line "ALTOPIANO BLU."
	done

TrainerHouseSignText:
	text "CASA ALLENATORE"

	para "Il Club dove si"
	line "sfidano i migliori"
	cont "allenatori"
	done

ViridianCity_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 32,  7, VIRIDIAN_GYM, 1
	warp_event 21,  9, VIRIDIAN_NICKNAME_SPEECH_HOUSE, 1
	warp_event 23, 15, TRAINER_HOUSE_1F, 1
	warp_event 29, 19, VIRIDIAN_MART, 2
	warp_event 23, 25, VIRIDIAN_POKECENTER_1F, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event 17, 17, BGEVENT_READ, ViridianCitySign
	bg_event 27,  7, BGEVENT_READ, ViridianGymSign
	bg_event 19,  1, BGEVENT_READ, ViridianCityWelcomeSign
	bg_event 21, 15, BGEVENT_READ, TrainerHouseSign
	bg_event 24, 25, BGEVENT_READ, ViridianCityPokecenterSign
	bg_event 30, 19, BGEVENT_READ, ViridianCityMartSign

	db 4 ; object events
	object_event 18,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianCityCoffeeGramps, -1
	object_event 30,  8, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianCityGrampsNearGym, -1
	object_event  6, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ViridianCityDreamEaterFisher, -1
	object_event 17, 21, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ViridianCityYoungsterScript, -1
