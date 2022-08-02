	object_const_def ; object_event constants
	const ROUTE32_FISHER1
	const ROUTE32_FISHER2
	const ROUTE32_FISHER3
	const ROUTE32_YOUNGSTER1
	const ROUTE32_YOUNGSTER2
	const ROUTE32_YOUNGSTER3
	const ROUTE32_LASS1
	const ROUTE32_COOLTRAINER_M
	const ROUTE32_YOUNGSTER4
	const ROUTE32_FISHER4
	const ROUTE32_POKE_BALL1
	const ROUTE32_FISHER5
	const ROUTE32_FRIEDA
	const ROUTE32_POKE_BALL2

Route32_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_script .DummyScene2 ; SCENE_ROUTE32_NOTHING

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .Frieda

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Frieda:
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	return

.FriedaAppears:
	appear ROUTE32_FRIEDA
	return

Route32CooltrainerMScript:
	faceplayer
Route32CooltrainerMContinueScene:
	opentext
	checkevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	iftrue .GotMiracleSeed
	checkflag ENGINE_ZEPHYRBADGE
	iffalse .DontHaveZephyrBadge
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .GiveMiracleSeed
	writetext Route32CooltrainerMText_AideIsWaiting
	waitbutton
	closetext
	end

.Unreferenced:
	writetext Route32CooltrainerMText_UnusedSproutTower
	waitbutton
	closetext
	end

.GiveMiracleSeed:
	writetext Route32CooltrainerMText_HaveThisSeed
	buttonsound
	verbosegiveitem MIRACLE_SEED
	iffalse .BagFull
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	sjump .GotMiracleSeed

.DontHaveZephyrBadge:
	writetext Route32CooltrainerMText_VioletGym
	waitbutton
	closetext
	end

.GotMiracleSeed:
	writetext Route32CooltrainerMText_ExperiencesShouldBeUseful
	waitbutton
.BagFull:
	closetext
	end

Route32CooltrainerMStopsYouScene:
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext Route32CooltrainerMText_WhatsTheHurry
	waitbutton
	closetext
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	turnobject PLAYER, DOWN
	scall Route32CooltrainerMContinueScene
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset1
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset2
	end

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftrue .AlreadyHaveRoar
	writetext Text_RoarIntro
	buttonsound
	verbosegiveitem TM_ROAR
	iffalse .Finish
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	writetext Text_RoarOutro
	waitbutton
.Finish:
	closetext
	end

Route32WannaBuyASlowpokeTailScript:
	turnobject ROUTE32_FISHER4, DOWN
	turnobject PLAYER, UP
	sjump _OfferToSellSlowpokeTail

SlowpokeTailSalesmanScript:
	faceplayer
_OfferToSellSlowpokeTail:
	setscene SCENE_ROUTE32_NOTHING
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .refused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	end

.refused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	end

TrainerCamperRoland:
	trainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherJustin:
	trainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end

TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_RALPH
	endifjustbattled
	opentext
	checkflag ENGINE_RALPH
	iftrue .Rematch
	checkflag ENGINE_FISH_SWARM
	iftrue .Swarm
	checkcellnum PHONE_FISHER_RALPH
	iftrue .NumberAccepted
	checkevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext FisherRalphAfterText
	buttonsound
	setevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_RALPH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext FisherRalph1BeatenText, 0
	readmem wRalphFightCount
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
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, RALPH1
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 1
	clearflag ENGINE_RALPH
	end

.LoadFight1:
	loadtrainer FISHER, RALPH2
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 2
	clearflag ENGINE_RALPH
	end

.LoadFight2:
	loadtrainer FISHER, RALPH3
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 3
	clearflag ENGINE_RALPH
	end

.LoadFight3:
	loadtrainer FISHER, RALPH4
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 4
	clearflag ENGINE_RALPH
	end

.LoadFight4:
	loadtrainer FISHER, RALPH5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_RALPH
	end

.Swarm:
	writetext FisherRalphSwarmText
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

.RematchStd:
	jumpstd rematchm
	end

TrainerFisherHenry:
	trainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_LIZ
	endifjustbattled
	opentext
	checkflag ENGINE_LIZ
	iftrue .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftrue .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerLiz1AfterText
	buttonsound
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerLiz1BeatenText, 0
	readmem wLizFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 1
	clearflag ENGINE_LIZ
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 2
	clearflag ENGINE_LIZ
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 3
	clearflag ENGINE_LIZ
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 4
	clearflag ENGINE_LIZ
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ
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

.RematchStd:
	jumpstd rematchf
	end

TrainerYoungsterAlbert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAlbertAfterText
	waitbutton
	closetext
	end

TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end

TrainerBirdKeeperPeter:
	trainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, BirdKeeperPeterSeenText, BirdKeeperPeterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPeterAfterText
	waitbutton
	closetext
	end

FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	buttonsound
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	buttonsound
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route32GreatBall:
	itemball GREAT_BALL

Route32Repel:
	itemball REPEL

Route32Sign:
	jumptext Route32SignText

Route32RuinsSign:
	jumptext Route32RuinsSignText

Route32UnionCaveSign:
	jumptext Route32UnionCaveSignText

Route32PokecenterSign:
	jumpstd pokecentersign

Route32HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL

Route32HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION

Movement_Route32CooltrainerMPushesYouBackToViolet:
	step UP
	step UP
	step_end

Movement_Route32CooltrainerMReset1:
	step DOWN
	step_end

Movement_Route32CooltrainerMReset2:
	step RIGHT
	step_end

Route32CooltrainerMText_WhatsTheHurry:
	text "Ehi!"
	line "Dove corri?"
	done

Route32CooltrainerMText_AideIsWaiting:
	text "<PLAYER>, giusto?"
	line "Un tipo con gli"

	para "occhiali ti sta"
	line "cercando."

	para "Vai a vedere:"
	line "ti sta aspettando"

	para "al CENTRO "
	line "#MON."
	done

Route32CooltrainerMText_UnusedSproutTower:
; unused
	text "Hai visitato la"
	line "TORRE SPROUT?"

	para "Se passi da"
	line "VIOLAPOLI, dovrai"

	para "sicuramente"
	line "allenarti lì."

	para "È una tappa"
	line "obbligata per un"
	cont "allenatore: vacci,"
	cont "mi raccomando!"
	done

Route32CooltrainerMText_VioletGym:
	text "Hai visitato la"
	line "PALESTRA #MON?"

	para "Se ci vai, potrai"
	line "misurare la forza"
	cont "tua e dei #MON."

	para "È un rito di"
	line "passaggio per"
	cont "ogni allenatore!"
	done

Route32CooltrainerMText_HaveThisSeed:
	text "I tuoi #MON non"
	line "sono male."

	para "Dev'essere per"
	line "l'allenamento che"

	para "hanno fatto a"
	line "VIOLAPOLI."

	para "Quella PALESTRA"
	line "dev'essere un"

	para "allenamento"
	line "proprio efficace."

	para "Prendi questo come"
	line "ricordo di"
	cont "VIOLAPOLI."

	para "Migliora le mosse"
	line "di tipo erba."
	done

Route32CooltrainerMText_ExperiencesShouldBeUseful:
	text "Le tue esperienze"
	line "a VIOLAPOLI devono"

	para "esserti state"
	line "molto utili."
	done

Text_MillionDollarSlowpokeTail:
	text "Che ne dici di"
	line "una CODASLOWPOKE"

	para "gustosa e"
	line "nutriente?"

	para "Solo per te costa"
	line "¥1.000.000!"

	para "La vuoi?"
	done

Text_ThoughtKidsWereLoaded:
	text "Pensavo che i"
	line "bambini fossero"
	cont "pieni di soldi al"
	cont "giorno d'oggi…"
	done

Text_RefusedToBuySlowpokeTail:
	text "Non t'interessa?"
	line "Allora smamma!"
	done

FisherJustinSeenText:
	text "Nooo!"

	para "Hai fatto"
	line "scappare i pesci!"
	done

FisherJustinBeatenText:
	text "Splash!"
	done

FisherJustinAfterText:
	text "Calma e"
	line "concentrazione…"

	para "Per i #MON e la"
	line "pesca servono le"
	cont "stesse qualità."
	done

FisherRalph1SeenText:
	text "Sono bravo sia a"
	line "pescare che con i"
	cont "#MON."

	para "Non credo proprio"
	line "che perderò!"
	done

FisherRalph1BeatenText:
	text "Ho voluto"
	line "strafare…"
	done

FisherRalphAfterText:
	text "La pesca e i"
	line "#MON non"

	para "ti abbandoneranno"
	line "mai!"
	done

FisherRalphSwarmText:
	text "Uno, due, tre…"
	line "Aaah! Che bel"

	para "bottino!"
	line "Sono esausto! Vai"

	para "e cattura tutti i"
	line "#MON che puoi!"
	done

; --- start a segment of unused text

Route32UnusedFisher1SeenText:
	text "Prendo sempre gli"
	line "stessi #MON…"

	para "Magari una lotta"
	line "cambierà le"
	cont "cose!"
	done

Route32UnusedFisher1BeatenText:
	text "Non me ne va"
	line "bene una…"
	done

Route32UnusedFisher1AfterText:
	text "Perché il ragazzo"
	line "vicino a me prende"
	cont "#MON migliori?"
	done

Route32UnusedFisher2SeenText:
	text "Oggi sono in"
	line "forma: che ne dici"
	cont "di una lotta?"
	done

Route32UnusedFisher2BeatenText:
	text "Ah, stavolta m'è"
	line "andata male."
	done

Route32UnusedFisher2AfterText:
	text "Per prendere buoni"
	line "#MON ti serve"

	para "un AMO buono."
	done

; --- end a segment of unused texts

FisherHenrySeenText:
	text "I miei #MON?"
	line "Appena presi!"
	done

FisherHenryBeatenText:
	text "SPLASH?"
	done

FisherHenryAfterText:
	text "I #MON appena"
	line "catturati non"

	para "possono competere"
	line "con quelli che hai"
	cont "allenato tu."
	done

YoungsterAlbertSeenText:
	text "Non t'ho mai visto"
	line "da queste parti."

	para "Pensi di essere"
	line "abbastanza forte?"
	done

YoungsterAlbertBeatenText:
	text "Ma sei forte!"
	done

YoungsterAlbertAfterText:
	text "A usare i #MON"
	line "più forti sono"
	cont "capaci tutti!"

	para "Cerco di essere il"
	line "migliore usando i"
	cont "miei preferiti."
	done

YoungsterGordonSeenText:
	text "Nell'erba ho"
	line "trovato dei #-"
	cont "MON niente male."

	para "Fanno proprio al"
	line "caso mio!"
	done

YoungsterGordonBeatenText:
	text "Credevo proprio di"
	line "poter vincere!"
	done

YoungsterGordonAfterText:
	text "Nell'erba si resta"
	line "sempre impigliati!"
	done

CamperRolandSeenText:
	text "Quello sguardo…"
	line "È intrigante!"
	done

CamperRolandBeatenText:
	text "Uhmmm!"
	line "Che delusione!"
	done

CamperRolandAfterText:
	text "Per non lottare,"
	line "evita lo sguardo"
	cont "degli allenatori."
	done

PicnickerLiz1SeenText:
	text "Capisco. Certo, ma"
	line "vedi…"

	para "Vuoi lottare? Sono"
	line "al telefono!"

	para "Ok, lottiamo. Ma"
	line "facciamo presto."
	done

PicnickerLiz1BeatenText:
	text "Ah! Devo cercare"
	line "di calmarmi!"
	done

PicnickerLiz1AfterText:
	text "Mi divertivo così"
	line "tanto al telefono!"
	done

BirdKeeperPeterSeenText:
	text "Quella MEDAGLIA!"
	line "È di VIOLAPOLI!"

	para "Hai battuto"
	line "VALERIO?"
	done

BirdKeeperPeterBeatenText:
	text "Conosco le mie"
	line "debolezze."
	done

BirdKeeperPeterAfterText:
	text "Dovrei allenarmi"
	line "di nuovo alla"
	cont "PALESTRA di"
	cont "VIOLAPOLI."
	done

Route32UnusedText:
; unused
	text "I pescatori mi han"
	line "sgridato perché"
	cont "li disturbavo…"
	done

Text_RoarIntro:
	text "BOAAAH! LA GENTE"
	line "SCAPPA QUANDO"

	para "GRIDO! MA TU NON"
	line "ABBASSI LO SGUARDO"

	para "E QUESTO MI PIACE."
	line "PRENDI!"
	done

Text_RoarOutro:
	text "BOAAAH!"
	line "È BOATO! ANCHE I"

	para "#MON FUGGONO"
	line "SE SENTONO UN URLO"
	cont "SIMILE!"
	done

MeetFriedaText:
	text "VERONICA: Sììì!"
	line "È venerdì!"

	para "E io sono VERONICA"
	line "del venerdì."

	para "Piacere!"
	done

FriedaGivesGiftText:
	text "Eccoti un"
	line "VELENACULEO!"
	done

FriedaGaveGiftText:
	text "VERONICA: Dallo ad"
	line "un #MON con"
	cont "mosse veleno."

	para "Oh!"

	para "È terribile!"

	para "Vedrai come"
	line "migliorerà le"
	cont "mosse veleno!"
	done

FriedaFridayText:
	text "VERONICA: Quale"
	line "giorno preferisci?"

	para "Io il venerdì,"
	line "senza dubbio!"

	para "Non pensi anche tu"
	line "che sia stupendo?"
	done

FriedaNotFridayText:
	text "VERONICA: Oggi è"
	line "venerdì o no?"

	para "Gli altri giorni"
	line "mi annoiano!"
	done

Route32SignText:
	text "PERCORSO 32"

	para "VIOLAPOLI -"
	line "AZALINA"
	done

Route32RuinsSignText:
	text "ROVINE D'ALFA"
	line "INGRESSO EST"
	done

Route32UnionCaveSignText:
	text "Per la GROTTA"
	line "DI MEZZO"
	done

Route32_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4

	db 2 ; coord events
	coord_event 18,  8, SCENE_DEFAULT, Route32CooltrainerMStopsYouScene
	coord_event  7, 71, SCENE_ROUTE32_OFFER_SLOWPOKETAIL, Route32WannaBuyASlowpokeTailScript

	db 6 ; bg events
	bg_event 13,  5, BGEVENT_READ, Route32Sign
	bg_event  9,  1, BGEVENT_READ, Route32RuinsSign
	bg_event 10, 84, BGEVENT_READ, Route32UnionCaveSign
	bg_event 12, 73, BGEVENT_READ, Route32PokecenterSign
	bg_event 12, 67, BGEVENT_ITEM, Route32HiddenGreatBall
	bg_event 11, 40, BGEVENT_ITEM, Route32HiddenSuperPotion

	db 14 ; object events
	object_event  8, 49, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJustin, -1
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	object_event  6, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherHenry, -1
	object_event 12, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterAlbert, -1
	object_event  4, 63, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	object_event  3, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRoland, -1
	object_event 10, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event 19,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32CooltrainerMScript, -1
	object_event 11, 82, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperPeter, -1
	object_event  7, 70, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6, 53, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32GreatBall, EVENT_ROUTE_32_GREAT_BALL
	object_event 15, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	object_event 12, 67, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event  3, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32Repel, EVENT_ROUTE_32_REPEL
