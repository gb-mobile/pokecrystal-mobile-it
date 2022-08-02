	object_const_def ; object_event constants
	const CIANWOODPHOTOSTUDIO_FISHING_GURU

CianwoodPhotoStudio_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodPhotoStudioFishingGuruScript:
	faceplayer
	opentext
	writetext CianwoodPhotoStudioFishingGuruText_Question
	yesorno
	iffalse .Refused
	writetext CianwoodPhotoStudioFishingGuruText_Yes
	waitbutton
	special PhotoStudio
	waitbutton
	closetext
	end

.Refused:
	writetext CianwoodPhotoStudioFishingGuruText_No
	waitbutton
	closetext
	end

CianwoodPhotoStudioFishingGuruText_Question:
	text "Hai dei #MON"
	line "magnifici con te."

	para "Che ne dici di una"
	line "foto ricordo?"
	done

CianwoodPhotoStudioFishingGuruText_Yes:
	text "Ok! Un attimo!"
	done

CianwoodPhotoStudioFishingGuruText_No:
	text "Oh, come mi"
	line "dispiace! Una foto"

	para "sarebbe stata un"
	line "bel ricordo…"
	done

CianwoodPhotoStudio_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 5
	warp_event  3,  7, CIANWOOD_CITY, 5

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPhotoStudioFishingGuruScript, -1
