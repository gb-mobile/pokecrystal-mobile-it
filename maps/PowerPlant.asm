	object_const_def ; object_event constants
	const POWERPLANT_OFFICER1
	const POWERPLANT_GYM_GUY1
	const POWERPLANT_GYM_GUY2
	const POWERPLANT_OFFICER2
	const POWERPLANT_GYM_GUY3
	const POWERPLANT_MANAGER
	const POWERPLANT_FOREST

PowerPlant_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_POWERPLANT_NOTHING
	scene_script .DummyScene1 ; SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

PowerPlantGuardPhoneScript:
	playsound SFX_CALL
	showemote EMOTE_SHOCK, POWERPLANT_OFFICER1, 15
	waitsfx
	pause 30
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ApproachGymGuy2Movement
	turnobject POWERPLANT_GYM_GUY1, DOWN
	turnobject POWERPLANT_GYM_GUY2, DOWN
	opentext
	writetext PowerPlantOfficer1CeruleanShadyCharacterText
	waitbutton
	closetext
	turnobject POWERPLANT_OFFICER1, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement POWERPLANT_OFFICER1, PowerPlantOfficer1ReturnToPostMovement
	setscene SCENE_POWERPLANT_NOTHING
	end

PowerPlantOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantOfficer1AThiefBrokeInText
	waitbutton
	closetext
	end

.MetManager:
	writetext PowerPlantOfficer1CouldIAskForYourCooperationText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer1HaveToBeefUpSecurityText
	waitbutton
	closetext
	end

PowerPlantGymGuy1Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuy1SomeoneStoleAPartText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuy1GeneratorUpAndRunningText
	waitbutton
	closetext
	end

PowerPlantGymGuy2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuy2PowerPlantUpAndRunningText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuy2GeneratorIsRunningAgainText
	waitbutton
	closetext
	end

PowerPlantOfficer2Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantOfficer2ManagerHasBeenSadAndFuriousText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantOfficer2ManagerHasBeenCheerfulText
	waitbutton
	closetext
	end

PowerPlantGymGuy4Script:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	writetext PowerPlantGymGuy4MagnetTrainConsumesElectricityText
	waitbutton
	closetext
	end

.ReturnedMachinePart:
	writetext PowerPlantGymGuy4WeCanGetMagnetTrainRunningText
	waitbutton
	closetext
	end

PowerPlantManager:
	faceplayer
	opentext
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue .ReturnedMachinePart
	checkitem MACHINE_PART
	iftrue .FoundMachinePart
	checkevent EVENT_MET_MANAGER_AT_POWER_PLANT
	iftrue .MetManager
	writetext PowerPlantManagerWhoWouldRuinMyGeneratorText
	waitbutton
	closetext
	setevent EVENT_MET_MANAGER_AT_POWER_PLANT
	clearevent EVENT_CERULEAN_GYM_ROCKET
	clearevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setmapscene CERULEAN_GYM, SCENE_CERULEANGYM_GRUNT_RUNS_OUT
	setscene SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL
	end

.MetManager:
	writetext PowerPlantManagerIWontForgiveCulpritText
	waitbutton
	closetext
	end

.FoundMachinePart:
	writetext PowerPlantManagerThatsThePartText
	buttonsound
	takeitem MACHINE_PART
	setevent EVENT_RETURNED_MACHINE_PART
	clearevent EVENT_SAFFRON_TRAIN_STATION_POPULATION
	setevent EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
	setevent EVENT_ROUTE_24_ROCKET
	setevent EVENT_RESTORED_POWER_TO_KANTO
	clearevent EVENT_GOLDENROD_TRAIN_STATION_GENTLEMAN
.ReturnedMachinePart:
	checkevent EVENT_GOT_TM07_ZAP_CANNON
	iftrue .GotZapCannon
	writetext PowerPlantManagerTakeThisTMText
	buttonsound
	verbosegiveitem TM_ZAP_CANNON
	iffalse .NoRoom
	setevent EVENT_GOT_TM07_ZAP_CANNON
	writetext PowerPlantManagerTM07IsZapCannonText
	waitbutton
.NoRoom:
	closetext
	end

.GotZapCannon:
	writetext PowerPlantManagerMyBelovedGeneratorText
	waitbutton
	closetext
	end

Forest:
	faceplayer
	opentext
	trade NPC_TRADE_FOREST
	waitbutton
	closetext
	end

PowerPlantBookshelf:
	jumpstd difficultbookshelf

PowerPlantOfficer1ApproachGymGuy2Movement:
	step RIGHT
	step RIGHT
	step UP
	step UP
	step_end

PowerPlantOfficer1ReturnToPostMovement:
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	turn_head DOWN
	step_end

PowerPlantOfficer1AThiefBrokeInText:
	text "Un ladro è entrato"
	line "nella CENTRALE…"

	para "Ma in che mondo"
	line "viviamo?"
	done

PowerPlantOfficer1CeruleanShadyCharacterText:
	text "Ho avuto notizie"
	line "da CELESTOPOLI."

	para "Sembra che un tipo"
	line "sospetto si stia"

	para "aggirando nei"
	line "dintorni."
	done

PowerPlantOfficer1CouldIAskForYourCooperationText:
	text "Aiutaci, per"
	line "favore!"
	done

PowerPlantOfficer1HaveToBeefUpSecurityText:
	text "Ora rafforzeremo"
	line "il servizio di"
	cont "sicurezza!"
	done

PowerPlantGymGuy1SomeoneStoleAPartText:
	text "Qualcuno ha"
	line "portato via un"

	para "pezzo essenziale"
	line "per il generatore."

	para "Senza il pezzo, il"
	line "nuovo generatore"
	cont "non funziona!"
	done

PowerPlantGymGuy1GeneratorUpAndRunningText:
	text "Il generatore"
	line "funziona alla per-"
	cont "fezione: ma non"
	cont "dovremo sprecare"
	cont "la sua energia!"
	done

PowerPlantGymGuy2PowerPlantUpAndRunningText:
	text "Questa CENTRALE"
	line "ELETTRICA era"
	cont "abbandonata."

	para "È stata rimessa"
	line "in funzione per"

	para "fornire energia al"
	line "SUPERTRENO."
	done

PowerPlantGymGuy2GeneratorIsRunningAgainText:
	text "Il generatore è"
	line "di nuovo in"
	cont "funzione!"
	done

PowerPlantOfficer2ManagerHasBeenSadAndFuriousText:
	text "Il DIRETTORE della"
	line "CENTRALE ELETTRICA"
	cont "è qui dietro."

	para "Ma è depresso"
	line "e furioso,"
	cont "perché qualcuno"
	cont "ha manomesso il"
	cont "generatore…"
	done

PowerPlantOfficer2ManagerHasBeenCheerfulText:
	text "Ora il generatore"
	line "è riparato e il"

	para "DIRETTORE è di"
	line "nuovo sereno."
	done

PowerPlantGymGuy4MagnetTrainConsumesElectricityText:
	text "Il SUPERTRENO"
	line "consuma molta"
	cont "elettricità."

	para "Non può funzionare"
	line "senza il nuovo"
	cont "generatore."
	done

PowerPlantGymGuy4WeCanGetMagnetTrainRunningText:
	text "Bene! Finalmente"
	line "possiamo rimettere"

	para "in funzione il"
	line "SUPERTRENO."
	done

PowerPlantManagerWhoWouldRuinMyGeneratorText:
	text "DIRETTORE: Potrei"
	line "far male a"
	cont "qualcuno!"

	para "Chi ha osato"
	line "manomettere il mio"
	cont "generatore?"

	para "Gli ho dedicato"
	line "così tanto tempo!"

	para "Se lo prendo gli"
	line "farò provare la"

	para "forza del mio"
	line "FALCECANNONE!"
	done

PowerPlantManagerIWontForgiveCulpritText:
	text "DIRETTORE: Come"
	line "posso perdonarlo?"

	para "Anche se venisse a"
	line "scusarsi pian-"
	cont "gendo, gli darei"
	cont "una bella lezione!"

	para "Aaah!!!"
	done

PowerPlantManagerThatsThePartText:
	text "DIRETTORE: Sììì!"

	para "È proprio il"
	line "pezzo rubato al"
	cont "mio generatore!"
	cont "L'hai trovato tu?"
	done

PowerPlantManagerTakeThisTMText:
	text "Grazie, grazie!"

	para "Prendi questo come"
	line "ricompensa!"
	done

PowerPlantManagerTM07IsZapCannonText:
	text "DIRETTORE: MT07 è"
	line "FALCECANNONE."

	para "È una tecnica"
	line "potente!"

	para "Non è il massimo"
	line "della precisione,"

	para "ma può far male"
	line "davvero."
	done

PowerPlantManagerMyBelovedGeneratorText:
	text "DIRETTORE: Il mio"
	line "generatore!"

	para "Ora continuerà a"
	line "produrre energia!"
	done

PowerPlant_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2, 17, ROUTE_10_NORTH, 2
	warp_event  3, 17, ROUTE_10_NORTH, 2

	db 1 ; coord events
	coord_event  5, 12, SCENE_POWERPLANT_GUARD_GETS_PHONE_CALL, PowerPlantGuardPhoneScript

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, PowerPlantBookshelf
	bg_event  1,  1, BGEVENT_READ, PowerPlantBookshelf

	db 7 ; object events
	object_event  4, 14, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficerScript, -1
	object_event  2,  9, SPRITE_GYM_GUY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy1Script, -1
	object_event  6, 11, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy2Script, -1
	object_event  9,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PowerPlantOfficer2Script, -1
	object_event  7,  2, SPRITE_GYM_GUY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PowerPlantGymGuy4Script, -1
	object_event 14, 10, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PowerPlantManager, -1
	object_event  5,  5, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Forest, -1
