	object_const_def ; object_event constants
	const BATTLETOWER1F_RECEPTIONIST
	const BATTLETOWER1F_YOUNGSTER
	const BATTLETOWER1F_COOLTRAINER_F
	const BATTLETOWER1F_BUG_CATCHER
	const BATTLETOWER1F_GRANNY

BattleTower1F_MapScripts: ; offset 67096 in jp crystal
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED

	db 0 ; callbacks

.Scene0: ; 70A0
	setval BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .LeftWithoutSaving
;	ifequal $3, .SkipEverything
;	ifequal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	prioritysjump Script_ResumeBattleTowerChallenge
	end

.LeftWithoutSaving ; 70BF
	setval BATTLETOWERACTION_13
	special BattleTowerAction
	ifnotequal $00, .skip;$70CB
	prioritysjump BattleTower_LeftWithoutSaving
.skip
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_FINISHED
.Scene1:
	end

; checking the honor roll
BattleTower1FRulesSign: ; 70D8
	opentext
	writetext Text_CheckTheLeaderHonorRoll;Text_ReadBattleTowerRules
	yesorno
	iffalse .skip
	;writetext Text_BattleTowerRules
	;waitbutton
	db $0F, $78, $00
	
.skip:
	closetext
	end

BattleTower1FReceptionistScript: ;70E5
	;setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	;special BattleTowerAction
	;ifequal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext

	setval BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .idk2;$711F
	setval BATTLETOWERACTION_13
	special BattleTowerAction
	ifnotequal $00, .idk2;$711F
	setval BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal $00, .idk2;$711F
	ifequal $08, .idk1;$711B
	writetext Text_RegisterRecordOnFile_Mobile;$7709 ???
	yesorno
	iffalse .idk2;$711F
	writetext Text_SaveBeforeConnecting_Mobile; $76A1
	yesorno
	iffalse Script_BattleTowerHopeToServeYouAgain;$71E3
	special TryQuickSave
	iffalse Script_BattleTowerHopeToServeYouAgain;$71E3
	sjump Idk4;$71BB

.idk1
	writetext Text_BattleTowerWelcomesYou;???$77DC
	waitbutton

.idk2
	writetext Text_BattleTowerWelcomesYou;$72DE
	buttonsound
	setval BATTLETOWERACTION_CHECK_EXPLANATION_READ ; if new save file: bit 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	ifnotequal $0, Script_Menu_ChallengeExplanationCancel
	jump Script_BattleTowerIntroductionYesNo

Script_Menu_ChallengeExplanationCancel: ; $712F
	writetext Text_WantToGoIntoABattleRoom
	setval TRUE
	special Menu_ChallengeExplanationCancel
	ifequal 1, Script_ChooseChallenge ; 714A
	ifequal 2, UnreferencedScript_0x9e4be ; 71F1
	ifequal 3, Script_BattleTowerExplanation ; 71D8
	ifequal 5, UnreferencedScript_0x9e4ea ; $721D
	sjump Script_BattleTowerHopeToServeYouAgain ; 71E3

Script_ChooseChallenge:
	setval BATTLETOWERACTION_0D
	special BattleTowerAction
	iftrue UnreferencedScript_0x9e53b;$726E
	
;	setval BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
;	special BattleTowerAction
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writetext Text_SaveBeforeConnecting_Mobile
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
	setval BATTLETOWERACTION_SET_EXPLANATION_READ ; set 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	special BattleTowerRoomMenu
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError ; 7283
	setval BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	
	setval BATTLETOWERACTION_SAVELEVELGROUP
	special BattleTowerAction
	setval BATTLETOWERACTION_0C ; start timer?
	special BattleTowerAction
	
;	closetext
;	setval BATTLETOWERACTION_CHOOSEREWARD
;	special BattleTowerAction
;	sjump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
;	setval BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
;	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_TOWER_BATTLE_ROOM, SCENE_DEFAULT
	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_DEFAULT
	setmapscene BATTLE_TOWER_HALLWAY, SCENE_DEFAULT
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, MovementData_BattleTower1FWalkToElevator
	setval BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Idk3: ; 71B4
	writetext Text_AskRegisterRecord_Mobile;$7523
	yesorno
	iffalse Script_BattleTowerHopeToServeYouAgain;$71E3

Idk4:
	special Function170114 ; 76
	ifequal $0A, Script_BattleTowerHopeToServeYouAgain;$71E3
	ifnotequal $00, Script_MobileError;$7283
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	writetext Text_YourRegistrationIsComplete;$753F
	waitbutton
	closetext
	end

;	setval BATTLETOWERACTION_1C
;	special BattleTowerAction
;	setval BATTLETOWERACTION_GIVEREWARD
;	special BattleTowerAction
;	ifequal POTION, Script_YourPackIsStuffedFull
;	getitemname STRING_BUFFER_4, USE_SCRIPT_VAR
;	giveitem ITEM_FROM_MEM, 5
;	writetext Text_PlayerGotFive
;	setval BATTLETOWERACTION_1D
;	special BattleTowerAction
;	closetext
;	end

;Script_YourPackIsStuffedFull:
;	writetext Text_YourPackIsStuffedFull
;	waitbutton
;	closetext
;	end

Script_BattleTowerIntroductionYesNo: ; 71D1
	writetext Text_WouldYouLikeToHearAboutTheBattleTower
	yesorno
	iffalse Script_BattleTowerSkipExplanation
Script_BattleTowerExplanation:
	writetext Text_BattleTowerIntroduction_1
Script_BattleTowerSkipExplanation:
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	sjump Script_Menu_ChallengeExplanationCancel

Script_BattleTowerHopeToServeYouAgain: ; 71E3
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

UnreferencedScript_0x9e4b6: ; 71E9
	special BattleTowerMobileError
	closetext
	end

Script_WaitButton: ; 71EE
	waitbutton
	closetext
	end

; honor roll download
UnreferencedScript_0x9e4be: ; 71F1
	writetext Text_SaveBeforeConnecting_Mobile; 76A1
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	special Function1700ba
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writetext Text_ReceivedAListOfLeadersOnTheHonorRoll
	turnobject BATTLETOWER1F_RECEPTIONIST, LEFT
	writetext Text_PleaseConfirmOnThisMonitor
	waitbutton
	turnobject BATTLETOWER1F_RECEPTIONIST, DOWN
	closetext
	end

UnreferencedScript_0x9e4ea: ; 721D
	setval BATTLETOWERACTION_LEVEL_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_AMonLevelExceeds
	setval BATTLETOWERACTION_UBERS_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_MayNotEnterABattleRoomUnderL70
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	setval BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal $0, .zero
	writetext Text_CantBeRegistered_PreviousRecordDeleted
	sjump continue

.zero
	writetext Text_CantBeRegistered
continue:
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	writetext Text_SaveBeforeReentry
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	setval BATTLETOWERACTION_12
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	sjump Script_ResumeBattleTowerChallenge

UnreferencedScript_0x9e53b: ; 726E
	writetext Text_FiveDayBattleLimit_Mobile
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

Script_AMonLevelExceeds:
	writetext Text_AMonLevelExceeds
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70:
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MobileError: ; 7283
	special BattleTowerMobileError
	closetext
	end

BattleTower_LeftWithoutSaving:
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

BattleTower1FYoungsterScript:
	faceplayer
	opentext
	writetext Text_BattleTowerYoungster
	waitbutton
	closetext
	turnobject BATTLETOWER1F_YOUNGSTER, RIGHT
	end

BattleTower1FCooltrainerFScript:
	jumptextfaceplayer Text_BattleTowerCooltrainerF

BattleTower1FBugCatcherScript:
	jumptextfaceplayer Text_BattleTowerBugCatcher

BattleTower1FGrannyScript:
	jumptextfaceplayer Text_BattleTowerGranny

MovementData_BattleTower1FWalkToElevator:
	step UP
	step UP
	step UP
	step UP
	step UP
MovementData_BattleTowerHallwayPlayerEntersBattleRoom:
	step UP
	step_end

MovementData_BattleTowerElevatorExitElevator:
	step DOWN
	step_end

MovementData_BattleTowerHallwayWalkTo1020Room:
	step RIGHT
	step RIGHT
MovementData_BattleTowerHallwayWalkTo3040Room:
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_BattleTowerHallwayWalkTo90100Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo7080Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo5060Room:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerWalksIn:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut:
	turn_head UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist:
	turn_head DOWN
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent:
	turn_head RIGHT
	step_end

Text_BattleTowerWelcomesYou:
	text "La TORRE LOTTA ti"
	line "dà il benvenuto!"

	para "Se vuoi, posso"
	line "farti entrare in"
	cont "una SALA LOTTA!"
	done

Text_WantToGoIntoABattleRoom:
	text "Vuoi entrare in"
	line "una SALA LOTTA?"
	done

Text_RightThisWayToYourBattleRoom:
	text "Per la SALA LOTTA,"
	line "da questa parte."
	done

Text_BattleTowerIntroduction_1:
	text "La TORRE LOTTA è"
	line "stata costruita"
	cont "per le lotte di"
	cont "#MON."

	para "Le SALE LOTTA sono"
	line "state studiate per"

	para "ospitare le lotte"
	line "di allenatori"

	para "provenienti da"
	line "tutto il mondo."

	para "Nella TORRE LOTTA"
	line "ci sono molte"
	cont "SALE LOTTA."

	para "In ogni SALA si"
	line "trovano sette"
	cont "allenatori."

	para "Se sconfiggi tutti"
	line "i sette allenatori"

	para "di una SALA"
	line "ottenendo un buon"

	para "record, sarai il"
	line "PRIMO ALLENATORE"
	cont "di quella SALA."

	para "Tutti i MIGLIORI"
	line "ALLENATORI"

	para "entreranno per"
	line "sempre nell'ALBO"
	cont "D'ORO."

	para "You may challenge"
	line "in up to five"

	para "BATTLE ROOMS each"
	line "day."

	para "However, you may"
	line "battle only once a"

	para "day in any given"
	line "ROOM."

	para "To interrupt a"
	line "session, you must"

	para "SAVE. If not, you"
	line "won't be able to"

	para "resume your ROOM"
	line "challenge."

	para ""
	done

Text_BattleTowerIntroduction_2:
	text "La TORRE LOTTA è"
	line "una struttura che"
	cont "ospita le lotte di"

	para "#MON."
	line "Allenatori da"

	para "tutto il mondo si"
	line "sfidano nelle SALE"

	para "LOTTA. Nella TORRE"
	line "LOTTA si trovano"

	para "moltissime SALE"
	line "LOTTA. In ogni"
	cont "SALA lottano sette"

	para "allenatori. Chi li"
	line "batte tutti vince"

	para "un premio. Per"
	line "interrompere le"

	para "lotte in una SALA"
	line "e riprenderle più"

	para "tardi, occorre"
	line "salvare il gioco"

	para "(SALVA)."
	line "Altrimenti si"

	para "dovrà ricominciare"
	line "daccapo."

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:
	text "Received a list of"
	line "LEADERS on the"
	cont "HONOR ROLL."

	para ""
	done

Text_PleaseConfirmOnThisMonitor:
	text "Please confirm on"
	line "this monitor."
	done

Text_ThankYou:
	text "Grazie!"

	para ""
	done

Text_ThanksForVisiting:
	text "Grazie per la"
	line "visita!"
	done

Text_BeatenAllTheTrainers_Mobile:
	text "Congratulations!"

	para "You've beaten all"
	line "the trainers!"

	para "Your feat may be"
	line "worth registering,"

	para "<PLAYER>. With your"
	line "results, you may"

	para "be chosen as a"
	line "ROOM LEADER."

	para ""
	done

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "Congratulazioni!"

	para "Hai battuto tutti"
	line "gli allenatori!"

	para "Ecco a te un"
	line "fantastico premio!"
	done

Text_AskRegisterRecord_Mobile:
	text "Would you like to"
	line "register your"

	para "record with the"
	line "CENTER?"
	done

Text_PlayerGotFive:
	text "<PLAYER> got five"
	line "@"
	text_ram wStringBuffer4
	text "!@"
	sound_item
	text_waitbutton
	text_end

Text_YourPackIsStuffedFull:
	text "Ehi, il tuo ZAINO"
	line "è pieno zeppo."

	para "Torna dopo aver"
	line "fatto spazio."
	done

Text_YourRegistrationIsComplete:
	text "Your registration"
	line "is complete."

	para "Please come again!"
	done

Text_WeHopeToServeYouAgain:
	text "Speriamo di"
	line "rivederti presto."
	done

Text_PleaseStepThisWay:
	text "Prego, per di qui."
	done

Text_WouldYouLikeToHearAboutTheBattleTower:
	text "Vuoi qualche"
	line "informazione sulla"
	cont "TORRE LOTTA?"
	done

Text_CantBeRegistered:
	text "Il tuo risultato"
	line "nella SALA LOTTA"

	para "precedente non"
	line "si può registrare."
	cont "Va bene?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:
	text "Il tuo risultato"
	line "nella SALA LOTTA"

	para "precedente non si"
	line "può registrare."

	para "Anche il risultato"
	line "attuale andrà"
	cont "perso."
	done

Text_CheckTheLeaderHonorRoll:
	text "Check the LEADER"
	line "HONOR ROLL?"
	done

Text_ReadBattleTowerRules:
	text "Qui sono scritte"
	line "le regole della"
	cont "TORRE LOTTA. Vuoi"
	cont "leggerle?"
	done

Text_BattleTowerRules:
	text "I #MON in"
	line "squadra devono"

	para "essere tre, tutti"
	line "diversi uno"
	cont "dall'altro."

	para "Non possono tenere"
	line "gli stessi"
	cont "strumenti. Inoltre"

	para "alcuni #MON non"
	line "sono ammessi anche"

	para "se non superano il"
	line "limite di livello."
	done

Text_BattleTower_LeftWithoutSaving:
	text "Scusa, ma non hai"
	line "salvato prima di"

	para "uscire dalla SALA"
	line "LOTTA. Mi dispiace"

	para "molto, ma la sfida"
	line "non è valida."
	done

Text_YourMonWillBeHealedToFullHealth:
	text "I tuoi #MON"
	line "torneranno in"
	cont "piena forma."
	done

Text_NextUpOpponentNo:
	text "Il prossimo"
	line "avversario è il"
	cont "Nº@"
	text_ram wStringBuffer3
	text ". Dai!"
	done

Text_SaveBeforeConnecting_Mobile:
	text "Prima del"
	line "collegamento con"

	para "il CENTRO, la"
	line "sessione sarà"
	cont "salvata."
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Prima di accedere"
	line "alla SALA LOTTA,"

	para "il gioco verrà"
	line "salvato."
	done

Text_SaveAndEndTheSession:
	text "Vuoi salvare e"
	line "concludere per"
	cont "il momento?"
	done

Text_SaveBeforeReentry:
	text "Your record will"
	line "be SAVED before"

	para "you go back into"
	line "the previous ROOM."
	done

Text_CancelYourBattleRoomChallenge:
	text "Annulli la sfida"
	line "nella SALA LOTTA?"
	done

Text_RegisterRecordOnFile_Mobile:
	text "We have your"
	line "previous record on"

	para "file. Would you"
	line "like to register"
	cont "it at the CENTER?"
	done

Text_WeveBeenWaitingForYou:
	text "Ti stavamo"
	line "aspettando. Per la"

	para "SALA LOTTA, per di"
	line "qui."
	done

Text_FiveDayBattleLimit_Mobile:
	text "Puoi entrare solo"
	line "in cinque SALE"
	cont "LOTTA al giorno."

	para "Torna domani, va"
	line "bene?"
	done

Text_TooMuchTimeElapsedNoRegister:
	text "Scusa, ma non puoi"
	line "registrare il tuo"

	para "record attuale al"
	line "CENTRO, perché è"

	para "trascorso troppo"
	line "tempo da quando"

	para "hai iniziato la"
	line "sfida."
	done

; a dupe?
Text_RegisterRecordTimedOut_Mobile:
	text "Sorry, but it's"
	line "not possible to"

	para "register your most"
	line "recent record at"

	para "the CENTER because"
	line "too much time has"

	para "elapsed since the"
	line "start of your"
	cont "challenge."
	done

Text_AMonLevelExceeds:
	text "One or more of"
	line "your #MON's"
	cont "levels exceeds @"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70:
	text_ram wcd49
	text " may not"
	line "enter a BATTLE"
	cont "ROOM under L70."

	para "This BATTLE ROOM"
	line "is for L@"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_BattleTowerYoungster:
	text "M'ha distrutto il"
	line "primo avversario,"
	cont "in un secondo!!!"
	done

Text_BattleTowerCooltrainerF:
	text "Le SALE LOTTA sono"
	line "molte, ma so che"

	para "posso vincere in"
	line "tutte!"
	done

Text_BattleTowerGranny:
	text "Non è facile"
	line "vincere senza"

	para "usare STRUMENTI"
	line "durante la lotta."

	para "Ma se fai tenere"
	line "strumenti ai tuoi"

	para "#MON, potrai"
	line "farcela!"
	done

Text_BattleTowerBugCatcher:
	text "Voglio vedere dove"
	line "riesco ad arrivare"

	para "usando solo #-"
	line "MON coleottero."

	para "Spero di non"
	line "lottare contro un"
	cont "#MON fuoco…"
	done

BattleTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  9, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  9, BATTLE_TOWER_OUTSIDE, 4
	warp_event  7,  0, BATTLE_TOWER_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  6, BGEVENT_READ, BattleTower1FRulesSign

	db 5 ; object events
	object_event  7,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleTower1FYoungsterScript, -1
	object_event  4,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FCooltrainerFScript, -1
	object_event  1,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FBugCatcherScript, -1
	object_event 14,  3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FGrannyScript, -1
