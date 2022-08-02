	object_const_def ; object_event constants
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUY

VermilionGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	waitbutton
	closetext
	winlosstext LtSurgeWinLossText, 0
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext LtSurgeThunderBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext LtSurgeFightDoneText
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer GUITARIST, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer JUGGLER, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuyWinScript
	writetext VermilionGymGuyText
	waitbutton
	closetext
	end

.VermilionGymGuyWinScript:
	writetext VermilionGymGuyWinText
	waitbutton
	closetext
	end

VermilionGymTrashCan:
	jumptext VermilionGymTrashCanText

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, LT_SURGE, LT_SURGE1
	jumpstd gymstatue2

LtSurgeIntroText:
	text "SURGE: Ehi, tu,"
	line "pulce!"

	para "Credo di doverti"
	line "dare una lezione."

	para "Sfidarmi non è"
	line "molto saggio, ma"
	cont "hai fegato!"

	para "Con i #MON di"
	line "tipo elettro non"
	cont "ho rivali!"

	para "Non ho mai perso"
	line "una guerra!"

	para "Ti farò fare la"
	line "stessa fine dei"
	cont "miei nemici!"
	done

LtSurgeWinLossText:
	text "SURGE: Arrrg!"
	line "Allora sei forte!"

	para "E va bene! Eccoti"
	line "la MEDAGLIA TUONO."
	done

ReceivedThunderBadgeText:
	text "<PLAYER> riceve la"
	line "MEDAGLIA TUONO."
	done

LtSurgeThunderBadgeText:
	text "SURGE: La MEDAGLIA"
	line "TUONO aumenta la"
	cont "velocità dei"
	cont "#MON."

	para "È la prova che"
	line "mi hai battuto!"

	para "È un grande onore"
	line "per te, sai?"
	done

LtSurgeFightDoneText:
	text "SURGE: Ehi, tu!"
	line "Sei ancora lì a"
	cont "perdere tempo?"

	para "Io e i miei #-"
	line "MON siamo sempre"
	cont "pronti a lottare!"
	done

GentlemanGregorySeenText:
	text "Sei qui per"
	line "sfidare LT.SURGE?"

	para "Prima dovrai"
	line "vedertela con me!"
	done

GentlemanGregoryBeatenText:
	text "Missione fallita,"
	line "LT.SURGE, mi"
	cont "dispiace!"
	done

GentlemanGregoryAfterBattleText:
	text "Quando ero nell'"
	line "esercito, LT.SURGE"
	cont "mi salvò la vita!"
	done

GuitaristVincentSeenText:
	text "Anche LT.SURGE"
	line "riconosce che ci"

	para "so fare con i"
	line "#MON elettro."

	para "Pensi di potermi"
	line "battere?"
	done

GuitaristVincentBeatenText:
	text "Mi hai fulminato!"
	done

GuitaristVincentAfterBattleText:
	text "Se le trappole"
	line "della PALESTRA"

	para "funzionassero, non"
	line "avresti fatto"
	cont "molta strada…"
	done

JugglerHortonSeenText:
	text "Ti distruggerò!"
	line "Preparati ad una"
	cont "bella scossa!"
	done

JugglerHortonBeatenText:
	text "Ehi! Sono andato"
	line "in corto circuito…"
	done

JugglerHortonAfterBattleText:
	text "Non gasarti troppo"
	line "per aver battuto"

	para "me: LT.SURGE è"
	line "un'altra storia."
	done

VermilionGymGuyText:
	text "Ehi, CAMPIONE"
	line "in erba!"

	para "Per questa volta"
	line "hai avuto fortuna."

	para "LT.SURGE è molto"
	line "cauto. Ha messo"

	para "trappole in tutta"
	line "la PALESTRA."

	para "Ma purtroppo,"
	line "in questo momento"
	cont "non sono attivate."

	para "Non avrai problemi"
	line "a trovare"
	cont "LT.SURGE."
	done

VermilionGymGuyWinText:
	text "È stato un"
	line "incontro"
	cont "elettrizzante!"

	para "Mi hai reso"
	line "parecchio nervoso."
	done

VermilionGymTrashCanText:
	text "Ehi, qui c'è solo"
	line "spazzatura."
	done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	db 0 ; coord events

	db 17 ; bg events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	db 5 ; object events
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  0, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  7, 15, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuyScript, -1
