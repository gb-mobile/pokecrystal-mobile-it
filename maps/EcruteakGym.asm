	object_const_def ; object_event constants
	const ECRUTEAKGYM_MORTY
	const ECRUTEAKGYM_SAGE1
	const ECRUTEAKGYM_SAGE2
	const ECRUTEAKGYM_GRANNY1
	const ECRUTEAKGYM_GRANNY2
	const ECRUTEAKGYM_GYM_GUY
	const ECRUTEAKGYM_GRAMPS

EcruteakGym_MapScripts:
	db 2 ; scene scripts
	scene_script .ForcedToLeave ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.ForcedToLeave:
	prioritysjump EcruteakGymClosed
	end

.DummyScene:
	end

EcruteakGymMortyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .FightDone
	writetext MortyIntroText
	waitbutton
	closetext
	winlosstext MortyWinLossText, 0
	loadtrainer MORTY, MORTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MORTY
	opentext
	writetext Text_ReceivedFogBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_FOGBADGE
	readvar VAR_BADGES
	scall EcruteakGymActivateRockets
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_FINISHED
	setevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
.FightDone:
	checkevent EVENT_GOT_TM30_SHADOW_BALL
	iftrue .GotShadowBall
	setevent EVENT_BEAT_SAGE_JEFFREY
	setevent EVENT_BEAT_SAGE_PING
	setevent EVENT_BEAT_MEDIUM_MARTHA
	setevent EVENT_BEAT_MEDIUM_GRACE
	writetext MortyText_FogBadgeSpeech
	buttonsound
	verbosegiveitem TM_SHADOW_BALL
	iffalse .NoRoomForShadowBall
	setevent EVENT_GOT_TM30_SHADOW_BALL
	writetext MortyText_ShadowBallSpeech
	waitbutton
	closetext
	end

.GotShadowBall:
	writetext MortyFightDoneText
	waitbutton
.NoRoomForShadowBall:
	closetext
	end

EcruteakGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

EcruteakGymClosed:
	applymovement PLAYER, EcruteakGymPlayerStepUpMovement
	applymovement ECRUTEAKGYM_GRAMPS, EcruteakGymGrampsSlowStepDownMovement
	opentext
	writetext EcruteakGymClosedText
	waitbutton
	closetext
	follow PLAYER, ECRUTEAKGYM_GRAMPS
	applymovement PLAYER, EcruteakGymPlayerSlowStepDownMovement
	stopfollow
	special FadeOutPalettes
	playsound SFX_ENTER_DOOR
	waitsfx
	warp ECRUTEAK_CITY, 6, 27
	end

TrainerSageJeffrey:
	trainer SAGE, JEFFREY, EVENT_BEAT_SAGE_JEFFREY, SageJeffreySeenText, SageJeffreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJeffreyAfterBattleText
	waitbutton
	closetext
	end

TrainerSagePing:
	trainer SAGE, PING, EVENT_BEAT_SAGE_PING, SagePingSeenText, SagePingBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SagePingAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumMartha:
	trainer MEDIUM, MARTHA, EVENT_BEAT_MEDIUM_MARTHA, MediumMarthaSeenText, MediumMarthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumMarthaAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumGrace:
	trainer MEDIUM, GRACE, EVENT_BEAT_MEDIUM_GRACE, MediumGraceSeenText, MediumGraceBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumGraceAfterBattleText
	waitbutton
	closetext
	end

EcruteakGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MORTY
	iftrue .EcruteakGymGuyWinScript
	writetext EcruteakGymGuyText
	waitbutton
	closetext
	end

.EcruteakGymGuyWinScript:
	writetext EcruteakGymGuyWinText
	waitbutton
	closetext
	end

EcruteakGymStatue:
	checkflag ENGINE_FOGBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, MORTY, MORTY1
	jumpstd gymstatue2

EcruteakGymPlayerStepUpMovement:
	step UP
	step_end

EcruteakGymPlayerSlowStepDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

EcruteakGymGrampsSlowStepDownMovement:
	slow_step DOWN
	step_end

MortyIntroText:
	text "Hai fatto un"
	line "ottimo lavoro per"
	cont "giungere qui."

	para "Ad AMARANTOPOLI i"
	line "#MON sono"
	cont "sempre stati"
	cont "riveriti."

	para "Si dice che un"
	line "#MON con i"

	para "colori dell'arco-"
	line "baleno apparirà"

	para "per sfidare un"
	line "allenatore forte"
	cont "e puro."

	para "È per questo che"
	line "mi sono allenato"

	para "qui, in segreto,"
	line "tutta la mia vita."

	para "Ora posso vedere"
	line "ciò che gli altri"
	cont "non vedono."

	para "Mi manca poco…"

	para "Mi manca poco per"
	line "vedere un futuro"

	para "in cui finalmente"
	line "vedrò il #MON"
	cont "con i colori"
	cont "dell'arcobaleno."

	para "E tu mi aiuterai a"
	line "raggiungere quel"
	cont "livello!"
	done

MortyWinLossText:
	text "Non sono ancora"
	line "al massimo…"

	para "E va bene. La"
	line "MEDAGLIA è tua."
	done

Text_ReceivedFogBadge:
	text "<PLAYER> riceve la"
	line "MEDAGLIA NEBBIA."
	done

MortyText_FogBadgeSpeech:
	text "Con la MEDAGLIA"
	line "NEBBIA i #MON"

	para "fino al livello 50"
	line "ti obbediranno."

	para "Inoltre, i #MON"
	line "che hanno SURF lo"

	para "potranno usare in"
	line "qualsiasi momento."

	para "Prendi anche"
	line "questa."
	done

MortyText_ShadowBallSpeech:
	text "È una PALLA"
	line "OMBRA. Causa danni"
	cont "e può ridurre la"

	para "DIFESA SPECIALE."
	line "Usala se ti va!"
	done

MortyFightDoneText:
	text "Capisco…"

	para "Il tuo viaggio ti"
	line "ha portato molto"
	cont "lontano."

	para "E hai visto molte"
	line "più cose di me."

	para "Ti invidio un"
	line "po'…"
	done

SageJeffreySeenText:
	text "Ho passato la pri-"
	line "mavera con i #-"
	cont "MON, poi l'estate,"
	cont "l'autunno…"

	para "E dopo l'inverno è"
	line "tornata la prima-"
	cont "vera. È tanto che"
	cont "viviamo insieme!"
	done

SageJeffreyBeatenText:
	text "Ho avuto sconfitte"
	line "e vittorie!"
	done

SageJeffreyAfterBattleText:
	text "Da dove vengono i "
	line "#MON?"
	done

SagePingSeenText:
	text "Potrai battere i"
	line "nostri #MON?"
	done

SagePingBeatenText:
	text "Ah! Ben fatto!"
	done

SagePingAfterBattleText:
	text "Usiamo solo #-"
	line "MON spettro."

	para "Gli attacchi di"
	line "tipo normale non"
	cont "li colpiscono."
	done

MediumMarthaSeenText:
	text "Vincerò!"
	done

MediumMarthaBeatenText:
	text "No, ho perso!"
	done

MediumMarthaAfterBattleText:
	text "Vince chi lo"
	line "desidera di più!"
	done

MediumGraceSeenText:
	text "Hai inciampato nel"
	line "pavimento invisi-"
	cont "bile? Battimi e ti"
	cont "darò un consiglio!"
	done

MediumGraceBeatenText:
	text "Come?"
	done

MediumGraceAfterBattleText:
	text "E va bene. Ti dirò"
	line "il segreto del"

	para "pavimento"
	line "invisibile."

	para "La strada è"
	line "proprio davanti"
	cont "ai nostri occhi."
	done

EcruteakGymGuyText:
	text "Gli allenatori di"
	line "qui conoscono"
	cont "strani segreti."

	para "Se vinci, potranno"
	line "dirti qualcosa sui"

	para "profondi misteri"
	line "di AMARANTOPOLI."
	done

EcruteakGymGuyWinText:
	text "Uauh, <PLAYER>!"
	line "Sei grande!"

	para "Ho dovuto nascon-"
	line "dermi per la"
	cont "paura!"
	done

EcruteakGymClosedText:
	text "Il CAPOPALESTRA"
	line "ANGELO è assente."

	para "Mi dispiace, ma"
	line "devi andartene."
	done

EcruteakGym_MapEvents:
	db 0, 0 ; filler

	db 33 ; warp events
	warp_event  4, 17, ECRUTEAK_CITY, 10
	warp_event  5, 17, ECRUTEAK_CITY, 10
	warp_event  4, 14, ECRUTEAK_GYM, 4
	warp_event  2,  4, ECRUTEAK_GYM, 3
	warp_event  3,  4, ECRUTEAK_GYM, 3
	warp_event  4,  4, ECRUTEAK_GYM, 3
	warp_event  4,  5, ECRUTEAK_GYM, 3
	warp_event  6,  7, ECRUTEAK_GYM, 3
	warp_event  7,  4, ECRUTEAK_GYM, 3
	warp_event  2,  6, ECRUTEAK_GYM, 3
	warp_event  3,  6, ECRUTEAK_GYM, 3
	warp_event  4,  6, ECRUTEAK_GYM, 3
	warp_event  5,  6, ECRUTEAK_GYM, 3
	warp_event  7,  6, ECRUTEAK_GYM, 3
	warp_event  7,  7, ECRUTEAK_GYM, 3
	warp_event  4,  8, ECRUTEAK_GYM, 3
	warp_event  5,  8, ECRUTEAK_GYM, 3
	warp_event  6,  8, ECRUTEAK_GYM, 3
	warp_event  7,  8, ECRUTEAK_GYM, 3
	warp_event  2,  8, ECRUTEAK_GYM, 3
	warp_event  2,  9, ECRUTEAK_GYM, 3
	warp_event  2, 10, ECRUTEAK_GYM, 3
	warp_event  2, 11, ECRUTEAK_GYM, 3
	warp_event  4, 10, ECRUTEAK_GYM, 3
	warp_event  5, 10, ECRUTEAK_GYM, 3
	warp_event  2, 12, ECRUTEAK_GYM, 3
	warp_event  3, 12, ECRUTEAK_GYM, 3
	warp_event  4, 12, ECRUTEAK_GYM, 3
	warp_event  5, 12, ECRUTEAK_GYM, 3
	warp_event  7, 10, ECRUTEAK_GYM, 3
	warp_event  7, 11, ECRUTEAK_GYM, 3
	warp_event  7, 12, ECRUTEAK_GYM, 3
	warp_event  7, 13, ECRUTEAK_GYM, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, EcruteakGymStatue
	bg_event  6, 15, BGEVENT_READ, EcruteakGymStatue

	db 7 ; object events
	object_event  5,  1, SPRITE_MORTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, EcruteakGymMortyScript, -1
	object_event  2,  7, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSageJeffrey, -1
	object_event  3, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSagePing, -1
	object_event  7,  5, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumMartha, -1
	object_event  7,  9, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerMediumGrace, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakGymGuyScript, -1
	object_event  4, 14, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_GYM_GRAMPS
