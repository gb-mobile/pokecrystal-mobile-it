	object_const_def ; object_event constants
	const GOLDENRODDEPTSTOREB1F_POKE_BALL1
	const GOLDENRODDEPTSTOREB1F_POKE_BALL2
	const GOLDENRODDEPTSTOREB1F_POKE_BALL3
	const GOLDENRODDEPTSTOREB1F_POKE_BALL4
	const GOLDENRODDEPTSTOREB1F_BLACK_BELT1
	const GOLDENRODDEPTSTOREB1F_BLACK_BELT2
	const GOLDENRODDEPTSTOREB1F_BLACK_BELT3
	const GOLDENRODDEPTSTOREB1F_MACHOP

GoldenrodDeptStoreB1F_MapScripts:
	db 0 ; scene scripts

	db 2 ; callbacks
	callback MAPCALLBACK_TILES, .ClearBoxes
	callback MAPCALLBACK_NEWMAP, .Unblock

.ClearBoxes:
	checkevent EVENT_RECEIVED_CARD_KEY
	iftrue .GotCardKey
	sjump .Continue

.GotCardKey:
	changeblock 16, 4, $0d ; floor
	sjump .Continue

.Continue:
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_2
	iftrue .Layout2
	checkevent EVENT_GOLDENROD_DEPT_STORE_B1F_LAYOUT_3
	iftrue .Layout3
	changeblock 10, 8, $0d ; floor
	return

.Layout2:
	changeblock 4, 10, $0d ; floor
	return

.Layout3:
	changeblock 10, 12, $0d ; floor
	return

.Unblock:
	clearevent EVENT_GOLDENROD_UNDERGROUND_WAREHOUSE_BLOCKED_OFF
	return

GoldenrodDeptStoreB1FBlackBelt1Script:
	jumptextfaceplayer GoldenrodDeptStoreB1FBlackBelt1Text

GoldenrodDeptStoreB1FBlackBelt2Script:
	jumptextfaceplayer GoldenrodDeptStoreB1FBlackBelt2Text

GoldenrodDeptStoreB1FBlackBelt3Script:
	jumptextfaceplayer GoldenrodDeptStoreB1FBlackBelt3Text

GoldenrodDeptStoreB1FMachopScript:
	opentext
	writetext GoldenrodDeptStoreB1FMachokeText
	cry MACHOKE
	waitbutton
	closetext
	end

GoldenrodDeptStoreB1FEther:
	itemball ETHER

GoldenrodDeptStoreB1FAmuletCoin:
	itemball AMULET_COIN

GoldenrodDeptStoreB1FBurnHeal:
	itemball BURN_HEAL

GoldenrodDeptStoreB1FUltraBall:
	itemball ULTRA_BALL

GoldenrodDeptStoreB1FBlackBelt1Text:
	text "Ehi, ci stai"
	line "disturbando!"

	para "Noi vogliamo"
	line "lavorare dietro"

	para "le quinte, senza"
	line "farci vedere!"
	done

GoldenrodDeptStoreB1FBlackBelt2Text:
	text "Se mi osservano"
	line "non lavoro"
	cont "volentieri."

	para "Avanti, microbo:"
	line "smamma!"
	done

GoldenrodDeptStoreB1FBlackBelt3Text:
	text "Oooh!"

	para "Sul pavimento c'è"
	line "della robaccia!"

	para "Prendila se ti"
	line "va!"
	done

GoldenrodDeptStoreB1FMachokeText:
	text "MACHOKE: Maaacho!"
	done

GoldenrodDeptStoreB1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 17,  2, GOLDENROD_UNDERGROUND_WAREHOUSE, 3
	warp_event  9,  4, GOLDENROD_DEPT_STORE_ELEVATOR, 1
	warp_event 10,  4, GOLDENROD_DEPT_STORE_ELEVATOR, 2

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event 10, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodDeptStoreB1FEther, EVENT_GOLDENROD_DEPT_STORE_B1F_ETHER
	object_event 14,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodDeptStoreB1FAmuletCoin, EVENT_GOLDENROD_DEPT_STORE_B1F_AMULET_COIN
	object_event  6,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodDeptStoreB1FBurnHeal, EVENT_GOLDENROD_DEPT_STORE_B1F_BURN_HEAL
	object_event 15, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, GoldenrodDeptStoreB1FUltraBall, EVENT_GOLDENROD_DEPT_STORE_B1F_ULTRA_BALL
	object_event  9, 10, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreB1FBlackBelt1Script, -1
	object_event  4,  8, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreB1FBlackBelt2Script, -1
	object_event  6, 13, SPRITE_BLACK_BELT, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreB1FBlackBelt3Script, -1
	object_event  7,  7, SPRITE_MACHOP, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodDeptStoreB1FMachopScript, -1
