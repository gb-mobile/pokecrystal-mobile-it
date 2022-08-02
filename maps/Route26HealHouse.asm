	object_const_def ; object_event constants
	const ROUTE26HEALHOUSE_TEACHER

Route26HealHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route26HealHouseTeacherScript:
	faceplayer
	opentext
	writetext Route26HealHouseRestAWhileText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	special StubbedTrainerRankings_Healings
	playmusic MUSIC_HEAL
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext Route26HealHouseKeepAtItText
	waitbutton
	closetext
	end

Route26HealHouseBookshelf:
	jumpstd picturebookshelf

Route26HealHouseRestAWhileText:
	text "I tuoi #MON"
	line "sembrano stanchi."

	para "Dovresti farli"
	line "riposare."
	done

Route26HealHouseKeepAtItText:
	text "Guarda qui!"

	para "I tuoi #MON"
	line "hanno proprio un"
	cont "bell'aspetto ora!"

	para "Trattali bene!"
	done

Route26HealHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_26, 2
	warp_event  3,  7, ROUTE_26, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, Route26HealHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route26HealHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route26HealHouseTeacherScript, -1
