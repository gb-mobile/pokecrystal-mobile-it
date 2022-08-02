	object_const_def ; object_event constants
	const ROUTE19FUCHSIAGATE_OFFICER

Route19FuchsiaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route19FuchsiaGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19FuchsiaGateOfficerText
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19FuchsiaGateOfficerText_RocksCleared
	waitbutton
	closetext
	end

Route19FuchsiaGateOfficerText:
	text "Il vulcano dell'"
	line "ISOLA CANNELLA ha"
	cont "eruttato."

	para "Dei massi lanciati"
	line "dal vulcano hanno"
	cont "reso impraticabile"
	cont "il PERCORSO 19."

	para "Speriamo che gli"
	line "abitanti dell'"
	cont "ISOLA siano salvi…"
	done

Route19FuchsiaGateOfficerText_RocksCleared:
	text "Nessun abitante"
	line "dell'ISOLA"

	para "CANNELLA è rimasto"
	line "ferito per l'eru-"
	cont "zione. Meno male!"
	done

Route19FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  4,  0, FUCHSIA_CITY, 10
	warp_event  5,  0, FUCHSIA_CITY, 11
	warp_event  4,  7, ROUTE_19, 1
	warp_event  5,  7, ROUTE_19, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FuchsiaGateOfficerScript, -1
