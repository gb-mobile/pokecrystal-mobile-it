	object_const_def ; object_event constants
	const RADIOTOWER5F_DIRECTOR
	const RADIOTOWER5F_ROCKET
	const RADIOTOWER5F_ROCKET_GIRL
	const RADIOTOWER5F_ROCKER
	const RADIOTOWER5F_POKE_BALL

RadioTower5F_MapScripts:
	db 3 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_RADIOTOWER5F_ROCKET_BOSS
	scene_script .DummyScene2 ; SCENE_RADIOTOWER5F_NOTHING

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

FakeDirectorScript:
	turnobject RADIOTOWER5F_DIRECTOR, UP
	showemote EMOTE_SHOCK, RADIOTOWER5F_DIRECTOR, 15
	opentext
	writetext FakeDirectorTextBefore1
	waitbutton
	closetext
	applymovement RADIOTOWER5F_DIRECTOR, FakeDirectorMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	opentext
	writetext FakeDirectorTextBefore2
	waitbutton
	closetext
	winlosstext FakeDirectorWinText, 0
	setlasttalked RADIOTOWER5F_DIRECTOR
	loadtrainer EXECUTIVEM, EXECUTIVEM_3
	startbattle
	reloadmapafterbattle
	opentext
	writetext FakeDirectorTextAfter
	buttonsound
	verbosegiveitem BASEMENT_KEY
	closetext
	setscene SCENE_RADIOTOWER5F_ROCKET_BOSS
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_3
	end

Director:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .TrueDirector
	writetext FakeDirectorTextAfter
	waitbutton
	closetext
	end

.TrueDirector:
	writetext RadioTower5FDirectorText
	waitbutton
	closetext
	end

TrainerExecutivef1:
	trainer EXECUTIVEF, EXECUTIVEF_1, EVENT_BEAT_ROCKET_EXECUTIVEF_1, Executivef1SeenText, Executivef1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivef1AfterBattleText
	waitbutton
	closetext
	end

RadioTower5FRocketBossScene:
	applymovement PLAYER, RadioTower5FPlayerTwoStepsLeftMovement
	playmusic MUSIC_ROCKET_ENCOUNTER
	turnobject RADIOTOWER5F_ROCKET, RIGHT
	opentext
	writetext RadioTower5FRocketBossBeforeText
	waitbutton
	closetext
	winlosstext RadioTower5FRocketBossWinText, 0
	setlasttalked RADIOTOWER5F_ROCKET
	loadtrainer EXECUTIVEM, EXECUTIVEM_1
	startbattle
	reloadmapafterbattle
	opentext
	writetext RadioTower5FRocketBossAfterText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear RADIOTOWER5F_ROCKET
	disappear RADIOTOWER5F_ROCKET_GIRL
	pause 15
	special FadeInQuickly
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_ROCKET_SCOUT
	setevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	setevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_MAHOGANY_MART_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_GOLDENROD_CITY_CIVILIANS
	clearevent EVENT_RADIO_TOWER_CIVILIANS_AFTER
	setevent EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	clearevent EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	special PlayMapMusic
	disappear RADIOTOWER5F_DIRECTOR
	moveobject RADIOTOWER5F_DIRECTOR, 12, 0
	appear RADIOTOWER5F_DIRECTOR
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksIn
	turnobject PLAYER, RIGHT
	opentext
	writetext RadioTower5FDirectorThankYouText
	buttonsound
	verbosegiveitem CLEAR_BELL
	writetext RadioTower5FDirectorDescribeClearBellText
	waitbutton
	closetext
	setscene SCENE_RADIOTOWER5F_NOTHING
	setmapscene ECRUTEAK_TIN_TOWER_ENTRANCE, SCENE_DEFAULT
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_TEAM_ROCKET_DISBANDED
	sjump .UselessJump

.UselessJump:
	applymovement RADIOTOWER5F_DIRECTOR, RadioTower5FDirectorWalksOut
	playsound SFX_EXIT_BUILDING
	disappear RADIOTOWER5F_DIRECTOR
	end

Ben:
	jumptextfaceplayer BenText

RadioTower5FUltraBall:
	itemball ULTRA_BALL

RadioTower5FDirectorsOfficeSign:
	jumptext RadioTower5FDirectorsOfficeSignText

RadioTower5FStudio1Sign:
	jumptext RadioTower5FStudio1SignText

RadioTower5FBookshelf:
	jumpstd magazinebookshelf

FakeDirectorMovement:
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FDirectorWalksIn:
	step DOWN
	step DOWN
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step_end

RadioTower5FDirectorWalksOut:
	step RIGHT
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

RadioTower5FPlayerTwoStepsLeftMovement:
	step LEFT
	step LEFT
	step_end

FakeDirectorTextBefore1:
	text "Ehi tu! Sei qui"
	line "per salvarmi?"
	done

FakeDirectorTextBefore2:
	text "È questo che ti"
	line "aspettavi?"

	para "Sbagliato!"
	line "Sono un impostore!"

	para "Ho finto di essere"
	line "il vero DIRETTORE:"

	para "ciò fa parte del"
	line "piano per prendere"
	cont "il potere!"

	para "Vuoi sapere dove"
	line "teniamo nascosto"
	cont "il DIRETTORE vero?"

	para "Va bene, te lo"
	line "dirò. Ma prima"
	cont "dovrai battermi!"
	done

FakeDirectorWinText:
	text "Ok, ok. Ora ti"
	line "dico dov'è."
	done

FakeDirectorTextAfter:
	text "Abbiamo nascosto"
	line "il DIRETTORE nei"

	para "MAGAZZINI"
	line "SOTTERRANEI."

	para "Si trovano proprio"
	line "in fondo ai"
	cont "SOTTERRANEI."

	para "Ma non credo che"
	line "ci arriverai."
	done

Executivef1SeenText:
	text "Ricordi? Ci siamo"
	line "visti al rifugio"
	cont "di MOGANIA!"

	para "Ho perso allora,"
	line "ma non questa"
	cont "volta!"
	done

Executivef1BeatenText:
	text "Ma questo è"
	line "incredibile!"

	para "Ho riflettuto a"
	line "lungo eppure ho"
	cont "perso ancora…"
	done

Executivef1AfterBattleText:
	text "Sei <PLAYER>, vero?"

	para "I tipi come te non"
	line "apprezzano il"

	para "valore di TEAM"
	line "ROCKET!"

	para "Peccato, perché"
	line "ammiro la tua"
	cont "forza!"
	done

RadioTower5FRocketBossBeforeText:
	text "Come hai fatto ad"
	line "arrivare fin qui?"

	para "Devi essere"
	line "proprio forte."

	para "Vogliamo prendere"
	line "possesso di questa"

	para "STAZIONE RADIO per"
	line "annunciare il"
	cont "nostro ritorno."

	para "Così GIOVANNI, il"
	line "nostro capo,"

	para "tornerà dal suo"
	line "isolamento!"

	para "Riprenderemo"
	line "tutto il nostro"
	cont "potere!"

	para "E tu non potrai"
	line "intralciare i"
	cont "nostri piani."
	done

RadioTower5FRocketBossWinText:
	text "No! Perdonami"
	line "GIOVANNI!"
	done

RadioTower5FRocketBossAfterText:
	text "Com'è potuto"
	line "accadere?"

	para "Il nostro sogno"
	line "ora è un incubo!"

	para "Forse non ero"
	line "all'altezza."

	para "Come fece GIOVANNI"
	line "prima di me, da"

	para "oggi sciolgo"
	line "TEAM ROCKET."

	para "Addio."
	done

RadioTower5FDirectorThankYouText:
	text "DIRETTORE: Grazie,"
	line "<PLAY_G>!"

	para "Grazie al tuo"
	line "coraggio hai"

	para "salvato i #MON"
	line "di tutto il mondo."

	para "So che non è molto"
	line "ma voglio darti"
	cont "questo."
	done

RadioTower5FDirectorDescribeClearBellText:
	text "Un tempo c'era una"
	line "torre a"
	cont "FIORDOROPOLI."

	para "Ma era vecchia e"
	line "pericolante."

	para "Così, fu"
	line "sostituita con la"
	cont "TORRE RADIO."

	para "E durante la"
	line "costruzione"
	cont "trovammo questa"
	cont "campana."

	para "Dicono che in"
	line "passato vivessero"

	para "a FIORDOROPOLI"
	line "#MON di ogni"
	cont "sorta."

	para "Forse…"

	para "La campana ha a"
	line "che fare con la"

	para "TORRE DI LATTA ad"
	line "AMARANTOPOLI…"

	para "Anzi!"

	para "Ora ricordo…"

	para "Mi è capitato di"
	line "ascoltare TEAM"
	cont "ROCKET."

	para "Dicevano che alla"
	line "TORRE DI LATTA sta"
	cont "succedendo"
	cont "qualcosa."

	para "Non so cosa stia"
	line "succedendo, di"

	para "preciso: vai a"
	line "dare un'occhiata!"

	para "Ok, me ne torno"
	line "al mio UFFICIO."
	done

RadioTower5FDirectorText:
	text "DIRETTORE: Ciao,"
	line "<PLAY_G>!"

	para "Sai, io adoro i"
	line "#MON."

	para "Ho costruito la"
	line "TORRE RADIO per"

	para "esprimere il mio"
	line "affetto per loro."

	para "Sono felice che la"
	line "gente apprezzi i"
	cont "nostri programmi."
	done

BenText:
	text "TIMMI: Ascolti la"
	line "nostra musica?"
	done

RadioTower5FDirectorsOfficeSignText:
	text "4ºP UFFICIO del"
	line "    DIRETTORE"
	done

RadioTower5FStudio1SignText:
	text "4ºP STUDIO 1"
	done

RadioTower5F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  0,  0, RADIO_TOWER_4F, 1
	warp_event 12,  0, RADIO_TOWER_4F, 3

	db 2 ; coord events
	coord_event  0,  3, SCENE_DEFAULT, FakeDirectorScript
	coord_event 16,  5, SCENE_RADIOTOWER5F_ROCKET_BOSS, RadioTower5FRocketBossScene

	db 5 ; bg events
	bg_event  3,  0, BGEVENT_READ, RadioTower5FDirectorsOfficeSign
	bg_event 11,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 15,  0, BGEVENT_READ, RadioTower5FStudio1Sign
	bg_event 16,  1, BGEVENT_READ, RadioTower5FBookshelf
	bg_event 17,  1, BGEVENT_READ, RadioTower5FBookshelf

	db 5 ; object events
	object_event  3,  6, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Director, -1
	object_event 13,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 17,  2, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerExecutivef1, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 13,  5, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Ben, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  8,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RadioTower5FUltraBall, EVENT_RADIO_TOWER_5F_ULTRA_BALL
