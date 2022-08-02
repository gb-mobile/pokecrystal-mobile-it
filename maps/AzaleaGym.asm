	object_const_def ; object_event constants
	const AZALEAGYM_BUGSY
	const AZALEAGYM_BUG_CATCHER1
	const AZALEAGYM_BUG_CATCHER2
	const AZALEAGYM_BUG_CATCHER3
	const AZALEAGYM_TWIN1
	const AZALEAGYM_TWIN2
	const AZALEAGYM_GYM_GUY

AzaleaGym_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

AzaleaGymBugsyScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BUGSY
	iftrue .FightDone
	writetext BugsyText_INeverLose
	waitbutton
	closetext
	winlosstext BugsyText_ResearchIncomplete, 0
	loadtrainer BUGSY, BUGSY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BUGSY
	opentext
	writetext Text_ReceivedHiveBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_HIVEBADGE
	readvar VAR_BADGES
	scall AzaleaGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM49_FURY_CUTTER
	iftrue .GotFuryCutter
	setevent EVENT_BEAT_TWINS_AMY_AND_MAY
	setevent EVENT_BEAT_BUG_CATCHER_BENNY
	setevent EVENT_BEAT_BUG_CATCHER_AL
	setevent EVENT_BEAT_BUG_CATCHER_JOSH
	writetext BugsyText_HiveBadgeSpeech
	buttonsound
	verbosegiveitem TM_FURY_CUTTER
	iffalse .NoRoomForFuryCutter
	setevent EVENT_GOT_TM49_FURY_CUTTER
	writetext BugsyText_FuryCutterSpeech
	waitbutton
	closetext
	end

.GotFuryCutter:
	writetext BugsyText_BugMonsAreDeep
	waitbutton
.NoRoomForFuryCutter:
	closetext
	end

AzaleaGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd goldenrodrockets

.RadioTowerRockets:
	jumpstd radiotowerrockets

TrainerTwinsAmyandmay1:
	trainer TWINS, AMYANDMAY1, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay1SeenText, TwinsAmyandmay1BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsAmyandmay2:
	trainer TWINS, AMYANDMAY2, EVENT_BEAT_TWINS_AMY_AND_MAY, TwinsAmyandmay2SeenText, TwinsAmyandmay2BeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TwinsAmyandmay2AfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherBenny:
	trainer BUG_CATCHER, BUG_CATCHER_BENNY, EVENT_BEAT_BUG_CATCHER_BENNY, BugCatcherBennySeenText, BugCatcherBennyBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherBennyAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherAl:
	trainer BUG_CATCHER, AL, EVENT_BEAT_BUG_CATCHER_AL, BugCatcherAlSeenText, BugCatcherAlBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherAlAfterBattleText
	waitbutton
	closetext
	end

TrainerBugCatcherJosh:
	trainer BUG_CATCHER, JOSH, EVENT_BEAT_BUG_CATCHER_JOSH, BugCatcherJoshSeenText, BugCatcherJoshBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext BugCatcherJoshAfterBattleText
	waitbutton
	closetext
	end

AzaleaGymGuyScript:
	faceplayer
	checkevent EVENT_BEAT_BUGSY
	iftrue .AzaleaGymGuyWinScript
	opentext
	writetext AzaleaGymGuyText
	waitbutton
	closetext
	end

.AzaleaGymGuyWinScript:
	opentext
	writetext AzaleaGymGuyWinText
	waitbutton
	closetext
	end

AzaleaGymStatue:
	checkflag ENGINE_HIVEBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten:
	gettrainername STRING_BUFFER_4, BUGSY, BUGSY1
	jumpstd gymstatue2

BugsyText_INeverLose:
	text "Sono RAFFAELLO!"
	line "Con i #MON"

	para "coleottero non ho"
	line "proprio rivali."

	para "Sto studiando per"
	line "diventare un'"

	para "autorità nel campo"
	line "dei #MON"
	cont "coleottero!"

	para "Ora ti mostro"
	line "ciò che ho"
	cont "imparato."
	done

BugsyText_ResearchIncomplete:
	text "Strabiliante!"
	line "Conosci proprio"
	cont "bene i #MON!"

	para "La mia ricerca va"
	line "approfondita."

	para "Ok, hai vinto tu."
	line "Ecco la MEDAGLIA."
	done

Text_ReceivedHiveBadge:
	text "<PLAYER> riceve la"
	line "MEDAGLIA ALVEARE."
	done

BugsyText_HiveBadgeSpeech:
	text "Conosci i vantaggi"
	line "della MEDAGLIA"
	cont "ALVEARE?"

	para "Se ce l'hai, tutti"
	line "i #MON fino al"
	cont "livello 30 ti"
	cont "obbediranno."

	para "I #MON che"
	line "conoscono TAGLIO"

	para "potranno usarlo"
	line "anche fuori dalla"
	cont "lotta."

	para "Inoltre, voglio"
	line "darti questo."
	done

BugsyText_FuryCutterSpeech:
	text "MT49 contiene"
	line "TAGLIOFURIA."

	para "Se il colpo va a"
	line "segno, la sua"
	cont "forza cresce ad"
	cont "ogni turno."

	para "Diviene sempre"
	line "più forte con il"
	cont "prolungarsi della"
	cont "lotta."

	para "Bello, vero?"
	line "L'ho scoperto io!"
	done

BugsyText_BugMonsAreDeep:
	text "I #MON"
	line "coleottero sono"

	para "misteriosi: c'è"
	line "ancora molto da"
	cont "scoprire!"

	para "Scopri i tuoi"
	line "preferiti."
	done

BugCatcherBennySeenText:
	text "I #MON"
	line "coleottero si"

	para "evolvono presto,"
	line "diventando forti"
	cont "in breve tempo."
	done

BugCatcherBennyBeatenText:
	text "L'evoluzione"
	line "non è tutto!"
	done

BugCatcherBennyAfterBattleText:
	text "I #MON"
	line "evoluti sono più"
	cont "forti: davvero!"
	done

BugCatcherAlSeenText:
	text "I #MON"
	line "coleottero sono"

	para "una forza: ora te"
	line "lo mostro."
	done

BugCatcherAlBeatenText:
	text "Anche tu sei una"
	line "forza, lo ammetto…"
	done

BugCatcherAlAfterBattleText:
	text "I #MON"
	line "coleottero sono"

	para "grandiosi, ma a"
	line "molte ragazze non"
	cont "piacciono."

	para "Chissà perché…"
	done

BugCatcherJoshSeenText:
	text "Hai salvato tu gli"
	line "SLOWPOKE? Allora"
	cont "sei forte!"

	para "Ma il mio #MON"
	line "esperto è pane per"
	cont "i tuoi denti."
	done

BugCatcherJoshBeatenText:
	text "Nooo!"
	done

BugCatcherJoshAfterBattleText:
	text "Devono imparare"
	line "mosse migliori,"
	cont "credo…"
	done

TwinsAmyandmay1SeenText:
	text "AMI: Vuoi sfidare"
	line "il CAPOPALESTRA?"
	cont "Non si passa!"
	done

TwinsAmyandmay1BeatenText:
	text "AMI&MIMI: Che"
	line "doppia disdetta!"
	done

TwinsAmyandmay1AfterBattleText:
	text "AMI: Sei davvero"
	line "forte!"
	done

TwinsAmyandmay2SeenText:
	text "MIMI: Vai dal"
	line "CAPOPALESTRA? Ci"
	cont "siamo prima noi!"
	done

TwinsAmyandmay2BeatenText:
	text "AMI&MIMI: Che"
	line "doppia disdetta!"
	done

TwinsAmyandmay2AfterBattleText:
	text "MIMI: I nostri"
	line "#MON coleottero"
	cont "hanno perso: che"
	cont "vergogna!"
	done

AzaleaGymGuyText:
	text "Ehi, sfidante!"

	para "RAFFAELLO è"
	line "giovane ma ha già"

	para "esperienza con i "
	line "#MON"
	cont "coleottero."

	para "Sarà dura se non"
	line "segui i miei"
	cont "consigli."

	para "Vediamo… I"
	line "#MON coleottero"
	cont "odiano il fuoco."

	para "Anche le mosse di"
	line "tipo volante sono"
	cont "molto efficaci."
	done

AzaleaGymGuyWinText:
	text "Ben fatto! Una"
	line "grande lotta tra"

	para "giovani allenatori"
	line "di talento."

	para "Con gente come te"
	line "i #MON avranno"
	cont "un grande futuro!"
	done

AzaleaGym_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4, 15, AZALEA_TOWN, 5
	warp_event  5, 15, AZALEA_TOWN, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  3, 13, BGEVENT_READ, AzaleaGymStatue
	bg_event  6, 13, BGEVENT_READ, AzaleaGymStatue

	db 7 ; object events
	object_event  5,  7, SPRITE_BUGSY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, AzaleaGymBugsyScript, -1
	object_event  5,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherBenny, -1
	object_event  8,  8, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherAl, -1
	object_event  0,  2, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBugCatcherJosh, -1
	object_event  4, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay1, -1
	object_event  5, 10, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsAmyandmay2, -1
	object_event  7, 13, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, AzaleaGymGuyScript, -1
