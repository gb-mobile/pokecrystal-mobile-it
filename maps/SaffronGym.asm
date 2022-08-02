	object_const_def ; object_event constants
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_GRANNY1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_GRANNY2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_GYM_GUY

SaffronGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	opentext
	writetext ReceivedMarshBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	writetext SabrinaMarshBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext SabrinaFightDoneText
	waitbutton
	closetext
	end

TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFranklin:
	trainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFranklinAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJaredAfterBattleText
	waitbutton
	closetext
	end

SaffronGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuyWinScript
	writetext SaffronGymGuyText
	waitbutton
	closetext
	end

.SaffronGymGuyWinScript:
	writetext SaffronGymGuyWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, SABRINA, SABRINA1
	jumpstd gymstatue2

SabrinaIntroText:
	text "SABRINA: Ti stavo"
	line "aspettando…"

	para "Tre anni fa ho"
	line "avuto una visione"
	cont "del tuo arrivo."

	para "Vuoi la mia"
	line "MEDAGLIA?"

	para "Non amo lottare,"
	line "ma è il mio dovere"

	para "di CAPOPALESTRA"
	line "conferire MEDAGLIE"

	para "a chi dimostri"
	line "di meritarle."

	para "Se lo vuoi, ora"
	line "vedrai i miei"
	cont "poteri psichici."
	done

SabrinaWinLossText:
	text "SABRINA: La tua"
	line "forza è…"

	para "…molto maggiore di"
	line "quanto credessi…"

	para "Ma forse non si"
	line "può predire"

	para "perfettamente"
	line "il futuro…"

	para "Ok, hai vinto tu."
	line "Hai guadagnato la"
	cont "MEDAGLIA PALUDE."
	done

ReceivedMarshBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA PALUDE."
	done

SabrinaMarshBadgeText:
	text "SABRINA: La"
	line "MEDAGLIA PALUDE"

	para "libera i tuoi"
	line "poteri segreti…"

	para "Anche se non ho"
	line "previsto tutta la"
	cont "tua forza, di una"
	cont "cosa sono davvero"
	cont "certa: godrai del"

	para "rispetto di un"
	line "vero CAMPIONE."
	done

SabrinaFightDoneText:
	text "SABRINA: Il tuo a-"
	line "more per i #MON"

	para "ha battuto il mio"
	line "potere psichico…"

	para "Anche l'amore è"
	line "un potere psichico"

	para "secondo me, sei"
	line "d'accordo?"
	done

MediumRebeccaSeenText:
	text "Ora riceverò la"
	line "forza di tutti"
	cont "quelli che hai"
	cont "battuto."
	done

MediumRebeccaBeatenText:
	text "Forte…"
	line "Troppo forte…"
	done

MediumRebeccaAfterBattleText:
	text "Da dove proviene"
	line "la tua forza?"
	done

PsychicFranklinSeenText:
	text "Il potere psichico"
	line "è la forza"
	cont "dell'anima."
	done

PsychicFranklinBeatenText:
	text "La tua anima è più"
	line "forte della mia."
	done

PsychicFranklinAfterBattleText:
	text "La tua forza non è"
	line "solo fisica, ma è"
	cont "anche nell'anima."
	done

MediumDorisSeenText:
	text "Fufufufu… So"
	line "tutto di te."

	para "Ho potuto leggere"
	line "nel tuo cuore."
	done

MediumDorisBeatenText:
	text "Pur avendoti letto"
	line "dentro, ho perso…"
	done

MediumDorisAfterBattleText:
	text "Oh, ora ricordo!"
	line "Avevo predetto che"
	cont "avrei perso!"
	done

PsychicJaredSeenText:
	text "Il DOJO KARATE"
	line "della porta accan-"
	cont "to era la PALESTRA"
	cont "un tempo."
	done

PsychicJaredBeatenText:
	text "Non c'è storia…"
	done

PsychicJaredAfterBattleText:
	text "Il RE del KARATE,"
	line "maestro di DOJO"

	para "KARATE, è stato"
	line "distrutto da"
	cont "SABRINA."
	done

SaffronGymGuyText:
	text "Ehi, CAMPIONE"
	line "in erba!"

	para "Una persona"
	line "esperta come te"

	para "non ha certo"
	line "bisogno che le si"

	para "dica come trattare"
	line "i #MON"
	cont "di tipo psico."

	para "Mi aspetto grandi"
	line "cose da te!"

	para "In bocca al lupo."
	done

SaffronGymGuyWinText:
	text "È stata un'altra"
	line "fantastica lotta!"
	done

SaffronGym_MapEvents:
	db 0, 0 ; filler

	db 32 ; warp events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 11, 15, SAFFRON_GYM, 18
	warp_event 19, 15, SAFFRON_GYM, 19
	warp_event 19, 11, SAFFRON_GYM, 20
	warp_event  1, 11, SAFFRON_GYM, 21
	warp_event  5,  3, SAFFRON_GYM, 22
	warp_event 11,  5, SAFFRON_GYM, 23
	warp_event  1, 15, SAFFRON_GYM, 24
	warp_event 19,  3, SAFFRON_GYM, 25
	warp_event 15, 17, SAFFRON_GYM, 26
	warp_event  5, 17, SAFFRON_GYM, 27
	warp_event  5,  9, SAFFRON_GYM, 28
	warp_event  9,  3, SAFFRON_GYM, 29
	warp_event 15,  9, SAFFRON_GYM, 30
	warp_event 15,  5, SAFFRON_GYM, 31
	warp_event  1,  5, SAFFRON_GYM, 32
	warp_event 19, 17, SAFFRON_GYM, 3
	warp_event 19,  9, SAFFRON_GYM, 4
	warp_event  1,  9, SAFFRON_GYM, 5
	warp_event  5,  5, SAFFRON_GYM, 6
	warp_event 11,  3, SAFFRON_GYM, 7
	warp_event  1, 17, SAFFRON_GYM, 8
	warp_event 19,  5, SAFFRON_GYM, 9
	warp_event 15, 15, SAFFRON_GYM, 10
	warp_event  5, 15, SAFFRON_GYM, 11
	warp_event  5, 11, SAFFRON_GYM, 12
	warp_event  9,  5, SAFFRON_GYM, 13
	warp_event 15, 11, SAFFRON_GYM, 14
	warp_event 15,  3, SAFFRON_GYM, 15
	warp_event  1,  3, SAFFRON_GYM, 16
	warp_event 11,  9, SAFFRON_GYM, 17

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	db 6 ; object events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event 17, 16, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event  3, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFranklin, -1
	object_event  3,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event 17,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJared, -1
	object_event  9, 14, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuyScript, -1
