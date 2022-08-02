	object_const_def ; object_event constants
	const DRAGONSDENB1F_POKE_BALL1
	const DRAGONSDENB1F_CLAIR
	const DRAGONSDENB1F_SILVER
	const DRAGONSDENB1F_COOLTRAINER_M
	const DRAGONSDENB1F_COOLTRAINER_F
	const DRAGONSDENB1F_TWIN1
	const DRAGONSDENB1F_TWIN2
	const DRAGONSDENB1F_POKE_BALL2
	const DRAGONSDENB1F_POKE_BALL3

DragonsDenB1F_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DRAGONSDENB1F_NOTHING
	scene_script .DummyScene1 ; SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .CheckSilver

.DummyScene0:
	end

.DummyScene1:
	end

.CheckSilver:
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .CheckDay
	disappear DRAGONSDENB1F_SILVER
	return

.CheckDay:
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .AppearSilver
	ifequal THURSDAY, .AppearSilver
	disappear DRAGONSDENB1F_SILVER
	return

.AppearSilver:
	appear DRAGONSDENB1F_SILVER
	return

DragonsDenB1F_ClairScene:
	appear DRAGONSDENB1F_CLAIR
	opentext
	writetext ClairText_Wait
	pause 30
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	playmusic MUSIC_CLAIR
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksToYou
	opentext
	writetext ClairText_GiveDragonbreathDragonDen
	buttonsound
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext NotifyReceiveDragonbreath
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext ClairText_DescribeDragonbreathDragonDen
	buttonsound
	writetext ClairText_WhatsTheMatterDragonDen
	waitbutton
	closetext
	sjump .FinishClair

.BagFull:
	writetext ClairText_NoRoom
	waitbutton
	closetext
.FinishClair:
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksAway
	special FadeOutMusic
	pause 30
	special RestartMapMusic
	disappear DRAGONSDENB1F_CLAIR
	setscene SCENE_DRAGONSDENB1F_NOTHING
	end

TrainerCooltrainermDarin:
	trainer COOLTRAINERM, DARIN, EVENT_BEAT_COOLTRAINERM_DARIN, CooltrainermDarinSeenText, CooltrainermDarinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermDarinAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCara:
	trainer COOLTRAINERF, CARA, EVENT_BEAT_COOLTRAINERF_CARA, CooltrainerfCaraSeenText, CooltrainerfCaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCaraAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia1:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia1SeenText, TwinsLeaandpia1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia2:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia2SeenText, TwinsLeaandpia2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia2AfterBattleText
	waitbutton
	closetext
	end

DragonsDenB1FDragonFangScript:
; This whole script is written out rather than as an itemball
; because it's left over from the GS event.
	giveitem DRAGON_FANG
	iffalse .BagFull
	disappear DRAGONSDENB1F_POKE_BALL1
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

.BagFull:
	opentext
	getitemname STRING_BUFFER_3, DRAGON_FANG
	writetext Text_FoundDragonFang
	buttonsound
	writetext Text_NoRoomForDragonFang
	waitbutton
	closetext
	end

DragonsDenB1FSilverScript:
	playmusic MUSIC_RIVAL_ENCOUNTER
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .SilverTalkAgain
	writetext SilverText_Training1
	waitbutton
	closetext
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	special RestartMapMusic
	end

.SilverTalkAgain:
	writetext SilverText_Training2
	waitbutton
	closetext
	special RestartMapMusic
	end

DragonShrineSignpost:
	jumptext DragonShrineSignpostText

DragonsDenB1FCalcium:
	itemball CALCIUM

DragonsDenB1FMaxElixer:
	itemball MAX_ELIXER

DragonsDenB1FHiddenRevive:
	hiddenitem REVIVE, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE

DragonsDenB1FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION

DragonsDenB1FHiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER

MovementDragonsDen_ClairWalksToYou:
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementDragonsDen_ClairWalksAway:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	step_end

ClairText_Wait:
	text "Aspetta!"
	done

ClairText_GiveDragonbreathDragonDen:
	text "SANDRA: Mi spiace,"
	line "davvero."

	para "Prendi: con questo"
	line "dono spero di"
	cont "farmi perdonare!"
	done

NotifyReceiveDragonbreath:
	text "<PLAYER> riceve"
	line "MT24."
	done

ClairText_DescribeDragonbreathDragonDen:
	text "Contiene"
	line "DRAGOSPIRO."

	para "No, non ha nulla"
	line "a che fare col mio"
	cont "respiro."

	para "Se non la vuoi"
	line "puoi anche non"
	cont "prenderla."
	done

ClairText_NoRoom:
	text "Ehi, ma non hai"
	line "posto!"

	para "Ci vediamo alla"
	line "PALESTRA, quando"

	para "avrai fatto posto"
	line "per il mio dono."
	done

ClairText_WhatsTheMatterDragonDen:
	text "SANDRA: Che ti"
	line "succede? Perché"

	para "non vai alla"
	line "LEGA #MON?"

	para "Sai come"
	line "arrivarci?"

	para "Da qui vai a"
	line "BORGO FOGLIANOVA."

	para "Poi usa SURF per"
	line "andare ad est."
	cont "Sarà dura!"

	para "Vedi di non"
	line "perdere alla"
	cont "LEGA #MON!"

	para "Altrimenti sarà"
	line "ancora più umi-"
	cont "liante aver perso"
	cont "contro di te!"

	para "Metticela tutta,"
	line "mi raccomando!"
	done

DragonShrineSignpostText:
	text "SANTUARIO DRAGO."

	para "Un santuario in"
	line "onore del #MON"

	para "drago che pare"
	line "abitasse nella"
	cont "TANA DEL DRAGO."
	done

SilverText_Training1:
	text "…"
	line "Come? <PLAYER>?"

	para "… No, non ti"
	line "sfiderò adesso…"

	para "I miei #MON non"
	line "sono pronti."

	para "Non posso forzarli"
	line "troppo."

	para "Serve disciplina"
	line "per diventare il"

	para "miglior Allenatore"
	line "di #MON…"
	done

SilverText_Training2:
	text "…"

	para "Ehi…"

	para "Impara a starmi"
	line "alla larga…"
	done

CooltrainermDarinSeenText:
	text "Come osi entrare"
	line "senza invito!"
	done

CooltrainermDarinBeatenText:
	text "Che forte!"
	done

CooltrainermDarinAfterBattleText:
	text "Nel SANTUARIO qui"
	line "vicino abita il"

	para "MAESTRO del nostro"
	line "gruppo: noi siamo"

	para "tutti appassionati"
	line "del tipo drago."
	cont "Non è così facile"
	cont "entrare."
	done

CooltrainerfCaraSeenText:
	text "Tu non puoi"
	line "entrare!"
	done

CooltrainerfCaraBeatenText:
	text "Aaah, ho perso!"
	done

CooltrainerfCaraAfterBattleText:
	text "Presto il MAESTRO"
	line "mi permetterà di"

	para "usare il tipo"
	line "drago."

	para "Così diventerò un"
	line "grande esperto del"

	para "tipo drago e il"
	line "MAESTRO potrà"

	para "essere fiero di"
	line "me!"
	done

TwinsLeaandpia1SeenText:
	text "È una persona che"
	line "non conosciamo."
	done

TwinsLeaandpia1BeatenText:
	text "Ahi ahi ahi!"
	done

TwinsLeaandpia1AfterBattleText:
	text "Credevo di"
	line "lottare con LANCE!"
	done

TwinsLeaandpia2SeenText:
	text "Chi sei?!"
	done

TwinsLeaandpia2BeatenText:
	text "Che rabbia!!!"
	done

TwinsLeaandpia2AfterBattleText:
	text "Lo diremo al"
	line "MAESTRO!"

	para "Sarà furioso con"
	line "te, vedrai!"
	done

Text_FoundDragonFang:
	text "<PLAYER> trova"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Text_NoRoomForDragonFang:
	text "Ma <PLAYER> non"
	line "può trasportare"
	cont "altri strumenti."
	done

DragonsDenB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 20,  3, DRAGONS_DEN_1F, 3
	warp_event 19, 29, DRAGON_SHRINE, 1

	db 1 ; coord events
	coord_event 19, 30, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM, DragonsDenB1F_ClairScene

	db 4 ; bg events
	bg_event 18, 24, BGEVENT_READ, DragonShrineSignpost
	bg_event 33, 29, BGEVENT_ITEM, DragonsDenB1FHiddenRevive
	bg_event 21, 17, BGEVENT_ITEM, DragonsDenB1FHiddenMaxPotion
	bg_event 31, 15, BGEVENT_ITEM, DragonsDenB1FHiddenMaxElixer

	db 9 ; object events
	object_event 35, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FDragonFangScript, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	object_event 14, 30, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGONS_DEN_CLAIR
	object_event 20, 23, SPRITE_SILVER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FSilverScript, EVENT_RIVAL_DRAGONS_DEN
	object_event 20,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermDarin, -1
	object_event  8,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCara, -1
	object_event  4, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia1, -1
	object_event  4, 18, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia2, -1
	object_event 30,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FCalcium, EVENT_DRAGONS_DEN_B1F_CALCIUM
	object_event  5, 20, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FMaxElixer, EVENT_DRAGONS_DEN_B1F_MAX_ELIXER
