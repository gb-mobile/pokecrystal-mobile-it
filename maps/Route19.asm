	object_const_def ; object_event constants
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2

Route19_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .ClearRocks

.ClearRocks:
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .Done
	changeblock  6,  6, $7a ; rock
	changeblock  8,  6, $7a ; rock
	changeblock 10,  6, $7a ; rock
	changeblock 12,  8, $7a ; rock
	changeblock  4,  8, $7a ; rock
	changeblock 10, 10, $7a ; rock
.Done:
	return

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermJerome:
	trainer SWIMMERM, JEROME, EVENT_BEAT_SWIMMERM_JEROME, SwimmermJeromeSeenText, SwimmermJeromeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermJeromeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

Route19Fisher1Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher1Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher1Text_RocksCleared
	waitbutton
	closetext
	end

Route19Fisher2Script:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19Fisher2Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher2Text_RocksCleared
	waitbutton
	closetext
	end

Route19Sign:
	jumptext Route19SignText

CarefulSwimmingSign:
	jumptext CarefulSwimmingSignText

SwimmermHaroldSeenText:
	text "Hai mai nuotato in"
	line "mare di notte?"
	done

SwimmermHaroldBeatenText:
	text "Oooh…"
	done

SwimmermHaroldAfterBattleText:
	text "Di notte il mare"
	line "si fa scuro. Pare"

	para "che ti voglia"
	line "ingoiare."
	done

SwimmermTuckerSeenText:
	text "Puff puff…"
	line "Per… FUCSIAPOLI…"

	para "non… manca…"
	line "molto…"
	done

SwimmermTuckerBeatenText:
	text "Annego!"
	done

SwimmermTuckerAfterBattleText:
	text "Ho… chiesto alla"
	line "mia ragazza di"
	cont "nuotare fino a"
	cont "FUCSIAPOLI… Puff…"
	done

SwimmerfDawnSeenText:
	text "Mi disgustano i"
	line "buoni a nulla."
	done

SwimmerfDawnBeatenText:
	text "Che ne dici di"
	line "una gara di nuoto?"
	done

SwimmerfDawnAfterBattleText:
	text "Le ISOLE SPUMARINE"
	line "sono piuttosto"

	para "vicine a"
	line "FUCSIAPOLI…"

	para "Guarda il mio"
	line "ragazzo, è proprio"

	para "un buono a nulla."
	done

SwimmermJeromeSeenText:
	text "A nuotare sono"
	line "una frana."

	para "Mi limito a"
	line "sguazzare"
	cont "nell'acqua bassa."
	done

SwimmermJeromeBeatenText:
	text "Credevo di poter"
	line "vincere."
	done

SwimmermJeromeAfterBattleText:
	text "Non nuoterò bene,"
	line "ma adoro il mare!"
	done

Route19Fisher1Text:
	text "Mi dispiace ma la"
	line "strada è chiusa"
	cont "per lavori."

	para "Per andare all'"
	line "ISOLA CANNELLA"

	para "devi passare"
	line "per BIANCAVILLA."
	done

Route19Fisher1Text_RocksCleared:
	text "Sono in un bagno"
	line "di sudore: farò"
	cont "una nuotata!"
	done

Route19Fisher2Text:
	text "Chissà quanto"
	line "tempo ci vorrebbe"
	cont "per spostare"
	cont "questo masso…"
	done

Route19Fisher2Text_RocksCleared:
	text "I lavori alla"
	line "strada sono"
	cont "terminati."

	para "Ora posso tornare"
	line "a pescare."
	done

Route19SignText:
	text "PERCORSO 19"

	para "FUCSIAPOLI -"
	line "ISOLE SPUMARINE"
	done

CarefulSwimmingSignText:
	text "Se nuotate fino"
	line "alle ISOLE SPUMA-"
	cont "RINE, fate molta"
	cont "attenzione."

	para "POLIZIA di"
	line "FUCSIAPOLI"
	done

Route19_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  3, ROUTE_19_FUCHSIA_GATE, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11, 13, BGEVENT_READ, Route19Sign
	bg_event 11,  1, BGEVENT_READ, CarefulSwimmingSign

	db 6 ; object events
	object_event  9, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerSwimmerfDawn, -1
	object_event 13, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 11, 17, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermJerome, -1
	object_event  8, 23, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerSwimmermTucker, -1
	object_event  9,  5, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Route19Fisher1Script, -1
	object_event 11,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, Route19Fisher2Script, -1
