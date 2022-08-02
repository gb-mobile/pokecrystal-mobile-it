	object_const_def ; object_event constants
	const GOLDENRODFLOWERSHOP_TEACHER
	const GOLDENRODFLOWERSHOP_FLORIA

GoldenrodFlowerShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FlowerShopTeacherScript:
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .Lalala
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	checkevent EVENT_MET_FLORIA
	iffalse .HaventMetFloria
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iffalse .Lalala
	checkflag ENGINE_PLAINBADGE
	iffalse .NoPlainBadge
	faceplayer
	opentext
	writetext GoldenrodFlowerShopTeacherHeresTheSquirtbottleText
	buttonsound
	verbosegiveitem SQUIRTBOTTLE
	setevent EVENT_GOT_SQUIRTBOTTLE
	closetext
	setevent EVENT_FLORIA_AT_SUDOWOODO
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	end

.Lalala:
	turnobject GOLDENRODFLOWERSHOP_TEACHER, LEFT
	opentext
	writetext GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText
	waitbutton
	closetext
	end

.GotSquirtbottle:
	jumptextfaceplayer GoldenrodFlowerShopTeacherDontDoAnythingDangerousText

.NoPlainBadge:
	jumptextfaceplayer GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText

.HaventMetFloria:
	jumptextfaceplayer GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text

FlowerShopFloriaScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .FoughtSudowoodo
	checkevent EVENT_GOT_SQUIRTBOTTLE
	iftrue .GotSquirtbottle
	writetext GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	setevent EVENT_FLORIA_AT_FLOWER_SHOP
	clearevent EVENT_FLORIA_AT_SUDOWOODO
	end

.GotSquirtbottle:
	writetext GoldenrodFlowerShopFloriaYouBeatWhitneyText
	waitbutton
	closetext
	end

.FoughtSudowoodo:
	writetext GoldenrodFlowerShopFloriaItReallyWasAMonText
	waitbutton
	closetext
	end

FlowerShopShelf1:
; unused
	jumpstd picturebookshelf

FlowerShopShelf2:
; unused
	jumpstd magazinebookshelf

FlowerShopRadio:
; unused
	jumpstd radio2

GoldenrodFlowerShopTeacherMySisterWentToSeeWigglyTreeRoute36Text:
	text "Hai visto lo"
	line "strano albero che"

	para "cresce sul"
	line "PERCORSO 36?"

	para "Quando l'ha visto,"
	line "la mia sorellina"

	para "è tornata tutta"
	line "agitata…"

	para "Non sarà mica"
	line "pericoloso?"
	done

GoldenrodFlowerShopTeacherAskWantToBorrowWaterBottleText:
	text "Anche tu vuoi"
	line "prendere l'"
	cont "ANNAFFIATOIO? Ma"
	cont "non metterti nei"

	para "guai, mi"
	line "raccomando!"
	done

GoldenrodFlowerShopTeacherHeresTheSquirtbottleText:
	text "Beh, allora sei"
	line "meglio di CHIARA…"

	para "Bene. Eccoti"
	line "l'ANNAFFIATOIO!"
	done

GoldenrodFlowerShopTeacherDontDoAnythingDangerousText:
	text "Fa attenzione, mi"
	line "raccomando!"
	done

GoldenrodFlowerShopTeacherLalalaHavePlentyOfWaterText:
	text "Lalala lalalala."
	line "Annaffia qui,"
	cont "annaffia là!"
	done

GoldenrodFlowerShopFloriaWonderIfSisWillLendWaterBottleText:
	text "Ho raccontato a"
	line "mia sorella dell'"
	cont "ANNAFFIATOIO: mi"
	cont "ha detto che è"
	cont "pericoloso!"

	para "Ma se batto CHIARA"
	line "potrò avere il suo"

	para "ANNAFFIATOIO,"
	line "forse…"
	done

GoldenrodFlowerShopFloriaYouBeatWhitneyText:
	text "Hai battuto"
	line "CHIARA? Grande!"
	done

GoldenrodFlowerShopFloriaItReallyWasAMonText:
	text "Allora era davvero"
	line "un #MON!"
	done

GoldenrodFlowerShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 6
	warp_event  3,  7, GOLDENROD_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  4, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FlowerShopTeacherScript, -1
	object_event  5,  6, SPRITE_LASS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FlowerShopFloriaScript, EVENT_FLORIA_AT_FLOWER_SHOP
