	object_const_def ; object_event constants
	const GOLDENRODDEPTSTOREROOF_CLERK
	const GOLDENRODDEPTSTOREROOF_POKEFAN_F
	const GOLDENRODDEPTSTOREROOF_FISHER
	const GOLDENRODDEPTSTOREROOF_TWIN
	const GOLDENRODDEPTSTOREROOF_SUPER_NERD
	const GOLDENRODDEPTSTOREROOF_POKEFAN_M
	const GOLDENRODDEPTSTOREROOF_TEACHER
	const GOLDENRODDEPTSTOREROOF_BUG_CATCHER

GoldenrodDeptStoreRoof_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .CheckSaleChangeBlock
	callback MAPCALLBACK_OBJECTS, .CheckSaleChangeClerk

.CheckSaleChangeBlock:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleIsOn
	return

.SaleIsOn:
	changeblock 0, 2, $3f ; cardboard boxes
	changeblock 0, 4, $0f ; vendor booth
	return

.CheckSaleChangeClerk:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .ChangeClerk
	setevent EVENT_GOLDENROD_SALE_OFF
	clearevent EVENT_GOLDENROD_SALE_ON
	return

.ChangeClerk:
	clearevent EVENT_GOLDENROD_SALE_OFF
	setevent EVENT_GOLDENROD_SALE_ON
	return

GoldenrodDeptStoreRoofClerkScript:
	opentext
	pokemart MARTTYPE_ROOFTOP, 0
	closetext
	end

GoldenrodDeptStoreRoofPokefanFScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofPokefanFText

GoldenrodDeptStoreRoofFisherScript:
	faceplayer
	opentext
	writetext GoldenrodDeptStoreRoofFisherText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_FISHER, UP
	end

GoldenrodDeptStoreRoofTwinScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofTwinText

GoldenrodDeptStoreRoofSuperNerdScript:
	opentext
	writetext GoldenrodDeptStoreRoofSuperNerdOhWowText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, UP
	opentext
	writetext GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText
	waitbutton
	closetext
	turnobject GOLDENRODDEPTSTOREROOF_SUPER_NERD, RIGHT
	end

GoldenrodDeptStoreRoofPokefanMScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofPokefanMText

GoldenrodDeptStoreRoofTeacherScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofTeacherText

GoldenrodDeptStoreRoofBugCatcherScript:
	jumptextfaceplayer GoldenrodDeptStoreRoofBugCatcherText

Binoculars1:
	jumptext Binoculars1Text

Binoculars2:
	jumptext Binoculars2Text

Binoculars3:
	jumptext Binoculars3Text

PokeDollVendingMachine:
	jumptext PokeDollVendingMachineText

GoldenrodDeptStoreRoofPokefanFText:
	text "Che stanchezza."

	para "A volte vengo qui"
	line "sulla terrazza per"

	para "rilassarmi un po'."
	done

GoldenrodDeptStoreRoofFisherText:
	text "Ehi, chi ha detto"
	line "che queste non"
	cont "sono cose da"
	cont "adulti?"

	para "Verrò qui tutti i"
	line "giorni per"

	para "prendere le"
	line "bambole!"
	done

GoldenrodDeptStoreRoofTwinText:
	text "Qui ogni tanto ci"
	line "sono offerte"
	cont "speciali."
	done

GoldenrodDeptStoreRoofSuperNerdOhWowText:
	text "Uauh!"
	done

GoldenrodDeptStoreRoofSuperNerdQuitBotheringMeText:
	text "La smetti di"
	line "importunarmi?!"
	done

GoldenrodDeptStoreRoofPokefanMText:
	text "C'è qualcosa che"
	line "mi piace davvero,"

	para "ma non mi bastano"
	line "i soldi…"

	para "Penso che venderò"
	line "le BACCHE che ho"
	cont "raccolto…"
	done

GoldenrodDeptStoreRoofTeacherText:
	text "Costa tutto così"
	line "poco!"

	para "Ho comprato"
	line "talmente tanto che"
	cont "ho lo ZAINO pieno!"
	done

GoldenrodDeptStoreRoofBugCatcherText:
	text "Non so perché, ma"
	line "i miei #MON"

	para "sono spesso"
	line "paralizzati o"
	cont "avvelenati…"

	para "Così ho deciso di"
	line "comprare CURA"
	cont "TOTALE."

	para "Spero che ne"
	line "abbiano ancora!"
	done

Binoculars1Text:
	text "Questi binocoli"
	line "sono potentissimi:"

	para "chissà, forse"
	line "riesco a vedere"
	cont "persino casa mia!"

	para "Non è quella con"
	line "il tetto verde?"
	done

Binoculars2Text:
	text "Ehi! Ci sono dei"
	line "#MON che"
	cont "lottano sulla"
	cont "strada."

	para "Uno ha lanciato"
	line "una raffica di"
	cont "foglie!"

	para "Ah, m'è venuta una"
	line "voglia di lottare!"
	done

Binoculars3Text:
	text "Un PESCATORE ha"
	line "preso parecchi"
	cont "MAGIKARP…"

	para "Stanno facendo"
	line "SPLASH ovunque!"

	para "Guarda, c'è acqua"
	line "dappertutto!"
	done

PokeDollVendingMachineText:
	text "Un distributore"
	line "automatico per"
	cont "# BAMBOLE!"

	para "Inserisci i soldi,"
	line "poi gira la leva…"

	para "Ma è quasi vuoto…"
	done

GoldenrodDeptStoreRoof_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 13,  1, GOLDENROD_DEPT_STORE_6F, 3

	db 0 ; coord events

	db 4 ; bg events
	bg_event 15,  3, BGEVENT_RIGHT, Binoculars1
	bg_event 15,  5, BGEVENT_RIGHT, Binoculars2
	bg_event 15,  6, BGEVENT_RIGHT, Binoculars3
	bg_event  3,  0, BGEVENT_UP, PokeDollVendingMachine

	db 8 ; object events
	object_event  1,  4, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofClerkScript, EVENT_GOLDENROD_SALE_OFF
	object_event 10,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofPokefanFScript, -1
	object_event  2,  1, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofFisherScript, -1
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofTwinScript, EVENT_GOLDENROD_SALE_ON
	object_event 14,  6, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofSuperNerdScript, EVENT_GOLDENROD_SALE_ON
	object_event  7,  0, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofPokefanMScript, EVENT_GOLDENROD_SALE_OFF
	object_event  5,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofTeacherScript, EVENT_GOLDENROD_SALE_OFF
	object_event  1,  6, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreRoofBugCatcherScript, EVENT_GOLDENROD_SALE_OFF
