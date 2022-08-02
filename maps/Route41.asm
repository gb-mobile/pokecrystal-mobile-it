	object_const_def ; object_event constants
	const ROUTE41_OLIVINE_RIVAL1
	const ROUTE41_OLIVINE_RIVAL2
	const ROUTE41_OLIVINE_RIVAL3
	const ROUTE41_OLIVINE_RIVAL4
	const ROUTE41_OLIVINE_RIVAL5
	const ROUTE41_SWIMMER_GIRL1
	const ROUTE41_SWIMMER_GIRL2
	const ROUTE41_SWIMMER_GIRL3
	const ROUTE41_SWIMMER_GIRL4
	const ROUTE41_SWIMMER_GIRL5

Route41_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfKaylee:
	trainer SWIMMERF, KAYLEE, EVENT_BEAT_SWIMMERF_KAYLEE, SwimmerfKayleeSeenText, SwimmerfKayleeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKayleeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfSusie:
	trainer SWIMMERF, SUSIE, EVENT_BEAT_SWIMMERF_SUSIE, SwimmerfSusieSeenText, SwimmerfSusieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfSusieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfDenise:
	trainer SWIMMERF, DENISE, EVENT_BEAT_SWIMMERF_DENISE, SwimmerfDeniseSeenText, SwimmerfDeniseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDeniseAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfKara:
	trainer SWIMMERF, KARA, EVENT_BEAT_SWIMMERF_KARA, SwimmerfKaraSeenText, SwimmerfKaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfKaraAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfWendy:
	trainer SWIMMERF, WENDY, EVENT_BEAT_SWIMMERF_WENDY, SwimmerfWendySeenText, SwimmerfWendyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfWendyAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermCharlie:
	trainer SWIMMERM, CHARLIE, EVENT_BEAT_SWIMMERM_CHARLIE, SwimmermCharlieSeenText, SwimmermCharlieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermCharlieAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermGeorge:
	trainer SWIMMERM, GEORGE, EVENT_BEAT_SWIMMERM_GEORGE, SwimmermGeorgeSeenText, SwimmermGeorgeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermGeorgeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermBerke:
	trainer SWIMMERM, BERKE, EVENT_BEAT_SWIMMERM_BERKE, SwimmermBerkeSeenText, SwimmermBerkeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermBerkeAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermKirk:
	trainer SWIMMERM, KIRK, EVENT_BEAT_SWIMMERM_KIRK, SwimmermKirkSeenText, SwimmermKirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermKirkAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermMathew:
	trainer SWIMMERM, MATHEW, EVENT_BEAT_SWIMMERM_MATHEW, SwimmermMathewSeenText, SwimmermMathewBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermMathewAfterBattleText
	waitbutton
	closetext
	end

Route41Rock:
; unused
	jumpstd smashrock

Route41HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_41_HIDDEN_MAX_ETHER

SwimmermCharlieSeenText:
	text "Qui l'acqua è"
	line "calma, e sono"
	cont "proprio agile."

	para "Avanti, ti"
	line "sfido!"
	done

SwimmermCharlieBeatenText:
	text "Cielo! Ho"
	line "la pelle viola!"
	done

SwimmermCharlieAfterBattleText:
	text "Non è rilassante"
	line "farsi trasportare"
	cont "dall'acqua?"
	done

SwimmermGeorgeSeenText:
	text "Sono stanco."
	line "Se vinco, mi"
	cont "presti i tuoi"
	cont "#MON."
	done

SwimmermGeorgeBeatenText:
	text "Puf puf…"
	done

SwimmermGeorgeAfterBattleText:
	text "FIORLISOPOLI è"
	line "così distante..."

	para "Ma anche per"
	line "tornare a OLIVI-"
	cont "NOPOLI ci si"
	cont "impiega un po'."

	para "Che posso fare?"
	done

SwimmermBerkeSeenText:
	text "Vedi quelle isole"
	line "circondate dai"
	cont "vortici?"

	para "Dev'esserci un"
	line "segreto!"
	done

SwimmermBerkeBeatenText:
	text "Qual è il segreto"
	line "della tua forza?"
	done

SwimmermBerkeAfterBattleText:
	text "Era una notte buia"
	line "e tempestosa…"

	para "Vidi volare un"
	line "#MON gigante,"
	cont "proveniente dalle"
	cont "isole."

	para "Le sue ali d'"
	line "argento lasciavano"
	cont "una scia di piume."
	done

SwimmermKirkSeenText:
	text "Qui ci sono onde"
	line "violente."

	para "Ti stremano se"
	line "nuoti contro."
	done

SwimmermKirkBeatenText:
	text "Sono distrutto!"
	done

SwimmermKirkAfterBattleText:
	text "Le correnti mi"
	line "impediscono di"
	cont "raggiungere"
	cont "l'isola."
	done

SwimmermMathewSeenText:
	text "Vuoi scoprire i"
	line "segreti delle"
	cont "ISOLE VORTICOSE?"
	done

SwimmermMathewBeatenText:
	text "Hai davvero una"
	line "grande resistenza!"
	done

SwimmermMathewAfterBattleText:
	text "Un segreto sulle"
	line "ISOLE VORTICOSE…"

	para "È buio pesto"
	line "laggiù!"
	done

SwimmerfKayleeSeenText:
	text "Sto andando alle"
	line "ISOLE VORTICOSE."

	para "Le esplorerò con"
	line "i miei amici."
	done

SwimmerfKayleeBeatenText:
	text "Allora è così che"
	line "fai!"
	done

SwimmerfKayleeAfterBattleText:
	text "Si dice che un"
	line "grande #MON si"
	cont "nasconda sotto le"
	cont "ISOLE VORTICOSE."

	para "Cosa potrebbe mai"
	line "essere?"
	done

SwimmerfSusieSeenText:
	text "Sei così elegante"
	line "sul tuo #MON!"
	done

SwimmerfSusieBeatenText:
	text "Sono distrutta…"
	done

SwimmerfSusieAfterBattleText:
	text "Non c'era una"
	line "canzone che"
	cont "parlava di un"
	cont "ragazzo"
	cont "su di un LAPRAS?"
	done

SwimmerfDeniseSeenText:
	text "Il tempo è così"
	line "bello che sono"
	cont "in estasi!"
	done

SwimmerfDeniseBeatenText:
	text "Oooh!"
	done

SwimmerfDeniseAfterBattleText:
	text "Scottarsi fa male"
	line "alla pelle,"

	para "ma non uso creme"
	line "solari."

	para "Non voglio mica"
	line "inquinare l'acqua."
	done

SwimmerfKaraSeenText:
	text "Se vuoi riposarti"
	line "veleggia sull'"
	cont "acqua!"

	para "Avrai il vento"
	line "alle spalle, così"

	para "potrai continuare"
	line "ad andare veloce."
	done

SwimmerfKaraBeatenText:
	text "Oooh, hai più"
	line "energia di me."
	done

SwimmerfKaraAfterBattleText:
	text "Ho sentito versi"
	line "spaventosi prove-"
	cont "nire dalle ISOLE."
	done

SwimmerfWendySeenText:
	text "Di notte gli"
	line "STARYU si riuni-"
	cont "scono vicino all'"
	cont "acqua."
	done

SwimmerfWendyBeatenText:
	text "Oooh…"
	done

SwimmerfWendyAfterBattleText:
	text "Gli STARYU si"
	line "illuminano tutti"
	cont "insieme."

	para "È spaventosamente"
	line "bello!"
	done

Route41_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 12, 17, WHIRL_ISLAND_NW, 1
	warp_event 36, 19, WHIRL_ISLAND_NE, 1
	warp_event 12, 37, WHIRL_ISLAND_SW, 1
	warp_event 36, 45, WHIRL_ISLAND_SE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  9, 35, BGEVENT_ITEM, Route41HiddenMaxEther

	db 10 ; object events
	object_event 32,  6, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermCharlie, -1
	object_event 46,  8, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermGeorge, -1
	object_event 20, 26, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermBerke, -1
	object_event 32, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermKirk, -1
	object_event 19, 46, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermMathew, -1
	object_event 17,  4, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfKaylee, -1
	object_event 23, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfSusie, -1
	object_event 27, 34, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDenise, -1
	object_event 44, 28, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfKara, -1
	object_event  9, 50, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerSwimmerfWendy, -1
