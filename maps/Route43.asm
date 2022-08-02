	object_const_def ; object_event constants
	const ROUTE43_SUPER_NERD1
	const ROUTE43_SUPER_NERD2
	const ROUTE43_SUPER_NERD3
	const ROUTE43_FISHER
	const ROUTE43_LASS
	const ROUTE43_YOUNGSTER
	const ROUTE43_FRUIT_TREE
	const ROUTE43_POKE_BALL

Route43_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfRockets

.CheckIfRockets:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .NoRockets
	setmapscene ROUTE_43_GATE, SCENE_DEFAULT
	return

.NoRockets:
	setmapscene ROUTE_43_GATE, SCENE_FINISHED
	return

TrainerCamperSpencer:
	trainer CAMPER, SPENCER, EVENT_BEAT_CAMPER_SPENCER, CamperSpencerSeenText, CamperSpencerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperSpencerAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBen:
	trainer POKEMANIAC, BEN, EVENT_BEAT_POKEMANIAC_BEN, PokemaniacBenSeenText, PokemaniacBenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacBenAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacBrent:
	trainer POKEMANIAC, BRENT1, EVENT_BEAT_POKEMANIAC_BRENT, PokemaniacBrentSeenText, PokemaniacBrentBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_POKEMANIAC_BRENT
	endifjustbattled
	opentext
	checkflag ENGINE_BRENT
	iftrue .WantsBattle
	checkcellnum PHONE_POKEMANIAC_BRENT
	iftrue .NumberAccepted
	checkevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PokemaniacBrentAfterBattleText
	buttonsound
	setevent EVENT_BRENT_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_POKEMANIAC_BRENT
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PokemaniacBrentBeatenText, 0
	readmem wBrentFightCount
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 1
	clearflag ENGINE_BRENT
	end

.LoadFight1:
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 2
	clearflag ENGINE_BRENT
	end

.LoadFight2:
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	reloadmapafterbattle
	loadmem wBrentFightCount, 3
	clearflag ENGINE_BRENT
	end

.LoadFight3:
	loadtrainer POKEMANIAC, BRENT4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_BRENT
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

.Rematch:
	jumpstd rematchm
	end

TrainerPokemaniacRon:
	trainer POKEMANIAC, RON, EVENT_BEAT_POKEMANIAC_RON, PokemaniacRonSeenText, PokemaniacRonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacRonAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMarvin:
	trainer FISHER, MARVIN, EVENT_BEAT_FISHER_MARVIN, FisherMarvinSeenText, FisherMarvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMarvinAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTiffany:
	trainer PICNICKER, TIFFANY3, EVENT_BEAT_PICNICKER_TIFFANY, PicnickerTiffanySeenText, PicnickerTiffanyBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_TIFFANY
	endifjustbattled
	opentext
	checkflag ENGINE_TIFFANY
	iftrue .WantsBattle
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue .HasPinkBow
	checkcellnum PHONE_PICNICKER_TIFFANY
	iftrue .NumberAccepted
	checkpoke CLEFAIRY
	iffalse .NoClefairy
	checkevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext PicnickerTiffanyWantsPicnicText
	buttonsound
	setevent EVENT_TIFFANY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_TIFFANY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext PicnickerTiffanyBeatenText, 0
	readmem wTiffanyFightCount
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight3:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, TIFFANY3
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 1
	clearflag ENGINE_TIFFANY
	end

.LoadFight1:
	loadtrainer PICNICKER, TIFFANY1
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 2
	clearflag ENGINE_TIFFANY
	end

.LoadFight2:
	loadtrainer PICNICKER, TIFFANY2
	startbattle
	reloadmapafterbattle
	loadmem wTiffanyFightCount, 3
	clearflag ENGINE_TIFFANY
	end

.LoadFight3:
	loadtrainer PICNICKER, TIFFANY4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TIFFANY
	end

.HasPinkBow:
	scall .Gift
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	clearflag ENGINE_TIFFANY_HAS_PINK_BOW
	setevent EVENT_TIFFANY_GAVE_PINK_BOW
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

.NoClefairy:
	writetext PicnickerTiffanyClefairyText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd asknumber1f
	end

.AskNumber2:
	jumpstd asknumber2f
	end

.RegisteredNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.NumberDeclined:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.Rematch:
	jumpstd rematchf
	end

.Gift:
	jumpstd giftf
	end

.PackFull:
	jumpstd packfullf
	end

Route43Sign1:
	jumptext Route43Sign1Text

Route43Sign2:
	jumptext Route43Sign2Text

Route43TrainerTips:
	jumptext Route43TrainerTipsText

Route43FruitTree:
	fruittree FRUITTREE_ROUTE_43

Route43MaxEther:
	itemball MAX_ETHER

PokemaniacBenSeenText:
	text "Adoro i #MON!"

	para "È per questo che"
	line "ho iniziato e con-"
	cont "tinuerò a colle-"
	cont "zionare #MON!"
	done

PokemaniacBenBeatenText:
	text "Come hai potuto"
	line "farmi questo?"
	done

PokemaniacBenAfterBattleText:
	text "Cos'altro mi piace"
	line "oltre ai"
	cont "#MON?"

	para "LORI alla radio!"
	line "Mi è così"
	cont "simpatica!"
	done

PokemaniacBrentSeenText:
	text "Ehi! Hai dei"
	line "#MON rari?"
	done

PokemaniacBrentBeatenText:
	text "Oh, il mio povero"
	line "#MON! Caro!"
	done

PokemaniacBrentAfterBattleText:
	text "Se potessi avere"
	line "anche un solo"
	cont "#MON raro!"
	done

PokemaniacRonSeenText:
	text "Ehi, senti"
	line "questa!"

	para "Un certo <RIVAL>"
	line "ha preso in giro"
	cont "il mio #MON!"

	para "Che rabbia! Il mio"
	line "#MON è"
	cont "grande!"
	done

PokemaniacRonBeatenText:
	text "Il mio NIDOKING si"
	line "è fatto valere!"
	done

PokemaniacRonAfterBattleText:
	text "Ognuno ha il suo"
	line "#MON"

	para "preferito, è"
	line "normale."

	para "Non si tratta sol-"
	line "tanto di avere il"
	cont "#MON più forte."
	done

FisherMarvinSeenText:
	text "Non sono in forma."

	para "Dipenderà dall'"
	line "equipaggiamento."

	para "Lottiamo, vediamo"
	line "se mi riprendo!"
	done

FisherMarvinBeatenText:
	text "Ho perso, ma mi"
	line "sento meglio."
	done

FisherMarvinAfterBattleText:
	text "L'ESCA BALL di"
	line "FRANZ è il massimo"
	cont "per catturare i"
	cont "#MON pescati."

	para "È molto più"
	line "efficace di una"
	cont "ULTRA BALL."
	done

CamperSpencerSeenText:
	text "Posso fare così"
	line "tanto con i #-"
	cont "MON! Mi diverto un"
	cont "sacco!"
	done

CamperSpencerBeatenText:
	text "Perdere non è"
	line "divertente…"
	done

CamperSpencerAfterBattleText:
	text "Che sta accadendo"
	line "al LAGO D'IRA?"

	para "Volevamo"
	line "accamparci lì."
	done

PicnickerTiffanySeenText:
	text "Anche tu vai al"
	line "LAGO D'IRA?"

	para "Giochiamo un"
	line "po' insieme!"
	done

PicnickerTiffanyBeatenText:
	text "Ho giocato troppo!"
	done

PicnickerTiffanyWantsPicnicText:
	text "Faccio un pic-nic"
	line "con i #MON."

	para "Sei dei nostri?"
	done

PicnickerTiffanyClefairyText:
	text "Non trovi che il"
	line "mio CLEFAIRY sia"
	cont "adorabile?"
	done

Route43Sign1Text:
	text "PERCORSO 43"

	para "LAGO D'IRA -"
	line "MOGANIA"
	done

Route43Sign2Text:
	text "PERCORSO 43"

	para "LAGO D'IRA -"
	line "MOGANIA"
	done

Route43TrainerTipsText:
	text "CONSIGLI UTILI"

	para "Tutti i #MON"
	line "hanno qualità e"

	para "punti deboli,"
	line "dipende dal tipo."

	para "Anche un #MON"
	line "di livello supe-"
	cont "riore può perdere,"
	cont "secondo il tipo."

	para "Scopri contro"
	line "quali tipi i tuoi"

	para "#MON sono"
	line "più forti."
	done

Route43_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  9, 51, ROUTE_43_MAHOGANY_GATE, 1
	warp_event 10, 51, ROUTE_43_MAHOGANY_GATE, 2
	warp_event 17, 35, ROUTE_43_GATE, 3
	warp_event 17, 31, ROUTE_43_GATE, 1
	warp_event 18, 31, ROUTE_43_GATE, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event 13,  3, BGEVENT_READ, Route43Sign1
	bg_event 11, 49, BGEVENT_READ, Route43Sign2
	bg_event 16, 38, BGEVENT_READ, Route43TrainerTips

	db 8 ; object events
	object_event 13,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacBen, -1
	object_event 13, 20, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacBrent, -1
	object_event 14,  7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPokemaniacRon, -1
	object_event  4, 16, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerFisherMarvin, -1
	object_event  9, 25, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTiffany, -1
	object_event 13, 40, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperSpencer, -1
	object_event  1, 26, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route43FruitTree, -1
	object_event 12, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route43MaxEther, EVENT_ROUTE_43_MAX_ETHER
