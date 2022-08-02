	object_const_def ; object_event constants
	const ROUTE38_STANDING_YOUNGSTER1
	const ROUTE38_LASS
	const ROUTE38_STANDING_YOUNGSTER2
	const ROUTE38_BUENA1
	const ROUTE38_SAILOR
	const ROUTE38_FRUIT_TREE
	const ROUTE38_BUENA2

Route38_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBirdKeeperToby:
	trainer BIRD_KEEPER, TOBY, EVENT_BEAT_BIRD_KEEPER_TOBY, BirdKeeperTobySeenText, BirdKeeperTobyBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BirdKeeperTobyAfterBattleText
	waitbutton
	closetext
	end

TrainerSailorHarry:
	trainer SAILOR, HARRY, EVENT_BEAT_SAILOR_HARRY, SailorHarrySeenText, SailorHarryBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext SailorHarryAfterBattleText
	waitbutton
	closetext
	end

TrainerLassDana1:
	trainer LASS, DANA1, EVENT_BEAT_LASS_DANA, LassDana1SeenText, LassDana1BeatenText, 0, .Script

.Script
	loadvar VAR_CALLERID, PHONE_LASS_DANA
	endifjustbattled
	opentext
	checkflag ENGINE_DANA
	iftrue .DanaRematch
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue .TryGiveThunderstone
	checkcellnum PHONE_LASS_DANA
	iftrue .NumberAccepted
	checkevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	iftrue .SecondTimeAsking
	writetext UnknownText_0x1a20ec
	buttonsound
	setevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1F
	sjump .AskForPhoneNumber

.SecondTimeAsking:
	scall .AskNumber2F
.AskForPhoneNumber:
	askforphonenumber PHONE_LASS_DANA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .DeclinedPhoneNumber
	gettrainername STRING_BUFFER_3, LASS, DANA1
	scall .RegisteredPhoneNumber
	sjump .NumberAccepted

.DanaRematch:
	scall .Rematch
	winlosstext LassDana1BeatenText, 0
	readmem wDanaFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer LASS, DANA1
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 1
	clearflag ENGINE_DANA
	end

.LoadFight1:
	loadtrainer LASS, DANA2
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 2
	clearflag ENGINE_DANA
	end

.LoadFight2:
	loadtrainer LASS, DANA3
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 3
	clearflag ENGINE_DANA
	end

.LoadFight3:
	loadtrainer LASS, DANA4
	startbattle
	reloadmapafterbattle
	loadmem wDanaFightCount, 4
	clearflag ENGINE_DANA
	end

.LoadFight4:
	loadtrainer LASS, DANA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_DANA
	end

.TryGiveThunderstone:
	scall .Gift
	verbosegiveitem THUNDERSTONE
	iffalse .NoRoomForThunderstone
	clearflag ENGINE_DANA_HAS_THUNDERSTONE
	setevent EVENT_DANA_GAVE_THUNDERSTONE
	sjump .NumberAccepted

.NoRoomForThunderstone:
	sjump .PackFull

.AskNumber1F:
	jumpstd asknumber1f
	end

.AskNumber2F:
	jumpstd asknumber2f
	end

.RegisteredPhoneNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.DeclinedPhoneNumber:
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

TrainerSchoolboyChad1:
	trainer SCHOOLBOY, CHAD1, EVENT_BEAT_SCHOOLBOY_CHAD, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, 0, .Script

.Script
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_CHAD
	endifjustbattled
	opentext
	checkflag ENGINE_CHAD
	iftrue .ChadRematch
	checkcellnum PHONE_SCHOOLBOY_CHAD
	iftrue .HaveChadsNumber
	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	iftrue .SecondTimeAsking
	writetext UnknownText_0x1a200e
	buttonsound
	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	scall .AskPhoneNumber1
	sjump .AskToRegisterNumber

.SecondTimeAsking:
	scall .AskPhoneNumber2
.AskToRegisterNumber:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .SaidNo
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	scall .RegisteredChad
	sjump .HaveChadsNumber

.ChadRematch:
	scall .Rematch
	winlosstext SchoolboyChad1BeatenText, 0
	readmem wChadFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 1
	clearflag ENGINE_CHAD
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 2
	clearflag ENGINE_CHAD
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 3
	clearflag ENGINE_CHAD
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	reloadmapafterbattle
	loadmem wChadFightCount, 4
	clearflag ENGINE_CHAD
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_CHAD
	end

.AskPhoneNumber1:
	jumpstd asknumber1m
	end

.AskPhoneNumber2:
	jumpstd asknumber2m
	end

.RegisteredChad:
	jumpstd registerednumberm
	end

.HaveChadsNumber:
	jumpstd numberacceptedm
	end

.SaidNo:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.Rematch:
	jumpstd rematchm
	end

TrainerBeautyValerie:
	trainer BEAUTY, VALERIE, EVENT_BEAT_BEAUTY_VALERIE, BeautyValerieSeenText, BeautyValerieBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyValerieAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyOlivia:
	trainer BEAUTY, OLIVIA, EVENT_BEAT_BEAUTY_OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText, 0, .Script

.Script
	endifjustbattled
	opentext
	writetext BeautyOliviaAfterBattleText
	waitbutton
	closetext
	end

Route38Sign:
	jumptext Route38SignText

Route38TrainerTips:
	jumptext Route38TrainerTipsText

Route38FruitTree:
	fruittree FRUITTREE_ROUTE_38

BirdKeeperTobySeenText:
	text "Volate alti"
	line "nel cielo, miei"
	cont "amati #MON"
	cont "uccello!"
	done

BirdKeeperTobyBeatenText:
	text "Penso che"
	line "m'involerò!"
	done

BirdKeeperTobyAfterBattleText:
	text "Voglio allenarmi"
	line "a FIORLISOPOLI,"

	para "per insegnare ai"
	line "miei #MON"
	cont "a volare."
	done

SchoolboyChad1SeenText:
	text "Ti mostro quello"
	line "che ho imparato"
	cont "oggi."
	done

SchoolboyChad1BeatenText:
	text "Mi sa che non ho"
	line "studiato bene."
	done

UnknownText_0x1a200e:
	text "Devo fare così"
	line "tanti compiti che"

	para "non ho mai tempo"
	line "per i #MON."

	para "Così, quando mi"
	line "capita di giocare"
	cont "mi concentro"
	cont "molto."
	done

LassDana1SeenText:
	text "Te la cavi bene"
	line "con i #MON."

	para "Potresti darmi"
	line "qualche consiglio!"
	done

LassDana1BeatenText:
	text "Ah, è così"
	line "che si lotta!"
	done

UnknownText_0x1a20ec:
	text "Vuoi sapere una"
	line "cosa?"

	para "Il latte della"
	line "FATTORIA MUMU"
	cont "è famoso per il"
	cont "suo buon sapore."
	done

BeautyValerieSeenText:
	text "Ciao, che"
	line "persona simpatica!"

	para "Posso vedere i"
	line "tuoi #MON?"
	done

BeautyValerieBeatenText:
	text "Mi ha fatto"
	line "piacere vedere i"
	cont "tuoi #MON!"
	done

BeautyValerieAfterBattleText:
	text "Quando vedo i"
	line "#MON mi"
	cont "tranquillizzo."
	done

SailorHarrySeenText:
	text "Sono stato oltre-"
	line "mare, perciò"

	para "conosco #MON"
	line "di ogni tipo!"
	done

SailorHarryBeatenText:
	text "La tua classe è"
	line "mondiale!"
	done

SailorHarryAfterBattleText:
	text "Tutti i popoli"
	line "del mondo vivono"

	para "felici con i"
	line "#MON."
	done

BeautyOliviaSeenText:
	text "Non credi che io e"
	line "il mio #MON"
	cont "siamo stupendi?"
	done

BeautyOliviaBeatenText:
	text "Beviamo LATTE"
	line "MUMU ogni giorno."
	done

BeautyOliviaAfterBattleText:
	text "Il LATTE MUMU fa"
	line "bene e rende più"

	para "belli: peccato che"
	line "ne vendano solo"

	para "una bottiglia alla"
	line "volta."
	done

Route38SignText:
	text "PERCORSO 38"

	para "OLIVINOPOLI -"
	line "AMARANTOPOLI"
	done

Route38TrainerTipsText:
	text "CONSIGLI UTILI"

	para "Quando un #MON"
	line "si sta evolvendo,"
	cont "puoi bloccarlo."

	para "Premi B durante"
	line "l'evoluzione."

	para "Così facendo,"
	line "l'evoluzione del"
	cont "#MON si blocca."
	done

Route38_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 35,  8, ROUTE_38_ECRUTEAK_GATE, 1
	warp_event 35,  9, ROUTE_38_ECRUTEAK_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event 33,  7, BGEVENT_READ, Route38Sign
	bg_event  5, 13, BGEVENT_READ, Route38TrainerTips

	db 7 ; object events
	object_event  4,  1, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyChad1, -1
	object_event 15,  3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassDana1, -1
	object_event 12, 15, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBirdKeeperToby, -1
	object_event 19,  9, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyValerie, -1
	object_event 24,  5, SPRITE_SAILOR, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSailorHarry, -1
	object_event 12, 10, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route38FruitTree, -1
	object_event  5,  8, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBeautyOlivia, -1
