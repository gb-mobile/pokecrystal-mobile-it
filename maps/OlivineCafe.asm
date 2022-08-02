	object_const_def ; object_event constants
	const OLIVINECAFE_SAILOR1
	const OLIVINECAFE_FISHING_GURU
	const OLIVINECAFE_SAILOR2

OlivineCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivineCafeStrengthSailorScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM04_STRENGTH
	iftrue .GotStrength
	writetext OlivineCafeStrengthSailorText
	buttonsound
	verbosegiveitem HM_STRENGTH
	setevent EVENT_GOT_HM04_STRENGTH
.GotStrength:
	writetext OlivineCafeStrengthSailorText_GotStrength
	waitbutton
	closetext
	end

OlivineCafeFishingGuruScript:
	jumptextfaceplayer OlivineCafeFishingGuruText

OlivineCafeSailorScript:
	jumptextfaceplayer OlivineCafeSailorText

OlivineCafeStrengthSailorText:
	text "I tuoi #MON"
	line "mi sembrano un po'"
	cont "debolucci!"

	para "Non hanno la forza"
	line "per spostare i"
	cont "massi."

	para "Dagli questo, così"
	line "impareranno FORZA!"
	done

OlivineCafeStrengthSailorText_GotStrength:
	text "Quando sei in mare"
	line "puoi contare"

	para "soltanto su te"
	line "stesso."

	para "Sono proprio"
	line "fiero di me!"
	done

OlivineCafeFishingGuruText:
	text "All'OLIVIN BAR"
	line "preparano piatti"

	para "molto ricchi,"
	line "adatti per la gran"
	cont "fame dei MARINAI!"
	done

OlivineCafeSailorText:
	text "Ogni volta che"
	line "capito di qui,"

	para "faccio sempre un"
	line "salto all'OLIVIN"
	cont "BAR."

	para "Hanno piatti"
	line "energetici e"

	para "appetitosi: non"
	line "smetterei più di"
	cont "mangiare!"
	done

OlivineCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 7
	warp_event  3,  7, OLIVINE_CITY, 7

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  4,  3, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeStrengthSailorScript, -1
	object_event  7,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeFishingGuruScript, -1
	object_event  6,  6, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineCafeSailorScript, -1
