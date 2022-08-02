	object_const_def ; object_event constants
	const ECRUTEAKPOKECENTER1F_NURSE
	const ECRUTEAKPOKECENTER1F_POKEFAN_M
	const ECRUTEAKPOKECENTER1F_COOLTRAINER_F
	const ECRUTEAKPOKECENTER1F_GYM_GUY
	const ECRUTEAKPOKECENTER1F_BILL

EcruteakPokecenter1F_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetBill ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetBill:
	prioritysjump .BillActivatesTimeCapsule
	end

.DummyScene:
	end

.BillActivatesTimeCapsule:
	pause 30
	playsound SFX_EXIT_BUILDING
	appear ECRUTEAKPOKECENTER1F_BILL
	waitsfx
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement1
	applymovement PLAYER, EcruteakPokecenter1FPlayerMovement1
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 30
	turnobject ECRUTEAKPOKECENTER1F_NURSE, UP
	pause 10
	turnobject ECRUTEAKPOKECENTER1F_NURSE, DOWN
	pause 20
	turnobject ECRUTEAKPOKECENTER1F_BILL, DOWN
	pause 10
	opentext
	writetext EcruteakPokecenter1F_BillText1
	buttonsound
	sjump .PointlessJump

.PointlessJump:
	writetext EcruteakPokecenter1F_BillText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement ECRUTEAKPOKECENTER1F_BILL, EcruteakPokecenter1FBillMovement2
	playsound SFX_EXIT_BUILDING
	disappear ECRUTEAKPOKECENTER1F_BILL
	clearevent EVENT_MET_BILL
	setflag ENGINE_TIME_CAPSULE
	setscene SCENE_FINISHED
	waitsfx
	end

EcruteakPokecenter1FNurseScript:
	jumpstd pokecenternurse

EcruteakPokecenter1FPokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMText

.mobile
	jumptextfaceplayer EcruteakPokecenter1FPokefanMTextMobile

EcruteakPokecenter1FCooltrainerFScript:
	jumptextfaceplayer EcruteakPokecenter1FCooltrainerFText

EcruteakPokecenter1FGymGuyScript:
	jumptextfaceplayer EcruteakPokecenter1FGymGuyText

EcruteakPokecenter1FBillMovement1:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step RIGHT
	turn_head UP
	step_end

EcruteakPokecenter1FBillMovement2:
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

EcruteakPokecenter1FPlayerMovement1:
	step UP
	step UP
	step UP
	step_end

EcruteakPokecenter1F_BillText1:
	text "Ciao, sono BILL."
	line "Tu chi sei?"

	para "<PLAYER> hai detto?"
	line "Capiti proprio al"
	cont "momento giusto."
	done

EcruteakPokecenter1F_BillText2:
	text "Ho appena finito"
	line "di riparare la mia"
	cont "TEMPOCAPSULA."

	para "Sai che i #MON"
	line "si possono"
	cont "scambiare, giusto?"

	para "Con la mia TEMPO-"
	line "CAPSULA si possono"

	para "fare scambi con il"
	line "passato."

	para "Ma non si può"
	line "scambiare nulla"

	para "che non esistesse"
	line "già nel passato."

	para "Altrimenti il PC"
	line "del passato"
	cont "avrebbe un guasto."

	para "Quindi, togli di"
	line "mezzo tutto ciò"

	para "che nel passato"
	line "non esisteva."

	para "In poche parole:"
	line "non spedire nuove"

	para "mosse o nuovi"
	line "#MON con la"
	cont "TEMPOCAPSULA."

	para "Ora la"
	line "TEMPOCAPSULA è"
	cont "perfetta."

	para "Da domani funzio-"
	line "neranno tutte le"

	para "TEMPOCAPSULE in"
	line "ogni CENTRO"
	cont "#MON."

	para "Devo tornare dalla"
	line "mia gente a"
	cont "FIORDOROPOLI."

	para "Ciao ciao!"
	done

EcruteakPokecenter1FPokefanMText:
	text "È incredibile"
	line "la danza delle"

	para "KIMONO GIRL: e con"
	line "i #MON sono"
	cont "altrettanto"
	cont "leggiadre."
	done

EcruteakPokecenter1FPokefanMTextMobile:
	text "Vuoi sfidare altri"
	line "allenatori?"

	para "Conosco un posto"
	line "dove puoi"

	para "incontrarne"
	line "moltissimi."

	para "Dove?"

	para "È appena fuori"
	line "OLIVINOPOLI."
	done

EcruteakPokecenter1FCooltrainerFText:
	text "ANGELO, il CAPOPA-"
	line "LESTRA, è troppo"
	cont "forte!"

	para "Anche i suoi #-"
	line "MON sono potenti."
	done

EcruteakPokecenter1FGymGuyText:
	text "LAGO D'IRA…"

	para "L'apparizione di"
	line "un branco di"
	cont "GYARADOS…"

	para "Ci dev'essere"
	line "sotto qualcosa!"
	done

EcruteakPokecenter1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ECRUTEAK_CITY, 6
	warp_event  4,  7, ECRUTEAK_CITY, 6
	warp_event  0,  7, POKECENTER_2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FNurseScript, -1
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FPokefanMScript, -1
	object_event  1,  4, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FCooltrainerFScript, -1
	object_event  7,  1, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, EcruteakPokecenter1FGymGuyScript, -1
	object_event  0,  7, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ECRUTEAK_POKE_CENTER_BILL
