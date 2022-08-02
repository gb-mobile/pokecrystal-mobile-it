	object_const_def ; object_event constants
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_LASS1
	const GOLDENRODGYM_LASS2
	const GOLDENRODGYM_BUENA1
	const GOLDENRODGYM_BUENA2
	const GOLDENRODGYM_GYM_GUY

GoldenrodGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_GOLDENRODGYM_NOTHING
	scene_script .DummyScene1 ; SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

GoldenrodGymWhitneyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_MADE_WHITNEY_CRY
	setscene SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
.FightDone:
	opentext
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalse .StoppedCrying
	writetext WhitneyYouMeanieText
	waitbutton
	closetext
	end

.StoppedCrying:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	checkflag ENGINE_PLAINBADGE
	iftrue .GotPlainBadge
	writetext WhitneyWhatDoYouWantText
	buttonsound
	waitsfx
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	readvar VAR_BADGES
	scall GoldenrodGymActivateRockets
.GotPlainBadge:
	writetext WhitneyPlainBadgeText
	buttonsound
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext WhitneyGoodCryText
	waitbutton
.NoRoomForAttract:
	closetext
	end

GoldenrodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end

WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, BridgetWalksUpMovement
	turnobject PLAYER, DOWN
	opentext
	writetext BridgetWhitneyCriesText
	waitbutton
	closetext
	applymovement GOLDENRODGYM_LASS2, BridgetWalksAwayMovement
	setscene SCENE_GOLDENRODGYM_NOTHING
	clearevent EVENT_MADE_WHITNEY_CRY
	end

TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end

GoldenrodGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .GoldenrodGymGuyWinScript
	opentext
	writetext GoldenrodGymGuyText
	waitbutton
	closetext
	end

.GoldenrodGymGuyWinScript:
	opentext
	writetext GoldenrodGymGuyWinText
	waitbutton
	closetext
	end

GoldenrodGymStatue:
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, WHITNEY, WHITNEY1
	jumpstd gymstatue2

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

WhitneyBeforeText:
	text "Ciao, sono CHIARA!"

	para "Tutti sono nel"
	line "mondo dei #MON,"
	cont "così ci sono"
	cont "entrata anch'io."

	para "I #MON sono"
	line "carinissimi!"

	para "Vuoi lottare? Sono"
	line "forte, t'avverto!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Sigh…"

	para "… Ueeeh!"
	line "Che cattiveria!"

	para "Io stavo solo"
	line "scherzando! Come"
	cont "sei suscettibile!"
	done

WhitneyYouMeanieText:
	text "Ueeeh!"

	para "Ueeeh!"

	para "… Sigh, sigh…"
	line "… Che rabbia!"
	done

WhitneyWhatDoYouWantText:
	text "… Sigh…"

	para "Che vuoi ancora?"
	line "Una MEDAGLIA?"

	para "Ah, dimenticavo."
	line "Eccoti la MEDAGLIA"
	cont "PIANA."
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA PIANA."
	done

WhitneyPlainBadgeText:
	text "Con la MEDAGLIA"
	line "PIANA i #MON"

	para "possono usare"
	line "FORZA anche fuori"
	cont "dalla lotta."

	para "Inoltre, potenzia"
	line "la VELOCITÀ dei "
	cont "#MON."

	para "Ho ancora qualcosa"
	line "per te: tieni!"
	done

WhitneyAttractText:
	text "È ATTRAZIONE."
	line "Serve per"

	para "sfruttare appieno "
	line "il fascino dei"
	cont "#MON."

	para "Si addice ad una"
	line "carina come me,"
	cont "vero?"
	done

WhitneyGoodCryText:
	text "Piangere mi ha"
	line "fatto bene! Torna"

	para "a farmi visita, mi"
	line "raccomando!"
	done

LassCarrieSeenText:
	text "Non pensare che il"
	line "mio #MON sia"

	para "debole solo perché"
	line "è così carino!"
	done

LassCarrieBeatenText:
	text "Ehi… Ti avevo"
	line "sottovalutato…"
	done

LassCarrieAfterBattleText:
	text "Chissà se il mio"
	line "#MON mi"
	cont "trova carina?"
	done

LassBridgetSeenText:
	text "Preferisco i"
	line "#MON carini a"
	cont "quelli forti."

	para "Ma io ho #MON"
	line "forti e carini."
	done

LassBridgetBeatenText:
	text "Oh, no, no, no!"
	done

LassBridgetAfterBattleText:
	text "Provo a battere"
	line "CHIARA, ma…"
	cont "È deprimente."

	para "Però sono forte."
	line "Se perdo, dovrò"

	para "solo impegnarmi"
	line "di più!"
	done

BridgetWhitneyCriesText:
	text "Oh, no. Hai fatto"
	line "piangere CHIARA."

	para "Ma non è niente,"
	line "presto starà"

	para "meglio. Fa sempre"
	line "così quando perde."
	done

BeautyVictoriaSeenText:
	text "Sei una persona"
	line "davvero simpatica!"

	para "Ma non mi farò"
	line "intenerire!"
	done

BeautyVictoriaBeatenText:
	text "Vediamo… Oh,"
	line "è già finita?"
	done

BeautyVictoriaAfterBattleText:
	text "Uauh, ma allora"
	line "sei forte!"
	cont "Continua così!"
	done

BeautySamanthaSeenText:
	text "Vedi d'impegnarti,"
	line "o ti distruggerò!"
	done

BeautySamanthaBeatenText:
	text "No! Oh, MEOWTH,"
	line "mi dispiace!"
	done

BeautySamanthaAfterBattleText:
	text "Al mio MEOWTH ho"
	line "insegnato mosse"
	cont "per tener testa a"

	para "qualsiasi tipo."
	done

GoldenrodGymGuyText:
	text "Ehi, CAMPIONE in"
	line "erba!"

	para "Questa PALESTRA è"
	line "per allenatori di"
	cont "#MON di tipo"
	cont "normale."

	para "Ti raccomando di"
	line "usare #MON di"
	cont "tipo lotta."
	done

GoldenrodGymGuyWinText:
	text "Hai vinto? Grande!"
	line "Io ero occupato ad"
	cont "ammirare queste"
	cont "signorine."
	done

GoldenrodGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	db 1 ; coord events
	coord_event  8,  5, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING, WhitneyCriesScript

	db 2 ; bg events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	db 6 ; object events
	object_event  8,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassCarrie, -1
	object_event  9,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassBridget, -1
	object_event  0,  2, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	object_event 19,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuyScript, -1
