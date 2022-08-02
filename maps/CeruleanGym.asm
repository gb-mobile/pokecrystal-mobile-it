	object_const_def ; object_event constants
	const CERULEANGYM_ROCKET
	const CERULEANGYM_MISTY
	const CERULEANGYM_SWIMMER_GIRL1
	const CERULEANGYM_SWIMMER_GIRL2
	const CERULEANGYM_SWIMMER_GUY
	const CERULEANGYM_GYM_GUY

CeruleanGym_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_CERULEANGYM_NOTHING
	scene_script .GruntRunsOut ; SCENE_CERULEANGYM_GRUNT_RUNS_OUT

	db 0 ; callbacks

.DummyScene0:
	end

.GruntRunsOut:
	prioritysjump .GruntRunsOutScript
	end

.GruntRunsOutScript:
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsDownMovement
	playsound SFX_TACKLE
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsIntoYouMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext CeruleanGymGruntIntroText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, CERULEANGYM_ROCKET, 15
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntBacksAwayMovement
	opentext
	writetext CeruleanGymGruntBigMistakeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntMovesCloseMovement
	opentext
	writetext CeruleanGymGruntByeText
	waitbutton
	closetext
	applymovement CERULEANGYM_ROCKET, CeruleanGymGruntRunsOutMovement
	playsound SFX_EXIT_BUILDING
	disappear CERULEANGYM_ROCKET
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_ROUTE_24_ROCKET
	clearevent EVENT_ROUTE_25_MISTY_BOYFRIEND
	setscene SCENE_CERULEANGYM_NOTHING
	setmapscene ROUTE_25, SCENE_ROUTE25_MISTYS_DATE
	setmapscene POWER_PLANT, SCENE_POWERPLANT_NOTHING
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, DOWN
	pause 15
	end

CeruleanGymMistyScript:
	faceplayer
	opentext
	checkflag ENGINE_CASCADEBADGE
	iftrue .FightDone
	writetext MistyIntroText
	waitbutton
	closetext
	winlosstext MistyWinLossText, 0
	loadtrainer MISTY, MISTY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SWIMMERM_PARKER
	opentext
	writetext ReceivedCascadeBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CASCADEBADGE
.FightDone:
	writetext MistyFightDoneText
	waitbutton
	closetext
	end

TrainerSwimmerfDiana:
	trainer SWIMMERF, DIANA, EVENT_BEAT_SWIMMERF_DIANA, SwimmerfDianaSeenText, SwimmerfDianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfBriana:
	trainer SWIMMERF, BRIANA, EVENT_BEAT_SWIMMERF_BRIANA, SwimmerfBrianaSeenText, SwimmerfBrianaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfBrianaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermParker:
	trainer SWIMMERM, PARKER, EVENT_BEAT_SWIMMERM_PARKER, SwimmermParkerSeenText, SwimmermParkerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermParkerAfterBattleText
	waitbutton
	closetext
	end

CeruleanGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_MISTY
	iftrue .CeruleanGymGuyWinScript
	writetext CeruleanGymGuyText
	waitbutton
	closetext
	end

.CeruleanGymGuyWinScript:
	writetext CeruleanGymGuyWinText
	waitbutton
	closetext
	end

CeruleanGymHiddenMachinePart:
	hiddenitem MACHINE_PART, EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM

CeruleanGymStatue1:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote1Text
	waitbutton
	closetext
	end

CeruleanGymStatue2:
	checkevent EVENT_TRAINERS_IN_CERULEAN_GYM
	iffalse CeruleanGymStatue
	opentext
	writetext CeruleanGymNote2Text
	waitbutton
	closetext
	end

CeruleanGymStatue:
	checkflag ENGINE_CASCADEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, MISTY, MISTY1
	jumpstd gymstatue2

CeruleanGymGruntRunsDownMovement:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

CeruleanGymGruntRunsOutMovement:
	big_step RIGHT
	big_step DOWN
	step_end

CeruleanGymGruntRunsIntoYouMovement:
	fix_facing
	set_sliding
	jump_step UP
	remove_sliding
	remove_fixed_facing
	step_sleep 8
	step_sleep 8
	step DOWN
	step DOWN
	step_end

CeruleanGymGruntMovesCloseMovement:
	big_step DOWN
	step_end

CeruleanGymGruntBacksAwayMovement:
	fix_facing
	slow_step UP
	remove_fixed_facing
	step_end

CeruleanGymGruntIntroText:
	text "Oh, tu scusa!"
	line "Tu no male,"
	cont "sì?"

	para "Io avere fretta,"
	line "no tempo per"
	cont "parlare. Io non"
	cont "volere che"
	cont "qualcuno vede me."
	done

CeruleanGymGruntBigMistakeText:
	text "Oh no! Tu avere"
	line "visto me ora! Io"
	cont "fatto errore!"
	done

CeruleanGymGruntByeText:
	text "Ehi, tu! Dimentica"
	line "che tu visto me,"

	para "ok? Tu avere visto"
	line "e sentito niente,"

	para "ok?"
	line "Niente niente."

	para "Ciao ciao."
	done

CeruleanGymNote1Text:
	text "Sarò assente per"
	line "un po'."
	cont "CAPOPALESTRA MISTY"
	done

CeruleanGymNote2Text:
	text "Visto che MISTY è"
	line "assente, saremo"
	cont "via anche noi."
	cont "Gli ALLENATORI"
	done

MistyIntroText:
	text "MISTY: Ehi,"
	line "microbo, ti stavo"
	cont "aspettando!"

	para "Potrai anche avere"
	line "tutte le MEDAGLIE"

	para "di JOHTO, ma"
	line "faresti bene a non"
	cont "sottovalutarmi."

	para "I miei #MON"
	line "acqua sono grandi!"
	done

MistyWinLossText:
	text "MISTY: Sei proprio"
	line "forte…"

	para "Devo ammettere che"
	line "hai talento…"

	para "Eccoti la MEDAGLIA"
	line "CASCATA!"
	done

ReceivedCascadeBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA CASCATA."
	done

MistyFightDoneText:
	text "MISTY: Ci sono"
	line "molti allenatori"
	cont "forti come te a"
	cont "JOHTO?"

	para "Un giorno andrò a"
	line "farci un giro, per"

	para "sfidare dei buoni"
	line "allenatori."
	done

SwimmerfDianaSeenText:
	text "Scusa per"
	line "l'assenza: dai,"
	cont "iniziamo!"
	done

SwimmerfDianaBeatenText:
	text "Mi arrendo: hai"
	line "vinto tu!"
	done

SwimmerfDianaAfterBattleText:
	text "Mi piace nuotare"
	line "con calma."
	done

SwimmerfBrianaSeenText:
	text "Non vorrei che il"
	line "modo in cui nuoto"
	cont "ti innervosisse."
	done

SwimmerfBrianaBeatenText:
	text "Ehi, mi hai"
	line "sistemato con"
	cont "tutta calma…"
	done

SwimmerfBrianaAfterBattleText:
	text "Non ti esaltare"
	line "per aver vinto."

	para "MISTY potrebbe"
	line "distruggerti se"
	cont "perdi la"
	cont "concentrazione."
	done

SwimmermParkerSeenText:
	text "Eccomi…"

	para "Sono io il tuo"
	line "primo ostacolo!"
	done

SwimmermParkerBeatenText:
	text "Non può essere…"
	done

SwimmermParkerAfterBattleText:
	text "MISTY è molto"
	line "migliorata negli"
	cont "ultimi tempi."

	para "Non abbassare la"
	line "guardia o potrà"
	cont "farti molto male!"
	done

CeruleanGymGuyText:
	text "Ehi, CAMPIONE"
	line "in erba!"

	para "Già che MISTY"
	line "non c'era, ho"

	para "fatto un giro"
	line "anch'io: eh eh eh."
	done

CeruleanGymGuyWinText:
	text "Mi hai dimostrato"
	line "quanto vali."

	para "È stata una"
	line "gran bella lotta!"
	done

CeruleanGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, CERULEAN_CITY, 5
	warp_event  5, 15, CERULEAN_CITY, 5

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  8, BGEVENT_ITEM, CeruleanGymHiddenMachinePart
	bg_event  2, 13, BGEVENT_READ, CeruleanGymStatue1
	bg_event  6, 13, BGEVENT_READ, CeruleanGymStatue2

	db 6 ; object events
	object_event  4, 10, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_CERULEAN_GYM_ROCKET
	object_event  5,  3, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanGymMistyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  4,  6, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDiana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  1,  9, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerSwimmerfBriana, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  8,  9, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermParker, EVENT_TRAINERS_IN_CERULEAN_GYM
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanGymGuyScript, EVENT_TRAINERS_IN_CERULEAN_GYM
