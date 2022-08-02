	object_const_def ; object_event constants
	const DANCETHEATRE_KIMONO_GIRL1
	const DANCETHEATRE_KIMONO_GIRL2
	const DANCETHEATRE_KIMONO_GIRL3
	const DANCETHEATRE_KIMONO_GIRL4
	const DANCETHEATRE_KIMONO_GIRL5
	const DANCETHEATRE_GENTLEMAN
	const DANCETHEATRE_RHYDON
	const DANCETHEATRE_COOLTRAINER_M
	const DANCETHEATRE_GRANNY

DanceTheatre_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerKimonoGirlNaoko2:
	trainer KIMONO_GIRL, NAOKO2, EVENT_BEAT_KIMONO_GIRL_NAOKO, KimonoGirlNaoko2SeenText, KimonoGirlNaoko2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlNaoko2AfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlSayo:
	trainer KIMONO_GIRL, SAYO, EVENT_BEAT_KIMONO_GIRL_SAYO, KimonoGirlSayoSeenText, KimonoGirlSayoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlSayoAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlZuki:
	trainer KIMONO_GIRL, ZUKI, EVENT_BEAT_KIMONO_GIRL_ZUKI, KimonoGirlZukiSeenText, KimonoGirlZukiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlZukiAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlKuni:
	trainer KIMONO_GIRL, KUNI, EVENT_BEAT_KIMONO_GIRL_KUNI, KimonoGirlKuniSeenText, KimonoGirlKuniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlKuniAfterBattleText
	waitbutton
	closetext
	end

TrainerKimonoGirlMiki:
	trainer KIMONO_GIRL, MIKI, EVENT_BEAT_KIMONO_GIRL_MIKI, KimonoGirlMikiSeenText, KimonoGirlMikiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext KimonoGirlMikiAfterBattleText
	waitbutton
	closetext
	end

DanceTheaterSurfGuy:
	faceplayer
	opentext
	writetext SurfGuyNeverLeftAScratchText
	buttonsound
	checkevent EVENT_GOT_HM03_SURF
	iftrue SurfGuyAlreadyGaveSurf
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse .KimonoGirlsUndefeated
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse .KimonoGirlsUndefeated
	sjump .GetSurf

.KimonoGirlsUndefeated:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	writetext SurfGuyLadGiftText
	waitbutton
	closetext
	end

.PlayerIsFemale:
	writetext SurfGuyLassieGiftText
	waitbutton
	closetext
	end

.GetSurf:
	writetext SurfGuyLikeADanceText
	buttonsound
	verbosegiveitem HM_SURF
	setevent EVENT_GOT_HM03_SURF
	writetext SurfGuySurfExplanationText
	waitbutton
	closetext
	end

SurfGuyAlreadyGaveSurf:
	writetext SurfGuyElegantKimonoGirlsText
	waitbutton
	closetext
	end

DanceTheaterRhydon:
	opentext
	writetext RhydonText
	cry RHYDON
	waitbutton
	closetext
	end

DanceTheatreCooltrainerMScript:
	jumptextfaceplayer DanceTheatreCooltrainerMText

DanceTheatreGrannyScript:
	jumptextfaceplayer DanceTheatreGrannyText

DanceTheatreFancyPanel:
	jumptext DanceTheatreFancyPanelText

KimonoGirlNaoko2SeenText:
	text "Hai dei #MON"
	line "adorabili: posso"
	cont "vederli lottare?"
	done

KimonoGirlNaoko2BeatenText:
	text "Ma allora sei"
	line "forte!"
	done

KimonoGirlNaoko2AfterBattleText:
	text "È stato diverten-"
	line "te: spero di"
	cont "rivederti presto."
	done

KimonoGirlSayoSeenText:
	text "Danzo sempre con i"
	line "miei #MON. Li"

	para "alleno pure,"
	line "naturalmente."
	done

KimonoGirlSayoBeatenText:
	text "Ah, peccato! Stavo"
	line "per batterti."
	done

KimonoGirlSayoAfterBattleText:
	text "Nella danza e con"
	line "i #MON il"

	para "ritmo è molto"
	line "importante."
	done

KimonoGirlZukiSeenText:
	text "Ti piace la mia"
	line "mollettina?"

	para "Ah, vuoi fare una"
	line "lotta di #MON?"
	done

KimonoGirlZukiBeatenText:
	text "Non ho più"
	line "#MON da usare…"
	done

KimonoGirlZukiAfterBattleText:
	text "Ogni mese metto un"
	line "fiore diverso"
	cont "nella mia molletta"
	cont "per capelli."
	done

KimonoGirlKuniSeenText:
	text "Sei una persona"
	line "simpatica. Vuoi"
	cont "lottare?"
	done

KimonoGirlKuniBeatenText:
	text "Sei più forte di"
	line "quello che sembra."
	done

KimonoGirlKuniAfterBattleText:
	text "Con l'allenamento"
	line "che ho fatto,"

	para "pensavo di essere"
	line "in gamba. Ma pare"
	cont "che non sia così!"
	done

KimonoGirlMikiSeenText:
	text "Ti piace come dan-"
	line "zo? Me la cavo an-"
	cont "che con i #MON!"
	done

KimonoGirlMikiBeatenText:
	text "Anche tu te la ca-"
	line "vi con i #MON!"
	done

KimonoGirlMikiAfterBattleText:
	text "Continuo a danzare"
	line "perché c'è gente"

	para "che apprezza ciò"
	line "che faccio."

	para "Anche i #MON"
	line "mi tirano su."
	done

SurfGuyNeverLeftAScratchText:
	text "Le KIMONO GIRL non"
	line "sono solo grandi"

	para "danzatrici: sono"
	line "brave anche con i"
	cont "#MON."

	para "Le sfido sempre,"
	line "ma non riesco a"

	para "far loro neppure"
	line "un graffio…"
	done

SurfGuyLadGiftText:
	text "Ehi, tu: batti"
	line "tutte le KIMONO"

	para "GIRL e avrai un"
	line "premio da me!"
	done

SurfGuyLassieGiftText:
	text "Ascolta, se riesci"
	line "a battere le"

	para "KIMONO GIRL avrai"
	line "un premio da me."
	done

SurfGuyLikeADanceText:
	text "Il tuo stile di"
	line "lotta è simile"
	cont "ad una danza."

	para "Raramente si vede"
	line "una cosa simile!"

	para "Prendi questo: non"
	line "ti preoccupare."
	done

SurfGuySurfExplanationText:
	text "È SURF."

	para "Con questa mossa,"
	line "i tuoi #MON"
	cont "possono nuotare."
	done

SurfGuyElegantKimonoGirlsText:
	text "Oh, se i miei"
	line "#MON fossero"
	cont "eleganti come le"
	cont "KIMONO GIRL…"
	done

RhydonText:
	text "RHYDON: Gugooh"
	line "gugogooh!"
	done

DanceTheatreCooltrainerMText:
	text "Quel tipo è sempre"
	line "col suo RHYDON."

	para "Dice di volere un"
	line "#MON che"
	cont "danzi e usi SURF."

	para "Che non voglia"
	line "allenarlo per il"
	cont "nuoto"
	cont "sincronizzato!?"
	done

DanceTheatreGrannyText:
	text "Le KIMONO GIRL"
	line "sono così belle…"

	para "Ma devono fare un"
	line "allenamento molto"
	cont "rigoroso."

	para "E devono imparare"
	line "dure regole di"

	para "comportamento"
	line "prima di apparire"
	cont "in pubblico."

	para "Ma se ami"
	line "qualcosa, tutto"
	cont "è possibile."
	done

DanceTheatreFancyPanelText:
	text "È un pannello"
	line "decorato con"
	cont "fiori."
	done

DanceTheatre_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  5, 13, ECRUTEAK_CITY, 8
	warp_event  6, 13, ECRUTEAK_CITY, 8

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  6, BGEVENT_UP, DanceTheatreFancyPanel
	bg_event  6,  6, BGEVENT_UP, DanceTheatreFancyPanel

	db 9 ; object events
	object_event  0,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlNaoko2, -1
	object_event  2,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlSayo, -1
	object_event  6,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlZuki, -1
	object_event  9,  1, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlKuni, -1
	object_event 11,  2, SPRITE_KIMONO_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerKimonoGirlMiki, -1
	object_event  7, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheaterSurfGuy, -1
	object_event  6,  8, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DanceTheaterRhydon, -1
	object_event 10, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DanceTheatreCooltrainerMScript, -1
	object_event  3,  6, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DanceTheatreGrannyScript, -1
