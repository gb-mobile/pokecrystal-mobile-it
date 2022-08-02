	object_const_def ; object_event constants
	const ELMSLAB_ELM
	const ELMSLAB_ELMS_AIDE
	const ELMSLAB_POKE_BALL1
	const ELMSLAB_POKE_BALL2
	const ELMSLAB_POKE_BALL3
	const ELMSLAB_OFFICER

ElmsLab_MapScripts:
	db 6 ; scene scripts
	scene_script .MeetElm ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ELMSLAB_CANT_LEAVE
	scene_script .DummyScene2 ; SCENE_ELMSLAB_NOTHING
	scene_script .DummyScene3 ; SCENE_ELMSLAB_MEET_OFFICER
	scene_script .DummyScene4 ; SCENE_ELMSLAB_UNUSED
	scene_script .DummyScene5 ; SCENE_ELMSLAB_AIDE_GIVES_POTION

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MoveElmCallback

.MeetElm:
	prioritysjump .WalkUpToElm
	end

.DummyScene1:
	end

.DummyScene2:
	end

.DummyScene3:
	end

.DummyScene4:
	end

.DummyScene5:
	end

.MoveElmCallback:
	checkscene
	iftrue .Skip ; not SCENE_DEFAULT
	moveobject ELMSLAB_ELM, 3, 4
.Skip:
	return

.WalkUpToElm:
	applymovement PLAYER, ElmsLab_WalkUpToElmMovement
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	turnobject ELMSLAB_ELM, RIGHT
	opentext
	writetext ElmText_Intro
.MustSayYes:
	yesorno
	iftrue .ElmGetsEmail
	writetext ElmText_Refused
	sjump .MustSayYes

.ElmGetsEmail:
	writetext ElmText_Accepted
	buttonsound
	writetext ElmText_ResearchAmbitions
	waitbutton
	closetext
	playsound SFX_GLASS_TING
	pause 30
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 10
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmText_GotAnEmail
	waitbutton
	closetext
	opentext
	turnobject ELMSLAB_ELM, RIGHT
	writetext ElmText_MissionFromMrPokemon
	waitbutton
	closetext
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement1
	turnobject PLAYER, UP
	applymovement ELMSLAB_ELM, ElmsLab_ElmToDefaultPositionMovement2
	turnobject PLAYER, RIGHT
	opentext
	writetext ElmText_ChooseAPokemon
	waitbutton
	setscene SCENE_ELMSLAB_CANT_LEAVE
	closetext
	end

ProfElmScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SS_TICKET_FROM_ELM
	iftrue ElmCheckMasterBall
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue ElmGiveTicketScript
ElmCheckMasterBall:
	checkevent EVENT_GOT_MASTER_BALL_FROM_ELM
	iftrue ElmCheckEverstone
	checkflag ENGINE_RISINGBADGE
	iftrue ElmGiveMasterBallScript
ElmCheckEverstone:
	checkevent EVENT_GOT_EVERSTONE_FROM_ELM
	iftrue ElmScript_CallYou
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue ElmGiveEverstoneScript
	checkevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	iffalse ElmCheckTogepiEgg
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	writetext ElmThoughtEggHatchedText
	waitbutton
	closetext
	end

ElmEggHatchedScript:
	setval TOGEPI
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	setval TOGETIC
	special FindPartyMonThatSpeciesYourTrainerID
	iftrue ShowElmTogepiScript
	sjump ElmCheckGotEggAgain

ElmCheckTogepiEgg:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse ElmCheckGotEggAgain
	checkevent EVENT_TOGEPI_HATCHED
	iftrue ElmEggHatchedScript
ElmCheckGotEggAgain:
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE ; why are we checking it again?
	iftrue ElmWaitingEggHatchScript
	checkflag ENGINE_ZEPHYRBADGE
	iftrue ElmAideHasEggScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue ElmStudyingEggScript
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue ElmAfterTheftScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue ElmDescribesMrPokemonScript
	writetext ElmText_LetYourMonBattleIt
	waitbutton
	closetext
	end

LabTryToLeaveScript:
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext LabWhereGoingText
	waitbutton
	closetext
	applymovement PLAYER, ElmsLab_CantLeaveMovement
	end

CyndaquilPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CYNDAQUIL
	cry CYNDAQUIL
	waitbutton
	closepokepic
	opentext
	writetext TakeCyndaquilText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL1
	setevent EVENT_GOT_CYNDAQUIL_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, CYNDAQUIL
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CYNDAQUIL, 5, BERRY
	closetext
	readvar VAR_FACING
	ifequal RIGHT, ElmDirectionsScript
	applymovement PLAYER, AfterCyndaquilMovement
	sjump ElmDirectionsScript

TotodilePokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic TOTODILE
	cry TOTODILE
	waitbutton
	closepokepic
	opentext
	writetext TakeTotodileText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL2
	setevent EVENT_GOT_TOTODILE_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, TOTODILE
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke TOTODILE, 5, BERRY
	closetext
	applymovement PLAYER, AfterTotodileMovement
	sjump ElmDirectionsScript

ChikoritaPokeBallScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue LookAtElmPokeBallScript
	turnobject ELMSLAB_ELM, DOWN
	refreshscreen
	pokepic CHIKORITA
	cry CHIKORITA
	waitbutton
	closepokepic
	opentext
	writetext TakeChikoritaText
	yesorno
	iffalse DidntChooseStarterScript
	disappear ELMSLAB_POKE_BALL3
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	writetext ChoseStarterText
	buttonsound
	waitsfx
	getmonname STRING_BUFFER_3, CHIKORITA
	writetext ReceivedStarterText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	givepoke CHIKORITA, 5, BERRY
	closetext
	applymovement PLAYER, AfterChikoritaMovement
	sjump ElmDirectionsScript

DidntChooseStarterScript:
	writetext DidntChooseStarterText
	waitbutton
	closetext
	end

ElmDirectionsScript:
	turnobject PLAYER, UP
	opentext
	writetext ElmDirectionsText1
	waitbutton
	closetext
	addcellnum PHONE_ELM
	opentext
	writetext GotElmsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, LEFT
	opentext
	writetext ElmDirectionsText2
	waitbutton
	closetext
	turnobject ELMSLAB_ELM, DOWN
	opentext
	writetext ElmDirectionsText3
	waitbutton
	closetext
	setevent EVENT_GOT_A_POKEMON_FROM_ELM
	setevent EVENT_RIVAL_CHERRYGROVE_CITY
	setscene SCENE_ELMSLAB_AIDE_GIVES_POTION
	setmapscene NEW_BARK_TOWN, SCENE_FINISHED
	end

ElmDescribesMrPokemonScript:
	writetext ElmDescribesMrPokemonText
	waitbutton
	closetext
	end

LookAtElmPokeBallScript:
	opentext
	writetext ElmPokeBallText
	waitbutton
	closetext
	end

ElmsLabHealingMachine:
	opentext
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .CanHeal
	writetext ElmsLabHealingMachineText1
	waitbutton
	closetext
	end

.CanHeal:
	writetext ElmsLabHealingMachineText2
	yesorno
	iftrue ElmsLabHealingMachine_HealParty
	closetext
	end

ElmsLabHealingMachine_HealParty:
	special StubbedTrainerRankings_Healings
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_ELMS_LAB
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	closetext
	end

ElmAfterTheftDoneScript:
	waitbutton
	closetext
	end

ElmAfterTheftScript:
	writetext ElmAfterTheftText1
	checkitem MYSTERY_EGG
	iffalse ElmAfterTheftDoneScript
	buttonsound
	writetext ElmAfterTheftText2
	waitbutton
	takeitem MYSTERY_EGG
	scall ElmJumpBackScript1
	writetext ElmAfterTheftText3
	waitbutton
	scall ElmJumpBackScript2
	writetext ElmAfterTheftText4
	buttonsound
	writetext ElmAfterTheftText5
	buttonsound
	setevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	setflag ENGINE_MAIN_MENU_MOBILE_CHOICES
	setmapscene ROUTE_29, SCENE_ROUTE29_CATCH_TUTORIAL
	clearevent EVENT_ROUTE_30_YOUNGSTER_JOEY
	setevent EVENT_ROUTE_30_BATTLE
	writetext ElmAfterTheftText6
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS
	end

ElmStudyingEggScript:
	writetext ElmStudyingEggText
	waitbutton
	closetext
	end

ElmAideHasEggScript:
	writetext ElmAideHasEggText
	waitbutton
	closetext
	end

ElmWaitingEggHatchScript:
	writetext ElmWaitingEggHatchText
	waitbutton
	closetext
	end

ShowElmTogepiScript:
	writetext ShowElmTogepiText1
	waitbutton
	closetext
	showemote EMOTE_SHOCK, ELMSLAB_ELM, 15
	setevent EVENT_SHOWED_TOGEPI_TO_ELM
	opentext
	writetext ShowElmTogepiText2
	buttonsound
	writetext ShowElmTogepiText3
	buttonsound
ElmGiveEverstoneScript:
	writetext ElmGiveEverstoneText1
	buttonsound
	verbosegiveitem EVERSTONE
	iffalse ElmScript_NoRoomForEverstone
	writetext ElmGiveEverstoneText2
	waitbutton
	closetext
	setevent EVENT_GOT_EVERSTONE_FROM_ELM
	end

ElmScript_CallYou:
	writetext ElmText_CallYou
	waitbutton
ElmScript_NoRoomForEverstone:
	closetext
	end

ElmGiveMasterBallScript:
	writetext ElmGiveMasterBallText1
	buttonsound
	verbosegiveitem MASTER_BALL
	iffalse .notdone
	setevent EVENT_GOT_MASTER_BALL_FROM_ELM
	writetext ElmGiveMasterBallText2
	waitbutton
.notdone
	closetext
	end

ElmGiveTicketScript:
	writetext ElmGiveTicketText1
	buttonsound
	verbosegiveitem S_S_TICKET
	setevent EVENT_GOT_SS_TICKET_FROM_ELM
	writetext ElmGiveTicketText2
	waitbutton
	closetext
	end

ElmJumpBackScript1:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpDownScript
	ifequal UP, ElmJumpUpScript
	ifequal LEFT, ElmJumpLeftScript
	ifequal RIGHT, ElmJumpRightScript
	end

ElmJumpBackScript2:
	closetext
	readvar VAR_FACING
	ifequal DOWN, ElmJumpUpScript
	ifequal UP, ElmJumpDownScript
	ifequal LEFT, ElmJumpRightScript
	ifequal RIGHT, ElmJumpLeftScript
	end

ElmJumpUpScript:
	applymovement ELMSLAB_ELM, ElmJumpUpMovement
	opentext
	end

ElmJumpDownScript:
	applymovement ELMSLAB_ELM, ElmJumpDownMovement
	opentext
	end

ElmJumpLeftScript:
	applymovement ELMSLAB_ELM, ElmJumpLeftMovement
	opentext
	end

ElmJumpRightScript:
	applymovement ELMSLAB_ELM, ElmJumpRightMovement
	opentext
	end

AideScript_WalkPotion1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkPotion2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GivePotion
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GivePotion:
	opentext
	writetext AideText_GiveYouPotion
	buttonsound
	verbosegiveitem POTION
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_WalkBalls1:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight1
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft1
	end

AideScript_WalkBalls2:
	applymovement ELMSLAB_ELMS_AIDE, AideWalksRight2
	turnobject PLAYER, DOWN
	scall AideScript_GiveYouBalls
	applymovement ELMSLAB_ELMS_AIDE, AideWalksLeft2
	end

AideScript_GiveYouBalls:
	opentext
	writetext AideText_GiveYouBalls
	buttonsound
	getitemname STRING_BUFFER_4, POKE_BALL
	scall AideScript_ReceiveTheBalls
	giveitem POKE_BALL, 5
	writetext AideText_ExplainBalls
	buttonsound
	itemnotify
	closetext
	setscene SCENE_ELMSLAB_NOTHING
	end

AideScript_ReceiveTheBalls:
	jumpstd receiveitem
	end

ElmsAideScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue AideScript_AfterTheft
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue AideScript_ExplainBalls
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue AideScript_TheftTestimony
	writetext AideText_AlwaysBusy
	waitbutton
	closetext
	end

AideScript_TheftTestimony:
	writetext AideText_TheftTestimony
	waitbutton
	closetext
	end

AideScript_ExplainBalls:
	writetext AideText_ExplainBalls
	waitbutton
	closetext
	end

AideScript_AfterTheft:
	writetext AideText_AfterTheft
	waitbutton
	closetext
	end

MeetCopScript2:
	applymovement PLAYER, MeetCopScript2_StepLeft

MeetCopScript:
	applymovement PLAYER, MeetCopScript_WalkUp
CopScript:
	turnobject ELMSLAB_OFFICER, LEFT
	opentext
	writetext ElmsLabOfficerText1
	buttonsound
	special NameRival
	writetext ElmsLabOfficerText2
	waitbutton
	closetext
	applymovement ELMSLAB_OFFICER, OfficerLeavesMovement
	disappear ELMSLAB_OFFICER
	setscene SCENE_ELMSLAB_NOTHING
	end

ElmsLabWindow:
	opentext
	checkflag ENGINE_FLYPOINT_VIOLET
	iftrue .Normal
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .BreakIn
	sjump .Normal

.BreakIn:
	writetext ElmsLabWindowText2
	waitbutton
	closetext
	end

.Normal:
	writetext ElmsLabWindowText1
	waitbutton
	closetext
	end

ElmsLabTravelTip1:
	jumptext ElmsLabTravelTip1Text

ElmsLabTravelTip2:
	jumptext ElmsLabTravelTip2Text

ElmsLabTravelTip3:
	jumptext ElmsLabTravelTip3Text

ElmsLabTravelTip4:
	jumptext ElmsLabTravelTip4Text

ElmsLabTrashcan:
	jumptext ElmsLabTrashcanText

ElmsLabPC:
	jumptext ElmsLabPCText

ElmsLabTrashcan2:
; unused
	jumpstd trashcan

ElmsLabBookshelf:
	jumpstd difficultbookshelf

ElmsLab_WalkUpToElmMovement:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head LEFT
	step_end

ElmsLab_CantLeaveMovement:
	step UP
	step_end

MeetCopScript2_StepLeft:
	step LEFT
	step_end

MeetCopScript_WalkUp:
	step UP
	step UP
	turn_head RIGHT
	step_end

OfficerLeavesMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

AideWalksRight1:
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksRight2:
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

AideWalksLeft1:
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

AideWalksLeft2:
	step LEFT
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

ElmJumpUpMovement:
	fix_facing
	big_step UP
	remove_fixed_facing
	step_end

ElmJumpDownMovement:
	fix_facing
	big_step DOWN
	remove_fixed_facing
	step_end

ElmJumpLeftMovement:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	step_end

ElmJumpRightMovement:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	step_end

ElmsLab_ElmToDefaultPositionMovement1:
	step UP
	step_end

ElmsLab_ElmToDefaultPositionMovement2:
	step RIGHT
	step RIGHT
	step UP
	turn_head DOWN
	step_end

AfterCyndaquilMovement:
	step LEFT
	step UP
	turn_head UP
	step_end

AfterTotodileMovement:
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

AfterChikoritaMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	turn_head UP
	step_end

ElmText_Intro:
	text "ELM: <PLAY_G>!"
	line "Eccoti qui!"

	para "Dovevo chiederti"
	line "un favore."

	para "Sto conducendo una"
	line "nuova ricerca sui"

	para "#MON e mi"
	line "servirebbe il tuo"

	para "aiuto. Che ne"
	line "dici, <PLAY_G>?"

	para "Vedi…"

	para "Sto scrivendo una"
	line "relazione che"

	para "presenterò in una"
	line "conferenza."

	para "Ma devo ancora"
	line "approfondire"
	cont "alcuni aspetti."

	para "Perciò…"

	para "Vorrei che"
	line "allevassi un"

	para "#MON che ho"
	line "appena catturato."
	done

ElmText_Accepted:
	text "Grazie, <PLAY_G>!"

	para "Il tuo aiuto mi è"
	line "preziosissimo."
	done

ElmText_Refused:
	text "Ma… Ho bisogno"
	line "del tuo aiuto!"
	done

ElmText_ResearchAmbitions:
	text "Quando presenterò"
	line "le mie scoperte,"

	para "avremo svelato un"
	line "altro mistero"

	para "nel mondo dei"
	line "#MON."

	para "Puoi contarci!"
	done

ElmText_GotAnEmail:
	text "Ehi! Ho ricevuto"
	line "un'e-mail!"

	para "<……><……><……>"
	line "Ehm… Ah ah…"

	para "Ok…"
	done

ElmText_MissionFromMrPokemon:
	text "Ehi, ascolta!"

	para "Ho un amico che"
	line "si chiama"
	cont "MR.#MON."

	para "È uno scienziato,"
	line "un vulcano di"

	para "nuove scoperte,"
	line "spesso deliranti."

	para "Mi ha scritto un'"
	line "e-mail in cui dice"

	para "che questa volta è"
	line "una cosa seria."

	para "In effetti sembra"
	line "una scoperta affa-"
	cont "scinante, ma noi"
	cont "siamo troppo presi"
	cont "dalle ricerche!"

	para "Ma…"

	para "Ho un'idea!"

	para "<PLAY_G>, perché"
	line "non ci vai tu?"
	done

ElmText_ChooseAPokemon:
	text "Vorrei che tu"
	line "allevassi uno dei"

	para "#MON contenuti"
	line "nelle BALL."

	para "Sarai tu ad"
	line "allenarlo,"
	cont "<PLAY_G>!"

	para "Dai, prendine"
	line "uno!"
	done

ElmText_LetYourMonBattleIt:
	text "Se appare un #-"
	line "MON selvatico,"
	cont "manda in campo il"
	cont "tuo #MON!"
	done

LabWhereGoingText:
	text "ELM: Aspetta? Dove"
	line "stai andando?"
	done

TakeCyndaquilText:
	text "ELM: Vuoi"
	line "CYNDAQUIL, #MON"
	cont "di tipo fuoco?"
	done

TakeTotodileText:
	text "ELM: Prendi"
	line "TOTODILE, #MON"
	cont "di tipo acqua?"
	done

TakeChikoritaText:
	text "ELM: Scegli"
	line "CHIKORITA, #MON"
	cont "di tipo erba?"
	done

DidntChooseStarterText:
	text "ELM: Pensaci con"
	line "attenzione."

	para "È una scelta"
	line "importante."
	done

ChoseStarterText:
	text "ELM: Credo che"
	line "sia davvero un"
	cont "grande #MON!"
	done

ReceivedStarterText:
	text "<PLAYER> riceve"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

ElmDirectionsText1:
	text "MR.#MON vive"
	line "subito dopo la"

	para "prossima città,"
	line "FIORPESCOPOLI."

	para "La strada è"
	line "praticamente"

	para "sempre dritta, non"
	line "puoi sbagliare."

	para "Comunque ti do il"
	line "numero telefonico:"

	para "chiamami se"
	line "succede qualcosa."
	done

ElmDirectionsText2:
	text "Se il tuo #MON"
	line "è debole, puoi"

	para "venire a curarlo"
	line "con questa"
	cont "macchina. "

	para "Usala quando"
	line "preferisci."
	done

ElmDirectionsText3:
	text "<PLAY_G>, conto"
	line "su di te!"
	done

GotElmsNumberText:
	text "<PLAYER> riceve il"
	line "numero telefonico"
	cont "di ELM."
	done

ElmDescribesMrPokemonText:
	text "MR.#MON è"
	line "sempre in giro"
	cont "alla ricerca di"
	cont "rarità."

	para "Il problema è che"
	line "le sue rarità sono"
	cont "spesso inutili…"
	done

ElmPokeBallText:
	text "Contiene un"
	line "#MON catturato"
	cont "dal PROF.ELM."
	done

ElmsLabHealingMachineText1:
	text "Chissà a cosa"
	line "serve!"
	done

ElmsLabHealingMachineText2:
	text "Vuoi rimettere in"
	line "sesto i tuoi"
	cont "#MON?"
	done

ElmAfterTheftText1:
	text "ELM: <PLAY_G>, è"
	line "terribile…"

	para "Ah, sì! Qual era"
	line "poi la scoperta di"
	cont "MR.#MON?"
	done

ElmAfterTheftText2:
	text "<PLAYER> porge"
	line "al PROF.ELM"
	cont "l'UOVO MISTERO."
	done

ElmAfterTheftText3:
	text "ELM: Questo?"
	done

ElmAfterTheftText4:
	text "Ma questo… è un"
	line "UOVO #MON?"

	para "Se è così, è una"
	line "grande scoperta!"
	done

ElmAfterTheftText5:
	text "ELM: Cosa?!?"

	para "Il PROF.OAK ti ha"
	line "dato un #DEX?"

	para "<PLAY_G>, dici"
	line "davvero? Ma è"
	cont "incredibile!"

	para "OAK sa riconoscere"
	line "all'istante il"
	cont "potenziale di un"
	cont "buon allenatore."

	para "<PLAY_G>, sai che"
	line "ti dico? Potresti"

	para "davvero diventare"
	line "CAMPIONE!"

	para "Sembri cavartela"
	line "molto bene con i"
	cont "#MON."

	para "Perché non sfidi"
	line "le PALESTRE"
	cont "#MON?"

	para "Quella più vicina"
	line "dovrebbe essere"
	cont "a VIOLAPOLI."
	done

ElmAfterTheftText6:
	text "…<PLAY_G>! È"
	line "lunga la strada"

	para "per diventare il"
	line "CAMPIONE."

	para "Prima di partire,"
	line "ricorda di parlare"
	cont "con la mamma."
	done

ElmStudyingEggText:
	text "ELM: Non arrender-"
	line "ti! Se scopro"

	para "qualcosa sull'UOVO"
	line "ti chiamo."
	done

ElmAideHasEggText:
	text "ELM: <PLAY_G>,"
	line "hai visto il mio"
	cont "assistente?"

	para "Ti aspettava con"
	line "l'UOVO al CENTRO"

	para "#MON di"
	line "VIOLAPOLI."

	para "Ma non vi siete"
	line "visti: vai, lo"
	cont "trovi ancora là!"
	done

ElmWaitingEggHatchText:
	text "ELM: L'UOVO ha"
	line "avuto qualche"
	cont "cambiamento?"
	done

ElmThoughtEggHatchedText:
	text "<PLAY_G>? Credevo"
	line "che l'UOVO si"
	cont "fosse schiuso!"

	para "Dov'è il"
	line "#MON?"
	done

ShowElmTogepiText1:
	text "ELM: <PLAY_G>, ti"
	line "vedo in forma!"
	done

ShowElmTogepiText2:
	text "Come?"
	line "Quel #MON!?!"
	done

ShowElmTogepiText3:
	text "L'UOVO si è"
	line "schiuso! Allora i"
	cont "#MON nascono"
	cont "dalle UOVA…"

	para "No, forse non"
	line "tutti i #MON."

	para "Comunque, bisogna"
	line "fare ancora molte"
	cont "ricerche."
	done

ElmGiveEverstoneText1:
	text "Grazie, <PLAY_G>!"
	line "Ci stai aiutando a"

	para "svelare i segreti"
	line "dei #MON!"

	para "Accetta questo"
	line "segno della nostra"
	cont "stima!"
	done

ElmGiveEverstoneText2:
	text "È PIETRASTANTE."

	para "Alcune specie di"
	line "#MON si"

	para "evolvono quando"
	line "raggiungono un"
	cont "certo livello."

	para "Se un #MON ha"
	line "una PIETRASTANTE"
	cont "non si evolve."

	para "Dalla ad un #-"
	line "MON che non vuoi"
	cont "far evolvere."
	done

ElmText_CallYou:
	text "ELM: <PLAY_G>, ti"
	line "chiamo se succede"
	cont "qualcosa."
	done

AideText_AfterTheft:
	text "… Sigh… Un"
	line "#MON rubato!"

	para "Spero che stia"
	line "bene!"

	para "Si dice che un"
	line "#MON allevato"

	para "da una persona"
	line "cattiva"
	cont "s'incattivisca!"
	done

ElmGiveMasterBallText1:
	text "ELM: <PLAY_G>!"
	line "Grazie a te la"

	para "mia ricerca va a"
	line "gonfie vele!"

	para "Prendi questo, in"
	line "segno del mio"
	cont "apprezzamento!"
	done

ElmGiveMasterBallText2:
	text "La MASTER BALL è"
	line "il massimo!"

	para "È la regina delle"
	line "BALL! Cattura"

	para "qualsiasi #MON,"
	line "e non sbaglia mai."

	para "È conferita solo"
	line "agli scienziati"
	cont "#MON."

	para "Ma credo che tu ne"
	line "possa fare miglior"

	para "uso di me,"
	line "<PLAY_G>!"
	done

ElmGiveTicketText1:
	text "ELM: <PLAY_G>!"
	line "Eccoti qui!"

	para "Ti ho fatto venire"
	line "perché ho qualcosa"
	cont "per te."

	para "È un BIGLIETTO"
	line "NAVE."

	para "Così puoi andare a"
	line "catturare #MON"
	cont "a KANTO!"
	done

ElmGiveTicketText2:
	text "La nave parte da"
	line "OLIVINOPOLI."

	para "Ma lo sapevi già,"
	line "vero, <PLAY_G>?"

	para "Con i tuoi #MON"
	line "hai viaggiato"
	cont "ovunque."

	para "Salutami il"
	line "PROF.OAK a KANTO!"
	done

ElmsLabSignpostText_Egg:
	text "È l'UOVO #MON"
	line "che il PROF.ELM"
	cont "sta studiando."
	done

AideText_GiveYouPotion:
	text "<PLAY_G>, prendi"
	line "questo, ti servirà"
	cont "per il viaggio."
	done

AideText_AlwaysBusy:
	text "Siamo solo in due"
	line "qui: siamo così"
	cont "impegnati!"
	done

AideText_TheftTestimony:
	text "Da fuori proveniva"
	line "uno strano rumore…"

	para "Siamo usciti a ve-"
	line "dere, e nel"
	cont "frattempo ci hanno"
	cont "rubato un #MON."

	para "Non posso credere"
	line "che qualcuno abbia"
	cont "potuto farlo!"

	para "…Sigh… Un"
	line "#MON rubato!"

	para "Spero che stia"
	line "bene."

	para "Si dice che un "
	line "#MON allevato"

	para "da una persona"
	line "cattiva"
	cont "s'incattivisca."
	done

AideText_GiveYouBalls:
	text "<PLAY_G>, tieni!"

	para "Usale per ampliare"
	line "il tuo #DEX!"
	done

AideText_ExplainBalls:
	text "Per ampliare il"
	line "#DEX devi"
	cont "prendere #MON."

	para "Tirando le #"
	line "BALL ai #MON"
	cont "selvatici, potrai"
	cont "catturarli!"
	done

ElmsLabOfficerText1:
	text "Ho sentito che qui"
	line "hanno rubato un"
	cont "#MON…"

	para "Il PROF.ELM me lo"
	line "stava proprio"
	cont "raccontando."

	para "Pare che sia stato"
	line "un ragazzo con i"
	cont "capelli rossi,"
	cont "lunghi…"

	para "Come?"

	para "È la descrizione"
	line "di un allenatore"
	cont "che hai sfidato?"

	para "Ti ha per caso"
	line "detto il suo nome?"
	done

ElmsLabOfficerText2:
	text "Ah, quindi si"
	line "chiama <RIVAL>!"

	para "Hai dato un grande"
	line "aiuto alle nostre"
	cont "indagini!"
	done

ElmsLabWindowText1:
	text "La finestra è"
	line "aperta."

	para "Entra una brezza"
	line "leggera."
	done

ElmsLabWindowText2:
	text "È entrato da"
	line "qui!"
	done

ElmsLabTravelTip1Text:
	text "<PLAYER> apre un"
	line "libro."

	para "Suggerimento 1:"

	para "Premi START per"
	line "aprire il MENU."
	done

ElmsLabTravelTip2Text:
	text "<PLAYER> apre un"
	line "libro."

	para "Suggerimento 2:"

	para "Con SALVA puoi"
	line "salvare la tua"
	cont "posizione!"
	done

ElmsLabTravelTip3Text:
	text "<PLAYER> apre un"
	line "libro."

	para "Suggerimento 3:"

	para "Apri lo ZAINO e"
	line "premi SELECT per"
	cont "spostare gli"
	cont "strumenti."
	done

ElmsLabTravelTip4Text:
	text "<PLAYER> apre un"
	line "libro."

	para "Suggerimento 4:"

	para "Premendo A puoi"
	line "spostare le mosse"
	cont "dei tuoi #MON."
	done

ElmsLabTrashcanText:
	text "C'è la carta di"
	line "uno snack del"
	cont "PROF.ELM…"
	done

ElmsLabPCText:
	text "…Sullo schermo"
	line "c'è scritto…"

	para "OSSERVAZIONI SULL'"
	line "EVOLUZIONE DEI"
	cont "#MON"
	done

ElmsLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, NEW_BARK_TOWN, 1
	warp_event  5, 11, NEW_BARK_TOWN, 1

	db 8 ; coord events
	coord_event  4,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  5,  6, SCENE_ELMSLAB_CANT_LEAVE, LabTryToLeaveScript
	coord_event  4,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript
	coord_event  5,  5, SCENE_ELMSLAB_MEET_OFFICER, MeetCopScript2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POTION, AideScript_WalkPotion2
	coord_event  4,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls1
	coord_event  5,  8, SCENE_ELMSLAB_AIDE_GIVES_POKE_BALLS, AideScript_WalkBalls2

	db 16 ; bg events
	bg_event  2,  1, BGEVENT_READ, ElmsLabHealingMachine
	bg_event  6,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  1, BGEVENT_READ, ElmsLabBookshelf
	bg_event  0,  7, BGEVENT_READ, ElmsLabTravelTip1
	bg_event  1,  7, BGEVENT_READ, ElmsLabTravelTip2
	bg_event  2,  7, BGEVENT_READ, ElmsLabTravelTip3
	bg_event  3,  7, BGEVENT_READ, ElmsLabTravelTip4
	bg_event  6,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  7,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  8,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  7, BGEVENT_READ, ElmsLabBookshelf
	bg_event  9,  3, BGEVENT_READ, ElmsLabTrashcan
	bg_event  5,  0, BGEVENT_READ, ElmsLabWindow
	bg_event  3,  5, BGEVENT_DOWN, ElmsLabPC

	db 6 ; object events
	object_event  5,  2, SPRITE_ELM, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfElmScript, -1
	object_event  2,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ElmsAideScript, EVENT_ELMS_AIDE_IN_LAB
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CyndaquilPokeBallScript, EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	object_event  7,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TotodilePokeBallScript, EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	object_event  8,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChikoritaPokeBallScript, EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	object_event  5,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CopScript, EVENT_COP_IN_ELMS_LAB
