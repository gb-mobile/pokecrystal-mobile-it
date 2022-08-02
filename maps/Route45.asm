	object_const_def ; object_event constants
	const ROUTE45_POKEFAN_M1
	const ROUTE45_POKEFAN_M2
	const ROUTE45_POKEFAN_M3
	const ROUTE45_POKEFAN_M4
	const ROUTE45_BLACK_BELT
	const ROUTE45_COOLTRAINER_M
	const ROUTE45_COOLTRAINER_F
	const ROUTE45_FRUIT_TREE
	const ROUTE45_POKE_BALL1
	const ROUTE45_POKE_BALL2
	const ROUTE45_POKE_BALL3
	const ROUTE45_POKE_BALL4
	const ROUTE45_YOUNGSTER

Route45_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBlackbeltKenji:
	trainer BLACKBELT_T, KENJI3, EVENT_BEAT_BLACKBELT_KENJI, BlackbeltKenji3SeenText, BlackbeltKenji3BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BLACKBELT_KENJI
	endifjustbattled
	opentext
	checkcellnum PHONE_BLACKBELT_KENJI
	iftrue .Registered
	checkevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	special SampleKenjiBreakCountdown
	writetext BlackbeltKenjiAfterBattleText
	waitbutton
	setevent EVENT_KENJI_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_BLACKBELT_KENJI
	ifequal PHONE_CONTACTS_FULL, Route45PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route45NumberDeclinedM
	gettrainername STRING_BUFFER_3, BLACKBELT_T, KENJI3
	scall Route45RegisteredNumberM
	sjump Route45NumberAcceptedM

.Registered:
	readvar VAR_KENJI_BREAK
	ifnotequal 1, Route45NumberAcceptedM
	checktime MORN
	iftrue .Morning
	checktime NITE
	iftrue .Night
	checkevent EVENT_KENJI_ON_BREAK
	iffalse Route45NumberAcceptedM
	scall Route45GiftM
	verbosegiveitem PP_UP
	iffalse .NoRoom
	clearevent EVENT_KENJI_ON_BREAK
	special SampleKenjiBreakCountdown
	sjump Route45NumberAcceptedM

.Morning:
	writetext BlackbeltKenjiMorningText
	waitbutton
	closetext
	end

.Night:
	writetext BlackbeltKenjiNightText
	waitbutton
	closetext
	end

.NoRoom:
	sjump Route45PackFullM

Route45AskNumber1M:
	jumpstd asknumber1m
	end

Route45AskNumber2M:
	jumpstd asknumber2m
	end

Route45RegisteredNumberM:
	jumpstd registerednumberm
	end

Route45NumberAcceptedM:
	jumpstd numberacceptedm
	end

Route45NumberDeclinedM:
	jumpstd numberdeclinedm
	end

Route45PhoneFullM:
	jumpstd phonefullm
	end

Route45RematchM:
	jumpstd rematchm
	end

Route45GiftM:
	jumpstd giftm
	end

Route45PackFullM:
	jumpstd packfullm
	end

HikerParryHasIron:
	setevent EVENT_PARRY_IRON
	jumpstd packfullm
	end

Route45RematchGiftM:
	jumpstd rematchgiftm
	end

TrainerHikerErik:
	trainer HIKER, ERIK, EVENT_BEAT_HIKER_ERIK, HikerErikSeenText, HikerErikBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerErikAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerMichael:
	trainer HIKER, MICHAEL, EVENT_BEAT_HIKER_MICHAEL, HikerMichaelSeenText, HikerMichaelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerMichaelAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerParry:
	trainer HIKER, PARRY3, EVENT_BEAT_HIKER_PARRY, HikerParry3SeenText, HikerParry3BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_HIKER_PARRY
	endifjustbattled
	opentext
	checkflag ENGINE_PARRY
	iftrue .WantsBattle
	checkcellnum PHONE_HIKER_PARRY
	iftrue Route45NumberAcceptedM
	checkevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext HikerParryAfterBattleText
	buttonsound
	setevent EVENT_PARRY_ASKED_FOR_PHONE_NUMBER
	scall Route45AskNumber1M
	sjump .AskForNumber

.AskedAlready:
	scall Route45AskNumber2M
.AskForNumber:
	askforphonenumber PHONE_HIKER_PARRY
	ifequal PHONE_CONTACTS_FULL, Route45PhoneFullM
	ifequal PHONE_CONTACT_REFUSED, Route45NumberDeclinedM
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	scall Route45RegisteredNumberM
	sjump Route45NumberAcceptedM

.WantsBattle:
	scall Route45RematchM
	winlosstext HikerParry3BeatenText, 0
	readmem wParryFightCount
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
	loadtrainer HIKER, PARRY3
	startbattle
	reloadmapafterbattle
	loadmem wParryFightCount, 1
	clearflag ENGINE_PARRY
	end

.LoadFight1:
	loadtrainer HIKER, PARRY1
	startbattle
	reloadmapafterbattle
	loadmem wParryFightCount, 2
	clearflag ENGINE_PARRY
	end

.LoadFight2:
	loadtrainer HIKER, PARRY2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_PARRY
	checkevent EVENT_PARRY_IRON
	iftrue .HasIron
	checkevent EVENT_GOT_IRON_FROM_PARRY
	iftrue .GotIron
	scall Route45RematchGiftM
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump Route45NumberAcceptedM

.GotIron:
	end

.HasIron:
	opentext
	writetext HikerParryGivesIronText
	waitbutton
	verbosegiveitem IRON
	iffalse HikerParryHasIron
	clearevent EVENT_PARRY_IRON
	setevent EVENT_GOT_IRON_FROM_PARRY
	sjump Route45NumberAcceptedM

TrainerHikerTimothy:
	trainer HIKER, TIMOTHY, EVENT_BEAT_HIKER_TIMOTHY, HikerTimothySeenText, HikerTimothyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerTimothyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermRyan:
	trainer COOLTRAINERM, RYAN, EVENT_BEAT_COOLTRAINERM_RYAN, CooltrainermRyanSeenText, CooltrainermRyanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermRyanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfKelly:
	trainer COOLTRAINERF, KELLY, EVENT_BEAT_COOLTRAINERF_KELLY, CooltrainerfKellySeenText, CooltrainerfKellyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfKellyAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperQuentin:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CAMPER_QUENTIN
	iftrue .Defeated
	writetext CamperQuentinSeenText
	waitbutton
	closetext
	winlosstext CamperQuentinBeatenText, 0
	loadtrainer CAMPER, QUENTIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_QUENTIN
	closetext
	end

.Defeated:
	writetext CamperQuentinAfterBattleText
	waitbutton
	closetext
	end

Route45DummyScript:
	writetext Route45DummyText
	waitbutton
	closetext
	end

Route45Sign:
	jumptext Route45SignText

Route45FruitTree:
	fruittree FRUITTREE_ROUTE_45

Route45Nugget:
	itemball NUGGET

Route45Revive:
	itemball REVIVE

Route45Elixer:
	itemball ELIXER

Route45MaxPotion:
	itemball MAX_POTION

Route45HiddenPpUp:
	hiddenitem PP_UP, EVENT_ROUTE_45_HIDDEN_PP_UP

HikerErikSeenText:
	text "Devi essere"
	line "sempre all'erta!"

	para "Fammi vedere se"
	line "hai allenato bene"
	cont "i tuoi #MON!"
	done

HikerErikBeatenText:
	text "Oh, no! Ho perso!"
	done

HikerErikAfterBattleText:
	text "Tornerò indietro"
	line "per la VIA GELATA"

	para "di EBANOPOLI per"
	line "allenarmi ancora."
	done

HikerMichaelSeenText:
	text "Ehi, hai fegato!"
	line "Ma sai una cosa?"

	para "Se si parla di"
	line "coraggio, io non"
	cont "ho rivali!"
	done

HikerMichaelBeatenText:
	text "I miei #MON"
	line "non hanno avuto"
	cont "abbastanza fegato!"
	done

HikerMichaelAfterBattleText:
	text "PS-SU mi piace da"
	line "matti! Mmmm!"

	para "Non faccio che"
	line "bere quello dei"
	cont "miei #MON!"

	para "Non posso farne"
	line "a meno!"
	done

HikerParry3SeenText:
	text "I miei #MON"
	line "sono"
	cont "superattrezzati!"
	done

HikerParry3BeatenText:
	text "Aaah! Ho perso"
	line "di brutto!"
	done

HikerParryAfterBattleText:
	text "Non sono un"
	line "granché con i"
	cont "ragionamenti!"

	para "Perciò attacco"
	line "sempre di potenza!"
	done

HikerTimothySeenText:
	text "Perché scalo le"
	line "montagne?"

	para "Perché sono"
	line "sul mio cammino."

	para "Perché alleno i"
	line "#MON?"

	para "Perché sono"
	line "sul mio cammino."
	done

HikerTimothyBeatenText:
	text "Le sconfitte…"
	line "Anche loro sono"
	cont "sul mio cammino!"
	done

HikerTimothyAfterBattleText:
	text "I #MON sono"
	line "la miglior cosa"

	para "che mi potesse"
	line "accadere."
	done

HikerParryGivesIronText:
	text "Non riesco proprio"
	line "a vincere!"

	para "Sei grande!"

	para "Ah, prendi questo:"
	line "è il regalo che"

	para "non t'ho dato"
	line "l'ultima volta che"
	cont "ci siamo visti."
	done

BlackbeltKenji3SeenText:
	text "Mi stavo allenando"
	line "in solitudine."

	para "Guarda il"
	line "frutto della"
	cont "mia fatica!"
	done

BlackbeltKenji3BeatenText:
	text "Aaargh!"
	done

BlackbeltKenjiAfterBattleText:
	text "Qui servono"
	line "estremi rimedi."

	para "Devo andare sui"
	line "monti ad allenarmi"
	cont "in solitudine."
	done

BlackbeltKenjiMorningText:
	text "M'alleno ancora un"
	line "po', poi vado a"
	cont "mangiare."
	done

BlackbeltKenjiNightText:
	text "A pranzo ci siamo"
	line "riposati un po',"

	para "così ora siamo"
	line "di nuovo pronti"
	cont "per lottare!"

	para "Ora ci alleneremo"
	line "di nuovo!"
	done

CooltrainermRyanSeenText:
	text "Che idee hai su"
	line "come allevare i"
	cont "#MON?"
	done

CooltrainermRyanBeatenText:
	text "Hai tutto il"
	line "mio rispetto."
	done

CooltrainermRyanAfterBattleText:
	text "Vedo che hai molta"
	line "cura dei tuoi"
	cont "#MON."

	para "Il legame che sai"
	line "creare ti toglierà"
	cont "sempre dai guai."
	done

CooltrainerfKellySeenText:
	text "Quale strategia di"
	line "lotta usi?"

	para "È stupido usare"
	line "sempre mosse"
	cont "potenti."
	done

CooltrainerfKellyBeatenText:
	text "Ok, ho perso."
	done

CooltrainerfKellyAfterBattleText:
	text "Non sono per le"
	line "mosse troppo"
	cont "potenti."

	para "Voglio vincere,"
	line "ma senza far male"
	cont "ai #MON."
	done

Route45DummyText:
	text "Sono davvero"
	line "forte!"

	para "C'è qualcuno a cui"
	line "posso dimostrare"
	cont "la mia forza?"
	done

CamperQuentinSeenText:
	text "Sono forte,"
	line "davvero!"
	done

CamperQuentinBeatenText:
	text "Alla TORRE LOTTA"
	line "me la sono cavata"
	cont "benissimo…"
	done

CamperQuentinAfterBattleText:
	text "Hai già lottato"
	line "alla TORRE LOTTA?"

	para "Non ho mai perso"
	line "laggiù, ma…"
	done

Route45SignText:
	text "PERCORSO 45"
	line "VIA MONTUOSA"
	done

Route45_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  2,  5, DARK_CAVE_BLACKTHORN_ENTRANCE, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event 10,  4, BGEVENT_READ, Route45Sign
	bg_event 13, 80, BGEVENT_ITEM, Route45HiddenPpUp

	db 13 ; object events
	object_event 10, 16, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerErik, -1
	object_event 15, 65, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerMichael, -1
	object_event  5, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerHikerParry, -1
	object_event  9, 65, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerHikerTimothy, -1
	object_event 11, 50, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltKenji, -1
	object_event 17, 18, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermRyan, -1
	object_event  5, 36, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfKelly, -1
	object_event 16, 82, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route45FruitTree, -1
	object_event  6, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45Nugget, EVENT_ROUTE_45_NUGGET
	object_event  5, 66, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45Revive, EVENT_ROUTE_45_REVIVE
	object_event  6, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45Elixer, EVENT_ROUTE_45_ELIXER
	object_event  7, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route45MaxPotion, EVENT_ROUTE_45_MAX_POTION
	object_event  4, 70, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, TrainerCamperQuentin, -1
