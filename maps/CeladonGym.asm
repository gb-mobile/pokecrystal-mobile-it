	object_const_def ; object_event constants
	const CELADONGYM_ERIKA
	const CELADONGYM_LASS1
	const CELADONGYM_LASS2
	const CELADONGYM_BUENA
	const CELADONGYM_TWIN1
	const CELADONGYM_TWIN2

CeladonGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonGymErikaScript:
	faceplayer
	opentext
	checkflag ENGINE_RAINBOWBADGE
	iftrue .FightDone
	writetext ErikaBeforeBattleText
	waitbutton
	closetext
	winlosstext ErikaBeatenText, 0
	loadtrainer ERIKA, ERIKA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_ERIKA
	setevent EVENT_BEAT_LASS_MICHELLE
	setevent EVENT_BEAT_PICNICKER_TANYA
	setevent EVENT_BEAT_BEAUTY_JULIA
	setevent EVENT_BEAT_TWINS_JO_AND_ZOE
	opentext
	writetext PlayerReceivedRainbowBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_RAINBOWBADGE
.FightDone:
	checkevent EVENT_GOT_TM19_GIGA_DRAIN
	iftrue .GotGigaDrain
	writetext ErikaExplainTMText
	buttonsound
	verbosegiveitem TM_GIGA_DRAIN
	iffalse .GotGigaDrain
	setevent EVENT_GOT_TM19_GIGA_DRAIN
.GotGigaDrain:
	writetext ErikaAfterBattleText
	waitbutton
	closetext
	end

TrainerLassMichelle:
	trainer LASS, MICHELLE, EVENT_BEAT_LASS_MICHELLE, LassMichelleSeenText, LassMichelleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassMichelleAfterBattleText
	waitbutton
	closetext
	end

TrainerPicnickerTanya:
	trainer PICNICKER, TANYA, EVENT_BEAT_PICNICKER_TANYA, PicnickerTanyaSeenText, PicnickerTanyaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PicnickerTanyaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyJulia:
	trainer BEAUTY, JULIA, EVENT_BEAT_BEAUTY_JULIA, BeautyJuliaSeenText, BeautyJuliaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyJuliaAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe1:
	trainer TWINS, JOANDZOE1, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe1SeenText, TwinsJoAndZoe1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsJoAndZoe2:
	trainer TWINS, JOANDZOE2, EVENT_BEAT_TWINS_JO_AND_ZOE, TwinsJoAndZoe2SeenText, TwinsJoAndZoe2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsJoAndZoe2AfterBattleText
	waitbutton
	closetext
	end

CeladonGymStatue:
	checkflag ENGINE_RAINBOWBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, ERIKA, ERIKA1
	jumpstd gymstatue2

ErikaBeforeBattleText:
	text "ERIKA: Ciao…"
	line "Che tempo"

	para "splendido, vero?"
	line "È così rilassante…"

	para "…Rischio di"
	line "addormentarmi…"

	para "Mi chiamo ERIKA."
	line "Sono CAPOPALESTRA"
	cont "di AZZURROPOLI."

	para "… Arrivi da"
	line "JOHTO?"
	cont "Complimenti…"

	para "Ah, scusa. Non"
	line "avevo capito che"

	para "fossi qui per"
	line "sfidarmi."

	para "Va bene, ma guarda"
	line "che non perderò!"
	done

ErikaBeatenText:
	text "ERIKA: Ok, ho"
	line "perso, lo ammetto…"

	para "Sei davvero"
	line "una forza…"

	para "Ti darò la MEDA-"
	line "GLIA ARCOBALENO…"
	done

PlayerReceivedRainbowBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA"
	cont "ARCOBALENO."
	done

ErikaExplainTMText:
	text "ERIKA: È stata una"
	line "gran bella lotta."

	para "Molto emozionante."
	line "Prendi questa MT,"
	cont "te la meriti."

	para "È GIGASSORBIMENTO."

	para "È una potente"
	line "mossa che dà"

	para "al tuo #MON"
	line "metà dei PS tolti"
	cont "all'avversario."

	para "Puoi usarla quando"
	line "vuoi…"
	done

ErikaAfterBattleText:
	text "ERIKA: Perdere"
	line "lascia l'amaro"
	cont "in bocca…"

	para "Ma sapere che ci"
	line "sono allenatori"

	para "forti mi sprona a"
	line "far meglio…"
	done

LassMichelleSeenText:
	text "Pensi che sia"
	line "rara una PALESTRA"
	cont "per sole ragazze?"
	done

LassMichelleBeatenText:
	text "Che rabbia!"
	done

LassMichelleAfterBattleText:
	text "È stato solo un"
	line "attimo di"
	cont "distrazione!"
	done

PicnickerTanyaSeenText:
	text "Vuoi lottare? Sono"
	line "un po' spaventata,"
	cont "ma va bene!"
	done

PicnickerTanyaBeatenText:
	text "È già finita?"
	done

PicnickerTanyaAfterBattleText:
	text "Hai così tante"
	line "MEDAGLIE! Non"

	para "avrei mai potuto"
	line "vincere."
	done

BeautyJuliaSeenText:
	text "Stavi guardando"
	line "me o i fiori?"
	done

BeautyJuliaBeatenText:
	text "Che fastidio!"
	done

BeautyJuliaAfterBattleText:
	text "Diventerò mai"
	line "una gran signora"
	cont "come ERIKA?"
	done

TwinsJoAndZoe1SeenText:
	text "Ora vedrai che"
	line "mosse abbiamo"
	cont "imparato da ERIKA!"
	done

TwinsJoAndZoe1BeatenText:
	text "Oh… Abbiamo"
	line "perso…"
	done

TwinsJoAndZoe1AfterBattleText:
	text "Ma ERIKA ci"
	line "vendicherà!"
	done

TwinsJoAndZoe2SeenText:
	text "Siamo qui per"
	line "proteggere ERIKA!"
	done

TwinsJoAndZoe2BeatenText:
	text "Niente da fare…"
	done

TwinsJoAndZoe2AfterBattleText:
	text "Ma ERIKA è molto,"
	line "molto più forte!"
	done

CeladonGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, CELADON_CITY, 8
	warp_event  5, 17, CELADON_CITY, 8

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, CeladonGymStatue
	bg_event  6, 15, BGEVENT_READ, CeladonGymStatue

	db 6 ; object events
	object_event  5,  3, SPRITE_ERIKA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonGymErikaScript, -1
	object_event  7,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassMichelle, -1
	object_event  2,  8, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerPicnickerTanya, -1
	object_event  3,  5, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBeautyJulia, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsJoAndZoe2, -1
