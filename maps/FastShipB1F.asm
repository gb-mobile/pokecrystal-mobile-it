	object_const_def ; object_event constants
	const FASTSHIPB1F_SAILOR1
	const FASTSHIPB1F_SAILOR2
	const FASTSHIPB1F_SAILOR3
	const FASTSHIPB1F_LASS
	const FASTSHIPB1F_SUPER_NERD
	const FASTSHIPB1F_SAILOR4
	const FASTSHIPB1F_FISHER
	const FASTSHIPB1F_BLACK_BELT
	const FASTSHIPB1F_SAILOR5
	const FASTSHIPB1F_TEACHER
	const FASTSHIPB1F_YOUNGSTER1
	const FASTSHIPB1F_YOUNGSTER2

FastShipB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

FastShipB1FSailorBlocksLeft:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR2, FashShipB1FSailorBlocksLeftMovement
	moveobject FASTSHIPB1F_SAILOR1, 30, 6
	appear FASTSHIPB1F_SAILOR1
	pause 5
	disappear FASTSHIPB1F_SAILOR2
	end

FastShipB1FSailorBlocksRight:
	checkevent EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	iftrue FastShipB1FAlreadyBlocked
	applymovement FASTSHIPB1F_SAILOR1, FashShipB1FSailorBlocksRightMovement
	moveobject FASTSHIPB1F_SAILOR2, 31, 6
	appear FASTSHIPB1F_SAILOR2
	pause 5
	disappear FASTSHIPB1F_SAILOR1
	end

FastShipB1FAlreadyBlocked:
	end

FastShipB1FSailorScript:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .FirstTime
	checkevent EVENT_FAST_SHIP_LAZY_SAILOR
	iftrue .LazySailor
	checkevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	iftrue .AlreadyInformed
	writetext FastShipB1FOnDutySailorText
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_INFORMED_ABOUT_LAZY_SAILOR
	clearevent EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	end

.AlreadyInformed:
	writetext FastShipB1FOnDutySailorRefusedText
	waitbutton
	closetext
	end

.LazySailor:
	writetext FastShipB1FOnDutySailorThanksText
	checkevent EVENT_FAST_SHIP_FOUND_GIRL
	iffalse .NotFoundGirl
	waitbutton
	closetext
	end

.NotFoundGirl:
	buttonsound
	writetext FastShipB1FOnDutySailorSawLittleGirlText
	waitbutton
	closetext
	end

.FirstTime:
	writetext FastShipB1FOnDutySailorDirectionsText
	waitbutton
	closetext
	end

TrainerSailorJeff:
	trainer SAILOR, JEFF, EVENT_BEAT_SAILOR_JEFF, SailorJeffSeenText, SailorJeffBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorJeffAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerDebra:
	trainer PICNICKER, DEBRA, EVENT_BEAT_PICNICKER_DEBRA, PicnickerDebraSeenText, PicnickerDebraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerDebraAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerFritz:
	trainer JUGGLER, FRITZ, EVENT_BEAT_JUGGLER_FRITZ, JugglerFritzSeenText, JugglerFritzBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerFritzAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorGarrett:
	trainer SAILOR, GARRETT, EVENT_BEAT_SAILOR_GARRETT, SailorGarrettSeenText, SailorGarrettBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorGarrettAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherJonah:
	trainer FISHER, JONAH, EVENT_BEAT_FISHER_JONAH, FisherJonahSeenText, FisherJonahBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJonahAfterBattleText
	waitbutton
	closetext
	end

TrainerBlackbeltWai:
	trainer BLACKBELT_T, WAI, EVENT_BEAT_BLACKBELT_WAI, BlackbeltWaiSeenText, BlackbeltWaiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltWaiAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorKenneth:
	trainer SAILOR, KENNETH, EVENT_BEAT_SAILOR_KENNETH, SailorKennethSeenText, SailorKennethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorKennethAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherShirley:
	trainer TEACHER, SHIRLEY, EVENT_BEAT_TEACHER_SHIRLEY, TeacherShirleySeenText, TeacherShirleyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherShirleyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyNate:
	trainer SCHOOLBOY, NATE, EVENT_BEAT_SCHOOLBOY_NATE, SchoolboyNateSeenText, SchoolboyNateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyNateAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyRicky:
	trainer SCHOOLBOY, RICKY, EVENT_BEAT_SCHOOLBOY_RICKY, SchoolboyRickySeenText, SchoolboyRickyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyRickyAfterBattleText
	waitbutton
	closetext
	end

FashShipB1FTrashcan:
	jumpstd trashcan

FashShipB1FSailorBlocksRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

FashShipB1FSailorBlocksLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

FastShipB1FOnDutySailorText:
	text "Ehi tu, andresti"
	line "a cercare il mio"
	cont "collega?"

	para "Starà perdendo"
	line "tempo chissà dove,"
	cont "quel pigrone!"

	para "Vorrei cercarlo"
	line "io, ma sono in"
	cont "servizio."
	done

FastShipB1FOnDutySailorRefusedText:
	text "Oh, no…"

	para "Il CAPITANO sarà"
	line "furioso…"
	done

FastShipB1FOnDutySailorThanksText:
	text "Ho sgridato per"
	line "bene il mio"

	para "collega, così la"
	line "smetterà di"
	cont "bighellonare!"
	done

FastShipB1FOnDutySailorSawLittleGirlText:
	text "Una bambina?"

	para "Mi pare di averla"
	line "vista passare."
	done

FastShipB1FOnDutySailorDirectionsText:
	text "Sempre dritto c'è"
	line "il ristorante."

	para "In fondo alla sala"
	line "trovi le scale per"
	cont "la cabina del"
	cont "CAPITANO."
	done

SailorJeffSeenText:
	text "Niente è meglio di"
	line "una lotta quando"
	cont "sono in pausa."
	done

SailorJeffBeatenText:
	text "Che abbia vinto o"
	line "perso, la pausa è"
	cont "finita."
	done

SailorJeffAfterBattleText:
	text "Ma per vincere"
	line "ci vuole"
	cont "serietà."
	done

PicnickerDebraSeenText:
	text "Che noia!"
	line "Lottiamo!"
	done

PicnickerDebraBeatenText:
	text "Ehi, ma sei"
	line "troppo forte!"
	done

PicnickerDebraAfterBattleText:
	text "ZAFFERANOPOLI,"
	line "AZZURROPOLI…"

	para "A KANTO ci sono"
	line "così tante città!"
	done

JugglerFritzSeenText:
	text "Ahi…"
	line "Ho il mal di mare!"
	done

JugglerFritzBeatenText:
	text "Non posso più"
	line "muovermi…"
	done

JugglerFritzAfterBattleText:
	text "Basta navi, la"
	line "prossima volta"

	para "prendo il"
	line "SUPERTRENO."
	done

SailorGarrettSeenText:
	text "È qui che"
	line "lavoriamo noi"
	cont "marinai!"
	done

SailorGarrettBeatenText:
	text "Praticamente ho"
	line "perso in casa…"
	done

SailorGarrettAfterBattleText:
	text "I passeggeri di"
	line "ARANCIOPOLI sono"

	para "diversi da quelli"
	line "di OLIVINOPOLI."
	done

FisherJonahSeenText:
	text "Anche se siamo in"
	line "mezzo al mare non"
	cont "posso pescare!"

	para "Che noia! Dai,"
	line "lottiamo!"
	done

FisherJonahBeatenText:
	text "Beh… Ora non mi"
	line "annoio più…"
	done

FisherJonahAfterBattleText:
	text "Pescherò dalla"
	line "banchina di"
	cont "ARANCIOPOLI."
	done

BlackbeltWaiSeenText:
	text "Mi rinforzo le"
	line "gambe facendo"

	para "resistenza alle"
	line "oscillazioni della"
	cont "nave."
	done

BlackbeltWaiBeatenText:
	text "Ehi, ma tu mi hai"
	line "fatto ballare!"
	done

BlackbeltWaiAfterBattleText:
	text "A JOHTO non ho"
	line "trovato il RE del"
	cont "KARATE."

	para "Penso che si stia"
	line "allenando in una"
	cont "grotta o chissà"
	cont "dove."
	done

SailorKennethSeenText:
	text "Sono un marinaio."

	para "Ma alleno i #-"
	line "MON per diventare"
	cont "un CAMPIONE."
	done

SailorKennethBeatenText:
	text "È ovvio che sono"
	line "poco allenato…"
	done

SailorKennethAfterBattleText:
	text "Otto MEDAGLIE!"
	line "Vuol dire che hai"

	para "battuto otto"
	line "CAPOPALESTRA."

	para "Ecco perché sei"
	line "così in gamba!"
	done

TeacherShirleySeenText:
	text "Guai se tocchi i"
	line "miei studenti!"
	done

TeacherShirleyBeatenText:
	text "Nooo!"
	done

TeacherShirleyAfterBattleText:
	text "Andiamo in gita"
	line "alle ROVINE fuori"
	cont "VIOLAPOLI."
	done

SchoolboyNateSeenText:
	text "Conosci le"
	line "ROVINE D'ALFA?"
	done

SchoolboyNateBeatenText:
	text "Nooo!"
	done

SchoolboyNateAfterBattleText:
	text "La radio capta"
	line "strani segnali"
	cont "alle ROVINE."
	done

SchoolboyRickySeenText:
	text "Nelle ROVINE"
	line "D'ALFA ci sono"
	cont "strani pannelli"
	cont "di pietra."
	done

SchoolboyRickyBeatenText:
	text "Sono a pezzi!"
	done

SchoolboyRickyAfterBattleText:
	text "Ho letto che ne"
	line "esistono quattro"
	cont "di quei pannelli."
	done

FastShipB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 11, FAST_SHIP_1F, 11
	warp_event 31, 13, FAST_SHIP_1F, 12

	db 2 ; coord events
	coord_event 30,  7, SCENE_DEFAULT, FastShipB1FSailorBlocksLeft
	coord_event 31,  7, SCENE_DEFAULT, FastShipB1FSailorBlocksRight

	db 1 ; bg events
	bg_event 27,  9, BGEVENT_READ, FashShipB1FTrashcan

	db 12 ; object events
	object_event 30,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_LEFT
	object_event 31,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FastShipB1FSailorScript, EVENT_FAST_SHIP_B1F_SAILOR_RIGHT
	object_event  9, 11, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSailorJeff, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  6,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerDebra, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 26,  9, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerJugglerFritz, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event 17,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorGarrett, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 25,  8, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherJonah, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 15, 11, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltWai, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event 23,  4, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSailorKenneth, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  9, 11, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherShirley, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyNate, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event 14, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyRicky, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
