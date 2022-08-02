	object_const_def ; object_event constants
	const LAVRADIOTOWER1F_RECEPTIONIST
	const LAVRADIOTOWER1F_OFFICER
	const LAVRADIOTOWER1F_SUPER_NERD1
	const LAVRADIOTOWER1F_GENTLEMAN
	const LAVRADIOTOWER1F_SUPER_NERD2

LavRadioTower1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavRadioTower1FReceptionistScript:
	jumptextfaceplayer LavRadioTower1FReceptionistText

LavRadioTower1FOfficerScript:
	jumptextfaceplayer LavRadioTower1FOfficerText

LavRadioTower1FSuperNerd1Script:
	jumptextfaceplayer LavRadioTower1FSuperNerd1Text

LavRadioTower1FGentlemanScript:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext LavRadioTower1FGentlemanText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext LavRadioTower1FGentlemanText_ReturnedMachinePart
	buttonsound
	getstring STRING_BUFFER_4, .expncardname
	scall .receiveitem
	setflag ENGINE_EXPN_CARD
.GotExpnCard:
	writetext LavRadioTower1FGentlemanText_GotExpnCard
	waitbutton
	closetext
	end

.receiveitem:
	jumpstd receiveitem
	end

.expncardname
	db "EXPN CARD@"

LavRadioTower1FSuperNerd2Script:
	faceplayer
	opentext
	checkflag ENGINE_EXPN_CARD
	iftrue .GotExpnCard
	writetext LavRadioTower1FSuperNerd2Text
	waitbutton
	closetext
	end

.GotExpnCard:
	writetext LavRadioTower1FSuperNerd2Text_GotExpnCard
	waitbutton
	closetext
	end

LavRadioTower1FDirectory:
	jumptext LavRadioTower1FDirectoryText

LavRadioTower1FPokeFluteSign:
	jumptext LavRadioTower1FPokeFluteSignText

LavRadioTower1FReferenceLibrary:
; unreferenced
	jumptext LavRadioTower1FReferenceLibraryText

LavRadioTower1FReceptionistText:
	text "Ti do il"
	line "benvenuto! Su"

	para "questo piano puoi"
	line "muoverti come"
	cont "desideri."
	done

LavRadioTower1FOfficerText:
	text "Mi spiace, ma hai"
	line "accesso soltanto"
	cont "al piano terra."

	para "Da quando una"
	line "banda di criminali"

	para "ha occupato la"
	line "TORRE RADIO di"

	para "JOHTO, abbiamo"
	line "dovuto tutelarci."
	done

LavRadioTower1FSuperNerd1Text:
	text "Tutti qui alla"
	line "TORRE RADIO"

	para "devono lavorare"
	line "sodo."

	para "Tutti si impegnano"
	line "al massimo per"
	cont "produrre buone"
	cont "trasmissioni."
	done

LavRadioTower1FGentlemanText:
	text "Oh, no, no, no!"

	para "Non trasmettiamo"
	line "più da quando la"

	para "CENTRALE ELETTRICA"
	line "è saltata."

	para "Tutti gli sforzi"
	line "per aprire una"

	para "stazione radio an-"
	line "dranno in fumo se"
	cont "non trasmettiamo."

	para "Sarei rovinato!"
	done

LavRadioTower1FGentlemanText_ReturnedMachinePart:
	text "Ah! Allora sei tu"
	line "<PLAY_G>, che ha"

	para "risolto il guasto"
	line "alla CENTRALE!"

	para "Grazie a te non ho"
	line "perso il lavoro."

	para "Mi hai salvato la"
	line "vita, davvero!"

	para "Prendi questo come"
	line "ringraziamento."
	done

LavRadioTower1FGentlemanText_GotExpnCard:
	text "Adesso puoi"
	line "ricevere i"

	para "programmi della"
	line "radio di KANTO!"

	para "Ahahahahah!"
	done

LavRadioTower1FSuperNerd2Text:
	text "Ehi, tu!"

	para "Sono il super DI-"
	line "RETTORE MUSICALE."

	para "Come? Il tuo #-"
	line "GEAR non può"

	para "ricevere i miei"
	line "programmi? Male!"

	para "Potresti riceverli"
	line "con una SCHEDA"

	para "ESPANSIONE."
	line "Procuratela!"
	done

LavRadioTower1FSuperNerd2Text_GotExpnCard:
	text "Ehi, tu!"

	para "Sono il super DI-"
	line "RETTORE MUSICALE!"

	para "Sono responsabile"
	line "delle stupende"

	para "trasmissioni"
	line "musicali!"

	para "Vuoi fare una"
	line "buona azione? Ruba"
	cont "la musica dalla"
	cont "nostra stazione!"
	done

LavRadioTower1FDirectoryText:
	text "PT  RECEPTION"
	line "1ºP VENDITA"

	para "2ºP PERSONALE"
	line "3ºP PRODUZIONE"

	para "4ºP UFFICIO DEL"
	line "    DIRETTORE"
	done

LavRadioTower1FPokeFluteSignText:
	text "Risveglia i #-"
	line "MON con la dolce"

	para "musica del #"
	line "FLAUTO: CANALE 20!"
	done

LavRadioTower1FReferenceLibraryText:
	text "Uauh! È pieno di"
	line "CD e video sui"
	cont "#MON."

	para "Dev'essere"
	line "l'archivio."
	done

LavRadioTower1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAVENDER_TOWN, 7
	warp_event  3,  7, LAVENDER_TOWN, 7

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11,  0, BGEVENT_READ, LavRadioTower1FDirectory
	bg_event  5,  0, BGEVENT_READ, LavRadioTower1FPokeFluteSign

	db 5 ; object events
	object_event  6,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FReceptionistScript, -1
	object_event 15,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FOfficerScript, -1
	object_event  1,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd1Script, -1
	object_event  9,  1, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FGentlemanScript, -1
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavRadioTower1FSuperNerd2Script, -1
