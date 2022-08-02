	object_const_def ; object_event constants
	const MAHOGANYGYM_PRYCE
	const MAHOGANYGYM_BUENA1
	const MAHOGANYGYM_ROCKER1
	const MAHOGANYGYM_BUENA2
	const MAHOGANYGYM_ROCKER2
	const MAHOGANYGYM_ROCKER3
	const MAHOGANYGYM_GYM_GUY

MahoganyGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MahoganyGymPryceScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .FightDone
	writetext PryceText_Intro
	waitbutton
	closetext
	winlosstext PryceText_Impressed, 0
	loadtrainer PRYCE, PRYCE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_PRYCE
	opentext
	writetext Text_ReceivedGlacierBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_GLACIERBADGE
	readvar VAR_BADGES
	scall MahoganyGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM16_ICY_WIND
	iftrue PryceScript_Defeat
	setevent EVENT_BEAT_SKIER_ROXANNE
	setevent EVENT_BEAT_SKIER_CLARISSA
	setevent EVENT_BEAT_BOARDER_RONALD
	setevent EVENT_BEAT_BOARDER_BRAD
	setevent EVENT_BEAT_BOARDER_DOUGLAS
	writetext PryceText_GlacierBadgeSpeech
	buttonsound
	verbosegiveitem TM_ICY_WIND
	iffalse MahoganyGym_NoRoomForIcyWind
	setevent EVENT_GOT_TM16_ICY_WIND
	writetext PryceText_IcyWindSpeech
	waitbutton
	closetext
	end

PryceScript_Defeat:
	writetext PryceText_CherishYourPokemon
	waitbutton
MahoganyGym_NoRoomForIcyWind:
	closetext
	end

MahoganyGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerSkierRoxanne:
	trainer SKIER, ROXANNE, EVENT_BEAT_SKIER_ROXANNE, SkierRoxanneSeenText, SkierRoxanneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierRoxanneAfterBattleText
	waitbutton
	closetext
	end

TrainerSkierClarissa:
	trainer SKIER, CLARISSA, EVENT_BEAT_SKIER_CLARISSA, SkierClarissaSeenText, SkierClarissaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SkierClarissaAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderRonald:
	trainer BOARDER, RONALD, EVENT_BEAT_BOARDER_RONALD, BoarderRonaldSeenText, BoarderRonaldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderRonaldAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderBrad:
	trainer BOARDER, BRAD, EVENT_BEAT_BOARDER_BRAD, BoarderBradSeenText, BoarderBradBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderBradAfterBattleText
	waitbutton
	closetext
	end

TrainerBoarderDouglas:
	trainer BOARDER, DOUGLAS, EVENT_BEAT_BOARDER_DOUGLAS, BoarderDouglasSeenText, BoarderDouglasBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BoarderDouglasAfterBattleText
	waitbutton
	closetext
	end

MahoganyGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PRYCE
	iftrue .MahoganyGymGuyWinScript
	writetext MahoganyGymGuyText
	waitbutton
	closetext
	end

.MahoganyGymGuyWinScript:
	writetext MahoganyGymGuyWinText
	waitbutton
	closetext
	end

MahoganyGymStatue:
	checkflag ENGINE_GLACIERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, PRYCE, PRYCE1
	jumpstd gymstatue2

PryceText_Intro:
	text "I #MON fanno"
	line "diverse esperienze"

	para "nella vita,"
	line "proprio come noi."

	para "Anch'io ho visto e"
	line "sofferto molto in"
	cont "vita mia."

	para "Visto che sono più"
	line "anziano, ti mostro"
	cont "cosa intendo."

	para "Vivo con i #MON"
	line "da quando tu non"

	para "eri neppure al"
	line "mondo."

	para "Non perdo tanto"
	line "facilmente."

	para "Ora io, ALFREDO,"
	line "l'allenatore dell'"

	para "inverno, ti mostro"
	line "la mia potenza!"
	done

PryceText_Impressed:
	text "La tua forza mi"
	line "ha impressionato!"

	para "La tua volontà ti"
	line "farà superare ogni"

	para "ostacolo della"
	line "vita."

	para "Meriti la MEDAGLIA"
	line "della PALESTRA!"
	done

Text_ReceivedGlacierBadge:
	text "<PLAYER> riceve la"
	line "MEDAGLIA GELO."
	done

PryceText_GlacierBadgeSpeech:
	text "Questa MEDAGLIA"
	line "migliora le STATI-"
	cont "STICHE SPECIALI"
	cont "dei #MON."

	para "Inoltre, permette"
	line "ai tuoi #MON"
	cont "di usare MULINELLO"
	cont "per superare i"
	cont "mulinelli d'acqua."

	para "E poi… Questo"
	line "è un mio regalo."
	done

PryceText_IcyWindSpeech:
	text "La MT contiene"
	line "VENTOGELATO."

	para "Arreca danni e"
	line "diminuisce la"
	cont "velocità."

	para "È il simbolo"
	line "della durezza"
	cont "dell'inverno."
	done

PryceText_CherishYourPokemon:
	text "Quando il ghiaccio"
	line "e la neve si"
	cont "sciolgono è"
	cont "primavera."

	para "Tu e i tuoi #-"
	line "MON sarete insieme"

	para "ancora per molti"
	line "anni."

	para "Goditi il tuo"
	line "tempo con loro!"
	done

BoarderRonaldSeenText:
	text "Congelerò i tuoi"
	line "#MON, così"
	cont "rimarrai immobile!"
	done

BoarderRonaldBeatenText:
	text "Sei tu che mi"
	line "hai bloccato!"
	done

BoarderRonaldAfterBattleText:
	text "Dev'esserci una"
	line "mossa che i #-"
	cont "MON possono usare"
	cont "anche se sono"
	cont "congelati."
	done

BoarderBradSeenText:
	text "Il pavimento della"
	line "PALESTRA è"

	para "scivoloso:"
	line "divertente, eh?"

	para "Sì, ma non siamo"
	line "di certo qui per"
	cont "divertirci!"
	done

BoarderBradBeatenText:
	text "Vuoi vedere quanto"
	line "siamo seri?"
	done

BoarderBradAfterBattleText:
	text "Questa PALESTRA è"
	line "grandiosa: adoro"
	cont "fare snowboard"
	cont "con i #MON!"
	done

BoarderDouglasSeenText:
	text "Conosco il segreto"
	line "di ALFREDO."
	done

BoarderDouglasBeatenText:
	text "Ok. Ti dirò il"
	line "segreto di"
	cont "ALFREDO."
	done

BoarderDouglasAfterBattleText:
	text "Il segreto della"
	line "forza di ALFREDO"
	cont "è questo…"

	para "Medita ogni giorno"
	line "sotto una cascata"

	para "per rinforzare la"
	line "mente e il corpo."
	done

SkierRoxanneSeenText:
	text "Per raggiungere"
	line "ALFREDO, il CAPO-"
	cont "PALESTRA, devi"
	cont "pensare prima di"
	cont "scivolare."
	done

SkierRoxanneBeatenText:
	text "Con gli sci"
	line "ti batterei!"
	done

SkierRoxanneAfterBattleText:
	text "Se non scivoli con"
	line "precisione, non"

	para "farai molta strada"
	line "nella PALESTRA."
	done

SkierClarissaSeenText:
	text "Guarda come curvo"
	line "a sci uniti!"
	done

SkierClarissaBeatenText:
	text "No! Mi hai fatto"
	line "cadere!"
	done

SkierClarissaAfterBattleText:
	text "Non avrei dovuto"
	line "vantarmi di come"
	cont "scio…"
	done

MahoganyGymGuyText:
	text "ALFREDO è un vete-"
	line "rano che si è"

	para "allenato per 50"
	line "anni con i"
	cont "#MON."

	para "Pare che sia abile"
	line "a congelare gli"

	para "avversari con le"
	line "sue mosse di tipo"
	cont "ghiaccio."

	para "Perciò, cerca di"
	line "arrostirlo con la"

	para "tua bruciante"
	line "ambizione!"
	done

MahoganyGymGuyWinText:
	text "ALFREDO è forte,"
	line "ma tu sei tutta"
	cont "un'altra cosa!"

	para "È stata una"
	line "grande lotta, che"

	para "ha regolato i"
	line "conti tra due"
	cont "generazioni!"
	done

MahoganyGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, MAHOGANY_TOWN, 3
	warp_event  5, 17, MAHOGANY_TOWN, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, MahoganyGymStatue
	bg_event  6, 15, BGEVENT_READ, MahoganyGymStatue

	db 7 ; object events
	object_event  5,  3, SPRITE_PRYCE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MahoganyGymPryceScript, -1
	object_event  4,  6, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierRoxanne, -1
	object_event  0, 17, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderRonald, -1
	object_event  9, 17, SPRITE_BUENA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerSkierClarissa, -1
	object_event  5,  9, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderBrad, -1
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerBoarderDouglas, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MahoganyGymGuyScript, -1
