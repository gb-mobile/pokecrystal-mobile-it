	object_const_def ; object_event constants
	const ROUTE36_YOUNGSTER1
	const ROUTE36_YOUNGSTER2
	const ROUTE36_WEIRD_TREE
	const ROUTE36_LASS1
	const ROUTE36_FISHER
	const ROUTE36_FRUIT_TREE
	const ROUTE36_ARTHUR
	const ROUTE36_FLORIA
	const ROUTE36_SUICUNE

Route36_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE36_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE36_SUICUNE

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .ArthurCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ArthurCallback:
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE36_ARTHUR
	return

.ArthurAppears:
	appear ROUTE36_ARTHUR
	return

Route36SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	turnobject PLAYER, UP
	applymovement ROUTE36_SUICUNE, Route36SuicuneMovement
	disappear ROUTE36_SUICUNE
	turnobject PLAYER, DOWN
	pause 10
	setscene SCENE_ROUTE36_NOTHING
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE
	end

SudowoodoScript:
	checkitem SQUIRTBOTTLE
	iftrue .Fight

	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	end

.Fight:
	opentext
	writetext UseSquirtbottleText
	yesorno
	iffalse DidntUseSquirtbottleScript
	closetext
WateredWeirdTreeScript:: ; export (for when you use Squirtbottle from pack)
	opentext
	writetext UsedSquirtbottleText
	waitbutton
	closetext
	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	opentext
	writetext SudowoodoAttackedText
	waitbutton
	closetext
	loadwildmon SUDOWOODO, 20
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	ifequal DRAW, DidntCatchSudowoodo
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	reloadmapafterbattle
	end

DidntUseSquirtbottleScript:
	closetext
	end

DidntCatchSudowoodo:
	reloadmapafterbattle
	applymovement ROUTE36_WEIRD_TREE, WeirdTreeMovement_Flee
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	special LoadUsedSpritesGFX
	special RefreshSprites
	end

Route36FloriaScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iftrue .SecondTimeTalking
	setevent EVENT_MET_FLORIA
	writetext FloriaText1
	waitbutton
	closetext
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	readvar VAR_FACING
	ifequal UP, .Up
	applymovement ROUTE36_FLORIA, FloriaMovement1
	disappear ROUTE36_FLORIA
	end

.Up:
	applymovement ROUTE36_FLORIA, FloriaMovement2
	disappear ROUTE36_FLORIA
	end

.SecondTimeTalking:
	writetext FloriaText2
	waitbutton
	closetext
	end

Route36RockSmashGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .AlreadyGotRockSmash
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext RockSmashGuyText1
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext RockSmashGuyText2
	buttonsound
	verbosegiveitem TM_ROCK_SMASH
	iffalse .NoRoomForTM
	setevent EVENT_GOT_TM08_ROCK_SMASH
.AlreadyGotRockSmash:
	writetext RockSmashGuyText3
	waitbutton
.NoRoomForTM:
	closetext
	end

Route36LassScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue .ClearedSudowoodo
	writetext Route36LassPCCText
	waitbutton
	closetext
	end

.ClearedSudowoodo:
	writetext Route36LassText_ClearedSudowoodo
	waitbutton
	closetext
	end

TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_ALAN
	endifjustbattled
	opentext
	checkflag ENGINE_ALAN
	iftrue .ChooseRematch
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .GiveFireStone
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext UnknownText_0x1947aa
	buttonsound
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall .RegisteredNumber
	sjump .NumberAccepted

.ChooseRematch:
	scall .Rematch
	winlosstext SchoolboyAlan1BeatenText, 0
	readmem wAlanFightCount
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
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 1
	clearflag ENGINE_ALAN
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 2
	clearflag ENGINE_ALAN
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 3
	clearflag ENGINE_ALAN
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	reloadmapafterbattle
	loadmem wAlanFightCount, 4
	clearflag ENGINE_ALAN
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN
	end

.GiveFireStone:
	scall .Gift
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	clearflag ENGINE_ALAN_HAS_FIRE_STONE
	setevent EVENT_ALAN_GAVE_FIRE_STONE
	sjump .NumberAccepted

.BagFull:
	sjump .PackFull

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

.Gift:
	jumpstd giftm
	end

.PackFull:
	jumpstd packfullm
	end

TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	buttonsound
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	buttonsound
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route36Sign:
	jumptext Route36SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route36TrainerTips1:
	jumptext Route36TrainerTips1Text

Route36TrainerTips2:
	jumptext Route36TrainerTips2Text

Route36FruitTree:
	fruittree FRUITTREE_ROUTE_36

SudowoodoShakeMovement:
	tree_shake ; shake
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end

FloriaMovement1:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

FloriaMovement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route36SuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

UseSquirtbottleText:
	text "È lo strano"
	line "albero. Usi"
	cont "l'ANNAFFIATOIO?"
	done

UsedSquirtbottleText:
	text "<PLAYER> usa"
	line "l'ANNAFFIATOIO."
	done

SudowoodoAttackedText:
	text "Lo strano albero"
	line "non gradisce"
	cont "l'ANNAFFIATOIO!"

	para "Lo strano albero"
	line "ti sta attaccando!"
	done

FloriaText1:
	text "Sono FLORIA, la"
	line "FIORISTA!"

	para "Ascolta!"

	para "Quando ho provato"
	line "a bagnare quell'"
	cont "albero ballerino,"

	para "s'è messo a"
	line "saltare!"

	para "Credo che sia un"
	line "#MON."

	para "Se lo si annaffia"
	line "per bene, sono"

	para "certa che perderà"
	line "il travestimento!"

	para "Voglio chiedere a"
	line "mia sorella di"
	cont "prestarmi"
	cont "l'ANNAFFIATOIO."
	done

FloriaText2:
	text "Ho raccontato a"
	line "mia sorella dell'"

	para "albero ballerino:"
	line "dice che è"
	cont "pericoloso!"

	para "Ma se batto CHIARA"
	line "penso che mi"

	para "presterà"
	line "l'ANNAFFIATOIO…"
	done

RockSmashGuyText1:
	text "Che tristezza!"

	para "Volevo abbattere"
	line "l'albero"

	para "tirandogli un"
	line "bel pugno."

	para "Ma non ce l'ho"
	line "fatta! Che frana!"
	done

RockSmashGuyText2:
	text "Hai tolto di mezzo"
	line "quell'albero"
	cont "stregato?"

	para "Complimenti!"
	line "Voglio farti un"
	cont "regalo."
	done

UnknownText_0x19451a:
	text "<PLAYER> riceve"
	line "MT08."
	done

RockSmashGuyText3:
	text "Si tratta di"
	line "SPACCAROCCIA."

	para "Può frantumare la"
	line "roccia con un"

	para "solo colpo ben"
	line "piazzato."

	para "Se trovi delle"
	line "rocce, non devi"
	cont "fare altro che"
	cont "frantumarle."
	done

Route36LassPCCText:
	text "C'è uno strano"
	line "albero che blocca"
	cont "la strada per"
	cont "FIORDOROPOLI."

	para "Volevo vedere"
	line "l'enorme CENTRO"

	para "#MON che hanno"
	line "appena aperto…"
	done

Route36LassText: ; Unused, English version of the above dialog.
	text "Uno strano albero"
	line "blocca la strada"
	cont "per FIORDOROPOLI."

	para "Così non posso"
	line "andare a far"

	para "spese. Bisogna"
	line "fare qualcosa!"
	done

Route36LassText_ClearedSudowoodo:
	text "L'albero stregato"
	line "è scomparso senza"
	cont "lasciare traccia."

	para "Era un #MON,"
	line "dici davvero?"
	done

PsychicMarkSeenText:
	text "Ora ti leggo il"
	line "pensiero!"
	done

PsychicMarkBeatenText:
	text "Devo aver letto"
	line "male!"
	done

PsychicMarkAfterBattleText:
	text "Sarei più forte se"
	line "potessi leggere"

	para "il pensiero degli"
	line "avversari."
	done

SchoolboyAlan1SeenText:
	text "Grazie ai miei"
	line "studi, posso"
	cont "sfidare qualsiasi"
	cont "#MON!"
	done

SchoolboyAlan1BeatenText:
	text "Ehi, devo aver"
	line "fatto un errore!"
	done

UnknownText_0x1947aa:
	text "Eppure"
	line "studio 5 ore al"
	cont "giorno."

	para "Molte cose non"
	line "si imparano sui"
	cont "libri."
	done

MeetArthurText:
	text "GIORGIO: Chi"
	line "sei?"

	para "Io sono GIORGIO"
	line "del giovedì."
	done

ArthurGivesGiftText:
	text "Tieni, prendi"
	line "questo."
	done

ArthurGaveGiftText:
	text "GIORGIO: Dovrebbe"
	line "tenerlo un"

	para "#MON"
	line "che usa attacchi"
	cont "di tipo roccia."

	para "Migliora proprio"
	line "questi attacchi."
	done

ArthurThursdayText:
	text "GIORGIO: Sono"
	line "GIORGIO del"

	para "giovedì, il"
	line "secondo maschio di"
	cont "sette fratelli e"
	cont "sorelle."
	done

ArthurNotThursdayText:
	text "GIORGIO: Ma oggi"
	line "non è giovedì,"
	cont "che peccato!"
	done

Route36SignText:
	text "PERCORSO 36"
	done

RuinsOfAlphNorthSignText:
	text "ROVINE D'ALFA"
	line "INGRESSO NORD"
	done

Route36TrainerTips1Text:
	text "CONSIGLI UTILI"

	para "Le statistiche dei"
	line "#MON variano"
	cont "anche nella stessa"
	cont "specie."

	para "Le statistiche"
	line "sono simili,"
	cont "all'inizio."

	para "Ma le differenze"
	line "verranno fuori"

	para "quando i #MON"
	line "cresceranno."
	done

Route36TrainerTips2Text:
	text "CONSIGLI UTILI"

	para "Con FOSSA puoi"
	line "tornare all'"
	cont "ingresso di"
	cont "qualsiasi posto."

	para "È utile quando"
	line "si esplorano"

	para "grotte o altri"
	line "luoghi."
	done

Route36_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 18,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event 18,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 47, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 48, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2

	db 2 ; coord events
	coord_event 20,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 22,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript

	db 4 ; bg events
	bg_event 29,  1, BGEVENT_READ, Route36TrainerTips2
	bg_event 45, 11, BGEVENT_READ, RuinsOfAlphNorthSign
	bg_event 55,  7, BGEVENT_READ, Route36Sign
	bg_event 21,  7, BGEVENT_READ, Route36TrainerTips1

	db 9 ; object events
	object_event 20, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicMark, -1
	object_event 31, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 35,  9, SPRITE_WEIRD_TREE, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SudowoodoScript, EVENT_ROUTE_36_SUDOWOODO
	object_event 51,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 44,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript, -1
	object_event 21,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36FruitTree, -1
	object_event 46,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event 33, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route36FloriaScript, EVENT_FLORIA_AT_SUDOWOODO
	object_event 21,  6, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_ON_ROUTE_36
