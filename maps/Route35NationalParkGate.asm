	object_const_def ; object_event constants
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_YOUNGSTER
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkGate_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE35NATIONALPARKGATE_UNUSED
	scene_script .LeaveContestEarly ; SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY

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
	setscene SCENE_ROUTE35NATIONALPARKGATE_NOTHING
	return

.BugContestIsRunning:
	setscene SCENE_ROUTE35NATIONALPARKGATE_LEAVE_CONTEST_EARLY
	return

.CheckIfContestAvailable:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .SetContestOfficer
	ifequal THURSDAY, .SetContestOfficer
	ifequal SATURDAY, .SetContestOfficer
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue .BugContestIsRunning
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_YOUNGSTER
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	return

.SetContestOfficer:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	return

.LeavingContestEarly:
	applymovement PLAYER, Route35NationalParkGatePlayerApproachOfficer1Movement
	turnobject ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	readvar VAR_CONTESTMINUTES
	addval 1
	getnum STRING_BUFFER_3
	writetext Route35NationalParkGateOfficer1WantToFinishText
	yesorno
	iffalse .GoBackToContest
	writetext Route35NationalParkGateOfficer1WaitAtNorthGateText
	waitbutton
	closetext
	jumpstd bugcontestresultswarp

.GoBackToContest:
	writetext Route35NationalParkGateOfficer1OkGoFinishText
	waitbutton
	closetext
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35OfficerScriptContest:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, Route35NationalParkGate_NoContestToday
	ifequal MONDAY, Route35NationalParkGate_NoContestToday
	ifequal WEDNESDAY, Route35NationalParkGate_NoContestToday
	ifequal FRIDAY, Route35NationalParkGate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	scall Route35NationalParkGate_GetDayOfWeek
	writetext Route35NationalParkGateOfficer1AskToParticipateText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToParticipate
	readvar VAR_PARTYCOUNT
	ifgreater 1, Route35NationalParkGate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkGate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext Route35NationalParkGateOfficer1GiveParkBallsText
	buttonsound
	writetext Route35NationalParkGatePlayerReceivedParkBallsText
	playsound SFX_ITEM
	waitsfx
	writetext Route35NationalParkGateOfficer1ExplainsRulesText
	waitbutton
	closetext
	special GiveParkBalls
	scall Route35NationalParkGate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	special SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, 10, 47
	end

Route35NationalParkGate_EnterContest:
	readvar VAR_FACING
	ifequal LEFT, Route35NationalParkGate_FacingLeft
	applymovement PLAYER, Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement
	end

Route35NationalParkGate_FacingLeft:
	applymovement PLAYER, Route35NationalParkGatePlayerEnterParkMovement
	end

Route35NationalParkGate_LeaveTheRestBehind:
	readvar VAR_PARTYCOUNT
	ifless PARTY_LENGTH, Route35NationalParkGate_LessThanFullParty
	readvar VAR_BOXSPACE
	ifequal 0, Route35NationalParkGate_NoRoomInBox

Route35NationalParkGate_LessThanFullParty:
	special CheckFirstMonIsEgg
	ifequal TRUE, Route35NationalParkGate_FirstMonIsEgg
	writetext Route35NationalParkGateOfficer1AskToUseFirstMonText
	yesorno
	iffalse Route35NationalParkGate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route35NationalParkGate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext Route35NationalParkGateOfficer1WellHoldYourMonText
	buttonsound
	writetext Route35NationalParkGatePlayersMonLeftWithHelperText
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	sjump Route35NationalParkGate_OkayToProceed

Route35NationalParkGate_DeclinedToParticipate:
	writetext Route35NationalParkGateOfficer1TakePartInFutureText
	waitbutton
	closetext
	end

Route35NationalParkGate_DeclinedToLeaveMonsBehind:
	writetext Route35NationalParkGateOfficer1ChooseMonAndComeBackText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsFainted:
	writetext Route35NationalParkGateOfficer1FirstMonCantBattleText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoRoomInBox:
	writetext Route35NationalParkGateOfficer1MakeRoomText
	waitbutton
	closetext
	end

Route35NationalParkGate_FirstMonIsEgg:
	writetext Route35NationalParkGateOfficer1EggAsFirstMonText
	waitbutton
	closetext
	end

Route35NationalParkGate_ContestIsOver:
	writetext Route35NationalParkGateOfficer1ContestIsOverText
	waitbutton
	closetext
	end

Route35NationalParkGate_NoContestToday:
	jumptextfaceplayer Route35NationalParkGateOfficer1WeHoldContestsText

Route35NationalParkGateOfficerScript:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkGate_ContestIsOver
	writetext Route35NationalParkGateOfficer1WeHoldContestsText
	waitbutton
	closetext
	end

Route35NationalParkGateYoungsterScript:
	jumptextfaceplayer Route35NationalParkGateYoungsterText

BugCatchingContestExplanationSign:
	jumptext BugCatchingContestExplanationText

Route35NationalParkGate_GetDayOfWeek:
	jumpstd daytotext
	end

Route35NationalParkGatePlayerApproachOfficer1Movement:
	step DOWN
	turn_head LEFT
	step_end

Route35NationalParkGatePlayerGoAroundOfficerAndEnterParkMovement:
	step RIGHT
	step UP
	step UP
	step_end

Route35NationalParkGatePlayerEnterParkMovement:
	step UP
	step_end

Route35NationalParkGateOfficer1AskToParticipateText:
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

Route35NationalParkGateOfficer1GiveParkBallsText:
	text "Ecco qui le PARK"
	line "BALL per la"
	cont "Gara."
	done

Route35NationalParkGatePlayerReceivedParkBallsText:
	text "<PLAYER> riceve"
	line "20 PARK BALL."
	done

Route35NationalParkGateOfficer1ExplainsRulesText:
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

Route35NationalParkGateOfficer1AskToUseFirstMonText:
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

Route35NationalParkGateOfficer1WellHoldYourMonText:
	text "Ti terremo noi gli"
	line "altri #MON"
	cont "durante la gara."
	done

Route35NationalParkGatePlayersMonLeftWithHelperText:
	text "I #MON di"
	line "<PLAYER> sono stati"
	cont "lasciati con"
	cont "l'ASSISTENTE GARA."
	done

Route35NationalParkGateOfficer1ChooseMonAndComeBackText:
	text "Scegli il #MON"
	line "che vuoi usare per"

	para "la Gara, e poi"
	line "ritorna qui."
	done

Route35NationalParkGateOfficer1TakePartInFutureText:
	text "Come vuoi. Sarà"
	line "per la prossima"
	cont "volta."
	done

Route35NationalParkGateOfficer1FirstMonCantBattleText:
	text "Oh…"
	line "Il primo #MON"

	para "della tua squadra"
	line "non può lottare."

	para "Scambialo di posto"
	line "con il #MON che"

	para "intendi usare, e"
	line "poi torna qui."
	done

Route35NationalParkGateOfficer1MakeRoomText:
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

Route35NationalParkGateOfficer1EggAsFirstMonText:
	text "Oh…"
	line "Il tuo primo"

	para "#MON è un"
	line "UOVO."

	para "Sostituiscilo con"
	line "il #MON che"

	para "intendi usare, e"
	line "poi torna qui."
	done

Route35NationalParkGateOfficer1WantToFinishText:
	text "Hai ancora @"
	text_ram wStringBuffer3
	text_start
	line "minuti(o)."

	para "Vuoi terminare"
	line "ora?"
	done

Route35NationalParkGateOfficer1WaitAtNorthGateText:
	text "Come vuoi. Attendi"
	line "l'annuncio dei"

	para "vincitori all'"
	line "Ingresso Nord."
	done

Route35NationalParkGateOfficer1OkGoFinishText:
	text "Bene, allora torna"
	line "fuori e concludi"
	cont "la Gara."
	done

Route35NationalParkGateOfficer1ContestIsOverText:
	text "La Gara di oggi è"
	line "terminata."

	para "Partecipa ad una"
	line "delle prossime"
	cont "Gare!"
	done

Route35NationalParkGateOfficer1WeHoldContestsText:
	text "In determinati"
	line "giorni si svolgono"

	para "delle Gare al"
	line "PARCO. Dovresti"
	cont "partecipare!"
	done

Route35NationalParkGateYoungsterText:
	text "Quando ci sarà la"
	line "prossima Gara"
	cont "Pigliamosche?"
	done

BugCatchingContestExplanationText:
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

Route35NationalParkGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  0, NATIONAL_PARK, 3
	warp_event  4,  0, NATIONAL_PARK, 4
	warp_event  3,  7, ROUTE_35, 3
	warp_event  4,  7, ROUTE_35, 3

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  0, BGEVENT_READ, BugCatchingContestExplanationSign

	db 3 ; object events
	object_event  2,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35OfficerScriptContest, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	object_event  6,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateYoungsterScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_YOUNGSTER
	object_event  0,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route35NationalParkGateOfficerScript, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
