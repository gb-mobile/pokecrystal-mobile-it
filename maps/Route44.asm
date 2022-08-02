	object_const_def ; object_event constants
	const ROUTE44_FISHER1
	const ROUTE44_FISHER2
	const ROUTE44_YOUNGSTER1
	const ROUTE44_SUPER_NERD
	const ROUTE44_YOUNGSTER2
	const ROUTE44_COOLTRAINER_M
	const ROUTE44_COOLTRAINER_F
	const ROUTE44_FRUIT_TREE
	const ROUTE44_POKE_BALL1
	const ROUTE44_POKE_BALL2
	const ROUTE44_POKE_BALL3

Route44_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperVance1:
	trainer BIRD_KEEPER, VANCE1, EVENT_BEAT_BIRD_KEEPER_VANCE, BirdKeeperVance1SeenText, BirdKeeperVance1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BIRDKEEPER_VANCE
	endifjustbattled
	opentext
	checkflag ENGINE_VANCE
	iftrue .WantsBattle
	checkcellnum PHONE_BIRDKEEPER_VANCE
	iftrue Route44NumberAcceptedM
	checkevent EVENT_VANCE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BirdKeeperVanceLegendaryBirdsText
	buttonsound
	setevent EVENT_VANCE_ASKED_FOR_PHONE_NUMBER
	scall Route44AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route44AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BIRDKEEPER_VANCE
	ifequal PHONE_CONTACTS_FULL, Route44PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route44NumberDeclinedM
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, VANCE1
	scall Route44RegisteredNumberM
	sjump Route44NumberAcceptedM

.WantsBattle:
	scall Route44RematchM
	winlosstext BirdKeeperVance1BeatenText, 0
	readmem wVanceFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer BIRD_KEEPER, VANCE1
	startbattle
	reloadmapafterbattle
	loadmem wVanceFightCount, 1
	clearflag ENGINE_VANCE
	end

.LoadFight1:
	loadtrainer BIRD_KEEPER, VANCE2
	startbattle
	reloadmapafterbattle
	loadmem wVanceFightCount, 2
	clearflag ENGINE_VANCE
	end

.LoadFight2:
	loadtrainer BIRD_KEEPER, VANCE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_VANCE
	checkevent EVENT_VANCE_CARBOS
	iftrue .Carbos
	checkevent EVENT_GOT_CARBOS_FROM_VANCE
	iftrue .ReceivedCarbosBefore
	scall Route44RematchGiftM
	verbosegiveitem CARBOS
	iffalse VancePackFull
	setevent EVENT_GOT_CARBOS_FROM_VANCE
	sjump Route44NumberAcceptedM

.ReceivedCarbosBefore:
	end

.Carbos:
	opentext
	writetext BirdKeeperVance2BeatenText
	waitbutton
	verbosegiveitem CARBOS
	iffalse VancePackFull
	clearevent EVENT_VANCE_CARBOS
	setevent EVENT_GOT_CARBOS_FROM_VANCE
	sjump Route44NumberAcceptedM

Route44AskNumber1M:
	jumpstd asknumber1m
	end

Route44AskNumber2M:
	jumpstd asknumber2m
	end

Route44RegisteredNumberM:
	jumpstd registerednumberm
	end

Route44NumberAcceptedM:
	jumpstd numberacceptedm
	end

Route44NumberDeclinedM:
	jumpstd numberdeclinedm
	end

Route44PhoneFullM:
	jumpstd phonefullm
	end

Route44RematchM:
	jumpstd rematchm
	end

Route44GiftM:
	jumpstd giftm
	end

Route44PackFullM:
	jumpstd packfullm
	end

VancePackFull:
	setevent EVENT_VANCE_CARBOS
	jumpstd packfullm
	end

Route44RematchGiftM:
	jumpstd rematchgiftm
	end

TrainerPsychicPhil:
	trainer PSYCHIC_T, PHIL, EVENT_BEAT_PSYCHIC_PHIL, PsychicPhilSeenText, PsychicPhilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicPhilAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherWilton1:
	trainer FISHER, WILTON1, EVENT_BEAT_FISHER_WILTON, FisherWilton1SeenText, FisherWilton1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_WILTON
	endifjustbattled
	opentext
	checkflag ENGINE_WILTON
	iftrue .WantsBattle
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue .HasItem
	checkcellnum PHONE_FISHER_WILTON
	iftrue Route44NumberAcceptedM
	checkevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext FisherWiltonHugePoliwagText
	buttonsound
	setevent EVENT_WILTON_ASKED_FOR_PHONE_NUMBER
	scall Route44AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route44AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_FISHER_WILTON
	ifequal PHONE_CONTACTS_FULL, Route44PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route44NumberDeclinedM
	gettrainername STRING_BUFFER_3, FISHER, WILTON1
	scall Route44RegisteredNumberM
	sjump Route44NumberAcceptedM

.WantsBattle:
	scall Route44RematchM
	winlosstext FisherWilton1BeatenText, 0
	readmem wWiltonFightCount
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, WILTON1
	startbattle
	reloadmapafterbattle
	loadmem wWiltonFightCount, 1
	clearflag ENGINE_WILTON
	end

.LoadFight1:
	loadtrainer FISHER, WILTON2
	startbattle
	reloadmapafterbattle
	loadmem wWiltonFightCount, 2
	clearflag ENGINE_WILTON
	end

.LoadFight2:
	loadtrainer FISHER, WILTON3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WILTON
	end

.HasItem:
	scall Route44GiftM
	checkevent EVENT_WILTON_HAS_ULTRA_BALL
	iftrue .UltraBall
	checkevent EVENT_WILTON_HAS_GREAT_BALL
	iftrue .GreatBall
	checkevent EVENT_WILTON_HAS_POKE_BALL
	iftrue .PokeBall
.UltraBall:
	verbosegiveitem ULTRA_BALL
	iffalse .Route44PackFullM
	sjump .ItemReceived

.GreatBall:
	verbosegiveitem GREAT_BALL
	iffalse .Route44PackFullM
	sjump .ItemReceived

.PokeBall:
	verbosegiveitem POKE_BALL
	iffalse .Route44PackFullM
.ItemReceived:
	clearflag ENGINE_WILTON_HAS_ITEM
	sjump Route44NumberAcceptedM

.Route44PackFullM:
	sjump Route44PackFullM

TrainerFisherEdgar:
	trainer FISHER, EDGAR, EVENT_BEAT_FISHER_EDGAR, FisherEdgarSeenText, FisherEdgarBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherEdgarAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCybil:
	trainer COOLTRAINERF, CYBIL, EVENT_BEAT_COOLTRAINERF_CYBIL, CooltrainerfCybilSeenText, CooltrainerfCybilBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCybilAfterBattleText
	waitbutton
	closetext
	end

TrainerPokemaniacZach:
	trainer POKEMANIAC, ZACH, EVENT_BEAT_POKEMANIAC_ZACH, PokemaniacZachSeenText, PokemaniacZachBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokemaniacZachAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAllen:
	trainer COOLTRAINERM, ALLEN, EVENT_BEAT_COOLTRAINERM_ALLEN, CooltrainermAllenSeenText, CooltrainermAllenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAllenAfterBattleText
	waitbutton
	closetext
	end

Route44Sign1:
	jumptext Route44Sign1Text

Route44Sign2:
	jumptext Route44Sign2Text

Route44FruitTree:
	fruittree FRUITTREE_ROUTE_44

Route44MaxRevive:
	itemball MAX_REVIVE

Route44UltraBall:
	itemball ULTRA_BALL

Route44MaxRepel:
	itemball MAX_REPEL

Route44HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_44_HIDDEN_ELIXER

FisherWilton1SeenText:
	text "Oh no! Mi hai fat-"
	line "to perdere un"
	cont "POLIWAG!"

	para "E ora come pensi"
	line "di rimediare?"
	done

FisherWilton1BeatenText:
	text "Come non detto."
	done

FisherWiltonHugePoliwagText:
	text "Il POLIWAG che è"
	line "scappato era…"
	cont "enorme!"

	para "Sarà stato lungo"
	line "almeno 5 metri!"
	done

FisherEdgarSeenText:
	text "Pesco finché non"
	line "ne posso più."

	para "E combatto sempre"
	line "fino a crollare."

	para "È questo il mio"
	line "rapporto con i"
	cont "#MON."
	done

FisherEdgarBeatenText:
	text "Uffi…"
	line "Non è giusto."
	done

FisherEdgarAfterBattleText:
	text "Ho vinto 100 volte"
	line "e perso 101."

	para "Non lotterò più"
	line "per un bel pezzo."
	done

BirdKeeperVance1SeenText:
	text "Sai qualcosa dei"
	line "#MON uccelli"
	cont "leggendari?"
	done

BirdKeeperVance1BeatenText:
	text "Uauh! Sei un osso"
	line "duro!"
	done

BirdKeeperVanceLegendaryBirdsText:
	text "ARTICUNO, ZAPDOS e"
	line "MOLTRES sono i tre"

	para "#MON uccelli"
	line "leggendari."

	para "Ma so che ci sono"
	line "anche altri uc-"
	cont "celli leggendari."
	done

BirdKeeperVance2BeatenText:
	text "Ma perché non"
	line "riesco mai a"
	cont "batterti?!"

	para "Ah, ecco a te. È"
	line "il regalo che non"

	para "t'ho potuto dare"
	line "la volta scorsa."
	done

PsychicPhilSeenText:
	text "Vincerò io,"
	line "di sicuro!"
	done

PsychicPhilBeatenText:
	text "Arrrg… Sono"
	line "sotto shock…"
	done

PsychicPhilAfterBattleText:
	text "È importante che"
	line "tu abbia"
	cont "determinazione."
	done

PokemaniacZachSeenText:
	text "Farei qualsiasi"
	line "cosa per mettere"
	cont "le mani su di un"
	cont "#MON raro!"
	done

PokemaniacZachBeatenText:
	text "Ah, come mi"
	line "piacciono i"
	cont "tuoi #MON!"
	done

PokemaniacZachAfterBattleText:
	text "Se un #MON"
	line "ha colori inusuali"

	para "ha molto più"
	line "valore."

	para "Come? Pensi che"
	line "non sia vero?"
	done

CooltrainermAllenSeenText:
	text "Si capisce subito"
	line "che ci sai fare."

	para "Io ci so fare con"
	line "i #MON, e so"
	cont "che sei in gamba"
	cont "anche tu!"
	done

CooltrainermAllenBeatenText:
	text "Ah! Una sconfitta"
	line "totale!"
	done

CooltrainermAllenAfterBattleText:
	text "Uauh! Hai molte"
	line "MEDAGLIE."

	para "Sei un osso duro,"
	line "non c'è dubbio."

	para "Sai se ANGELO"
	line "della PALESTRA di"

	para "AMARANTOPOLI è"
	line "ancora in forma?"

	para "Me le ha davvero"
	line "suonate!"
	done

CooltrainerfCybilSeenText:
	text "Sembri forte."

	para "I buoni allenatori"
	line "si riconoscono tra"
	cont "di loro!"
	done

CooltrainerfCybilBeatenText:
	text "No! Non puoi"
	line "farmi questo!"
	done

CooltrainerfCybilAfterBattleText:
	text "Tutti migliorano"
	line "attraverso molte"
	cont "lotte."

	para "Ho combattuto mol-"
	line "to per diventare"
	cont "ciò che sono: un"
	cont "FANTALLENATORE."
	done

Route44Sign1Text:
	text "PERCORSO 44"
	line "Per la VIA GELATA"
	done

Route44Sign2Text:
	text "PERCORSO 44"

	para "MOGANIA -"
	line "EBANOPOLI"
	done

Route44_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 56,  7, ICE_PATH_1F, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 53,  7, BGEVENT_READ, Route44Sign1
	bg_event  6, 10, BGEVENT_READ, Route44Sign2
	bg_event 32,  9, BGEVENT_ITEM, Route44HiddenElixer

	db 11 ; object events
	object_event 35,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherWilton1, -1
	object_event 19, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherEdgar, -1
	object_event 10,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicPhil, -1
	object_event 43,  2, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPokemaniacZach, -1
	object_event 51,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperVance1, -1
	object_event 41, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainermAllen, -1
	object_event 31, 14, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerfCybil, -1
	object_event  9,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route44FruitTree, -1
	object_event 30,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44MaxRevive, EVENT_ROUTE_44_MAX_REVIVE
	object_event 45,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44UltraBall, EVENT_ROUTE_44_ULTRA_BALL
	object_event 14,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route44MaxRepel, EVENT_ROUTE_44_MAX_REPEL
