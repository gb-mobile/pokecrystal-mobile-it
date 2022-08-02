	object_const_def ; object_event constants
	const ROUTE15_YOUNGSTER1
	const ROUTE15_YOUNGSTER2
	const ROUTE15_YOUNGSTER3
	const ROUTE15_YOUNGSTER4
	const ROUTE15_TEACHER1
	const ROUTE15_TEACHER2
	const ROUTE15_POKE_BALL

Route15_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerTeacherColette:
	trainer TEACHER, COLETTE, EVENT_BEAT_TEACHER_COLETTE, TeacherColetteSeenText, TeacherColetteBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherColetteAfterBattleText
	waitbutton
	closetext
	end

TrainerTeacherHillary:
	trainer TEACHER, HILLARY, EVENT_BEAT_TEACHER_HILLARY, TeacherHillarySeenText, TeacherHillaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherHillaryAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyKipp:
	trainer SCHOOLBOY, KIPP, EVENT_BEAT_SCHOOLBOY_KIP, SchoolboyKippSeenText, SchoolboyKippBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyKippAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyTommy:
	trainer SCHOOLBOY, TOMMY, EVENT_BEAT_SCHOOLBOY_TOMMY, SchoolboyTommySeenText, SchoolboyTommyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyTommyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJohnny:
	trainer SCHOOLBOY, JOHNNY, EVENT_BEAT_SCHOOLBOY_JOHNNY, SchoolboyJohnnySeenText, SchoolboyJohnnyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyJohnnyAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyBilly:
	trainer SCHOOLBOY, BILLY, EVENT_BEAT_SCHOOLBOY_BILLY, SchoolboyBillySeenText, SchoolboyBillyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyBillyAfterBattleText
	waitbutton
	closetext
	end

Route15Sign:
	jumptext Route15SignText

Route15PPUp:
	itemball PP_UP

TeacherColetteSeenText:
	text "Non dimentichi"
	line "niente?"
	done

TeacherColetteBeatenText:
	text "Aaah!"
	done

TeacherColetteAfterBattleText:
	text "Prima di fare l'"
	line "insegnante"

	para "dimenticavo sempre"
	line "tutto."
	done

TeacherHillarySeenText:
	text "Quando c'è il sole"
	line "i bambini"

	para "dovrebbero giocare"
	line "in cortile invece"

	para "di studiare in"
	line "classe."
	done

TeacherHillaryBeatenText:
	text "Non volevo"
	line "perdere…"
	done

TeacherHillaryAfterBattleText:
	text "Studiare è"
	line "importante, ma"
	cont "l'esercizio fisico"
	cont "è vitale."
	done

SchoolboyKippSeenText:
	text "Dopo telefonerò"
	line "alla mamma."
	done

SchoolboyKippBeatenText:
	text "Scusa mamma!"
	line "Mi hanno battuto!"
	done

SchoolboyKippAfterBattleText:
	text "Mia mamma si"
	line "preoccupa, vuole"

	para "sempre che la"
	line "chiami."
	done

SchoolboyTommySeenText:
	text "Lottiamo, non"
	line "perderò di certo!"
	done

SchoolboyTommyBeatenText:
	text "Ho dimenticato di"
	line "fare i compiti!"
	done

SchoolboyTommyAfterBattleText:
	text "Sayonara! L'ho"
	line "appena imparato"
	cont "nel corso di"
	cont "giapponese."
	done

SchoolboyJohnnySeenText:
	text "Andiamo alla TORRE"
	line "RADIO di"

	para "LAVANDONIA per"
	line "fare degli studi"
	cont "sociali."
	done

SchoolboyJohnnyBeatenText:
	text "Sei terribilmente"
	line "in gamba!"
	done

SchoolboyJohnnyAfterBattleText:
	text "Non ce la faccio"
	line "più a camminare."
	cont "Devo riposarmi."
	done

SchoolboyBillySeenText:
	text "La mia materia"
	line "preferita è la"
	cont "ginnastica."
	done

SchoolboyBillyBeatenText:
	text "Oh, no! Come ho"
	line "potuto perdere!"
	done

SchoolboyBillyAfterBattleText:
	text "Se i #MON si"
	line "insegnassero a"
	cont "scuola, sarebbero"
	cont "loro la mia"
	cont "materia preferita!"
	done

Route15SignText:
	text "PERCORSO 15"

	para "FUCSIAPOLI -"
	line "LAVANDONIA"
	done

Route15_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  2,  5, ROUTE_15_FUCHSIA_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 19,  9, BGEVENT_READ, Route15Sign

	db 7 ; object events
	object_event 10, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyKipp, -1
	object_event 15, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyTommy, -1
	object_event 33, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJohnny, -1
	object_event 27, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyBilly, -1
	object_event 30, 12, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerTeacherColette, -1
	object_event 20, 10, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerTeacherHillary, -1
	object_event 12,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route15PPUp, EVENT_ROUTE_15_PP_UP
