	object_const_def ; object_event constants
	const SLOWPOKEWELLB1F_ROCKET1
	const SLOWPOKEWELLB1F_ROCKET2
	const SLOWPOKEWELLB1F_ROCKET3
	const SLOWPOKEWELLB1F_ROCKET_GIRL
	const SLOWPOKEWELLB1F_SLOWPOKE1
	const SLOWPOKEWELLB1F_SLOWPOKE2
	const SLOWPOKEWELLB1F_KURT
	const SLOWPOKEWELLB1F_BOULDER
	const SLOWPOKEWELLB1F_POKE_BALL

SlowpokeWellB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

SlowpokeWellB1FKurtScript:
	jumptextfaceplayer SlowpokeWellB1FKurtText

TrainerGruntM29:
	trainer GRUNTM, GRUNTM_29, EVENT_BEAT_ROCKET_GRUNTM_29, GruntM29SeenText, GruntM29BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM29AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM1:
	trainer GRUNTM, GRUNTM_1, EVENT_BEAT_ROCKET_GRUNTM_1, GruntM1SeenText, GruntM1BeatenText, 0, .Script

.Script:
	opentext
	writetext TrainerGruntM1WhenTalkText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SLOWPOKEWELLB1F_ROCKET1
	disappear SLOWPOKEWELLB1F_ROCKET2
	disappear SLOWPOKEWELLB1F_ROCKET3
	disappear SLOWPOKEWELLB1F_ROCKET_GIRL
	pause 15
	special FadeInQuickly
	disappear SLOWPOKEWELLB1F_KURT
	moveobject SLOWPOKEWELLB1F_KURT, 11, 6
	appear SLOWPOKEWELLB1F_KURT
	applymovement SLOWPOKEWELLB1F_KURT, KurtSlowpokeWellVictoryMovementData
	turnobject PLAYER, RIGHT
	opentext
	writetext KurtLeaveSlowpokeWellText
	waitbutton
	closetext
	setevent EVENT_CLEARED_SLOWPOKE_WELL
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_SILVER
	setmapscene AZALEA_TOWN, SCENE_AZALEATOWN_RIVAL_BATTLE
	clearevent EVENT_ILEX_FOREST_APPRENTICE
	clearevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_CHARCOAL_KILN_FARFETCH_D
	setevent EVENT_CHARCOAL_KILN_APPRENTICE
	setevent EVENT_SLOWPOKE_WELL_SLOWPOKES
	setevent EVENT_SLOWPOKE_WELL_KURT
	clearevent EVENT_AZALEA_TOWN_SLOWPOKES
	clearevent EVENT_KURTS_HOUSE_SLOWPOKE
	clearevent EVENT_KURTS_HOUSE_KURT_1
	special FadeOutPalettes
	special HealParty
	pause 15
	warp KURTS_HOUSE, 3, 3
	end

TrainerGruntM2:
	trainer GRUNTM, GRUNTM_2, EVENT_BEAT_ROCKET_GRUNTM_2, GruntM2SeenText, GruntM2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF1:
	trainer GRUNTF, GRUNTF_1, EVENT_BEAT_ROCKET_GRUNTF_1, GruntF1SeenText, GruntF1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF1AfterBattleText
	waitbutton
	closetext
	end

SlowpokeWellB1FSlowpokeWithMailScript:
	faceplayer
	opentext
	cry SLOWPOKE
	writetext SlowpokeWellB1FSlowpokeWithMailText
	yesorno
	iftrue .ReadMail
	closetext
	end

.ReadMail:
	writetext SlowpokeWellB1FSlowpokeMailText
	waitbutton
	closetext
	end

SlowpokeWellB1FTaillessSlowpokeScript:
	faceplayer
	opentext
	writetext SlowpokeWellB1FTaillessSlowpokeText
	cry SLOWPOKE
	waitbutton
	closetext
	end

SlowpokeWellB1FBoulder:
	jumpstd strengthboulder

SlowpokeWellB1FSuperPotion:
	itemball SUPER_POTION

KurtSlowpokeWellVictoryMovementData:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	step LEFT
	step UP
	step UP
	step_sleep 8
	step_sleep 8
	step_sleep 8
	turn_head LEFT
	step_end

SlowpokeWellB1FKurtText:
	text "FRANZ: Ehi tu,"
	line "<PLAYER>!"

	para "La guardia lassù"
	line "se l'è filata"
	cont "quando ho iniziato"
	cont "a gridare."

	para "Ma poi sono volato"
	line "in questo POZZO."

	para "Sono atterrato con"
	line "la schiena e non"
	cont "riesco più a"
	cont "muovermi!"

	para "Razza di cani! Se"
	line "fossi in forma, i"

	para "miei #MON li"
	line "farebbero a"
	cont "fettine…"

	para "No, non posso"
	line "farcela."

	para "<PLAYER>, lotta"
	line "per me e fagliela"
	cont "vedere!"
	done

KurtLeaveSlowpokeWellText:
	text "FRANZ: Ce l'hai"
	line "fatta, <PLAYER>!"

	para "Hai messo in fuga"
	line "TEAM ROCKET."

	para "E la mia schiena"
	line "va un po' meglio."
	done

GruntM29SeenText:
	text "Acc! Stavo facendo"
	line "la guardia lassù"

	para "quando ho sentito"
	line "gridare."

	para "Per lo spavento"
	line "sono finito qui!"

	para "Penso che sfogherò"
	line "la mia ira su di"
	cont "te!"
	done

GruntM29BeatenText:
	text "Arrgh! Non è la"
	line "mia giornata!"
	done

GruntM29AfterBattleText:
	text "Certo, abbiamo"
	line "tagliato la CODA"

	para "agli SLOWPOKE per"
	line "vendercela."

	para "Facciamo tutto per"
	line "profitto."

	para "È logico!"
	line "Noi siamo TEAM"

	para "ROCKET e facciamo"
	line "tutto per soldi!"
	done

GruntM1SeenText:
	text "Che vuoi?"

	para "Se interrompi il"
	line "nostro lavoro,"
	cont "possiamo essere"
	cont "spietati!"
	done

GruntM1BeatenText:
	text "Oggi t'è andata"
	line "bene, ma la"
	cont "prossima volta"
	cont "vedrai!"
	done

TrainerGruntM1WhenTalkText:
	text "Sì, TEAM ROCKET"
	line "è stato sciolto"
	cont "tre anni fa."

	para "Ma abbiamo"
	line "continuato le"
	cont "nostre attività"
	cont "di nascosto."

	para "Ora potrai diver-"
	line "tirti vedendoci"
	cont "seminare il"
	cont "terrore!"
	done

GruntM2SeenText:
	text "Smettere di"
	line "tagliare le CODE"
	cont "agli SLOWPOKE?"

	para "Se ti obbedissimo,"
	line "la reputazione di "
	cont "TEAM ROCKET"
	cont "sarebbe distrutta."
	done

GruntM2BeatenText:
	text "Sei…"
	line "troppo forte…"
	done

GruntM2AfterBattleText:
	text "I soldi sono"
	line "necessari, ma"
	cont "perché vendere"
	cont "CODESLOWPOKE?"

	para "È dura essere una"
	line "RECLUTA ROCKET!"
	done

GruntF1SeenText:
	text "Smettere di"
	line "tagliare le CODE?"

	para "Prima ci dovrai"
	line "sconfiggere tutti!"
	done

GruntF1BeatenText:
	text "Pulce schifosa!"
	done

GruntF1AfterBattleText:
	text "Le CODESLOWPOKE"
	line "crescono in"
	cont "fretta."

	para "Perché non le"
	line "dovremmo vendere?"
	done

SlowpokeWellB1FSlowpokeWithMailText:
	text "Uno SLOWPOKE con"
	line "la CODA"
	cont "tagliata…"

	para "Ha un MESSAGGIO."
	line "Vuoi leggerlo?"
	done

SlowpokeWellB1FSlowpokeMailText:
	text "<PLAYER> legge"
	line "il MESSAGGIO."

	para "Comportati bene e"
	line "bada alla casa con"

	para "il nonno e"
	line "SLOWPOKE."

	para "Con affetto, PAPI"
	done

SlowpokeWellB1FTaillessSlowpokeText:
	text "Uno SLOWPOKE con"
	line "la CODA"
	cont "tagliata…"
	done

SlowpokeWellB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 15, AZALEA_TOWN, 6
	warp_event  7, 11, SLOWPOKE_WELL_B2F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 9 ; object events
	object_event 15,  7, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM29, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  2, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM2, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event 10,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerGruntF1, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  7,  4, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FSlowpokeWithMailScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event  6,  2, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FTaillessSlowpokeScript, EVENT_SLOWPOKE_WELL_SLOWPOKES
	object_event 16, 14, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FKurtScript, EVENT_SLOWPOKE_WELL_KURT
	object_event  3,  2, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeWellB1FBoulder, -1
	object_event 10,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, SlowpokeWellB1FSuperPotion, EVENT_SLOWPOKE_WELL_B1F_SUPER_POTION
