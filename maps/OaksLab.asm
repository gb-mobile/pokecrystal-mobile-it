	object_const_def ; object_event constants
	const OAKSLAB_OAK
	const OAKSLAB_SCIENTIST1
	const OAKSLAB_SCIENTIST2
	const OAKSLAB_SCIENTIST3

OaksLab_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.DummyScene:
	end

Oak:
	faceplayer
	opentext
	checkevent EVENT_OPENED_MT_SILVER
	iftrue .CheckPokedex
	checkevent EVENT_TALKED_TO_OAK_IN_KANTO
	iftrue .CheckBadges
	writetext OakWelcomeKantoText
	buttonsound
	setevent EVENT_TALKED_TO_OAK_IN_KANTO
.CheckBadges:
	readvar VAR_BADGES
	ifequal NUM_BADGES, .OpenMtSilver
	ifequal NUM_JOHTO_BADGES, .Complain
	sjump .AhGood

.CheckPokedex:
	writetext OakLabDexCheckText
	waitbutton
	special ProfOaksPCBoot
	writetext OakLabGoodbyeText
	waitbutton
	closetext
	end

.OpenMtSilver:
	writetext OakOpenMtSilverText
	buttonsound
	setevent EVENT_OPENED_MT_SILVER
	sjump .CheckPokedex

.Complain:
	writetext OakNoKantoBadgesText
	buttonsound
	sjump .CheckPokedex

.AhGood:
	writetext OakYesKantoBadgesText
	buttonsound
	sjump .CheckPokedex

OaksAssistant1Script:
	jumptextfaceplayer OaksAssistant1Text

OaksAssistant2Script:
	jumptextfaceplayer OaksAssistant2Text

OaksAssistant3Script:
	jumptextfaceplayer OaksAssistant3Text

OaksLabBookshelf:
	jumpstd difficultbookshelf

OaksLabPoster1:
	jumptext OaksLabPoster1Text

OaksLabPoster2:
	jumptext OaksLabPoster2Text

OaksLabTrashcan:
	jumptext OaksLabTrashcanText

OaksLabPC:
	jumptext OaksLabPCText

OakWelcomeKantoText:
	text "OAK: Ah, <PLAY_G>!"
	line "È lodevole che tu"

	para "abbia fatto tutta"
	line "questa strada per"
	cont "venire a KANTO!"

	para "Che ne pensi degli"
	line "allenatori di qui?"

	para "Niente male, vero?"
	done

OakLabDexCheckText:
	text "Come va con il tuo"
	line "#DEX?"

	para "Vediamo…"
	done

OakLabGoodbyeText:
	text "Se passi di qui,"
	line "torna a trovarmi!"
	done

OakOpenMtSilverText:
	text "OAK: Uauh!"
	line "Eccellente!"

	para "Hai le MEDAGLIE"
	line "delle PALESTRE di"
	cont "KANTO. Ben fatto!"

	para "È proprio quello"
	line "che mi aspettavo."

	para "Bene, <PLAY_G>."
	line "Vedrò di farti"

	para "andare al"
	line "MONTE ARGENTO."

	para "Il MONTE ARGENTO è"
	line "un grande monte"

	para "in cui vivono"
	line "#MON selvatici."

	para "È vietato agli"
	line "allenatori del tuo"

	para "livello, perché"
	line "è pericoloso."

	para "Ma per te faremo"
	line "un'eccezione,"
	cont "<PLAY_G>."

	para "Vai fino ad"
	line "ALTOPIANO BLU."

	para "Di lì si raggiunge"
	line "il MONTE ARGENTO."
	done

OakNoKantoBadgesText:
	text "OAK: Come? Non"
	line "collezioni"
	cont "le MEDAGLIE delle"
	cont "PALESTRE di KANTO?"

	para "I CAPOPALESTRA di"
	line "KANTO sono forti"

	para "come quelli di"
	line "JOHTO, che hai già"
	cont "battuto."

	para "Ti raccomando di"
	line "sfidare anche"
	cont "loro."
	done

OakYesKantoBadgesText:
	text "OAK: Bene, vedo"
	line "che collezioni le"
	cont "MEDAGLIE di KANTO."

	para "Immagino che non"
	line "sia facile, ma la"

	para "tua esperienza ti"
	line "sarà d'aiuto."

	para "Torna quando le"
	line "avrai tutte."

	para "Ti darò un bel"
	line "regalo."

	para "Continua così,"
	line "<PLAY_G>!"
	done

OaksAssistant1Text:
	text "A KANTO non"
	line "trasmettono il"

	para "PROGRAMMA RADIO"
	line "del PROF.#MON."

	para "Peccato, l'avrei"
	line "voluto ascoltare."
	done

OaksAssistant2Text:
	text "La ricerca del"
	line "PROF. sta andando"
	cont "a gonfie vele,"

	para "grazie al tuo"
	line "gran lavoro con"
	cont "il #DEX."
	done

OaksAssistant3Text:
	text "Non dirlo in giro,"
	line "ma il #MON TALK"

	para "del PROF.OAK non è"
	line "in diretta!"
	done

OaksLabPoster1Text:
	text "Premi START per"
	line "aprire il MENU."
	done

OaksLabPoster2Text:
	text "L'opzione SALVA è"
	line "nel MENU."

	para "Usala quando"
	line "serve."
	done

OaksLabTrashcanText:
	text "Qui non c'è"
	line "proprio niente…"
	done

OaksLabPCText:
	text "C'è un'e-mail"
	line "nel PC."

	para "…"

	para "PROF.OAK, come"
	line "va la ricerca?"

	para "Io lavoro sempre"
	line "sodo."

	para "Ho sentito che"
	line "<PLAY_G> si"

	para "sta facendo"
	line "valere."

	para "Ne sono davvero"
	line "felice."

	para "ELM, da BORGO"
	line "FOGLIANOVA :-)"
	done

OaksLab_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 11, PALLET_TOWN, 3
	warp_event  5, 11, PALLET_TOWN, 3

	db 0 ; coord events

	db 16 ; bg events
	bg_event  6,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  1, BGEVENT_READ, OaksLabBookshelf
	bg_event  0,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  1,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  2,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  3,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  6,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  7,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  8,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  9,  7, BGEVENT_READ, OaksLabBookshelf
	bg_event  4,  0, BGEVENT_READ, OaksLabPoster1
	bg_event  5,  0, BGEVENT_READ, OaksLabPoster2
	bg_event  9,  3, BGEVENT_READ, OaksLabTrashcan
	bg_event  0,  1, BGEVENT_READ, OaksLabPC

	db 4 ; object events
	object_event  4,  2, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Oak, -1
	object_event  1,  8, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant1Script, -1
	object_event  8,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant2Script, -1
	object_event  1,  4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OaksAssistant3Script, -1
