	object_const_def ; object_event constants
	const PEWTERGYM_BROCK
	const PEWTERGYM_YOUNGSTER
	const PEWTERGYM_GYM_GUY

PewterGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterGymBrockScript:
	faceplayer
	opentext
	checkflag ENGINE_BOULDERBADGE
	iftrue .FightDone
	writetext BrockIntroText
	waitbutton
	closetext
	winlosstext BrockWinLossText, 0
	loadtrainer BROCK, BROCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	opentext
	writetext ReceivedBoulderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext BrockBoulderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext BrockFightDoneText
	waitbutton
	closetext
	end

TrainerCamperJerry:
	trainer CAMPER, JERRY, EVENT_BEAT_CAMPER_JERRY, CamperJerrySeenText, CamperJerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperJerryAfterBattleText
	waitbutton
	closetext
	end

PewterGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuyWinScript
	writetext PewterGymGuyText
	waitbutton
	closetext
	end

.PewterGymGuyWinScript:
	writetext PewterGymGuyWinText
	waitbutton
	closetext
	end

PewterGymStatue:
	checkflag ENGINE_BOULDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, BROCK, BROCK1
	jumpstd gymstatue2

BrockIntroText:
	text "BROCK: Uauh, non"
	line "capita spesso di"

	para "avere uno sfidante"
	line "da JOHTO."

	para "Sono BROCK, il"
	line "CAPOPALESTRA di"

	para "PLUMBEOPOLI. Sono"
	line "un esperto di"
	cont "#MON roccia."

	para "I miei #MON"
	line "resistono a quasi"

	para "tutti gli attacchi"
	line "fisici. Non ti"

	para "sarà facile"
	line "colpirli."

	para "Avanti!"
	done

BrockWinLossText:
	text "BROCK: Le potenti"
	line "mosse dei tuoi"
	cont "#MON hanno"
	cont "sbriciolato la mia"
	cont "rocciosa difesa…"

	para "Sei più forte di"
	line "quanto credessi…"

	para "Continua così!"
	line "Ecco la MEDAGLIA!"
	done

ReceivedBoulderBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA SASSO."
	done

BrockBoulderBadgeText:
	text "BROCK: <PLAY_G>,"
	line "grazie. È stato"

	para "bello lottare con"
	line "te, anche se sono"
	cont "un po' arrabbiato."

	para "La MEDAGLIA SASSO"
	line "renderà i tuoi"

	para "#MON ancora"
	line "più forti."
	done

BrockFightDoneText:
	text "BROCK: Il mondo"
	line "è grande: troverai"

	para "altri allenatori"
	line "forti come te."

	para "Aspetta e vedrai:"
	line "io stesso"
	cont "diventerò molto"
	cont "più forte."
	done

CamperJerrySeenText:
	text "In questa PALESTRA"
	line "si usano #MON"
	cont "roccia."

	para "Il tipo roccia ha"
	line "una forte DIFESA."

	para "Le lotte contro"
	line "questo tipo di"

	para "solito durano a"
	line "lungo: iniziamo?"
	done

CamperJerryBeatenText:
	text "Questa lotta era"
	line "da vincere…"
	done

CamperJerryAfterBattleText:
	text "Ehi tu! Vieni da"
	line "JOHTO, vero? BROCK"

	para "è forte! Se fossi"
	line "in te non lo"

	para "sottovaluterei, o"
	line "te ne potresti"
	cont "pentire!"
	done

PewterGymGuyText:
	text "Ehi tu, giovane"
	line "CAMPIONE! Sei"

	para "impressionante!"
	line "Stai sfidando i"

	para "CAPOPALESTRA di"
	line "KANTO?"

	para "Sono forti e"
	line "molto seri,"

	para "proprio come"
	line "quelli di JOHTO."
	done

PewterGymGuyWinText:
	text "Ehi, giovane"
	line "CAMPIONE! Non hai"

	para "avuto problemi con"
	line "questa PALESTRA."

	para "Mi piace la"
	line "serietà con cui"

	para "agisci: dico sul"
	line "serio."
	done

PewterGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 13, PEWTER_CITY, 2
	warp_event  5, 13, PEWTER_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2, 11, BGEVENT_READ, PewterGymStatue
	bg_event  7, 11, BGEVENT_READ, PewterGymStatue

	db 3 ; object events
	object_event  5,  1, SPRITE_BROCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, PewterGymBrockScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperJerry, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, PewterGymGuyScript, -1
