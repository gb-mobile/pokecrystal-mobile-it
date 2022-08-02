	object_const_def ; object_event constants
	const PLAYERSNEIGHBORSHOUSE_COOLTRAINER_F
	const PLAYERSNEIGHBORSHOUSE_POKEFAN_F

PlayersNeighborsHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PlayersNeighborsDaughterScript:
	jumptextfaceplayer PlayersNeighborsDaughterText

PlayersNeighborScript:
	jumptextfaceplayer PlayersNeighborText

PlayersNeighborsHouseBookshelfScript:
	jumpstd magazinebookshelf

PlayersNeighborsHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext PlayerNeighborRadioText1
	pause 45
	writetext PlayerNeighborRadioText2
	pause 45
	writetext PlayerNeighborRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd radio1
.AbbreviatedRadio:
	opentext
	writetext PlayerNeighborRadioText4
	pause 45
	closetext
	end

PlayersNeighborsDaughterText:
	text "PIKACHU è un"
	line "#MON evoluto!"

	para "Le scoperte del"
	line "PROF.ELM sono"
	cont "sorprendenti."

	para "È famoso per le"
	line "sue ricerche sull'"
	cont "evoluzione dei"
	cont "#MON."

	para "…Sigh…"

	para "Vorrei avere tutta"
	line "la sua esperienza…"
	done

PlayersNeighborText:
	text "Mia figlia vuole"
	line "diventare a tutti"

	para "i costi assistente"
	line "del PROF.ELM."

	para "Va pazza per i"
	line "#MON!"

	para "Beh, anch'io!"
	done

PlayerNeighborRadioText1:
	text "Prossimamente: il"
	line "#MON TALK"
	cont "del PROF.OAK!"
	done

PlayerNeighborRadioText2:
	text "RADIO #MON!"
	done

PlayerNeighborRadioText3:
	text "Presentato da LORI"
	line "e il PROF.OAK!"
	done

PlayerNeighborRadioText4:
	text "#MON!"
	line "RADIO #MON!"
	done

PlayersNeighborsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, PlayersNeighborsHouseBookshelfScript
	bg_event  7,  1, BGEVENT_READ, PlayersNeighborsHouseRadioScript

	db 2 ; object events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborsDaughterScript, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PlayersNeighborScript, EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
