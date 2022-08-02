	object_const_def ; object_event constants
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_GYM_GUY
	const RADIOTOWER3F_COOLTRAINER_F
	const RADIOTOWER3F_ROCKET1
	const RADIOTOWER3F_ROCKET2
	const RADIOTOWER3F_ROCKET3
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .Change
	return

.Change:
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	return

RadioTower3FSuperNerdScript:
	jumptextfaceplayer RadioTower3FSuperNerdText

RadioTower3FGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	writetext RadioTower3FGymGuyText_Rockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FGymGuyText
	waitbutton
	closetext
	end

RadioTower3FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	iftrue .GotSunnyDay
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	writetext RadioTower3FCooltrainerFPleaseSaveDirectorText
	waitbutton
	closetext
	end

.UsedCardKey:
	writetext RadioTower3FCooltrainerFIsDirectorSafeText
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FCooltrainerFYoureMyHeroText
	buttonsound
	verbosegiveitem TM_SUNNY_DAY
	iffalse .NoRoom
	writetext RadioTower3FCooltrainerFItsSunnyDayText
	waitbutton
	closetext
	setevent EVENT_GOT_SUNNY_DAY_FROM_RADIO_TOWER
	end

.GotSunnyDay:
	writetext RadioTower3FCooltrainerFYouWereMarvelousText
	waitbutton
.NoRoom:
	closetext
	end

TrainerGruntM7:
	trainer GRUNTM, GRUNTM_7, EVENT_BEAT_ROCKET_GRUNTM_7, GruntM7SeenText, GruntM7BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM7AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMarc:
	trainer SCIENTIST, MARC, EVENT_BEAT_SCIENTIST_MARC, ScientistMarcSeenText, ScientistMarcBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMarcAfterBattleText
	waitbutton
	closetext
	end

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	checkitem CARD_KEY
	iftrue .HaveCardKey
.UsedCardKey:
	closetext
	end

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	reloadmappart
	closetext
	waitsfx
	end

RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonnelSignText

RadioTower3FPokemonMusicSign:
	jumptext RadioTower3FPokemonMusicSignText

RadioTower3FSuperNerdText:
	text "Abbiamo registrato"
	line "i versi di tutti i"

	para "#MON che"
	line "abbiamo trovato."

	para "Siamo a circa"
	line "200 specie."
	done

RadioTower3FGymGuyText_Rockets:
	text "Per un allenatore,"
	line "i #MON sono"
	cont "dei compagni."

	para "È tremendo il modo"
	line "in cui TEAM ROCKET"

	para "vuole controllare"
	line "i #MON."
	done

RadioTower3FGymGuyText:
	text "Trasmettiamo"
	line "programmi"

	para "d'intrattenimento"
	line "24 ore al giorno."

	para "Anch'io faccio del"
	line "mio meglio."
	done

RadioTower3FCooltrainerFPleaseSaveDirectorText:
	text "Il capo di TEAM "
	line "ROCKET si è chiuso"
	cont "dentro."

	para "Ma il DIRETTORE"
	line "può aprire."

	para "È al quarto"
	line "piano."

	para "Salvalo, ti prego!"
	done

RadioTower3FCooltrainerFIsDirectorSafeText:
	text "Il DIRETTORE è"
	line "al sicuro?"
	done

RadioTower3FCooltrainerFYoureMyHeroText:
	text "Grazie! Sei la"
	line "mia salvezza!"

	para "Ecco un segno del"
	line "mio apprezzamento."
	done

RadioTower3FCooltrainerFItsSunnyDayText:
	text "È GIORNODISOLE."
	line "Potenzia per un"
	cont "po' di tempo le"
	cont "mosse tipo fuoco."
	done

RadioTower3FCooltrainerFYouWereMarvelousText:
	text "È semplicemente"
	line "meraviglioso ciò"
	cont "che hai fatto!"
	done

GruntM7SeenText:
	text "Ho ricevuto ordini"
	line "precisi."

	para "Devo distruggere"
	line "chiunque sfidi"
	cont "TEAM ROCKET!"
	done

GruntM7BeatenText:
	text "Come?!"
	done

GruntM7AfterBattleText:
	text "Non ho fatto il"
	line "mio dovere…"

	para "Mi taglieranno la"
	line "paga…"
	done

GruntM8SeenText:
	text "Che bello ordinare"
	line "ai #MON di"
	cont "commettere"
	cont "crimini."
	done

GruntM8BeatenText:
	text "Stai scherzando?!"
	done

GruntM8AfterBattleText:
	text "Perdere mi fa"
	line "sentire da schifo!"

	para "Ah, quanto odio"
	line "i #MON inutili!"
	done

GruntM9SeenText:
	text "Perché si è"
	line "aperta la porta?"

	para "Tu ne sai"
	line "qualcosa?"
	done

GruntM9BeatenText:
	text "Sono fuori"
	line "combattimento."
	done

GruntM9AfterBattleText:
	text "Come?! Hai supe-"
	line "rato le guardie"
	cont "nei SOTTERRANEI?"

	para "Come hai fatto?"
	done

ScientistMarcSeenText:
	text "Ehi, un"
	line "intruso…"

	para "Ma chi sei?"
	done

ScientistMarcBeatenText:
	text "Ehi, ti ho preso"
	line "troppo sottogamba!"
	done

ScientistMarcAfterBattleText:
	text "Ahahaha…"

	para "Da qui trasmetto"
	line "con tutta la"
	cont "potenza che"
	cont "voglio!"
	done

RadioTower3FCardKeySlotText:
	text "È la serratura"
	line "dell'APRIPORTA."
	done

InsertedTheCardKeyText:
	text "<PLAYER> inserisce"
	line "l'APRIPORTA."
	done

RadioTower3FPersonnelSignText:
	text "2ºP PERSONALE"
	done

RadioTower3FPokemonMusicSignText:
	text "#MON MUSIC"
	line "Con il DJ TIMMI"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower3FPersonnelSign
	bg_event  9,  0, BGEVENT_READ, RadioTower3FPokemonMusicSign
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	db 7 ; object events
	object_event  7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower3FSuperNerdScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuyScript, -1
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  5,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM7, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  6,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  9,  6, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerScientistMarc, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
