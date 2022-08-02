	object_const_def ; object_event constants
	const ROUTE24_ROCKET

Route24_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route24RocketScript:
	faceplayer
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketSeenText
	waitbutton
	closetext
	winlosstext Route24RocketBeatenText, -1
	loadtrainer GRUNTM, GRUNTM_31
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext Route24RocketAfterBattleText
	buttonsound
	special FadeOutMusic
	writetext Route24RocketDisappearsText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear ROUTE24_ROCKET
	pause 25
	special FadeInQuickly
	playmapmusic
	end

Route24RocketSeenText:
	text "Ehi, tu! Io uno"
	line "di TEAM ROCKET,"
	cont "capire tu?"

	para "Da un altro paese"
	line "venire, essere"
	cont "numero uno!"

	para "Io avere pensato:"
	line "senza elettricità"

	para "la gente tremare"
	line "dal terrore!"

	para "Missione mia"
	line "essere segreta,"
	cont "non posso io a te"
	cont "raccontare."

	para "Ma se tu vince con"
	line "me, dirò io a te"

	para "il mio segreto: io"
	line "essere sincero!"

	para "Che aspettare:"
	line "lottiamo!"
	done

Route24RocketBeatenText:
	text "No, no, no."
	line "Credere posso io"
	cont "no!"

	para "Incredibile, tu"
	line "battuto me avere,"
	cont "uno zero sono!"
	done

Route24RocketAfterBattleText:
	text "Ok. Il segreto io"
	line "mio ti dirò."

	para "PEZZO MACCHINA ru-"
	line "bato, nascosto ho"

	para "in PALESTRA"
	line "CELESTOPOLI."

	para "Nell'acqua"
	line "gettato l'ho,"

	para "guarda nell'acqua"
	line "al centro della"
	cont "PALESTRA."

	para "Dimenticherai ti"
	line "di me però no!"

	para "Batterà di sicuro"
	line "TEAM ROCKET te."

	para "Da JOHTO"
	line "arrivano loro poi"

	para "vendicarsi per"
	line "di te."
	done

Route24RocketDisappearsText:
	text "…"

	para "Dici cosa tu? TEAM"
	line "ROCKET ciao ciao?"

	para "Sconfitto già è"
	line "dici tu?"

	para "Oh, no! E ora"
	line "faccio io cosa?"
	done

Route24_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  8,  7, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route24RocketScript, EVENT_ROUTE_24_ROCKET
