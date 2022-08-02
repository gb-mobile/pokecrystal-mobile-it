	object_const_def ; object_event constants
	const GOLDENRODHAPPINESSRATER_TEACHER
	const GOLDENRODHAPPINESSRATER_POKEFAN_M
	const GOLDENRODHAPPINESSRATER_TWIN

GoldenrodHappinessRater_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoldenrodHappinessRaterTeacherScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	writetext GoldenrodHappinessRaterTeacherText
	buttonsound
	ifgreater 250 - 1, .LovesYouALot
	ifgreater 200 - 1, .ReallyTrustsYou
	ifgreater 150 - 1, .SortOfHappy
	ifgreater 100 - 1, .QuiteCute
	ifgreater  50 - 1, .NotUsedToYou
	sjump .LooksMean

.LovesYouALot:
	writetext GoldenrodHappinessRatingText_LovesYouALot
	waitbutton
	closetext
	end

.ReallyTrustsYou:
	writetext GoldenrodHappinessRatingText_ReallyTrustsYou
	waitbutton
	closetext
	end

.SortOfHappy:
	writetext GoldenrodHappinessRatingText_SortOfHappy
	waitbutton
	closetext
	end

.QuiteCute:
	writetext GoldenrodHappinessRatingText_QuiteCute
	waitbutton
	closetext
	end

.NotUsedToYou:
	writetext GoldenrodHappinessRatingText_NotUsedToYou
	waitbutton
	closetext
	end

.LooksMean:
	writetext GoldenrodHappinessRatingText_LooksMean
	waitbutton
	closetext
	end

GoldenrodHappinessRaterPokefanMScript:
	jumptextfaceplayer GoldenrodHappinessRaterPokefanMText

GoldenrodHappinessRaterTwinScript:
	jumptextfaceplayer GoldenrodHappinessRaterTwinText

HappinessRatersHouseBookshelf:
	jumpstd difficultbookshelf

HappinessRatersHouseRadio:
	jumpstd radio2

GoldenrodHappinessRaterTeacherText:
	text "Se tratti bene i"
	line "tuoi #MON, ti"

	para "vorranno bene a"
	line "loro volta."

	para "Fammi vedere"
	line "il tuo @"
	text_ram wStringBuffer3
	text "…"
	done

GoldenrodHappinessRatingText_LovesYouALot:
	text "Sembra proprio"
	line "felice. Deve"
	cont "volerti bene."
	done

GoldenrodHappinessRatingText_ReallyTrustsYou:
	text "Pare proprio che"
	line "si fidi di te."
	done

GoldenrodHappinessRatingText_SortOfHappy:
	text "Ti è amico: sembra"
	line "piuttosto felice."
	done

GoldenrodHappinessRatingText_QuiteCute:
	text "È proprio carino."
	done

GoldenrodHappinessRatingText_NotUsedToYou:
	text "Devi trattarlo"
	line "meglio: non siete"
	cont "molto in sintonia."
	done

GoldenrodHappinessRatingText_LooksMean:
	text "A quanto pare non"
	line "gli piaci: ti"
	cont "guarda storto."
	done

GoldenrodHappinessRaterPokefanMText:
	text "Perdo sempre, e i"
	line "miei #MON"

	para "lottano fino ad"
	line "essere esausti…"

	para "Forse è per questo"
	line "che non piaccio"
	cont "ai miei #MON…"
	done

GoldenrodHappinessRaterTwinText:
	text "Se uso uno stru-"
	line "mento sul mio"
	cont "#MON, mi è"
	cont "riconoscente."
	done

GoldenrodHappinessRater_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 3
	warp_event  3,  7, GOLDENROD_CITY, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HappinessRatersHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, HappinessRatersHouseRadio

	db 3 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTeacherScript, -1
	object_event  5,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterPokefanMScript, -1
	object_event  5,  6, SPRITE_TWIN, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodHappinessRaterTwinScript, -1
