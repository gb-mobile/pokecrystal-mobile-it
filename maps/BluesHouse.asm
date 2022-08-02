	object_const_def ; object_event constants
	const BLUESHOUSE_DAISY

BluesHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

DaisyScript:
	faceplayer
	opentext
	readvar VAR_HOUR
	ifequal 15, .ThreePM
	writetext DaisyHelloText
	waitbutton
	closetext
	end

.ThreePM:
	checkflag ENGINE_DAISYS_GROOMING
	iftrue .AlreadyGroomedMon
	writetext DaisyOfferGroomingText
	yesorno
	iffalse .Refused
	writetext DaisyWhichMonText
	waitbutton
	special DaisysGrooming
	ifequal $0, .Refused
	ifequal $1, .CantGroomEgg
	setflag ENGINE_DAISYS_GROOMING
	writetext DaisyAlrightText
	waitbutton
	closetext
	special FadeOutPalettes
	playmusic MUSIC_HEAL
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext GroomedMonLooksContentText
	special PlayCurMonCry
	buttonsound
	writetext DaisyAllDoneText
	waitbutton
	closetext
	end

.AlreadyGroomedMon:
	writetext DaisyAlreadyGroomedText
	waitbutton
	closetext
	end

.Refused:
	writetext DaisyRefusedText
	waitbutton
	closetext
	end

.CantGroomEgg:
	writetext DaisyCantGroomEggText
	waitbutton
	closetext
	end

DaisyHelloText:
	text "MARGI: Ciao! Il"
	line "mio fratellino è"

	para "CAPOPALESTRA a"
	line "SMERALDOPOLI."

	para "Ma spesso è"
	line "fuori città e"

	para "ciò crea disagi"
	line "agli allenatori."
	done

DaisyOfferGroomingText:
	text "MARGI: Ciao, capi-"
	line "ti a fagiolo: sto"
	cont "facendo il tè."

	para "Vuoi"
	line "favorire?"

	para "I tuoi #MON"
	line "sono stanchi."

	para "Vuoi che te ne"
	line "spazzoli uno?"
	done

DaisyWhichMonText:
	text "MARGI: Quale vuoi"
	line "far spazzolare?"
	done

DaisyAlrightText:
	text "MARGI: In un minu-"
	line "to diventerà"
	cont "splendido."
	done

GroomedMonLooksContentText:
	text_ram wStringBuffer3
	text " ha"
	line "un aspetto felice."
	done

DaisyAllDoneText:
	text "MARGI: Ecco qui,"
	line "ho finito!"

	para "È bello, non"
	line "credi?"

	para "È un #MON"
	line "così carino!"
	done

DaisyAlreadyGroomedText:
	text "MARGI: Prendo"
	line "sempre il tè"

	para "a quest'ora."
	line "Ne vuoi?"
	done

DaisyRefusedText:
	text "MARGI: Non vuoi"
	line "che te ne spazzoli"

	para "uno? Ok, beviamo"
	line "soltanto."
	done

DaisyCantGroomEggText:
	text "MARGI: Mi spiace,"
	line "ma non posso"
	cont "proprio spazzolare"
	cont "un UOVO!"
	done

BluesHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PALLET_TOWN, 2
	warp_event  3,  7, PALLET_TOWN, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DaisyScript, -1
