	object_const_def ; object_event constants
	const CINNABARISLAND_BLUE

CinnabarIsland_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CINNABAR
	return

CinnabarIslandBlue:
	faceplayer
	opentext
	writetext CinnabarIslandBlueText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CINNABARISLAND_BLUE, CinnabarIslandBlueTeleport
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd pokecentersign

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

CinnabarIslandBlueText:
	text "E tu chi sei?"

	para "Beh, che alleni i"
	line "#MON è"
	cont "chiaro…"

	para "Io sono BLU."

	para "Sono stato"
	line "CAMPIONE, anche se"

	para "per un breve"
	line "periodo…"

	para "Poi ROSSO mi ha"
	line "battuto…"

	para "Ad ogni modo: cosa"
	line "vuoi? Sei qui per"

	para "sfidarmi, o per"
	line "quale motivo?"

	para "…Odio doverlo"
	line "dire, ma non sono"

	para "proprio in vena"
	line "di lottare."

	para "Guarda come vanno"
	line "le cose…"

	para "Se erutta un"
	line "vulcano, può"

	para "scomparire un'"
	line "intera città."

	para "Con i #MON"
	line "puoi vincere o"

	para "perdere, ma quando"
	line "la natura decide"

	para "di colpirti, non"
	line "hai scampo."

	para "…"

	para "È così che"
	line "funziona…"

	para "Comunque, sono"
	line "sempre un"
	cont "allenatore."

	para "E se mi trovo"
	line "davanti un forte"
	cont "avversario, devo"
	cont "sfidarlo."

	para "Se vuoi sfidarmi,"
	line "mi trovi alla"
	cont "PALESTRA di"
	cont "SMERALDOPOLI."

	para "Ti affronterò là."
	done

CinnabarIslandGymSignText:
	text "Un avviso:"
	line "c'è scritto…"

	para "La PALESTRA dell'"
	line "ISOLA CANNELLA s'è"
	cont "trasferita sulle"
	cont "ISOLE SPUMARINE."

	para "BLAINE"
	done

CinnabarIslandSignText:
	text "ISOLA CANNELLA"
	line "Città ardente!"
	done

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11, 11, CINNABAR_POKECENTER_1F, 1

	db 0 ; coord events

	db 4 ; bg events
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  7,  7, BGEVENT_READ, CinnabarIslandSign
	bg_event  9,  1, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy

	db 1 ; object events
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
