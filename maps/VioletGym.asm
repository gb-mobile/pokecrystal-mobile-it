	object_const_def ; object_event constants
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUY

VioletGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOTHING
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	buttonsound
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	waitbutton
	closetext
	end

.VioletGymGuyWinScript:
	writetext VioletGymGuyWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, FALKNER, FALKNER1
	jumpstd gymstatue2

FalknerIntroText:
	text "Sono VALERIO,"
	line "CAPOPALESTRA di"
	cont "VIOLAPOLI."

	para "So che qualcuno"
	line "tarpa le ali dei"

	para "#MON uccello"
	line "con una scossa"
	cont "elettrica…"

	para "Non permetterò che"
	line "qualcuno faccia un"
	cont "tale affronto ai"
	cont "miei #MON!"

	para "Ti mostrerò la"
	line "forza dei miei"

	para "magnifici #MON"
	line "uccello!"
	done

FalknerWinLossText:
	text "…No! Gli"
	line "amati #MON"
	cont "di mio padre…"

	para "E va bene. Devo"
	line "darti qualcosa!"

	para "Ecco la MEDAGLIA"
	line "ZEFIRO della LEGA"
	cont "#MON!"
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA ZEFIRO."
	done

FalknerZephyrBadgeText:
	text "La MEDAGLIA ZEFIRO"
	line "migliora l'ATTACCO"
	cont "dei #MON."

	para "Inoltre, permette"
	line "ai #MON che"

	para "hanno FLASH di"
	line "usarlo quando"
	cont "preferiscono."

	para "Puoi avere anche"
	line "questo: tieni!"
	done

FalknerTMMudSlapText:
	text "Se usi una MT, i"
	line "#MON potranno"

	para "subito imparare"
	line "una nuova mossa."

	para "Attenzione, però:"
	line "ogni MT si usa"
	cont "solo una volta!"

	para "La MT31 contiene"
	line "FANGOSBERLA."

	para "Danneggia il"
	line "nemico e ne"

	para "riduce la"
	line "precisione."

	para "Quindi è un'arma"
	line "sia offensiva che"
	cont "difensiva."
	done

FalknerFightDoneText:
	text "Incontrerai molte"
	line "PALESTRE #MON"
	cont "sulla tua strada."

	para "Metti alla prova"
	line "le tue capacità"
	cont "nelle PALESTRE."

	para "Io devo allenarmi"
	line "sodo per diventare"

	para "il più grande"
	line "Allenatore di"
	cont "#MON uccello."
	done

BirdKeeperRodSeenText:
	text "Qui ci vuole"
	line "fegato!"

	para "Ci alleniamo"
	line "giorno e notte per"

	para "diventare maestri"
	line "di #MON"
	cont "uccello."

	para "Fatti sotto!"
	done

BirdKeeperRodBeatenText:
	text "Aaah!"
	done

BirdKeeperRodAfterBattleText:
	text "Le qualità di"
	line "VALERIO non sono"
	cont "da sottovalutare."

	para "Non ti esaltare"
	line "troppo per aver"
	cont "battuto me!"
	done

BirdKeeperAbeSeenText:
	text "Vediamo se hai la"
	line "stoffa per sfidare"
	cont "VALERIO!"
	done

BirdKeeperAbeBeatenText:
	text "No, non ci posso"
	line "credere!"
	done

BirdKeeperAbeAfterBattleText:
	text "Perdere contro un"
	line "principiante è"
	cont "patetico…"
	done

VioletGymGuyText:
	text "Ciao, io non sono"
	line "un allenatore, ma"
	cont "ho un consiglio."

	para "Però devi credere:"
	line "solo così il tuo"

	para "sogno di CAMPIONE"
	line "potrà avverarsi."

	para "Mi credi? Allora"
	line "ascolta qui:"

	para "il tipo erba è"
	line "debole contro il"

	para "tipo volante. Non"
	line "dimenticarlo!"
	done

VioletGymGuyWinText:
	text "Bene: continua"
	line "così e"

	para "sarai presto"
	line "CAMPIONE."
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	db 4 ; object events
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuyScript, -1
