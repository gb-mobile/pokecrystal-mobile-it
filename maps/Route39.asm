	object_const_def ; object_event constants
	const ROUTE39_SAILOR
	const ROUTE39_POKEFAN_M
	const ROUTE39_POKEFAN_F1
	const ROUTE39_MILTANK1
	const ROUTE39_MILTANK2
	const ROUTE39_MILTANK3
	const ROUTE39_MILTANK4
	const ROUTE39_PSYCHIC_NORMAN
	const ROUTE39_FRUIT_TREE
	const ROUTE39_POKEFAN_F2

Route39_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route39Miltank:
	opentext
	writetext Route39MiltankText
	cry MILTANK
	waitbutton
	closetext
	end

TrainerPokefanmDerek:
	trainer POKEFANM, DEREK1, EVENT_BEAT_POKEFANM_DEREK, PokefanmDerekSeenText, PokefanmDerekBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEFANM_DEREK
	endifjustbattled
	opentext
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .HasNugget
	checkcellnum PHONE_POKEFANM_DEREK
	iftrue .NumberAccepted
	checkpoke PIKACHU
	iffalse .WantsPikachu
	checkevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokefanMDerekText_NotBragging
	buttonsound
	setevent EVENT_DEREK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEFANM_DEREK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	scall .RegisteredNumber
	sjump .NumberAccepted

.HasNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalse .NoRoom
	clearflag ENGINE_DEREK_HAS_NUGGET
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.WantsPikachu:
	writetext PokefanMDerekPikachuIsItText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.Gift:
	jumpstd giftm
	end

.PackFull:
	jumpstd packfullm
	end

TrainerPokefanfRuth:
	trainer POKEFANF, RUTH, EVENT_BEAT_POKEFANF_RUTH, PokefanfRuthSeenText, PokefanfRuthBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfRuthAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorEugene:
	trainer SAILOR, EUGENE, EVENT_BEAT_SAILOR_EUGENE, SailorEugeneSeenText, SailorEugeneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SailorEugeneAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicNorman:
	trainer PSYCHIC_T, NORMAN, EVENT_BEAT_PSYCHIC_NORMAN, PsychicNormanSeenText, PsychicNormanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicNormanAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfJaime:
	faceplayer
	opentext
	checktime NITE
	iffalse .NotNight
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue .Beaten
	writetext PokefanfJaimeSeenText
	waitbutton
	closetext
	winlosstext PokefanfJaimeBeatenText, 0
	loadtrainer POKEFANF, JAIME
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end

.Beaten:
	writetext PokefanfJaimeAfterBattleText
	waitbutton
	closetext
	end

.NotNight:
	writetext PokefanfJaimeHopeItGetsDarkText
	waitbutton
	closetext
	end

Route39Sign:
	jumptext Route39SignText

MoomooFarmSign:
	jumptext MoomooFarmSignText

Route39TrainerTips:
	jumptext Route39TrainerTipsText

Route39FruitTree:
	fruittree FRUITTREE_ROUTE_39

Route39HiddenNugget:
	hiddenitem NUGGET, EVENT_ROUTE_39_HIDDEN_NUGGET

Route39MiltankText:
	text "MILTANK: Muuu!"
	done

SailorEugeneSeenText:
	text "Sono appena stato"
	line "a OLIVINOPOLI."

	para "Che ne dici di una"
	line "lotta di #MON?"
	done

SailorEugeneBeatenText:
	text "Aaaargh!"
	done

SailorEugeneAfterBattleText:
	text "I miei #MON"
	line "sono stati cattu-"
	cont "rati e cresciuti"
	cont "oltremare."

	para "Mi hanno accompa-"
	line "gnato nei miei"
	cont "lunghi viaggi."
	done

PokefanmDerekSeenText:
	text "È l'occasione"
	line "buona per vantarmi"
	cont "un po' del mio"
	cont "PIKACHU!"
	done

PokefanmDerekBeatenText:
	text "Non avevo tempo"
	line "per mostrare il"
	cont "mio PIKACHU…"
	done

PokefanMDerekText_NotBragging:
	text "Non intendo"
	line "ascoltare chi si"
	cont "vanta!"

	para "Per noi #FAN"
	line "vale la regola"

	para "di non ascoltare"
	line "chi inizia a"
	cont "vantarsi!"
	done

PokefanfRuthSeenText:
	text "Hai #MON"
	line "carini?"

	para "Ora ti mostro il"
	line "mio #MON!"
	done

PokefanfRuthBeatenText:
	text "Non mi importa"
	line "di perdere."
	done

PokefanfRuthAfterBattleText:
	text "Hai sentito"
	line "parlare dei cuc-"
	cont "cioli di #MON?"

	para "Devono essere"
	line "dolcissimi!"
	done

PokefanMDerekPikachuIsItText:
	text "PIKACHU è quello"
	line "giusto non credi?"
	done

PsychicNormanSeenText:
	text "Mostrami di cosa"
	line "sono capaci i"
	cont "tuoi #MON!"
	done

PsychicNormanBeatenText:
	text "Vedo che i tuoi"
	line "#MON hanno"
	cont "stoffa!"
	done

PsychicNormanAfterBattleText:
	text "Ogni #MON"
	line "ha abilità"
	cont "differenti."

	para "Sono come le"
	line "persone."
	cont "Ognuno ha le"
	cont "proprie qualità."
	done

PokefanfJaimeHopeItGetsDarkText:
	text "Fufufu… Spero"
	line "che faccia presto"
	cont "buio."
	done

PokefanfJaimeSeenText:
	text "Capiti proprio al"
	line "momento adatto."

	para "Lottiamo!"
	done

PokefanfJaimeBeatenText:
	text "Che delusione…"
	done

PokefanfJaimeAfterBattleText:
	text "Ho incontrato"
	line "MEOWTH di notte,"
	cont "sul PERCORSO 39."

	para "Non so perché ma"
	line "pare che sia"

	para "contento quando"
	line "m'alleno qui."

	para "Quando m'alleno"
	line "qui, mi vuole"

	para "più bene di quando"
	line "m'alleno altrove."
	done

Route39SignText:
	text "PERCORSO 39"

	para "OLIVINOPOLI -"
	line "AMARANTOPOLI"
	done

MoomooFarmSignText:
	text "FATTORIA MUMU"

	para "Prova il nostro"
	line "gustosissimo"
	cont "latte!"
	done

Route39TrainerTipsText:
	text "Usa BOTTINTESTA"
	line "per scovare #-"
	cont "MON tra gli"
	cont "alberi."

	para "Sono molti i"
	line "#MON che si"
	cont "nascondono tra"
	cont "gli alberi."

	para "Usa BOTTINTESTA su"
	line "un qualsiasi al-"
	cont "bero, e vedrai!"
	done

Route39_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  1,  3, ROUTE_39_BARN, 1
	warp_event  5,  3, ROUTE_39_FARMHOUSE, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event  5, 31, BGEVENT_READ, Route39TrainerTips
	bg_event  9,  5, BGEVENT_READ, MoomooFarmSign
	bg_event 15,  7, BGEVENT_READ, Route39Sign
	bg_event  5, 13, BGEVENT_ITEM, Route39HiddenNugget

	db 10 ; object events
	object_event 13, 29, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSailorEugene, -1
	object_event 10, 22, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanmDerek, -1
	object_event 11, 19, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerPokefanfRuth, -1
	object_event  3, 12, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  6, 11, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  4, 15, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event  8, 13, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39Miltank, -1
	object_event 13,  7, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerPsychicNorman, -1
	object_event  9,  3, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39FruitTree, -1
	object_event  4, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TrainerPokefanfJaime, -1
