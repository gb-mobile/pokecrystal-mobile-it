	object_const_def ; object_event constants
	const OLIVINEMART_CLERK
	const OLIVINEMART_COOLTRAINER_F
	const OLIVINEMART_LASS

OlivineMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_OLIVINE
	closetext
	end

OlivineMartCooltrainerFScript:
	jumptextfaceplayer OlivineMartCooltrainerFText

OlivineMartLassScript:
	jumptextfaceplayer OlivineMartLassText

OlivineMartCooltrainerFText:
	text "I tuoi #MON"
	line "conoscono già"

	para "la mossa per"
	line "portare la gente"
	cont "sull'acqua?"
	done

OlivineMartLassText:
	text "Il mio ragazzo"
	line "è di là dal mare:"
	cont "mi ha mandato"
	cont "un BUTTERFREE!"

	para "Aveva un MESSAGGIO"
	line "con sé."

	para "Vuoi sapere che"
	line "c'è scritto?"

	para "Ecco… Non posso!"
	line "È un segreto!"
	done

OlivineMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 8
	warp_event  3,  7, OLIVINE_CITY, 8

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineMartClerkScript, -1
	object_event  6,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, OlivineMartCooltrainerFScript, -1
	object_event  1,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineMartLassScript, -1
