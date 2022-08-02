	object_const_def ; object_event constants
	const ROUTE36NATIONALPARKGATE_OFFICER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER1
	const ROUTE36NATIONALPARKGATE_YOUNGSTER2
	const ROUTE36NATIONALPARKGATE_ROCKER
	const ROUTE36NATIONALPARKGATE_POKEFAN_M
	const ROUTE36NATIONALPARKGATE_YOUNGSTER3
	const ROUTE36NATIONALPARKGATE_YOUNGSTER4
	const ROUTE36NATIONALPARKGATE_LASS
	const ROUTE36NATIONALPARKGATE_YOUNGSTER5
	const ROUTE36NATIONALPARKGATE_YOUNGSTER6
	const ROUTE36NATIONALPARKGATE_YOUNGSTER7
	const ROUTE36NATIONALPARKGATE_OFFICER2

Route36NationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE36NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE36NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY

	db 2 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckIfContestRunning
	callback MAPCALLBACK_OBJECTS, .CheckIfContestAvailable

.DummyScene0:
	end

.DummyScene1:
	end

.LeaveContestEarly:
	prioritysjump .LeavingContestEarly
	end

.CheckIfContestRunning:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	setscene SCENE_ROUTE36NATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_ROUTE36NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	checkevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	iftrue .Return
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .SetContestOfficer
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE36NATIONALPARKGATE_OFFICER1
	disappear ROUTE36NATIONALPARKGATE_OFFICER2
.Return:
	return

.LeavingContestEarly:
	turnobject PLAYER, UP
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route36NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route36NationalParkGateOfficer1WaitHereForAnnouncementText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	scall .CopyContestants
	disappear ROUTE36NATIONALPARKGATE_OFFICER1
	appear ROUTE36NATIONALPARKGATE_OFFICER2
	applymovement PLAYER, Route36NationalParkGatePlayerWaitWithContestantsMovement
	pause 15
	special FadeInQuickly
	jumpstd bugcontestresults

.GoBackToContest:
	writetext Route36NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.CopyContestants:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .Not1
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER1
.Not1:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .Not2
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER2
.Not2:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .Not3
	appear ROUTE36NATIONALPARKGATE_ROCKER
.Not3:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .Not4
	appear ROUTE36NATIONALPARKGATE_POKEFAN_M
.Not4:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .Not5
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER3
.Not5:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .Not6
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER4
.Not6:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .Not7
	appear ROUTE36NATIONALPARKGATE_LASS
.Not7:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .Not8
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER5
.Not8:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .Not9
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER6
.Not9:
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .Not10
	appear ROUTE36NATIONALPARKGATE_YOUNGSTER7
.Not10:
	special UpdateSprites
	end

Route36OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, _ContestNotOn
	ifequal MONDAY, _ContestNotOn
	ifequal WEDNESDAY, _ContestNotOn
	ifequal FRIDAY, _ContestNotOn
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	scall Route36ParkGate_DayToText
	writetext Route36NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse .DecidedNotToJoinContest
	readvar VAR_PARTYCOUNT
	ifgreater 1, .LeaveMonsWithOfficer
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
.ResumeStartingContest:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route36NationalParkGateOfficer1GiveParkBallsText
	buttonsound
	waitsfx
	writetext Route36NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route36NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	setflag ENGINE_BUG_CONTEST_TIMER
	special GiveParkBalls
	turnobject PLAYER, LEFT
	playsound SFX_EXIT_BUILDING
	special FadeOutPalettes
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing LEFT, NATIONAL_PARK_BUG_CONTEST, 33, 18
	end

.LeaveMonsWithOfficer:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, .ContinueLeavingMons
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
.ContinueLeavingMons:
	special CheckFirstMonIsEgg
	ifequal TRUE, .FirstMonIsEgg
	writetext Route36NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse .RefusedToLeaveMons
	special ContestDropOffMons
	iftrue .FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route36NationalParkGateOfficer1WellHoldYourMonText
	buttonsound
	writetext Route36NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	sjump .ResumeStartingContest

.DecidedNotToJoinContest:
	writetext Route36NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

.RefusedToLeaveMons:
	writetext Route36NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

.FirstMonIsFainted:
	writetext Route36NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

.BoxFull:
	writetext Route36NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

.FirstMonIsEgg:
	writetext Route36NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route36Officer_ContestHasConcluded:
	checkevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	iftrue .Sunstone
	checkevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	iftrue .Everstone
	checkevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	iftrue .GoldBerry
	checkevent EVENT_CONTEST_OFFICER_HAS_BERRY
	iftrue .Berry
	writetext Route36NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

.Sunstone:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	buttonsound
	verbosegiveitem SUN_STONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	closetext
	end

.Everstone:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	closetext
	end

.GoldBerry:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	buttonsound
	verbosegiveitem GOLD_BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	closetext
	end

.Berry:
	writetext Route36NationalParkGateOfficer1HeresThePrizeText
	buttonsound
	verbosegiveitem BERRY
	iffalse .BagFull
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	closetext
	end

.BagFull:
	writetext Route36NationalParkGateOfficer1WellHoldPrizeText
	waitbutton
	closetext
	end

_ContestNotOn:
	jumptextfaceplayer Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText

Route36NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route36Officer_ContestHasConcluded
	writetext Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText
	waitbutton
	closetext
	end

Route36ParkGate_DayToText:
	jumpstd daytotext
	end

BugCatchingContestant1BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant1BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant1BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant2BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant2BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant2BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant3BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant3BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant3BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant4BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant4BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant4BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant5BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant5BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant5BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant6BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant6BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant6BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant7BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant7BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant7BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant8BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant8BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant8BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant9BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant9BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant9BStillCompetingText
	waitbutton
	closetext
	end

BugCatchingContestant10BScript:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iffalse .StillCompeting
	writetext BugCatchingContestant10BText
	waitbutton
	closetext
	end

.StillCompeting:
	writetext BugCatchingContestant10BStillCompetingText
	waitbutton
	closetext
	end

UnusedBugCatchingContestExplanationSign:
; duplicate of BugCatchingContestExplanationSign in Route35NationalParkGate.asm
	jumptext UnusedBugCatchingContestExplanationText

Route36NationalParkGatePlayerWaitWithContestantsMovement:
	big_step DOWN
	big_step RIGHT
	turn_head UP
	step_end

Route36NationalParkGateOfficer1AskToParticipateText:
	text "Oggi è @"
	text_ram wStringBuffer3
	text "."
	line "Ciò significa che"

	para "oggi c'è la Gara"
	line "Pigliamosche!"

	para "Le regole?"
	line "Semplicissime."

	para "Usando uno dei"
	line "tuoi #MON,"

	para "cattura un #MON"
	line "coleottero che"
	cont "sarà giudicato."

	para "Vuoi provare?"
	done

Route36NationalParkGateOfficer1GiveParkBallsText:
	text "Ecco qui le PARK"
	line "BALL per la"
	cont "Gara."
	done

Route36NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> riceve"
	line "20 PARK BALL."
	done

Route36NationalParkGateOfficer1ExplainsRulesText:
	text "Vince chi cattura"
	line "il #MON"
	cont "coleottero più"
	cont "forte."

	para "Hai 20 minuti di"
	line "tempo."

	para "Se finisci le"
	line "PARK BALL, termina"
	cont "anche la gara."

	para "Potrai tenere"
	line "l'ultimo #MON"
	cont "che catturerai."

	para "Vai, e prendi il"
	line "#MON"

	para "coleottero"
	line "più forte!"
	done

Route36NationalParkGateOfficer1AskToUseFirstMonText:
	text "Ah…"

	para "Vedo che hai più"
	line "di un #MON."

	para "Dovrai usare"
	line "@"
	text_ram wStringBuffer3
	text ", il"

	para "primo #MON"
	line "in squadra."

	para "Ti va bene?"
	done

Route36NationalParkGateOfficer1WellHoldYourMonText:
	text "Ti terremo noi gli"
	line "altri #MON"
	cont "durante la gara."
	done

Route36NationalParkGatePlayersMonLeftWithHelperText:
	text "I #MON di"
	line "<PLAYER> sono stati"
	cont "lasciati con"
	cont "l'ASSISTENTE GARA."
	done

Route36NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Scegli il #MON"
	line "che vuoi usare per"

	para "la Gara, e poi"
	line "ritorna qui."
	done

Route36NationalParkGateOfficer1TakePartInFutureText:
	text "Come vuoi. Sarà"
	line "per la prossima"
	cont "volta."
	done

Route36NationalParkGateOfficer1FirstMonCantBattleText:
	text "Oh…"
	line "Il primo #MON"

	para "della tua squadra"
	line "non può lottare."

	para "Scambialo di posto"
	line "con il #MON che"

	para "intendi usare, e"
	line "poi torna qui."
	done

Route36NationalParkGateOfficer1MakeRoomText:
	text "Oh…"
	line "Sia la tua squadra"

	para "che il BOX del tuo"
	line "PC sono pieni."

	para "Non hai spazio per"
	line "il #MON che"
	cont "catturerai."

	para "Fai spazio nella"
	line "tua squadra o nel"

	para "BOX del PC e poi"
	line "torna a trovarmi!"
	done

Route36NationalParkGateOfficer1EggAsFirstMonText:
	text "Oh…"
	line "Il tuo primo"

	para "#MON è un"
	line "UOVO."

	para "Sostituiscilo con"
	line "il #MON che"

	para "intendi usare, e"
	line "poi torna qui."
	done

Route36NationalParkGateOfficer1WantToFinishText:
	text "Hai ancora @"
	text_ram wStringBuffer3
	text_start
	line "minuti(o)."

	para "Vuoi terminare"
	line "ora?"
	done

Route36NationalParkGateOfficer1WaitHereForAnnouncementText:
	text "Ok. Attendi qui la"
	line "proclamazione"
	cont "dei vincitori."
	done

Route36NationalParkGateOfficer1OkGoFinishText:
	text "Ok. Torna fuori e"
	line "concludi la"
	cont "gara."
	done

Route36NationalParkGateOfficer1ContestIsOverText:
	text "La Gara di oggi è"
	line "terminata."

	para "Partecipa ad una"
	line "delle prossime"
	cont "Gare!"
	done

Route36NationalParkGateOfficer1SomeMonOnlySeenInParkText:
	text "Ci sono #MON"
	line "visibili solo nel"
	cont "PARCO."
	done

BugCatchingContestant1BText:
	text "DIN: Uauh, mi hai"
	line "battuto: non sei"
	cont "niente male!"
	done

BugCatchingContestant1BStillCompetingText:
	text "DIN: È anche una"
	line "questione di"
	cont "fortuna."

	para "Non si sa mai"
	line "quale #MON"
	cont "potrà comparire."
	done

BugCatchingContestant2BText:
	text "ED: Ti invidio."
	line "Questa volta non"
	cont "avrei potuto"
	cont "farcela."
	done

BugCatchingContestant2BStillCompetingText:
	text "ED: Puoi vincere"
	line "prendendo un"
	cont "#MON grande?"
	done

BugCatchingContestant3BText:
	text "NICO: Ben fatto!"
	line "Allenerò meglio"
	cont "i miei #MON."
	done

BugCatchingContestant3BStillCompetingText:
	text "NICO: Potresti"
	line "avere un punteggio"

	para "più alto per un"
	line "#MON"
	cont "di un colore"
	cont "inusuale."
	done

BugCatchingContestant4BText:
	text "WILLIAM: Hai"
	line "vinto tu? Chi"
	cont "hai catturato?"
	done

BugCatchingContestant4BStillCompetingText:
	text "WILLIAM: Bene,"
	line "sono soddisfatto:"

	para "ho il #MON"
	line "che volevo."
	done

BugCatchingContestant5BText:
	text "MIK: Bene, hai"
	line "guadagnato tutto"
	cont "il mio rispetto!"
	done

BugCatchingContestant5BStillCompetingText:
	text "MIK: Ho già"
	line "catturato uno"
	cont "SCYTHER,"
	cont "ma non ho vinto."
	done

BugCatchingContestant6BText:
	text "PA: Il #MON"
	line "che hai"
	cont "catturato è…"
	cont "formidabile!"
	done

BugCatchingContestant6BStillCompetingText:
	text "PA: Vincere è"
	line "più facile se"

	para "catturi un"
	line "#MON"
	cont "coleottero"
	cont "di livello alto."

	para "Ma credo che valu-"
	line "tino anche altri"
	cont "fattori."
	done

BugCatchingContestant7BText:
	text "ZOE: Hai vinto?"
	line "Grande!"

	para "Verresti a cercare"
	line "#MON di"
	cont "tipo coleottero"
	cont "con me?"
	done

BugCatchingContestant7BStillCompetingText:
	text "ZOE: I #MON"
	line "coleottero sono"
	cont "la mia passione!"
	done

BugCatchingContestant8BText:
	text "JOI: Io… non"
	line "posso credere di"
	cont "aver perso…"
	done

BugCatchingContestant8BStillCompetingText:
	text "JOI: Mi han detto"
	line "che qualcuno ha"
	cont "vinto con un"
	cont "CATERPIE!"
	done

BugCatchingContestant9BText:
	text "SAMUELE: Vedrai la"
	line "prossima volta!"
	done

BugCatchingContestant9BStillCompetingText:
	text "SAMUELE: Uffa."
	line "Pensavo di andare"
	cont "meglio…"
	done

BugCatchingContestant10BText:
	text "PIPPO: Mi dai"
	line "qualche aiuto?"

	para "Voglio studiare"
	line "il tuo stile!"
	done

BugCatchingContestant10BStillCompetingText:
	text "PIPPO: Studio"
	line "molto, ma non"

	para "abbastanza"
	line "per vincere!"
	done

UnusedSudowoodoText:
; This text is unused and unreferenced in the final game.
; The tree Pokémon is Sudowoodo.
; The Silph Scope 2 was later reworked into the Squirtbottle.
	text "Ho sentito parlare"
	line "di un #MON"
	cont "che somiglia ad"
	cont "un albero."

	para "Puoi scovarlo con"
	line "SPETTROSONDA 2."
	done

UnusedBugCatchingContestExplanationText:
; duplicate of BugCatchingContestExplanationText in Route35NationalParkGate.asm
	text "Le Gare"
	line "Pigliamosche si"

	para "svolgono martedì,"
	line "giovedì e sabato."

	para "Non solo vinci un"
	line "premio per aver"

	para "partecipato, ma"
	line "puoi anche tenere"

	para "il #MON"
	line "coleottero che hai"
	cont "eventualmente"
	cont "catturato durante"
	cont "la Gara."
	done

Route36NationalParkGateOfficer1WellHoldPrizeText:
	text "Oh… Non hai più"
	line "spazio nello"
	cont "ZAINO!"

	para "Ti mettiamo il"
	line "premio da parte,"
	cont "ma solo per oggi."

	para "Libera spazio,"
	line "e poi torna qui."
	done

Route36NationalParkGateOfficer1HeresThePrizeText:
	text "<PLAYER>?"

	para "Ecco il premio che"
	line "ti abbiamo tenuto!"
	done

Route36NationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, NATIONAL_PARK, 1
	warp_event  0,  5, NATIONAL_PARK, 2
	warp_event  9,  4, ROUTE_36, 1
	warp_event  9,  5, ROUTE_36, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  6,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 12 ; object events
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36OfficerScriptContest, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant1BScript, EVENT_BUG_CATCHING_CONTESTANT_1B
	object_event  4,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant2BScript, EVENT_BUG_CATCHING_CONTESTANT_2B
	object_event  2,  6, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant3BScript, EVENT_BUG_CATCHING_CONTESTANT_3B
	object_event  6,  5, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant4BScript, EVENT_BUG_CATCHING_CONTESTANT_4B
	object_event  2,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant5BScript, EVENT_BUG_CATCHING_CONTESTANT_5B
	object_event  5,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant6BScript, EVENT_BUG_CATCHING_CONTESTANT_6B
	object_event  3,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant7BScript, EVENT_BUG_CATCHING_CONTESTANT_7B
	object_event  4,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant8BScript, EVENT_BUG_CATCHING_CONTESTANT_8B
	object_event  6,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant9BScript, EVENT_BUG_CATCHING_CONTESTANT_9B
	object_event  6,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BugCatchingContestant10BScript, EVENT_BUG_CATCHING_CONTESTANT_10B
	object_event  3,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route36NationalParkGateOfficerScript, EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
