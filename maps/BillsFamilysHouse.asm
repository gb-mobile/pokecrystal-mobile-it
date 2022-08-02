	object_const_def ; object_event constants
	const BILLSFAMILYSHOUSE_BILL
	const BILLSFAMILYSHOUSE_POKEFAN_F
	const BILLSFAMILYSHOUSE_TWIN

BillsFamilysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BillScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_EEVEE
	iftrue .GotEevee
	writetext BillTakeThisEeveeText
	yesorno
	iffalse .Refused
	writetext BillImCountingOnYouText
	buttonsound
	waitsfx
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .NoRoom
	writetext ReceivedEeveeText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke EEVEE, 20
	setevent EVENT_GOT_EEVEE
	writetext BillEeveeMayEvolveText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillPartyFullText
	waitbutton
	closetext
	end

.Refused:
	writetext BillNoEeveeText
	waitbutton
	closetext
	end

.GotEevee:
	writetext BillPopWontWorkText
	waitbutton
	closetext
	end

BillsMomScript:
	faceplayer
	opentext
	checkevent EVENT_MET_BILL
	iffalse .HaventMetBill
	writetext BillsPopText
	waitbutton
	closetext
	end

.HaventMetBill:
	writetext BillsMomText
	waitbutton
	closetext
	end

BillsSisterScript:
	faceplayer
	opentext
	checkcellnum PHONE_BILL
	iftrue .GotBillsNumber
	writetext BillsSisterUsefulNumberText
	askforphonenumber PHONE_BILL
	ifequal PHONE_CONTACTS_FULL, .NoRoom
	ifequal PHONE_CONTACT_REFUSED, .Refused
	waitsfx
	addcellnum PHONE_BILL
	writetext RecordedBillsNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	buttonsound
.GotBillsNumber:
	writetext BillsSisterStorageSystemText
	waitbutton
	closetext
	end

.Refused:
	writetext BillsSisterRefusedNumberText
	waitbutton
	closetext
	end

.NoRoom:
	writetext BillsSisterPhoneFullText
	buttonsound
	sjump .Refused

BillsHouseBookshelf1:
	jumpstd picturebookshelf

BillsHouseBookshelf2:
	jumpstd magazinebookshelf

BillsHouseRadio:
	jumpstd radio2

BillTakeThisEeveeText:
	text "BILL: Ciao, "
	line "<PLAYER>! Prendere-"
	cont "sti questo EEVEE?"

	para "È spuntato mentre"
	line "stavo aggiustando"
	cont "la TEMPOCAPSULA."

	para "Qualcuno dovrebbe"
	line "occuparsene, ma io"

	para "non esco"
	line "volentieri."

	para "Lo porterai fuori"
	line "a giocare,"
	cont "<PLAYER>?"
	done

BillImCountingOnYouText:
	text "BILL: Sapevo che"
	line "non m'avresti"
	cont "deluso!"

	para "Benissimo! Sei in"
	line "gamba!"

	para "Ok, allora conto"
	line "su di te."

	para "Abbine cura, mi"
	line "raccomando!"
	done

ReceivedEeveeText:
	text "<PLAYER> riceve"
	line "EEVEE!"
	done

BillEeveeMayEvolveText:
	text "BILL: Il PROF.ELM"
	line "sostiene che EEVEE"

	para "s'evolve in un"
	line "modo particolare."
	done

BillPartyFullText:
	text "Ah, ma non hai"
	line "posto per altri"
	cont "#MON!"
	done

BillNoEeveeText:
	text "Oh… E ora come"
	line "faccio?"
	done

BillPopWontWorkText:
	text "BILL: Mio padre mi"
	line "dà dei problemi."

	para "Non fa che"
	line "andarsene in"
	cont "giro!"

	para "Penso che mi darà"
	line "parecchio daffare…"
	done

BillsPopText:
	text "Collezioni #-"
	line "MON? Mio figlio"
	cont "BILL è un esperto."

	para "Ora è dovuto"
	line "andare al CENTRO"

	para "#MON di"
	line "AMARANTOPOLI."

	para "Mio marito invece"
	line "è andato al"

	para "CASINÒ, ma non"
	line "l'ha chiamato"
	cont "nessuno…"
	done

BillsMomText:
	text "Mio marito era"
	line "conosciuto come"

	para "#FANATICO, un"
	line "tempo. BILL deve"

	para "aver preso da suo"
	line "padre."
	done

BillsSisterUsefulNumberText:
	text "Alleni i #MON?"

	para "Ti do un numero"
	line "che ti sarà utile!"
	done

RecordedBillsNumberText:
	text "<PLAYER> registra"
	line "il numero di BILL."
	done

BillsSisterRefusedNumberText:
	text "Mio fratello ha"
	line "creato il Sistema"
	cont "Memoria #MON."

	para "Volevo darti il"
	line "numero di BILL…"
	done

BillsSisterPhoneFullText:
	text "Non puoi registra-"
	line "re altri numeri."
	done

BillsSisterStorageSystemText:
	text "Mio fratello"
	line "maggiore BILL ha"

	para "creato il Sistema"
	line "Memoria #MON."
	done

BillsFamilysHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, GOLDENROD_CITY, 4
	warp_event  3,  7, GOLDENROD_CITY, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, BillsHouseBookshelf2
	bg_event  1,  1, BGEVENT_READ, BillsHouseBookshelf1
	bg_event  7,  1, BGEVENT_READ, BillsHouseRadio

	db 3 ; object events
	object_event  2,  3, SPRITE_BILL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillScript, EVENT_MET_BILL
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BillsMomScript, -1
	object_event  5,  4, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BillsSisterScript, -1
