	object_const_def ; object_event constants
	const OLIVINEGOODRODHOUSE_FISHING_GURU

OlivineGoodRodHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

GoodRodGuru:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOOD_ROD
	iftrue .AlreadyGotItem
	writetext OfferGoodRodText
	yesorno
	iffalse .DontWantIt
	writetext GiveGoodRodText
	buttonsound
	verbosegiveitem GOOD_ROD
	writetext GaveGoodRodText
	waitbutton
	closetext
	setevent EVENT_GOT_GOOD_ROD
	end

.DontWantIt:
	writetext DontWantGoodRodText
	waitbutton
	closetext
	end

.AlreadyGotItem:
	writetext HaveGoodRodText
	waitbutton
	closetext
	end

GoodRodHouseBookshelf:
; unused
	jumpstd picturebookshelf

OfferGoodRodText:
	text "OLIVINOPOLI si"
	line "trova sul mare."

	para "E se è sul mare, è"
	line "logico che vi"
	cont "siano dei pesci!"

	para "Sono 30 anni che"
	line "pesco qui."

	para "Che ne dici di"
	line "sfidare il mare"
	cont "pescando?"
	done

GiveGoodRodText:
	text "Vedrai che ti"
	line "piacerà pescare!"
	done

GaveGoodRodText:
	text "I pesci non si"
	line "trovano solo in"

	para "mare: sono ovunque"
	line "ci sia dell'acqua."
	done

DontWantGoodRodText:
	text "Cosa! Non ti piace"
	line "pescare!?"
	cont "Inconcepibile!"
	done

HaveGoodRodText:
	text "Ehi, come va?"
	line "Abboccano?"
	done

OlivineGoodRodHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 6
	warp_event  3,  7, OLIVINE_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoodRodGuru, -1
