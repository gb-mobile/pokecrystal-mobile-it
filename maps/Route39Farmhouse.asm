ROUTE39FARMHOUSE_MILK_PRICE EQU 500

	object_const_def ; object_event constants
	const ROUTE39FARMHOUSE_POKEFAN_M
	const ROUTE39FARMHOUSE_POKEFAN_F

Route39Farmhouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PokefanM_DairyFarmer:
	faceplayer
	opentext
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerMScript_SellMilk
	writetext FarmerMText_SickCow
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end

FarmerMScript_SellMilk:
	checkitem MOOMOO_MILK
	iftrue FarmerMScript_Milking
	writetext FarmerMText_BuyMilk
	special PlaceMoneyTopRight
	yesorno
	iffalse FarmerMScript_NoSale
	checkmoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	ifequal HAVE_LESS, FarmerMScript_NoMoney
	giveitem MOOMOO_MILK
	iffalse FarmerMScript_NoRoom
	takemoney YOUR_MONEY, ROUTE39FARMHOUSE_MILK_PRICE
	special PlaceMoneyTopRight
	waitsfx
	playsound SFX_TRANSACTION
	writetext FarmerMText_GotMilk
	buttonsound
	itemnotify
	closetext
	end

FarmerMScript_NoMoney:
	writetext FarmerMText_NoMoney
	waitbutton
	closetext
	end

FarmerMScript_NoRoom:
	writetext FarmerMText_NoRoom
	waitbutton
	closetext
	end

FarmerMScript_NoSale:
	writetext FarmerMText_NoSale
	waitbutton
	closetext
	end

FarmerMScript_Milking:
	writetext FarmerMText_Milking
	waitbutton
	closetext
	end

PokefanF_SnoreFarmer:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue FarmerFScript_GotSnore
	checkevent EVENT_HEALED_MOOMOO
	iftrue FarmerFScript_GiveSnore
	writetext FarmerFText_InTrouble
	waitbutton
	closetext
	end

FarmerFScript_GiveSnore:
	writetext FarmerFText_HealedMiltank
	buttonsound
	verbosegiveitem TM_SNORE
	iffalse FarmerFScript_NoRoomForSnore
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
FarmerFScript_GotSnore:
	writetext FarmerFText_SnoreSpeech
	waitbutton
FarmerFScript_NoRoomForSnore:
	closetext
	end

FarmhouseBookshelf:
	jumpstd picturebookshelf

FarmerMText_SickCow:
	text "MILTANK non mi"
	line "dà più latte."

	para "Questa FATTORIA"
	line "era famosa per"
	cont "il latte!"

	para "Tutti me lo"
	line "chiedono!"

	para "Farebbe di nuovo"
	line "il latte se"

	para "potesse mangiare"
	line "delle BACCHE."
	done

FarmerMText_BuyMilk:
	text "Vorresti un po'"
	line "di LATTE MUMU?"

	para "È la mia gioia,"
	line "il mio orgoglio!"

	para "Se lo dai ad un"
	line "#MON"
	cont "recupererà PS!"

	para "Te lo darò per"
	line "soli ¥500."
	done

FarmerMText_GotMilk:
	text "Ecco a te!"
	line "Buon appetito!"
	done

FarmerMText_NoMoney:
	text "Sono spiacente."
	line "Niente soldi,"
	cont "niente latte!"
	done

FarmerMText_NoRoom:
	text "Temo che il tuo"
	line "ZAINO sia pieno."
	done

FarmerMText_NoSale:
	text "Non lo vuoi?"
	line "Ci vediamo!"
	done

FarmerMText_Milking:
	text "Penso che andrò a"
	line "mungere un po'."
	done

FarmerFText_InTrouble:
	text "Vendiamo il"
	line "nostro latte"
	cont "anche a KANTO."

	para "Se MILTANK"
	line "non ne produce"

	para "più è un"
	line "pasticcio!"
	done

FarmerFText_HealedMiltank:
	text "Hai guarito"
	line "MILTANK, ora"

	para "fa di nuovo LATTE"
	line "MUMU."

	para "Eccoti una"
	line "ricompensa."
	done

Text_ReceivedTM13:
	text "<PLAYER> riceve"
	line "MT13."
	done

FarmerFText_SnoreSpeech:
	text "Si tratta di"
	line "RUSSARE."

	para "È una mossa rara"
	line "che funziona solo"

	para "se il #MON"
	line "è addormentato."

	para "Pensa bene a"
	line "quando usarla."
	done

Route39Farmhouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_39, 2
	warp_event  3,  7, ROUTE_39, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, FarmhouseBookshelf
	bg_event  1,  1, BGEVENT_READ, FarmhouseBookshelf

	db 2 ; object events
	object_event  3,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PokefanM_DairyFarmer, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PokefanF_SnoreFarmer, -1
