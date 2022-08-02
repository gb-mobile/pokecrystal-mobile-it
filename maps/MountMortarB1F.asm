	object_const_def ; object_event constants
	const MOUNTMORTARB1F_POKE_BALL1
	const MOUNTMORTARB1F_POKE_BALL2
	const MOUNTMORTARB1F_BOULDER
	const MOUNTMORTARB1F_BLACK_BELT
	const MOUNTMORTARB1F_POKE_BALL3
	const MOUNTMORTARB1F_POKE_BALL4
	const MOUNTMORTARB1F_POKE_BALL5

MountMortarB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MountMortarB1FKiyoScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TYROGUE_FROM_KIYO
	iftrue .GotTyrogue
	checkevent EVENT_BEAT_BLACKBELT_KIYO
	iftrue .BeatKiyo
	writetext UnknownText_0x7e24d
	waitbutton
	closetext
	winlosstext UnknownText_0x7e2a9, 0
	loadtrainer BLACKBELT_T, KIYO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLACKBELT_KIYO
	opentext
.BeatKiyo:
	writetext UnknownText_0x7e2c0
	buttonsound
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext UnknownText_0x7e355
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke TYROGUE, 10
	setevent EVENT_GOT_TYROGUE_FROM_KIYO
.GotTyrogue:
	writetext UnknownText_0x7e36a
	waitbutton
	closetext
	end

.NoRoom:
	writetext UnknownText_0x7e3df
	waitbutton
	closetext
	end

MountMortarB1FBoulder:
	jumpstd strengthboulder

MountMortarB1FHyperPotion:
	itemball HYPER_POTION

MountMortarB1FCarbos:
	itemball CARBOS

MountMortarB1FFullRestore:
	itemball FULL_RESTORE

MountMortarB1FMaxEther:
	itemball MAX_ETHER

MountMortarB1FPPUp:
	itemball PP_UP

MountMortarB1FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_MOUNT_MORTAR_B1F_HIDDEN_MAX_REVIVE

UnknownText_0x7e24d:
	text "Ehi!"

	para "Io sono il RE del"
	line "KARATE!"

	para "Mi alleno qui"
	line "da solo al buio."

	para "Ehi tu!"
	line "Lotta con me!"

	para "Aaarggh!"
	done

UnknownText_0x7e2a9:
	text "Aaaarggh!"
	line "Mi hai distrutto!"
	done

UnknownText_0x7e2c0:
	text "Io… sono perduto…"

	para "Il mio allenamento"
	line "non è bastato…"

	para "Ma una sconfitta è"
	line "una sconfitta."

	para "Come prova che mi"
	line "hai battuto, ti"

	para "darò questo raro"
	line "#MON lotta."
	done

UnknownText_0x7e355:
	text "<PLAYER> riceve"
	line "TYROGUE."
	done

UnknownText_0x7e36a:
	text "TYROGUE è di tipo"
	line "lotta."

	para "Si evolve in un"
	line "#MON più forte."

	para "Continua a lavora-"
	line "re sodo! Anch'io"
	cont "continuerò ad"
	cont "allenarmi."

	para "Addio!"
	done

UnknownText_0x7e3df:
	text "Non c'è più posto"
	line "nella tua squadra!"
	done

MountMortarB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  3, MOUNT_MORTAR_1F_INSIDE, 5
	warp_event 19, 29, MOUNT_MORTAR_1F_OUTSIDE, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  6, BGEVENT_ITEM, MountMortarB1FHiddenMaxRevive

	db 7 ; object events
	object_event 29, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FHyperPotion, EVENT_MOUNT_MORTAR_B1F_HYPER_POTION
	object_event  4, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FCarbos, EVENT_MOUNT_MORTAR_B1F_CARBOS
	object_event  9, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FBoulder, -1
	object_event 16,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MountMortarB1FKiyoScript, -1
	object_event 34, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FFullRestore, EVENT_MOUNT_MORTAR_B1F_FULL_RESTORE
	object_event 32,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FMaxEther, EVENT_MOUNT_MORTAR_B1F_MAX_ETHER
	object_event 21, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FPPUp, EVENT_MOUNT_MORTAR_B1F_PP_UP
