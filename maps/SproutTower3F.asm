	object_const_def ; object_event constants
	const SPROUTTOWER3F_SAGE1
	const SPROUTTOWER3F_SAGE2
	const SPROUTTOWER3F_SAGE3
	const SPROUTTOWER3F_SAGE4
	const SPROUTTOWER3F_POKE_BALL1
	const SPROUTTOWER3F_POKE_BALL2
	const SPROUTTOWER3F_SILVER

SproutTower3F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

SproutTower3FRivalScene:
	turnobject PLAYER, UP
	showemote EMOTE_SHOCK, PLAYER, 15
	special FadeOutMusic
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	pause 15
	playsound SFX_TACKLE
	playsound SFX_ELEVATOR
	earthquake 79
	applymovement PLAYER, MovementData_0x184a1d
	applymovement SPROUTTOWER3F_SILVER, MovementData_0x184a22
	opentext
	writetext SproutTowerElderLecturesRivalText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, SPROUTTOWER3F_SILVER, 15
	turnobject SPROUTTOWER3F_SILVER, DOWN
	pause 15
	applymovement SPROUTTOWER3F_SILVER, MovementData_0x184a24
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext SproutTowerRivalOnlyCareAboutStrongText
	waitbutton
	closetext
	turnobject SPROUTTOWER3F_SILVER, UP
	opentext
	writetext SproutTowerRivalUsedEscapeRopeText
	pause 15
	closetext
	playsound SFX_WARP_TO
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SPROUTTOWER3F_SILVER
	waitsfx
	special FadeInQuickly
	setscene SCENE_FINISHED
	special RestartMapMusic
	end

SageLiScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM05_FLASH
	iftrue .GotFlash
	writetext SageLiSeenText
	waitbutton
	closetext
	winlosstext SageLiBeatenText, 0
	loadtrainer SAGE, LI
	startbattle
	reloadmapafterbattle
	opentext
	writetext SageLiTakeThisFlashText
	buttonsound
	verbosegiveitem HM_FLASH
	setevent EVENT_GOT_HM05_FLASH
	setevent EVENT_BEAT_SAGE_LI
	writetext SageLiFlashExplanationText
	waitbutton
	closetext
	end

.GotFlash:
	writetext SageLiAfterBattleText
	waitbutton
	closetext
	end

TrainerSageJin:
	trainer SAGE, JIN, EVENT_BEAT_SAGE_JIN, SageJinSeenText, SageJinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageJinAfterBattleText
	waitbutton
	closetext
	end

TrainerSageTroy:
	trainer SAGE, TROY, EVENT_BEAT_SAGE_TROY, SageTroySeenText, SageTroyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageTroyAfterBattleText
	waitbutton
	closetext
	end

TrainerSageNeal:
	trainer SAGE, NEAL, EVENT_BEAT_SAGE_NEAL, SageNealSeenText, SageNealBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SageNealAfterBattleText
	waitbutton
	closetext
	end

SproutTower3FPainting:
	jumptext SproutTower3FPaintingText

SproutTower3FStatue:
	jumptext SproutTower3FStatueText

SproutTower3FPotion:
	itemball POTION

SproutTower3FEscapeRope:
	itemball ESCAPE_ROPE

MovementData_0x184a1d:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x184a22:
	step UP
	step_end

MovementData_0x184a24:
	step RIGHT
	step DOWN
	step_end

SproutTowerElderLecturesRivalText:
	text "ANZIANO: Hai"
	line "classe."

	para "Come promesso,"
	line "eccoti una MN."

	para "Però, lasciamelo"
	line "dire: dovresti"

	para "trattare meglio i"
	line "tuoi #MON."

	para "La tua tecnica di"
	line "lotta è troppo"
	cont "rude."

	para "I #MON non sono"
	line "strumenti"
	cont "di guerra…"
	done

SproutTowerRivalOnlyCareAboutStrongText:
	text "…"
	line "… Aaah!"

	para "Dice di essere"
	line "l'ANZIANO ma è"
	cont "un mollaccione."

	para "È logico, non"
	line "credi?"

	para "Non perderò mai"
	line "contro chi fa"

	para "tante prediche"
	line "sulla bontà"
	cont "verso i #MON."

	para "A me interessano"
	line "solo i #MON"
	cont "forti e vincenti."

	para "I #MON deboli"
	line "mi lasciano"
	cont "indifferente."
	done

SproutTowerRivalUsedEscapeRopeText:
	text "<RIVAL> usa"
	line "FUNE DI FUGA."
	done

SageLiSeenText:
	text "Sono felice che tu"
	line "sia qui."

	para "La TORRE SPROUT è"
	line "un luogo per"
	cont "allenarsi."

	para "Le persone e i"
	line "#MON mettono"

	para "alla prova il"
	line "proprio legame,"
	cont "costruendo"
	cont "un radioso futuro."

	para "Io sono la prova"
	line "finale."

	para "Fammi vedere"
	line "quanto è forte il"

	para "legame tra i"
	line "#MON e te!"
	done

SageLiBeatenText:
	text "Eccellente!"
	done

SageLiTakeThisFlashText:
	text "Tu e i tuoi #-"
	line "MON non avrete"

	para "problemi ad usare"
	line "questa mossa."

	para "Prendi questa MN,"
	line "è FLASH."
	done

SageLiFlashExplanationText:
	text "FLASH illumina"
	line "anche i luoghi"
	cont "più oscuri."

	para "Ma per usarlo"
	line "fuori dalla lotta,"

	para "ti serve la"
	line "MEDAGLIA della"
	cont "PALESTRA di"
	cont "VIOLAPOLI."
	done

SageLiAfterBattleText:
	text "Spero che questo"
	line "viaggio ti farà"
	cont "crescere."
	done

SageJinSeenText:
	text "Mi alleno per tro-"
	line "vare nei #MON"
	cont "l'illuminazione!"
	done

SageJinBeatenText:
	text "Il mio allenamento"
	line "non è completo…"
	done

SageJinAfterBattleText:
	text "L'allenatore si"
	line "rafforza con i"
	cont "suoi #MON."

	para "Anzi, sono i"
	line "#MON che si"

	para "rafforzano con"
	line "l'allenatore."
	done

SageTroySeenText:
	text "Fammi vedere"
	line "la fiducia che hai"
	cont "nei tuoi #MON."
	done

SageTroyBeatenText:
	text "Sì, devo dire che"
	line "hai davvero"
	cont "fiducia in loro."
	done

SageTroyAfterBattleText:
	text "L'ANZIANO non è"
	line "distante."
	done

SageNealSeenText:
	text "La luce della MN"
	line "dell'ANZIANO"
	cont "illumina anche il"
	cont "buio più fitto."
	done

SageNealBeatenText:
	text "La luce è dentro"
	line "di me!"
	done

SageNealAfterBattleText:
	text "Che ci sia luce"
	line "sul tuo cammino!"
	done

SproutTower3FPaintingText:
	text "È un imponente"
	line "ritratto di"
	cont "BELLSPROUT."
	done

SproutTower3FStatueText:
	text "La statua di un"
	line "#MON…"

	para "Ha un aspetto"
	line "solenne."
	done

SproutTower3F_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 10, 14, SPROUT_TOWER_2F, 4

	db 1 ; coord events
	coord_event 11,  9, SCENE_DEFAULT, SproutTower3FRivalScene

	db 6 ; bg events
	bg_event  8,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event 11,  1, BGEVENT_READ, SproutTower3FStatue
	bg_event  9,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event 10,  0, BGEVENT_READ, SproutTower3FPainting
	bg_event  5, 15, BGEVENT_READ, SproutTower3FStatue
	bg_event 14, 15, BGEVENT_READ, SproutTower3FStatue

	db 7 ; object events
	object_event  8, 13, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageJin, -1
	object_event  8,  8, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSageTroy, -1
	object_event 10,  2, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SageLiScript, -1
	object_event 11, 11, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSageNeal, -1
	object_event  6, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FPotion, EVENT_SPROUT_TOWER_3F_POTION
	object_event 14,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SproutTower3FEscapeRope, EVENT_SPROUT_TOWER_3F_ESCAPE_ROPE
	object_event 10,  4, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_RIVAL_SPROUT_TOWER
