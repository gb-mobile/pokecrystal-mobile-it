	object_const_def ; object_event constants
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScripts:
	db 2 ; scene scripts
	scene_script .MeetMrPokemon ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.MeetMrPokemon:
	prioritysjump .MrPokemonEvent
	end

.DummyScene:
	end

.MrPokemonEvent:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	buttonsound
	waitsfx
	giveitem MYSTERY_EGG
	writetext MrPokemonsHouse_GotEggText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonIntroText3
	buttonsound
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	buttonsound
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonIntroText5
	waitbutton
	closetext
	sjump MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	sjump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end

MrPokemonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	opentext
	writetext MrPokemonsHouse_OakText1
	buttonsound
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_OakText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_FINISHED
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step_end

MrPokemonsHouse_OakExits:
	step DOWN
	step LEFT
	turn_head DOWN
	step_sleep 2
	step_end

MrPokemonIntroText1:
	text "Ciao! Tu devi"
	line "essere <PLAY_G>."

	para "Il PROF.ELM mi ha"
	line "informato del tuo"
	cont "arrivo."
	done

MrPokemonIntroText2:
	text "Ecco l'oggetto che"
	line "vorrei che il"
	cont "PROF.ELM"
	cont "analizzasse."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> riceve"
	line "l'UOVO MISTERO."
	done

MrPokemonIntroText3:
	text "Conosco una coppia"
	line "che dirige una"
	cont "PENSIONE #MON."

	para "Sono loro che mi"
	line "hanno dato l'UOVO."

	para "Ero curioso, così"
	line "mi sono rivolto al"
	cont "PROF.ELM."

	para "Il PROF.ELM è il"
	line "massimo esperto"
	cont "per l'evoluzione"
	cont "dei #MON."
	done

MrPokemonIntroText4:
	text "Anche il PROF.OAK"
	line "lo riconosce."
	done

MrPokemonIntroText5:
	text "Il PROF.ELM"
	line "saprà certamente"
	cont "di che si tratta."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "Stai tornando dal"
	line "PROF.ELM?"

	para "Allora il tuo"
	line "#MON dovrà"
	cont "riposarsi un po'."
	done

MrPokemonText_ImDependingOnYou:
	text "Conto su di te!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "Che bella la vita!"
	line "Ogni giorno fai"

	para "una nuova"
	line "scoperta!"
	done

MrPokemonsHouse_OakText1:
	text "OAK: Aaah! Allora"
	line "sei tu <PLAY_G>!"

	para "Sono OAK, esperto"
	line "di #MON."

	para "Ero passato a"
	line "salutare il mio"
	cont "vecchio amico"
	cont "MR.#MON."

	para "Mi ha detto della"
	line "tua missione per"

	para "il PROF.ELM, così"
	line "ti aspettavo."

	para "E questo cos'è?"
	line "Un #MON raro!"

	para "Fa vedere…"

	para "Ah!"

	para "Capisco perché il"
	line "PROF.ELM ti ha"

	para "dato un #MON"
	line "per la missione:"

	para "per esperti come"
	line "il PROF.ELM e me,"

	para "i #MON sono"
	line "degli amici."

	para "Sapeva che avresti"
	line "trattato il tuo"

	para "#MON con amore"
	line "e attenzione."

	para "… Bene!"

	para "Mi sembri"
	line "affidabile."

	para "Vuoi aiutarmi?"

	para "Guarda, questa è"
	line "l'ultima versione"
	cont "del #DEX."

	para "Registra automati-"
	line "camente i dati"

	para "dei #MON visti"
	line "o catturati."

	para "È un'enciclopedia"
	line "elettronica!"
	done

MrPokemonsHouse_GetDexText:
	text "<PLAYER> riceve"
	line "il #DEX!"
	done

MrPokemonsHouse_OakText2:
	text "Cattura tutti i"
	line "#MON che puoi,"

	para "per completare"
	line "il tuo #DEX!"

	para "Ma mi sono già"
	line "trattenuto troppo."

	para "Devo andare a"
	line "FIORDOROPOLI per"
	cont "condurre il mio"
	cont "show."

	para "<PLAY_G>, conto"
	line "su di te!"
	done

MrPokemonText_GimmeTheScale:
	text "Quella SQUAMA!"
	line "È di un GYARADOS"
	cont "rosso?"

	para "È una rarità!"
	line "La voglio…"

	para "<PLAY_G>, la scambi"
	line "con me?"

	para "In cambio ti do"
	line "questo CONDIV.ESP."
	cont "che ho avuto dal"
	cont "PROF.OAK."
	done

MrPokemonText_Disappointed:
	text "Che delusione,"
	line "era davvero una"
	cont "rarità!"
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "È pieno di"
	line "giornali"
	cont "stranieri."

	para "Non capisco"
	line "neppure i titoli…"
	done

MrPokemonsHouse_BrokenComputerText:
	text "È un grosso"
	line "computer, ma non"
	cont "funziona."
	done

MrPokemonsHouse_StrangeCoinsText:
	text "Una pila di monete"
	line "sconosciute!"

	para "Devono essere di"
	line "un altro paese…"
	done

MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	db 2 ; object events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
