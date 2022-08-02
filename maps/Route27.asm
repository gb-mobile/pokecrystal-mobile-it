	object_const_def ; object_event constants
	const ROUTE27_COOLTRAINER_M1
	const ROUTE27_COOLTRAINER_M2
	const ROUTE27_COOLTRAINER_F1
	const ROUTE27_COOLTRAINER_F2
	const ROUTE27_YOUNGSTER1
	const ROUTE27_YOUNGSTER2
	const ROUTE27_POKE_BALL1
	const ROUTE27_POKE_BALL2
	const ROUTE27_FISHER

Route27_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

FirstStepIntoKantoLeftScene:
	turnobject ROUTE27_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27_FISHER, 15
	applymovement ROUTE27_FISHER, MovementData_0x1a0a66
	sjump FirstStepIntoKantoScene_Continue

FirstStepIntoKantoRightScene:
	turnobject ROUTE27_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27_FISHER, 15
	applymovement ROUTE27_FISHER, MovementData_0x1a0a69
FirstStepIntoKantoScene_Continue:
	turnobject PLAYER, RIGHT
	opentext
	writetext Route27FisherHeyText
	buttonsound
	writetext Route27FisherText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

Route27FisherScript:
	jumptextfaceplayer Route27FisherText

TrainerPsychicGilbert:
	trainer PSYCHIC_T, GILBERT, EVENT_BEAT_PSYCHIC_GILBERT, PsychicGilbertSeenText, PsychicGilbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGilbertAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperJose2:
	trainer BIRD_KEEPER, JOSE2, EVENT_BEAT_BIRD_KEEPER_JOSE2, BirdKeeperJose2SeenText, BirdKeeperJose2BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_BIRDKEEPER_JOSE
	endifjustbattled
	opentext
	checkflag ENGINE_JOSE
	iftrue .WantsBattle
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue .HasStarPiece
	checkcellnum PHONE_BIRDKEEPER_JOSE
	iftrue .NumberAccepted
	checkevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext BirdKeeperJose2AfterBattleText
	buttonsound
	setevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_BIRDKEEPER_JOSE
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, JOSE2
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext BirdKeeperJose2BeatenText, 0
	readmem wJoseFightCount
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
	loadtrainer BIRD_KEEPER, JOSE2
	startbattle
	reloadmapafterbattle
	loadmem wJoseFightCount, 1
	clearflag ENGINE_JOSE
	end

.LoadFight1:
	loadtrainer BIRD_KEEPER, JOSE1
	startbattle
	reloadmapafterbattle
	loadmem wJoseFightCount, 2
	clearflag ENGINE_JOSE
	end

.LoadFight2:
	loadtrainer BIRD_KEEPER, JOSE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOSE
	end

.HasStarPiece:
	scall .Gift
	verbosegiveitem STAR_PIECE
	iffalse .NoRoom
	clearflag ENGINE_JOSE_HAS_STAR_PIECE
	sjump .NumberAccepted

.NoRoom:
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

TrainerCooltrainermBlake:
	trainer COOLTRAINERM, BLAKE, EVENT_BEAT_COOLTRAINERM_BLAKE, CooltrainermBlakeSeenText, CooltrainermBlakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBlakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBrian:
	trainer COOLTRAINERM, BRIAN, EVENT_BEAT_COOLTRAINERM_BRIAN, CooltrainermBrianSeenText, CooltrainermBrianBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBrianAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfReena:
	trainer COOLTRAINERF, REENA1, EVENT_BEAT_COOLTRAINERF_REENA, CooltrainerfReenaSeenText, CooltrainerfReenaBeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_COOLTRAINERF_REENA
	endifjustbattled
	opentext
	checkflag ENGINE_REENA
	iftrue .WantsBattle
	checkcellnum PHONE_COOLTRAINERF_REENA
	iftrue .NumberAccepted
	checkevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	iftrue .AskedAlready
	writetext CooltrainerfReenaAfterBattleText
	buttonsound
	setevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskedAlready:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_COOLTRAINERF_REENA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	scall .RegisteredNumber
	sjump .NumberAccepted

.WantsBattle:
	scall .Rematch
	winlosstext CooltrainerfReenaBeatenText, 0
	readmem wReenaFightCount
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
	loadtrainer COOLTRAINERF, REENA1
	startbattle
	reloadmapafterbattle
	loadmem wReenaFightCount, 1
	clearflag ENGINE_REENA
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, REENA2
	startbattle
	reloadmapafterbattle
	loadmem wReenaFightCount, 2
	clearflag ENGINE_REENA
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, REENA3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_REENA
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

TrainerCooltrainerfMegan:
	trainer COOLTRAINERF, MEGAN, EVENT_BEAT_COOLTRAINERF_MEGAN, CooltrainerfMeganSeenText, CooltrainerfMeganBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfMeganAfterBattleText
	waitbutton
	closetext
	end

TohjoFallsSign:
	jumptext TohjoFallsSignText

Route27TMSolarbeam:
	itemball TM_SOLARBEAM

Route27RareCandy:
	itemball RARE_CANDY

MovementData_0x1a0a66:
	step LEFT
	step LEFT
	step_end

MovementData_0x1a0a69:
	step LEFT
	step_end

Route27FisherHeyText:
	text "Ehi!"
	done

Route27FisherText:
	text "Sai cosa hai"
	line "appena fatto?"

	para "Hai appena messo"
	line "piede in KANTO."

	para "Controlla la MAPPA"
	line "nel #GEAR!"
	done

CooltrainermBlakeSeenText:
	text "Mi sembri"
	line "piuttosto forte!"
	cont "Lottiamo!"
	done

CooltrainermBlakeBeatenText:
	text "Ehi!"
	done

CooltrainermBlakeAfterBattleText:
	text "Se supererai"
	line "questo duro"

	para "viaggio, scoprirai"
	line "la verità!"

	para "Ehm, scusa,"
	line "intendo dire:"
	cont "qualcosa di"
	cont "eccezionale."
	done

CooltrainermBrianSeenText:
	text "Sei in gamba,"
	line "vero?"
	done

CooltrainermBrianBeatenText:
	text "Proprio come"
	line "immaginavo!"
	done

CooltrainermBrianAfterBattleText:
	text "Un buon allenatore"
	line "riesce sempre a"
	cont "riconoscere"
	cont "chi ha la sua"
	cont "stessa stoffa!"
	done

CooltrainerfReenaSeenText:
	text "Non sottovalutare"
	line "i #MON selva-"
	cont "tici che girano"
	cont "da queste parti!"
	done

CooltrainerfReenaBeatenText:
	text "Ah, ma allora sei"
	line "proprio forte!"
	done

CooltrainerfReenaAfterBattleText:
	text "Sei ancora giovane"
	line "ma è meglio non"

	para "sottovalutarti."
	done

CooltrainerfMeganSeenText:
	text "È raro che capiti"
	line "qualcuno da queste"
	cont "parti."

	para "Ti alleni con me?"
	done

CooltrainerfMeganBeatenText:
	text "Ah! Ma sei proprio"
	line "forte!"
	done

CooltrainerfMeganAfterBattleText:
	text "Stavo paragonando"
	line "i #MON prima e"
	cont "dopo l'evoluzione."

	para "L'evoluzione rende"
	line "i #MON molto"
	cont "più forti."

	para "Ma dopo l'evolu-"
	line "zione imparano le"
	cont "nuove mosse molto"
	cont "più tardi."
	done

PsychicGilbertSeenText:
	text "Non dire nulla!"

	para "Lascia che"
	line "indovini a cosa"
	cont "stai pensando!"

	para "Mmmmmmm…"

	para "Lo so! Pensi alla"
	line "sfida alla LEGA"
	cont "#MON!"
	done

PsychicGilbertBeatenText:
	text "È troppo per me!"
	done

PsychicGilbertAfterBattleText:
	text "Con la tua stoffa,"
	line "ti farai valere"
	cont "alla LEGA."

	para "Questa è la mia"
	line "predizione."
	done

BirdKeeperJose2SeenText:
	text "Tuiit! Tuiit!"
	line "Tituiit!"
	done

BirdKeeperJose2BeatenText:
	text "Tuiiit!"
	done

BirdKeeperJose2AfterBattleText:
	text "Gli AVICOLTORI"
	line "mimano il verso"

	para "dei #MON"
	line "uccello per"
	cont "comandarli."
	done

TohjoFallsSignText:
	text "CASCATE TOHJO"

	para "Il collegamento"
	line "tra KANTO e JOHTO"
	done

Route27_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 33,  7, ROUTE_27_SANDSTORM_HOUSE, 1
	warp_event 26,  5, TOHJO_FALLS, 1
	warp_event 36,  5, TOHJO_FALLS, 2

	db 2 ; coord events
	coord_event 18, 10, SCENE_DEFAULT, FirstStepIntoKantoLeftScene
	coord_event 19, 10, SCENE_DEFAULT, FirstStepIntoKantoRightScene

	db 1 ; bg events
	bg_event 25,  7, BGEVENT_READ, TohjoFallsSign

	db 9 ; object events
	object_event 48,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermBlake, -1
	object_event 58,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermBrian, -1
	object_event 72, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfReena, -1
	object_event 37,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfMegan, -1
	object_event 65,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicGilbert, -1
	object_event 58, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperJose2, -1
	object_event 60, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27TMSolarbeam, EVENT_ROUTE_27_TM_SOLARBEAM
	object_event 53, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27RareCandy, EVENT_ROUTE_27_RARE_CANDY
	object_event 21, 10, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 3, Route27FisherScript, -1
