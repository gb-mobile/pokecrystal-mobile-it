	object_const_def ; object_event constants
	const MANIASHOUSE_ROCKER

ManiasHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

ManiaScript:
	faceplayer
	opentext
	checkevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	iftrue .default_postevent
	checkevent EVENT_GOT_SHUCKIE
	iftrue .alreadyhaveshuckie
	writetext ManiaText_AskLookAfterShuckle
	yesorno
	iffalse .refusetotakeshuckie
	special GiveShuckle
	iffalse .partyfull
	writetext ManiaText_TakeCareOfShuckle
	buttonsound
	waitsfx
	writetext ManiaText_GotShuckle
	playsound SFX_KEY_ITEM
	waitsfx
	closetext
	setevent EVENT_GOT_SHUCKIE
	end

.alreadyhaveshuckie
	checkflag ENGINE_GOT_SHUCKIE_TODAY
	iffalse .returnshuckie
	writetext ManiaText_TakeCareOfShuckle
	waitbutton
	closetext
	end

.partyfull
	writetext ManiaText_PartyFull
	waitbutton
	closetext
	end

.refusetotakeshuckie
	writetext ManiaText_IfHeComesBack
	waitbutton
	closetext
	end

.returnshuckie
	writetext ManiaText_CanIHaveMyMonBack
	yesorno
	iffalse .refused
	special ReturnShuckle
	ifequal SHUCKIE_WRONG_MON, .wrong
	ifequal SHUCKIE_REFUSED, .refused
	ifequal SHUCKIE_HAPPY, .superhappy
	ifequal SHUCKIE_FAINTED, .default_postevent
	; SHUCKIE_RETURNED
	writetext ManiaText_ThankYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.wrong
	writetext ManiaText_ShuckleNotThere
	waitbutton
	closetext
	end

.superhappy
	writetext ManiaText_ShuckleLikesYou
	waitbutton
	closetext
	setevent EVENT_MANIA_TOOK_SHUCKIE_OR_LET_YOU_KEEP_HIM
	end

.refused
	writetext ManiaText_SameAsBeingRobbed
	waitbutton
	closetext
	end

.nothingleft
	writetext ManiaText_ShuckleIsYourLastMon
	waitbutton
	closetext
	end

.default_postevent
	writetext ManiaText_HappinessSpeech
	waitbutton
	closetext
	end

ManiasHouseUnusedBookshelf:
; unused
	jumpstd picturebookshelf

ManiaText_AskLookAfterShuckle:
	text "È pazzesco!"

	para "È entrato un"
	line "bambino con i"

	para "capelli lunghi e"
	line "una strana luce"
	cont "negli occhi."

	para "Mi ha fatto paura,"
	line "ho dovuto dargli i"
	cont "miei #MON!"

	para "Ne ho ancora uno,"
	line "ma che accadrà se"
	cont "ritorna?"

	para "Sembri forte: puoi"
	line "badare al mio"

	para "#MON per"
	line "un po'?"
	done

ManiaText_TakeCareOfShuckle:
	text "Oh, grazie!"

	para "Abbine cura, ti"
	line "prego!"
	done

ManiaText_GotShuckle:
	text "<PLAYER> riceve un"
	line "#MON."
	done

ManiaText_PartyFull:
	text "La tua squadra"
	line "è al completo."
	done

ManiaText_IfHeComesBack:
	text "Oh, no… Che"
	line "farò se ritorna?!"
	done

ManiaText_CanIHaveMyMonBack:
	text "Ciao! Come sta il"
	line "mio #MON?"

	para "Ora non ho più"
	line "nulla da temere:"
	cont "me lo ridai?"
	done

ManiaText_ThankYou:
	text "Grazie!"
	done

ManiaText_ShuckleNotThere:
	text "Ehi, ma il mio"
	line "#MON non è con"
	cont "te!"
	done

ManiaText_ShuckleLikesYou:
	text "Il mio #MON ti"
	line "si è affezionato."

	para "Va bene, te lo"
	line "lascio. Promettimi"

	para "che lo tratterai"
	line "bene, però!"
	done

ManiaText_SameAsBeingRobbed:
	text "Oh, no, no…È"
	line "come se me lo"
	cont "avessi rapito!"
	done

ManiaText_HappinessSpeech:
	text "Per un #MON, la"
	line "felicità è essere"

	para "con qualcuno che"
	line "lo tratta bene."
	done

ManiaText_ShuckleIsYourLastMon:
	text "Se mi riprendo il "
	line "#MON, chi"

	para "userai per"
	line "lottare?"
	done

ManiasHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CIANWOOD_CITY, 1
	warp_event  3,  7, CIANWOOD_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  4, SPRITE_ROCKER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ManiaScript, -1
