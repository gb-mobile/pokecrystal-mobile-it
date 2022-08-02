	object_const_def ; object_event constants
	const ROUTE34_YOUNGSTER1
	const ROUTE34_YOUNGSTER2
	const ROUTE34_YOUNGSTER3
	const ROUTE34_LASS
	const ROUTE34_OFFICER
	const ROUTE34_POKEFAN_M
	const ROUTE34_GRAMPS
	const ROUTE34_DAY_CARE_MON_1
	const ROUTE34_DAY_CARE_MON_2
	const ROUTE34_COOLTRAINER_F1
	const ROUTE34_COOLTRAINER_F2
	const ROUTE34_COOLTRAINER_F3
	const ROUTE34_POKE_BALL

Route34_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	sjump .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	sjump .CheckMon1

.CheckMon1:
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalse .HideMon1
	clearevent EVENT_DAY_CARE_MON_1
	sjump .CheckMon2

.HideMon1:
	setevent EVENT_DAY_CARE_MON_1
	sjump .CheckMon2

.CheckMon2:
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalse .HideMon2
	clearevent EVENT_DAY_CARE_MON_2
	return

.HideMon2:
	setevent EVENT_DAY_CARE_MON_2
	return

DayCareManScript_Outside:
	faceplayer
	opentext
	special DayCareManOutside
	waitbutton
	closetext
	ifequal TRUE, .end_fail
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
	readvar VAR_FACING
	ifequal RIGHT, .walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
.end_fail
	end

.walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
	end

DayCareMon1Script:
	opentext
	special DayCareMon1
	closetext
	end

DayCareMon2Script:
	opentext
	special DayCareMon2
	closetext
	end

TrainerCamperTodd1:
	trainer CAMPER, TODD1, EVENT_BEAT_CAMPER_TODD, CamperTodd1SeenText, CamperTodd1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_CAMPER_TODD
	endifjustbattled
	opentext
	checkflag ENGINE_TODD
	iftrue .Rematch
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleIsOn
	checkcellnum PHONE_CAMPER_TODD
	iftrue .NumberAccepted
	checkevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext CamperTodd1AfterText
	buttonsound
	setevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber
	sjump .FinishAsk

.AskAgain:
	scall .AskNumber2
.FinishAsk:
	askforphonenumber PHONE_CAMPER_TODD
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, CAMPER, TODD1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext CamperTodd1BeatenText, 0
	readmem wToddFightCount
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
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer CAMPER, TODD1
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 1
	clearflag ENGINE_TODD
	end

.LoadFight1:
	loadtrainer CAMPER, TODD2
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 2
	clearflag ENGINE_TODD
	end

.LoadFight2:
	loadtrainer CAMPER, TODD3
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 3
	clearflag ENGINE_TODD
	end

.LoadFight3:
	loadtrainer CAMPER, TODD4
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 4
	clearflag ENGINE_TODD
	end

.LoadFight4:
	loadtrainer CAMPER, TODD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TODD
	end

.SaleIsOn:
	writetext CamperToddSaleText
	waitbutton
	closetext
	end

.AskNumber:
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

.RematchStd:
	jumpstd rematchm
	end

TrainerPicnickerGina1:
	trainer PICNICKER, GINA1, EVENT_BEAT_PICNICKER_GINA, PicnickerGina1SeenText, PicnickerGina1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_GINA
	endifjustbattled
	opentext
	checkflag ENGINE_GINA
	iftrue .Rematch
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue .LeafStone
	checkcellnum PHONE_PICNICKER_GINA
	iftrue .NumberAccepted
	checkevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerGina1AfterText
	buttonsound
	setevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .FinishAsk

.AskAgain:
	scall .AskNumber2
.FinishAsk:
	askforphonenumber PHONE_PICNICKER_GINA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, GINA1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerGina1BeatenText, 0
	readmem wGinaFightCount
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
	loadtrainer PICNICKER, GINA1
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 1
	clearflag ENGINE_GINA
	end

.LoadFight1:
	loadtrainer PICNICKER, GINA2
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 2
	clearflag ENGINE_GINA
	end

.LoadFight2:
	loadtrainer PICNICKER, GINA3
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 3
	clearflag ENGINE_GINA
	end

.LoadFight3:
	loadtrainer PICNICKER, GINA4
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 4
	clearflag ENGINE_GINA
	end

.LoadFight4:
	loadtrainer PICNICKER, GINA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GINA
	end

.LeafStone:
	scall .Gift
	verbosegiveitem LEAF_STONE
	iffalse .BagFull
	clearflag ENGINE_GINA_HAS_LEAF_STONE
	setevent EVENT_GINA_GAVE_LEAF_STONE
	sjump .NumberAccepted

.BagFull:
	sjump .PackFull

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

.RematchStd:
	jumpstd rematchf
	end

.Gift:
	jumpstd giftf
	end

.PackFull:
	jumpstd packfullf
	end

OfficerKeithScript:
	faceplayer
	opentext
	checktime NITE
	iffalse .NoFight
	checkevent EVENT_BEAT_OFFICER_KEITH
	iftrue .AfterScript
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerKeithSeenText
	waitbutton
	closetext
	winlosstext OfficerKeithWinText, 0
	loadtrainer OFFICER, KEITH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_KEITH
	closetext
	end

.AfterScript:
	writetext OfficerKeithAfterText
	waitbutton
	closetext
	end

.NoFight:
	writetext OfficerKeithDaytimeText
	waitbutton
	closetext
	end

TrainerYoungsterSamuel:
	trainer YOUNGSTER, SAMUEL, EVENT_BEAT_YOUNGSTER_SAMUEL, YoungsterSamuelSeenText, YoungsterSamuelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterSamuelAfterText
	waitbutton
	closetext
	end

TrainerYoungsterIan:
	trainer YOUNGSTER, IAN, EVENT_BEAT_YOUNGSTER_IAN, YoungsterIanSeenText, YoungsterIanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterIanAfterText
	waitbutton
	closetext
	end

TrainerPokefanmBrandon:
	trainer POKEFANM, BRANDON, EVENT_BEAT_POKEFANM_BRANDON, PokefanmBrandonSeenText, PokefanmBrandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmBrandonAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfIreneAfterText1
	waitbutton
	closetext
	end

.GotSoftSand:
	writetext CooltrainerfIreneAfterText2
	waitbutton
	closetext
	end

TrainerCooltrainerfJenn:
	trainer COOLTRAINERF, JENN, EVENT_BEAT_COOLTRAINERF_JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfJennAfterText1
	waitbutton
	closetext
	end

.GotSoftSand:
	writetext CooltrainerfJennAfterText2
	waitbutton
	closetext
	end

TrainerCooltrainerfKate:
	trainer COOLTRAINERF, KATE, EVENT_BEAT_COOLTRAINERF_KATE, CooltrainerfKateSeenText, CooltrainerfKateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfKateOfferSoftSandText
	buttonsound
	verbosegiveitem SOFT_SAND
	iffalse .BagFull
	setevent EVENT_GOT_SOFT_SAND_FROM_KATE
.GotSoftSand:
	writetext CooltrainerfKateAfterText
	waitbutton
.BagFull:
	closetext
	end

Route34IlexForestSign:
; unused
	jumptext Route34IlexForestSignText

Route34Sign:
	jumptext Route34SignText

Route34TrainerTips:
	jumptext Route34TrainerTipsText

DayCareSign:
	jumptext DayCareSignText

Route34Nugget:
	itemball NUGGET

Route34HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_34_HIDDEN_RARE_CANDY

Route34HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_34_HIDDEN_SUPER_POTION

Route34MovementData_DayCareManWalksBackInside:
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	step_end

Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	slow_step UP
	step_end

YoungsterSamuelSeenText:
	text "È qui che mi"
	line "alleno."
	done

YoungsterSamuelBeatenText:
	text "Come ho potuto"
	line "farmi battere da"
	cont "una persona di"
	cont "passaggio?!"
	done

YoungsterSamuelMobileText:
	text "Hai visitato"
	line "FIORDOROPOLI?"

	para "Hai visto com'è"
	line "cambiato il"
	cont "CENTRO #MON?"
	done

YoungsterSamuelAfterText:
	text "Devo allenarmi di"
	line "più."

	para "Altrimenti non"
	line "sarò mai un"
	cont "CAPOPALESTRA."
	done

YoungsterIanSeenText:
	text "Con i #MON sono"
	line "il migliore della"
	cont "classe!"
	done

YoungsterIanBeatenText:
	text "No! Qualcuno è più"
	line "bravo di me…"
	done

YoungsterIanAfterText:
	text "Mi alleno per"
	line "essere il"
	cont "migliore della"
	cont "classe."
	done

CamperTodd1SeenText:
	text "Credo nelle mie"
	line "capacità come"
	cont "Allenatore di"
	cont "#MON."

	para "Vuoi vedere?"
	done

CamperTodd1BeatenText:
	text "Ecco, ho mandato a"
	line "monte tutto"
	cont "l'allenamento!"
	done

CamperTodd1AfterText:
	text "Magari dovrei"
	line "portarne uno alla"

	para "PENSIONE, o usare"
	line "degli strumenti…"
	done

CamperToddSaleText:
	text "Dalla terrazza si"
	line "vede il cielo!"

	para "Che bello fare"
	line "spese così!"
	done

PicnickerGina1SeenText:
	text "Alleni i #MON?"

	para "Lottiamo: voglio"
	line "allenarmi!"
	done

PicnickerGina1BeatenText:
	text "Oh, no! Non posso"
	line "proprio vincere…"
	done

PicnickerGina1AfterText:
	text "Sei troppo forte:"
	line "non possiamo"
	cont "allenarci insieme."
	done

OfficerKeithSeenText:
	text "Chi va là?"
	line "Dove credi di"
	cont "andare?"
	done

OfficerKeithWinText:
	text "Sei un tipo in"
	line "gamba!"
	done

OfficerKeithAfterText:
	text "Oggi è tutto"
	line "tranquillo. Vedi"

	para "di stare alla"
	line "larga dai guai."
	done

OfficerKeithDaytimeText:
	text "Controllo se ci"
	line "sono individui"
	cont "sospetti."
	done

PokefanmBrandonSeenText:
	text "Ho appena ripreso"
	line "un #MON"
	cont "dalla PENSIONE."

	para "Vediamo quanto è"
	line "più forte adesso!"
	done

PokefanmBrandonBeatenText:
	text "Come ho fatto a"
	line "perdere?"
	done

PokefanmBrandonAfterText:
	text "Il mio #MON"
	line "conosce nuove"
	cont "mosse, e questo"
	cont "mi ha stupito!"

	para "Ecco perché ho"
	line "perso!"
	done

CooltrainerfIreneSeenText:
	text "LIZIA: Ci hanno"
	line "trovate!"
	done

CooltrainerfIreneBeatenText:
	text "LIZIA: Ahhh! Sei"
	line "troppo forte!"
	done

CooltrainerfIreneAfterText1:
	text "LIZIA: KATIA, mia"
	line "sorella, vorrà"
	cont "di certo sfidarti!"
	done

CooltrainerfIreneAfterText2:
	text "LIZIA: Che bella"
	line "spiaggia, vero?"

	para "È un posto segreto"
	line "quindi smamma!"
	done

CooltrainerfJennSeenText:
	text "ILI: Ehi, credi"
	line "di farla franca"
	cont "dopo aver battuto"
	cont "LIZIA?"
	done

CooltrainerfJennBeatenText:
	text "ILI: LIZIA,"
	line "KATIA, scusatemi!"
	done

CooltrainerfJennAfterText1:
	text "ILI: Ora non ti"
	line "esaltare, perché"
	cont "mia sorella KATIA"
	cont "è un osso duro!"
	done

CooltrainerfJennAfterText2:
	text "ILI: Il sole"
	line "rinvigorisce il"
	cont "corpo!"
	done

CooltrainerfKateSeenText:
	text "KATIA: Hai"
	line "trattato proprio"
	cont "male le mie"
	cont "sorelline!"
	done

CooltrainerfKateBeatenText:
	text "KATIA: Non posso"
	line "credere di aver"
	cont "perso!"
	done

CooltrainerfKateOfferSoftSandText:
	text "KATIA: Sei troppo"
	line "forte. Non avevo"
	cont "alcuna possibilità"
	cont "di vincere."

	para "Tieni! Meriti"
	line "questo."
	done

CooltrainerfKateAfterText:
	text "KATIA: Scusa per"
	line "l'aggressione."

	para "Ci hai colte di"
	line "sorpresa,"

	para "capisci? Ci hai"
	line "spaventate!"
	done

Route34IlexForestSignText:
; unused
	text "BOSCO DI LECCI"
	line "Oltre il cancello"
	done

Route34SignText:
	text "PERCORSO 34"

	para "FIORDOROPOLI -"
	line "AZALINA"

	para "BOSCO DI LECCI"
	done

Route34TrainerTipsText:
	text "CONSIGLI UTILI"

	para "Le piante di"
	line "BACCHE fanno ogni"
	cont "giorno nuovi"
	cont "frutti."

	para "Ogni tipo di"
	line "pianta produce"
	cont "una diversa BACCA."
	done

DayCareSignText:
	text "PENSIONE"

	para "Facciamo crescere"
	line "i vostri #MON!"
	done

Route34_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 13, 37, ROUTE_34_ILEX_FOREST_GATE, 1
	warp_event 14, 37, ROUTE_34_ILEX_FOREST_GATE, 2
	warp_event 11, 14, DAY_CARE, 1
	warp_event 11, 15, DAY_CARE, 2
	warp_event 13, 15, DAY_CARE, 3

	db 0 ; coord events

	db 5 ; bg events
	bg_event 12,  6, BGEVENT_READ, Route34Sign
	bg_event 13, 33, BGEVENT_READ, Route34TrainerTips
	bg_event 10, 13, BGEVENT_READ, DayCareSign
	bg_event  8, 32, BGEVENT_ITEM, Route34HiddenRareCandy
	bg_event 17, 19, BGEVENT_ITEM, Route34HiddenSuperPotion

	db 13 ; object events
	object_event 13,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperTodd1, -1
	object_event 15, 32, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterSamuel, -1
	object_event 11, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterIan, -1
	object_event 10, 26, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerGina1, -1
	object_event  9, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerKeithScript, -1
	object_event 18, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmBrandon, -1
	object_event 15, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAY_CARE_MAN_ON_ROUTE_34
	object_event 14, 18, SPRITE_DAY_CARE_MON_1, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAY_CARE_MON_1
	object_event 17, 19, SPRITE_DAY_CARE_MON_2, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAY_CARE_MON_2
	object_event 11, 48, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerfIrene, -1
	object_event  3, 48, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
	object_event  6, 51, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKate, -1
	object_event  7, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route34Nugget, EVENT_ROUTE_34_NUGGET
