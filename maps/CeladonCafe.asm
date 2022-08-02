	object_const_def ; object_event constants
	const CELADONCAFE_SUPER_NERD
	const CELADONCAFE_FISHER1
	const CELADONCAFE_FISHER2
	const CELADONCAFE_FISHER3
	const CELADONCAFE_TEACHER

CeladonCafe_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeladonCafeChef:
	faceplayer
	opentext
	writetext ChefText_Eatathon
	waitbutton
	closetext
	end

CeladonCafeFisher1:
	opentext
	writetext Fisher1Text_Snarfle
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher1Text_Concentration
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER1, LEFT
	end

CeladonCafeFisher2:
	opentext
	writetext Fisher2Text_GulpChew
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher2Text_Quantity
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER2, RIGHT
	end

CeladonCafeFisher3:
	opentext
	writetext Fisher3Text_MunchMunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext Fisher3Text_GoldenrodIsBest
	waitbutton
	closetext
	turnobject CELADONCAFE_FISHER3, RIGHT
	end

CeladonCafeTeacher:
	checkitem COIN_CASE
	iftrue .HasCoinCase
	opentext
	writetext TeacherText_CrunchCrunch
	waitbutton
	closetext
	faceplayer
	opentext
	writetext TeacherText_NoCoinCase
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, LEFT
	end

.HasCoinCase:
	opentext
	writetext TeacherText_KeepEating
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, RIGHT
	opentext
	writetext TeacherText_MoreChef
	waitbutton
	closetext
	turnobject CELADONCAFE_TEACHER, LEFT
	end

EatathonContestPoster:
	jumptext EatathonContestPosterText

CeladonCafeTrashcan:
	checkevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	iftrue .TrashEmpty
	giveitem LEFTOVERS
	iffalse .PackFull
	opentext
	getitemname STRING_BUFFER_3, LEFTOVERS
	writetext FoundLeftoversText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setevent EVENT_FOUND_LEFTOVERS_IN_CELADON_CAFE
	end

.PackFull:
	opentext
	getitemname STRING_BUFFER_3, LEFTOVERS
	writetext FoundLeftoversText
	buttonsound
	writetext NoRoomForLeftoversText
	waitbutton
	closetext
	end

.TrashEmpty:
	jumpstd trashcan

ChefText_Eatathon:
	text "Salve!"

	para "Stiamo facendo una"
	line "gara di cibo."

	para "Non possiamo"
	line "servirti ora."
	done

Fisher1Text_Snarfle:
	text "…Gnam gnam…"
	done

Fisher1Text_Concentration:
	text "Non parlarmi!"

	para "Mi farai perdere"
	line "la concentrazione!"
	done

Fisher2Text_GulpChew:
	text "…Gulp… Gnam…"
	done

Fisher2Text_Quantity:
	text "Alla qualità"
	line "preferisco la"
	cont "quantità!"

	para "Mi piace sentirmi"
	line "sazio!"
	done

Fisher3Text_MunchMunch:
	text "Gnam gnam…"
	done

Fisher3Text_GoldenrodIsBest:
	text "Qui si mangia"
	line "bene, ma FIORDORO-"
	cont "POLI è il massimo."
	done

TeacherText_CrunchCrunch:
	text "Gnam… gnam…"
	done

TeacherText_NoCoinCase:
	text "Qui non c'è il"
	line "SALVADANAIO. Devi"

	para "procurartelo a"
	line "JOHTO."
	done

TeacherText_KeepEating:
	text "Gnam… gnam…"

	para "Voglio altro cibo!"
	done

TeacherText_MoreChef:
	text "Cameriere, ancora!"
	done

EatathonContestPosterText:
	text "Grande Abbuffata"
	line "Nessun limite di"

	para "tempo: una gara"
	line "interminabile! Il"

	para "miglior mangione"
	line "non paga il conto!"
	done

FoundLeftoversText:
	text "<PLAYER> trova"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

NoRoomForLeftoversText:
	text "Ma <PLAYER> non ha"
	line "posto nello ZAINO…"
	done

CeladonCafe_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  6,  7, CELADON_CITY, 9
	warp_event  7,  7, CELADON_CITY, 9

	db 0 ; coord events

	db 2 ; bg events
	bg_event  5,  0, BGEVENT_READ, EatathonContestPoster
	bg_event  7,  1, BGEVENT_READ, CeladonCafeTrashcan

	db 5 ; object events
	object_event  9,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeladonCafeChef, -1
	object_event  4,  6, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher1, -1
	object_event  1,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher2, -1
	object_event  1,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeFisher3, -1
	object_event  4,  3, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeladonCafeTeacher, -1
