	object_const_def ; object_event constants
	const VIRIDIANGYM_BLUE
	const VIRIDIANGYM_GYM_GUY

ViridianGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ViridianGymBlueScript:
	faceplayer
	opentext
	checkflag ENGINE_EARTHBADGE
	iftrue .FightDone
	writetext LeaderBlueBeforeText
	waitbutton
	closetext
	winlosstext LeaderBlueWinText, 0
	loadtrainer BLUE, BLUE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLUE
	opentext
	writetext Text_ReceivedEarthBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_EARTHBADGE
	writetext LeaderBlueAfterText
	waitbutton
	closetext
	end

.FightDone:
	writetext LeaderBlueEpilogueText
	waitbutton
	closetext
	end

ViridianGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BLUE
	iftrue .ViridianGymGuyWinScript
	writetext ViridianGymGuyText
	waitbutton
	closetext
	end

.ViridianGymGuyWinScript:
	writetext ViridianGymGuyWinText
	waitbutton
	closetext
	end

ViridianGymStatue:
	checkflag ENGINE_EARTHBADGE
	iftrue .Beaten
	jumpstd gymstatue1

.Beaten:
	gettrainername STRING_BUFFER_4, BLUE, BLUE1
	jumpstd gymstatue2

LeaderBlueBeforeText:
	text "BLU: Eccoti"
	line "finalmente!"

	para "A ISOLA CANNELLA"
	line "non ero in vena,"

	para "ora sono pronto"
	line "a lottare con te."

	para "…"

	para "Vuoi dirmi che hai"
	line "conquistato tutte"
	cont "le PALESTRE"
	cont "di JOHTO?"

	para "Beh, allora le"
	line "PALESTRE di JOHTO"
	cont "devono essere"
	cont "proprio patetiche."

	para "No, non ti"
	line "preoccupare."

	para "Capirò quanto vali"
	line "lottando contro di"
	cont "te adesso."

	para "In guardia,"
	line "CAMPIONE di JOHTO!"
	done

LeaderBlueWinText:
	text "BLU: Ma come?"

	para "Come ho potuto"
	line "perdere?"

	para "…"

	para "E va bene…"
	line "Prendi questa"
	cont "MEDAGLIA TERRA."
	done

Text_ReceivedEarthBadge:
	text "<PLAYER> riceve"
	line "la MEDAGLIA TERRA."
	done

LeaderBlueAfterText:
	text "BLU: …"

	para "Ok, mi ero"
	line "sbagliato. Sei"

	para "davvero in gamba"
	line "con i #MON!"

	para "Ma un giorno o"
	line "l'altro ti"

	para "batterò: non"
	line "dimenticarlo!"
	done

LeaderBlueEpilogueText:
	text "BLU: Ehi, tu!"

	para "Non perdere fino"
	line "a che non ti avrò"
	cont "battuto io, ok?"
	done

ViridianGymGuyText:
	text "Ehi, CAMPIONE"
	line "in erba!"

	para "Come ti senti?"
	line "Pare che ti vada"
	cont "alla grande!"

	para "Il CAPOPALESTRA di"
	line "qui ha lottato con"

	para "il CAMPIONE"
	line "tre anni fa."

	para "È un osso duro."

	para "Cerca di"
	line "mettercela tutta!"
	done

ViridianGymGuyWinText:
	text "Ah, sei davvero un"
	line "tipo tosto…"

	para "Il tuo è stato"
	line "davvero un pezzo"

	para "di bravura. Ho gli"
	line "occhi lucidi!"
	done

ViridianGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VIRIDIAN_CITY, 1
	warp_event  5, 17, VIRIDIAN_CITY, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, ViridianGymStatue
	bg_event  6, 13, BGEVENT_READ, ViridianGymStatue

	db 2 ; object events
	object_event  5,  3, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ViridianGymBlueScript, EVENT_VIRIDIAN_GYM_BLUE
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ViridianGymGuyScript, EVENT_VIRIDIAN_GYM_BLUE
