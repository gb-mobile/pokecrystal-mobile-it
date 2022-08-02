	object_const_def ; object_event constants
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4

CianwoodGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK, RIGHT
	opentext
	writetext ChuckIntroText2
	waitbutton
	closetext
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	faceplayer
	opentext
	writetext ChuckIntroText3
	waitbutton
	closetext
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	readvar VAR_BADGES
	scall CianwoodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	buttonsound
	verbosegiveitem TM_DYNAMICPUNCH
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext ChuckAfterText
	waitbutton
.BagFull:
	closetext
	end

CianwoodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

CianwoodGymBoulder:
	jumpstd strengthboulder

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, CHUCK, CHUCK1
	jumpstd gymstatue2

CianwoodGymMovement_ChuckChucksBoulder:
	set_sliding
	big_step LEFT
	big_step UP
	fast_jump_step RIGHT
	remove_sliding
	step_end

ChuckIntroText1:
	text "AHAHAHAH!"

	para "Ce l'hai fatta"
	line "a trovarmi!"

	para "Guarda che sono"
	line "proprio forte!"

	para "I miei #MON"
	line "possono frantumare"
	cont "ossi e pietre!"

	para "Guarda qui!"
	done

ChuckIntroText2:
	text "FURIO: Urrrg!!!"
	line "…"

	para "Oooarrrg!"
	done

ChuckIntroText3:
	text "Ecco qui! T'ho"
	line "spaventato, eh?"

	para "Come?"
	line "Non ha nulla a che"

	para "fare con i "
	line "#MON? È vero!"

	para "Avanti, dobbiamo"
	line "lottare!"
	done

ChuckLossText:
	text "Eh? Come?!"
	line "Ho perso?"

	para "Hai meritato una"
	line "MEDAGLIA TEMPESTA!"
	done

GetStormBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA TEMPESTA."
	done

ChuckExplainBadgeText:
	text "La MEDAGLIA TEMPE-"
	line "STA fa obbedire i"

	para "#MON fino al"
	line "livello 70, anche"
	cont "quelli scambiati."

	para "Ti permette anche"
	line "di usare VOLO"

	para "quando non stai"
	line "lottando."

	para "Tieni, prendi"
	line "anche questo!"
	done

ChuckExplainTMText:
	text "È DINAMIPUGNO."

	para "Non va sempre a"
	line "segno, ma quando"

	para "colpisce può cau-"
	line "sare confusione!"
	done

ChuckAfterText:
	text "AHAHAH! È stata"
	line "una bella lotta!"

	para "Ma devo ammettere"
	line "che ho perso!"

	para "D'ora in poi mi"
	line "allenerò 24 ore"
	cont "al giorno."
	done

BlackbeltYoshiSeenText:
	text "Io e i miei #-"
	line "MON siamo amici."

	para "Il nostro legame è"
	line "indissolubile!"
	done

BlackbeltYoshiBeatenText:
	text "Non ci credo!"
	done

BlackbeltYoshiAfterText:
	text "Anche tu hai un"
	line "forte legame con i"
	cont "#MON, vedo!"
	done

BlackbeltLaoSeenText:
	text "Noi artisti della"
	line "lotta non temiamo"
	cont "nulla!"
	done

BlackbeltLaoBeatenText:
	text "È terribile!"
	done

BlackbeltLaoAfterText:
	text "I #MON lotta"
	line "temono attacchi"
	cont "di tipo psico…"
	done

BlackbeltNobSeenText:
	text "Le parole sono"
	line "inutili: fai"
	cont "parlare i pugni!"
	done

BlackbeltNobBeatenText:
	text "…"
	done

BlackbeltNobAfterText:
	text "Ho perso!"
	line "Sono senza parole!"
	done

BlackbeltLungSeenText:
	text "I miei pugni"
	line "rabbiosi faranno a"
	cont "pezzi i tuoi"
	cont "#MON!"
	done

BlackbeltLungBeatenText:
	text "Sei tu che hai"
	line "fatto a pezzi me!"
	done

BlackbeltLungAfterText:
	text "Con i miei #MON"
	line "hai fatto a pezzi"
	cont "il mio orgoglio…"
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, CIANWOOD_CITY, 2
	warp_event  5, 17, CIANWOOD_CITY, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event  6, 15, BGEVENT_READ, CianwoodGymStatue

	db 9 ; object events
	object_event  4,  1, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	object_event  2, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltYoshi, -1
	object_event  7, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltLao, -1
	object_event  3,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
	object_event  5,  1, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  3,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  5,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
