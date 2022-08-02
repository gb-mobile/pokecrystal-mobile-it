	object_const_def ; object_event constants
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_CAPTAIN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN3
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN4
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD1
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_M2
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_POKEFAN_F
	const FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_SUPER_NERD2

FastShipCabins_SE_SSE_CaptainsCabin_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

.UnreferencedDummyScene:
	end

SSAquaCaptain:
	faceplayer
	opentext
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue .LaterTrip
	writetext SSAquaCaptainExhaustingText
	waitbutton
	closetext
	end

.LaterTrip:
	writetext SSAquaCaptainHowDoYouLikeText
	waitbutton
	closetext
	end

SSAquaGranddaughterBefore:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, RIGHT
	opentext
	writetext SSAquaGranddaughterCaptainPlayWithMeText
	waitbutton
	closetext
	faceplayer
	opentext
	writetext SSAquaGranddaughterHasToFindGrandpaText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2
	applymovement PLAYER, MovementData_0x76004
	moveobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, 3, 19
	appear FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1
	turnobject PLAYER, UP
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, UP
	special FadeInQuickly
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, DOWN
	showemote EMOTE_SHOCK, FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, 15
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN1, MovementData_0x7600c
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, RIGHT
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .PlayerIsFemale
	opentext
	writetext SSAquaGranddaughterWasPlayingMText
	waitbutton
	closetext
	sjump .cont

.PlayerIsFemale:
	opentext
	writetext SSAquaGranddaughterWasPlayingFText
	waitbutton
	closetext
.cont:
	turnobject FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_TWIN2, DOWN
	applymovement FASTSHIPCABINS_SE_SSE_CAPTAINSCABIN_GENTLEMAN, MovementData_0x76010
	opentext
	writetext SSAquaEntertainedGranddaughterText
	buttonsound
	setevent EVENT_VERMILION_PORT_SAILOR_AT_GANGWAY
	setmapscene FAST_SHIP_1F, SCENE_DEFAULT
	sjump SSAquaMetalCoatAndDocking

SSAquaGrandpa:
	faceplayer
	opentext
	checkevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
	iftrue SSAquaGotMetalCoat
	checkevent EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	iftrue SSAquaFoundGranddaughter
	writetext SSAquaCantFindGranddaughterText
	waitbutton
	closetext
	setmapscene FAST_SHIP_1F, SCENE_DEFAULT
	end

SSAquaMetalCoatAndDocking:
	writetext SSAquaGrandpaHaveThisText
	buttonsound
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	waitsfx
	playsound SFX_ELEVATOR_END
	pause 30
	opentext
	writetext SSAquaHasArrivedVermilionText
	waitbutton
	setevent EVENT_FAST_SHIP_HAS_ARRIVED
	setevent EVENT_FAST_SHIP_FOUND_GIRL
	closetext
	end

SSAquaFoundGranddaughter:
	writetext SSAquaGrandpaHaveThisText
	buttonsound
	verbosegiveitem METAL_COAT
	iffalse .NoRoom
	setevent EVENT_GOT_METAL_COAT_FROM_GRANDPA_ON_SS_AQUA
.NoRoom:
	closetext
	end

SSAquaGotMetalCoat:
	writetext SSAquaGrandpaTravellingText
	waitbutton
	closetext
	end

SSAquaGranddaughterAfter:
	faceplayer
	opentext
	writetext SSAquaGranddaughterHadFunText
	waitbutton
	closetext
	end

TrainerPokefanmColin:
	trainer POKEFANM, COLIN, EVENT_BEAT_POKEFANM_COLIN, PokefanmColinSeenText, PokefanmColinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmColinAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg1:
	trainer TWINS, MEGANDPEG1, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg1SeenText, TwinsMegandpeg1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsMegandpeg2:
	trainer TWINS, MEGANDPEG2, EVENT_BEAT_TWINS_MEG_AND_PEG, TwinsMegandpeg2SeenText, TwinsMegandpeg2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsMegandpeg2AfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicRodney:
	trainer PSYCHIC_T, RODNEY, EVENT_BEAT_PSYCHIC_RODNEY, PsychicRodneySeenText, PsychicRodneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicRodneyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmJeremy:
	trainer POKEFANM, JEREMY, EVENT_BEAT_POKEFANM_JEREMY, PokefanmJeremySeenText, PokefanmJeremyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmJeremyAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfGeorgia:
	trainer POKEFANF, GEORGIA, EVENT_BEAT_POKEFANF_GEORGIA, PokefanfGeorgiaSeenText, PokefanfGeorgiaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanfGeorgiaAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdShawn:
	trainer SUPER_NERD, SHAWN, EVENT_BEAT_SUPER_NERD_SHAWN, SupernerdShawnSeenText, SupernerdShawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdShawnAfterBattleText
	waitbutton
	closetext
	end

FastShipCaptainsCabinTrashcan:
	jumpstd trashcan

MovementData_0x76004:
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_0x7600c:
	step UP
	step UP
	turn_head LEFT
	step_end

MovementData_0x76010:
	step DOWN
	step_end

SSAquaCaptainExhaustingText:
	text "Grazie al cielo"
	line "sei qui!"

	para "Far divertire"
	line "quella bambina è"
	cont "stato estenuante!"
	done

SSAquaCaptainHowDoYouLikeText:
	text "Visto come corre"
	line "la M/N ACQUA?"

	para "Praticamente"
	line "scivola sulle"
	cont "onde."
	done

SSAquaCantFindGranddaughterText:
	text "…Ciao!"

	para "Continuo a non"
	line "trovare mia"
	cont "nipote."

	para "Se è sulla nave,"
	line "non mi preoccupo."

	para "Ma è una bambina"
	line "vivace, non vorrei"

	para "che stesse"
	line "disturbando"
	cont "qualcuno…"
	done

SSAquaEntertainedGranddaughterText:
	text "Sei <PLAY_G>?"
	line "Hai avuto molta"
	cont "pazienza con"
	cont "mia nipote."

	para "Devo"
	line "ringraziarti."
	done

SSAquaGrandpaHaveThisText:
	text "Ecco, prendi"
	line "questo!"
	done

SSAquaGrandpaTravellingText:
	text "Viaggiamo in tutto"
	line "il mondo."
	done

SSAquaGranddaughterCaptainPlayWithMeText:
	text "CAPITANO, vuoi"
	line "giocare con me?"

	para "Che noia! Nessuno"
	line "vuol giocare!"
	done

SSAquaGranddaughterHasToFindGrandpaText:
	text "Ciao, vuoi giocare"
	line "con me?"

	para "…Cosa?"

	para "Mio nonno è"
	line "preoccupato?"

	para "Corro da lui!"

	para "Devo trovare"
	line "il nonno!"
	done

SSAquaGranddaughterWasPlayingMText:
	text "Nonno, sono qui!"
	line "Stavo giocando con"

	para "il CAPITANO e"
	line "questo ragazzo."
	done

SSAquaGranddaughterWasPlayingFText:
	text "Nonno, sono qui!"
	line "Stavo giocando con"

	para "il CAPITANO e"
	line "questa ragazza."
	done

SSAquaGranddaughterHadFunText:
	text "Ci siamo proprio"
	line "divertiti!"
	done

PokefanmColinSeenText:
	text "Ehi, vuoi lottare"
	line "con me?"
	done

PokefanmColinBeatenText:
	text "Ma sei forte!"
	done

PokefanmColinAfterBattleText:
	text "Viaggi in"
	line "solitudine?"

	para "E la tua mamma non"
	line "si preoccupa?"
	done

TwinsMegandpeg1SeenText:
	text "Mi consideri una"
	line "bimba?"
	cont "Non è giusto!"
	done

TwinsMegandpeg1BeatenText:
	text "No, abbiamo perso!"
	done

TwinsMegandpeg1AfterBattleText:
	text "Chiamare bimba una"
	line "ragazza è proprio"
	cont "offensivo!"
	done

TwinsMegandpeg2SeenText:
	text "Bimba non è un bel"
	line "nome per una"
	cont "signora!"
	done

TwinsMegandpeg2BeatenText:
	text "No, abbiamo perso!"
	done

TwinsMegandpeg2AfterBattleText:
	text "A volte i bambini"
	line "hanno più cervello"
	cont "degli adulti!"
	done

PsychicRodneySeenText:
	text "Silenzio, il mio"
	line "cervello capta dei"
	cont "segnali radio!"
	done

PsychicRodneyBeatenText:
	text "… Sento"
	line "qualcosa!"
	done

PsychicRodneyAfterBattleText:
	text "Sì sì, dalla NAVE"
	line "VELOCE si sente"
	cont "la radio di JOHTO."
	done

PokefanmJeremySeenText:
	text "Tu che dici? Belli"
	line "i miei #MON,"
	cont "vero?"
	done

PokefanmJeremyBeatenText:
	text "Oh, no! I miei bei"
	line "#MON!"
	done

PokefanmJeremyAfterBattleText:
	text "Devo andare al"
	line "SALONE #MON per"
	cont "farli rimettere"
	cont "in ordine!"
	done

PokefanfGeorgiaSeenText:
	text "Prima vado al"
	line "CENTRO COMMERCIALE"
	cont "e poi…"
	done

PokefanfGeorgiaBeatenText:
	text "Cosa volevo fare?"
	done

PokefanfGeorgiaAfterBattleText:
	text "Ah, devo ritirare"
	line "i miei #MON"
	cont "dalla PENSIONE."
	done

SupernerdShawnSeenText:
	text "Che tipi di BALL"
	line "hai con te?"
	done

SupernerdShawnBeatenText:
	text "No! Aspetta!"
	line "Ti prego!"
	done

SupernerdShawnAfterBattleText:
	text "Devi avere le BALL"
	line "giuste per ogni"
	cont "situazione."
	done

SSAquaHasArrivedVermilionText:
	text "La NAVE VELOCE M/N"
	line "ACQUA è approdata"
	cont "ad ARANCIOPOLI."
	done

FastShipCabins_SE_SSE_CaptainsCabin_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  2,  7, FAST_SHIP_1F, 8
	warp_event  3,  7, FAST_SHIP_1F, 8
	warp_event  2, 19, FAST_SHIP_1F, 9
	warp_event  3, 19, FAST_SHIP_1F, 9
	warp_event  2, 33, FAST_SHIP_1F, 10
	warp_event  3, 33, FAST_SHIP_1F, 10

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4, 25, BGEVENT_READ, FastShipCaptainsCabinTrashcan

	db 11 ; object events
	object_event  3, 25, SPRITE_CAPTAIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaCaptain, -1
	object_event  2, 17, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SSAquaGrandpa, EVENT_FAST_SHIP_CABINS_SE_SSE_GENTLEMAN
	object_event  3, 17, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterAfter, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_1
	object_event  2, 25, SPRITE_TWIN, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SSAquaGranddaughterBefore, EVENT_FAST_SHIP_CABINS_SE_SSE_CAPTAINS_CABIN_TWIN_2
	object_event  5,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerPokefanmColin, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  2,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg1, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  3,  4, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsMegandpeg2, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	object_event  5,  5, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerPsychicRodney, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmJeremy, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  5,  5, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerPokefanfGeorgia, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	object_event  1, 15, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerSupernerdShawn, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
