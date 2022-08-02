	object_const_def ; object_event constants
	const BILLSHOUSE_GRAMPS

BillsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillsGrandpa:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .JustShowedSomething
	checkevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotThunderstone
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue .MetGrandpa
	writetext BillsGrandpaIntroText
	buttonsound
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	checkevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	iftrue .ShowedPichu
	checkevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	iftrue .ShowedGrowlitheVulpix
	checkevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	iftrue .ShowedStaryu
	checkevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	iftrue .ShowedOddish
	checkevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	iftrue .ShowedLickitung
	writetext BillsGrandpaLickitungText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal LICKITUNG, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_LICKITUNG_TO_BILLS_GRANDPA
	sjump .ShowedLickitung

.GotEverstone:
	writetext BillsGrandpaOddishText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal ODDISH, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_ODDISH_TO_BILLS_GRANDPA
	sjump .ShowedOddish

.GotLeafStone:
	writetext BillsGrandpaStaryuText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal STARYU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_STARYU_TO_BILLS_GRANDPA
	sjump .ShowedStaryu

.GotWaterStone:
	checkver
	iftrue .AskVulpix
	writetext BillsGrandpaGrowlitheText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal GROWLITHE, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	sjump .ShowedGrowlitheVulpix

.AskVulpix:
	writetext BillsGrandpaVulpixText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal VULPIX, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_GROWLITHE_VULPIX_TO_BILLS_GRANDPA
	sjump .ShowedGrowlitheVulpix

.GotFireStone:
	writetext BillsGrandpaPichuText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	ifnotequal PICHU, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_PICHU_TO_BILLS_GRANDPA
	sjump .ShowedPichu

.ShowedLickitung:
	checkevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	iftrue .GotEverstone
	scall .ReceiveItem
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_EVERSTONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedOddish:
	checkevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	iftrue .GotLeafStone
	scall .ReceiveItem
	verbosegiveitem LEAF_STONE
	iffalse .BagFull
	setevent EVENT_GOT_LEAF_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedStaryu:
	checkevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	iftrue .GotWaterStone
	scall .ReceiveItem
	verbosegiveitem WATER_STONE
	iffalse .BagFull
	setevent EVENT_GOT_WATER_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedGrowlitheVulpix:
	checkevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	iftrue .GotFireStone
	scall .ReceiveItem
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	setevent EVENT_GOT_FIRE_STONE_FROM_BILLS_GRANDPA
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	closetext
	end

.ShowedPichu:
	scall .ReceiveItem
	verbosegiveitem THUNDERSTONE
	iffalse .BagFull
	setevent EVENT_GOT_THUNDERSTONE_FROM_BILLS_GRANDPA
	closetext
	end

.ExcitedToSee:
	writetext BillsGrandpaExcitedToSeeText
	buttonsound
	end

.SaidNo:
	writetext BillsGrandpaYouDontHaveItTextText
	waitbutton
	closetext
	end

.CorrectPokemon:
	writetext BillsGrandpaShownPokemonText
	buttonsound
	end

.ReceiveItem:
	writetext BillsGrandpaTokenOfAppreciationText
	buttonsound
	end

.JustShowedSomething:
	writetext BillsGrandpaComeAgainText
	waitbutton
	closetext
	end

.GotThunderstone:
	writetext BillsGrandpaShownAllThePokemonText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext BillsGrandpaWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end

BillsGrandpaIntroText:
	text "Davvero conosci"
	line "BILL, mio nipote?"

	para "È a JOHTO. Fa non"
	line "so cosa con i PC,"

	para "ed io gli curo la"
	line "casa."
	done

BillsGrandpaAskToSeeMonText:
	text "Se hai quel"
	line "#MON, posso"
	cont "vederlo?"
	done

BillsGrandpaExcitedToSeeText:
	text "Me lo mostri?"
	line "Che gentile!"
	done

BillsGrandpaYouDontHaveItTextText:
	text "Non ce l'hai?"
	line "Che disdetta…"
	done

BillsGrandpaShownPokemonText:
	text "Ah, questo è"
	line "@"
	text_ram wStringBuffer3
	text "?"

	para "È proprio carino!"
	line "E tu sei gentile a"
	cont "mostrarmelo."
	done

BillsGrandpaTokenOfAppreciationText:
	text "Grazie!"

	para "Questo è un segno"
	line "della mia stima."
	done

BillsGrandpaComeAgainText:
	text "Torna a trovarmi."
	done

BillsGrandpaShownAllThePokemonText:
	text "Grazie per avermi"
	line "mostrato tanti"
	cont "simpatici #MON."

	para "È stato davvero"
	line "divertente. E ne"

	para "ho viste di belle"
	line "cose in vita mia!"
	done

BillsGrandpaWrongPokemonText:
	text "Eh?"

	para "No!"

	para "Non è questo il"
	line "#MON che"
	cont "intendevo!"
	done

BillsGrandpaLickitungText:
	text "Mio nipote BILL"
	line "mi ha parlato di"

	para "un #MON con"
	line "una lunga lingua."
	done

BillsGrandpaOddishText:
	text "Mio nipote mi ha"
	line "parlato di un"

	para "#MON rotondo"
	line "a cui crescono"
	cont "foglie verdi"
	cont "sul capo."
	done

BillsGrandpaStaryuText:
	text "Conosci un #MON"
	line "d'acqua con una"

	para "sfera rossa"
	line "sul corpo?"

	para "Sai, quello a"
	line "forma di stella?"

	para "BILL dice che"
	line "appare di notte."

	para "Mi piacerebbe"
	line "proprio vederlo."
	done

BillsGrandpaGrowlitheText:
	text "BILL mi ha parlato"
	line "di un #MON"

	para "molto leale con il"
	line "suo allenatore."

	para "Il suo verso"
	line "sembra un BOATO!"
	done

BillsGrandpaVulpixText:
	text "Conosci quel"
	line "#MON con sei"
	cont "code, molto"
	cont "carino?"

	para "Che bello sarebbe"
	line "abbracciare un"
	cont "#MON come"
	cont "quello!"
	done

BillsGrandpaPichuText:
	text "Conosci quel"
	line "#MON così"
	cont "famoso?"

	para "Quel #MON con"
	line "il corpo giallo e"
	cont "le guance rosse?"

	para "Mi piacerebbe"
	line "vedere com'è prima"

	para "di evolversi!"
	done

BillsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_25, 1
	warp_event  3,  7, ROUTE_25, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsGrandpa, -1
