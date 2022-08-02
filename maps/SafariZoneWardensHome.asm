	object_const_def ; object_event constants
	const SAFARIZONEWARDENSHOME_LASS

SafariZoneWardensHome_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

WardensGranddaughter:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	iftrue .AlreadyMet
	writetext WardensGranddaughterText1
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_WARDENS_GRANDDAUGHTER
	end
.AlreadyMet:
	writetext WardensGranddaughterText2
	waitbutton
	closetext
	end

WardenPhoto:
	jumptext WardenPhotoText

SafariZonePhoto:
	jumptext SafariZonePhotoText

WardensHomeBookshelf:
	jumpstd picturebookshelf

WardensGranddaughterText1:
	text "Mio nonno è il"
	line "GUARDIANO della"
	cont "ZONA SAFARI."

	para "O almeno, lo era…"

	para "Poi ha deciso di"
	line "andarsene in"

	para "vacanza all'estero"
	line "tutto solo."

	para "E la ZONA SAFARI"
	line "è abbandonata."
	done

WardensGranddaughterText2:
	text "È dispiaciuta a"
	line "molti la chiusura"

	para "della ZONA SAFARI,"
	line "ma mio nonno è"
	cont "proprio cocciuto…"
	done

WardenPhotoText:
	text "È la foto di un"
	line "vecchietto sorri-"
	cont "dente, circondato"
	cont "dai #MON."
	done

SafariZonePhotoText:
	text "È la foto di un'"
	line "enorme prateria,"

	para "in cui giocano"
	line "dei rari #MON."
	done

SafariZoneWardensHome_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, FUCHSIA_CITY, 6
	warp_event  3,  7, FUCHSIA_CITY, 6

	db 0 ; coord events

	db 4 ; bg events
	bg_event  0,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  1,  1, BGEVENT_READ, WardensHomeBookshelf
	bg_event  7,  0, BGEVENT_READ, WardenPhoto
	bg_event  9,  0, BGEVENT_READ, SafariZonePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, WardensGranddaughter, -1
