	object_const_def ; object_event constants
	const CELADONCITY_FISHER
	const CELADONCITY_POLIWAG
	const CELADONCITY_TEACHER1
	const CELADONCITY_GRAMPS1
	const CELADONCITY_GRAMPS2
	const CELADONCITY_YOUNGSTER1
	const CELADONCITY_YOUNGSTER2
	const CELADONCITY_TEACHER2
	const CELADONCITY_LASS

CeladonCity_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CELADON
	return

CeladonCityFisherScript:
	jumptextfaceplayer CeladonCityFisherText

CeladonCityPoliwrath:
	opentext
	writetext CeladonCityPoliwrathText
	cry POLIWRATH
	waitbutton
	closetext
	end

CeladonCityTeacher1Script:
	jumptextfaceplayer CeladonCityTeacher1Text

CeladonCityGramps1Script:
	jumptextfaceplayer CeladonCityGramps1Text

CeladonCityGramps2Script:
	jumptextfaceplayer CeladonCityGramps2Text

CeladonCityYoungster1Script:
	jumptextfaceplayer CeladonCityYoungster1Text

CeladonCityYoungster2Script:
	jumptextfaceplayer CeladonCityYoungster2Text

CeladonCityTeacher2Script:
	jumptextfaceplayer CeladonCityTeacher2Text

CeladonCityLassScript:
	jumptextfaceplayer CeladonCityLassText_Mobile

CeladonCitySign:
	jumptext CeladonCitySignText

CeladonGymSign:
	jumptext CeladonGymSignText

CeladonCityDeptStoreSign:
	jumptext CeladonCityDeptStoreSignText

CeladonCityMansionSign:
	jumptext CeladonCityMansionSignText

CeladonCityGameCornerSign:
	jumptext CeladonCityGameCornerSignText

CeladonCityTrainerTips:
	jumptext CeladonCityTrainerTipsText

CeladonCityPokecenterSign:
	jumpstd pokecentersign

CeladonCityHiddenPpUp:
	hiddenitem PP_UP, EVENT_CELADON_CITY_HIDDEN_PP_UP

CeladonCityFisherText:
	text "Questo POLIWRATH è"
	line "il mio socio."

	para "Chissà se si"
	line "evolve in un"
	cont "#MON simile"
	cont "ad una rana?"
	done

CeladonCityPoliwrathText:
	text "POLIWRATH: Croc!"
	done

CeladonCityTeacher1Text:
if DEF(_CRYSTAL_AU)
	text "I lost at the"
	line "machines."
	done
else
	text "Ho perso ancora"
	line "alle slot machine…"

	para "Anche noi ragazze"
	line "giochiamo alle"

	para "slot machine ora:"
	line "tu ci giochi?"
	done
endc

CeladonCityGramps1Text:
	text "Da un po' di tempo"
	line "si vedono dei"
	cont "GRIMER."

	para "Vedi quella pozza"
	line "di fronte alla"

	para "casa? I GRIMER"
	line "vivono lì."

	para "Da dove saranno"
	line "sbucati? Sono un"
	cont "bel problema…"
	done

CeladonCityGramps2Text:
	text "Grande questa"
	line "PALESTRA: solo le"

	para "ragazze vi si"
	line "possono allenare!"
	done

CeladonCityYoungster1Text:
	text "Vuoi sapere un"
	line "segreto?"

	para "VILLAZZURRA ha una"
	line "porta sul retro."
	done

CeladonCityYoungster2Text:
	text "Al ristorante"
	line "fanno una gara"
	cont "di cibo."

	para "Solo guardandoli"
	line "mi passa"
	cont "l'appetito…"
	done

CeladonCityTeacher2Text:
	text "Al CENTRO COMMER-"
	line "CIALE di AZZURRO-"
	cont "POLI hanno molta"
	cont "merce, della mi-"
	cont "gliore qualità."

	para "Se lì non trovi"
	line "qualcosa, vuol"

	para "dire che non"
	line "esiste!"

	para "Ehi… Parlo"
	line "come una commessa!"
	done

CeladonCityLassText_Mobile:
	text "Mi piace avere"
	line "tutti questi"
	cont "edifici intorno!"

	para "È vero che il"
	line "CENTRO #MON di"

	para "FIORDOROPOLI ora è"
	line "molto più grande?"

	para "Che bello! Peccato"
	line "che non esiste un"

	para "posto come quello"
	line "a KANTO…"
	done

CeladonCityLassText: ; Unused, English version replacement for above dialog.
	text "Camminare con gli"
	line "occhi a terra m'ha"

	para "fatto venire le"
	line "vertigini!"
	done

CeladonCitySignText:
	text "AZZURROPOLI"

	para "Città dei sogni"
	line "arcobaleno"
	done

CeladonGymSignText:
	text "AZZURROPOLI"
	line "CAPOPALESTRA:"
	cont "ERIKA"

	para "La principessa"
	line "amante della"
	cont "natura"
	done

CeladonCityDeptStoreSignText:
	text "Fa gli acquisti al"
	line "CENTRO COMMERCIALE"
	cont "di AZZURROPOLI!"
	done

CeladonCityMansionSignText:
	text "VILLAZZURRA"
	done

CeladonCityGameCornerSignText:
if DEF(_CRYSTAL_AU)
	text "The Game Area for"
	line "Grown-ups--CELADON"
	cont "GAME CORNER"
	done
else
	text "Il parco giochi"
	line "per tutti: CASINÒ"
	cont "di AZZURROPOLI"
	done
endc

CeladonCityTrainerTipsText:
	text "CONSIGLI UTILI"

	para "SUPERGUARDIA"
	line "protegge i #MON"

	para "da attacchi"
	line "speciali, come ad"
	cont "esempio quelli d'"
	cont "acqua o di fuoco."

	para "Cerca i tuoi stru-"
	line "menti al CENTRO"
	cont "COMMERCIALE di"
	cont "AZZURROPOLI!"
	done

CeladonCity_MapEvents:
	db 0, 0 ; filler

	db 9 ; warp events
	warp_event  4,  9, CELADON_DEPT_STORE_1F, 1
	warp_event 16,  9, CELADON_MANSION_1F, 1
	warp_event 16,  3, CELADON_MANSION_1F, 3
	warp_event 17,  3, CELADON_MANSION_1F, 3
	warp_event 29,  9, CELADON_POKECENTER_1F, 1
	warp_event 18, 19, CELADON_GAME_CORNER, 1
	warp_event 23, 19, CELADON_GAME_CORNER_PRIZE_ROOM, 1
	warp_event 10, 29, CELADON_GYM, 1
	warp_event 25, 29, CELADON_CAFE, 1

	db 0 ; coord events

	db 8 ; bg events
	bg_event 23, 21, BGEVENT_READ, CeladonCitySign
	bg_event 11, 31, BGEVENT_READ, CeladonGymSign
	bg_event  6,  9, BGEVENT_READ, CeladonCityDeptStoreSign
	bg_event 13,  9, BGEVENT_READ, CeladonCityMansionSign
	bg_event 19, 21, BGEVENT_READ, CeladonCityGameCornerSign
	bg_event 29, 21, BGEVENT_READ, CeladonCityTrainerTips
	bg_event 30,  9, BGEVENT_READ, CeladonCityPokecenterSign
	bg_event 37, 21, BGEVENT_ITEM, CeladonCityHiddenPpUp

	db 9 ; object events
	object_event 26, 11, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityFisherScript, -1
	object_event 27, 11, SPRITE_POLIWAG, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityPoliwrath, -1
	object_event 20, 24, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher1Script, -1
	object_event 14, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps1Script, -1
	object_event  8, 31, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityGramps2Script, -1
	object_event 18, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster1Script, -1
	object_event 24, 33, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityYoungster2Script, -1
	object_event  6, 14, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCityTeacher2Script, -1
	object_event  7, 22, SPRITE_LASS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeladonCityLassScript, -1
