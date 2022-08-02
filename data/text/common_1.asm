_FruitBearingTreeText::
	text "È una pianta da"
	line "frutta."
	done

_HeyItsFruitText::
	text "Ehi, ma è"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ObtainedFruitText::
	text "Trovata "
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_FruitPackIsFullText::
	text "Ma il tuo ZAINO"
	line "è pieno…"
	done

_NothingHereText::
	text "Qui non c'è"
	line "nulla…"
	done

_WhichApricornText::
	text "Quale GHICOCCA"
	line "devo usare?"
	done

_HowManyShouldIMakeText::
	text "Quante ne vuoi?"
	done

_RecoveredSomeHPText::
	text_ram wStringBuffer1
	text_start
	line "recupera @"
	text_decimal wCurHPAnimDeltaHP, 2, 3
	text "PS!"
	done

_CuredOfPoisonText::
	text_ram wStringBuffer1
	text_start
	line "è disintossicato."
	done

_RidOfParalysisText::
	text "Finita paralisi di"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_BurnWasHealedText::
	text "Finita scottatura"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_WasDefrostedText::
	text_ram wStringBuffer1
	text_start
	line "è scongelato."
	done

_WokeUpText::
	text_ram wStringBuffer1
	text_start
	line "si è svegliato."
	done

_HealthReturnedText::
	text_ram wStringBuffer1
	text_start
	line "è in piena forma."
	done

_RevitalizedText::
	text_ram wStringBuffer1
	text_start
	line "è rivitalizzato."
	done

_GrewToLevelText::
	text_ram wStringBuffer1
	text " grew to"
	line "level @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79 ; plays SFX_DEX_FANFARE_50_79, identical to SFX_LEVEL_UP
	text_waitbutton
	text_end

	text_end ; unused

_CameToItsSensesText::
	text_ram wStringBuffer1
	text_start
	line "è tornato in sé."
	done

_EnterNewPasscodeText::
	text "Inserisci un"
	line "numero di 4 cifre."
	done

_ConfirmPasscodeText::
	text "Inserisci di nuovo"
	line "lo stesso numero."
	done

_PasscodesNotSameText::
	text "Il numero è"
	line "diverso dal"
	cont "precedente."
	done

_PasscodeSetText::
	text "Your PASSCODE has"
	line "been set."

	para "Enter this number"
	line "next time to open"
	cont "the CARD FOLDER."

	para ""
	done

_FourZerosInvalidText::
	text "0000 is invalid!"

	para ""
	done

_EnterPasscodeText::
	text "Enter the CARD"
	next "FOLDER PASSCODE."
	done

_IncorrectPasscodeText::
	text "Incorrect"
	line "PASSCODE!"

	para ""
	done

_CardFolderOpenText::
	text "CARD FOLDER open.@"
	text_end

_OakTimeText1::
	text "<……><……><……><……><……><……>"
	line "<……><……><……><……><……><……>"

	para "Zzz…… Che c'è?"
	line "Mi hai svegliato!"

	para "Puoi controllare"
	line "l'orologio?"
	prompt

_OakTimeText2::
	text "Che ora è?"
	done

_OakTimeText3::
	text "What?@"
	text_end

_OakTimeText4::
	text "?"
	done

_OakTimeText5::
	text "Quanti minuti?"
	done

_OakTimeText6::
	text "Whoa!@"
	text_end

_OakTimeText7::
	text "?"
	done

_OakTimeText8::
	text "! "
	line "Ho dormito troppo!"
	done

_OakTimeText11::
	text "!"
	line "Ma allora ho"
	cont "dormito troppo!"
	done

_OakTimeText12::
	text "…Ah!"
	line "Ecco perché"
	cont "è così buio!"
	done

_OakTimeText13::
	text "Che giorno è?"
	done

_OakTimeText14::
	text ", vero?"
	done

UnknownText_0x1bc384::
	text "There is nothing"
	line "connected."
	done

UnknownText_0x1bc3a1::
	text "Check cell phone"
	line "adapter."
	done

UnknownText_0x1bc3bc::
	text "Check CDMA"
	line "adapter."
	done

UnknownText_0x1bc3d1::
	text "Check DOCOMO PHS"
	line "adapter."
	done

UnknownText_0x1bc3ec::
	text "Check DDI PHS"
	line "adapter."
	done

UnknownText_0x1bc404::
	text "Check unlimited"
	line "battle mobile"
	cont "adapter."
	done

UnknownText_0x1bc42c::
	text "La password è:"
	line ""
	done

UnknownText_0x1bc43f::
	text "È ok?"
	done

UnknownText_0x1bc44c::
	text "Inserisci il"
	line "Num. d'Identità."
	done

UnknownText_0x1bc45e::
	text "Inserisci la"
	line "somma."
	done

_NothingToChooseText::
	text "Non c'è nulla tra"
	line "cui scegliere."
	prompt

_WhichSidePutOnText::
	text "Da che lato?"
	done

_WhichSidePutAwayText::
	text "Quale lato vuoi"
	line "togliere?"
	done

_PutAwayTheDecoText::
	text "Hai tolto"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_NothingToPutAwayText::
	text "Non c'è nulla da"
	line "togliere."
	prompt

_SetUpTheDecoText::
	text "Hai sistemato"
	line "@"
	text_ram wStringBuffer3
	text "."
	prompt

_PutAwayAndSetUpText::
	text "Togli"
	line "@"
	text_ram wStringBuffer3
	text_start

	para "e sistemi"
	line "@"
	text_ram wStringBuffer4
	text "."
	prompt

_AlreadySetUpText::
	text "Questo articolo"
	line "è già sistemato."
	prompt

_LookTownMapText::
	text "È la MAPPA CITTÀ."
	done

_LookPikachuPosterText::
	text "È il poster di un"
	line "simpatico PIKACHU."
	done

_LookClefairyPosterText::
	text "È il poster di un"
	line "dolce CLEFAIRY."
	done

_LookJigglypuffPosterText::
	text "È il poster di un"
	line "dolce JIGGLYPUFF."
	done

_LookAdorableDecoText::
	text "Che bello! È"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_LookGiantDecoText::
	text "Una megabambola,"
	line "dolce e soffice."
	done

_MomShoppingText1::
	text "Ciao, <PLAYER>!"
	line "Come va?"
	prompt

_MomShoppingText2::
	text "T'ho comprato un"
	line "utile strumento:"
	prompt

_MomShoppingText3::
	text "ho usato i tuoi"
	line "soldi, ho fatto"
	cont "bene?"
	prompt

_MomShoppingText4::
	text "È nel tuo PC."
	line "Ti piacerà!"
	done

_MomShoppingText5::
	text "Facendo spese ho"
	line "trovato una"
	cont "bella bambola:"
	prompt

_MomShoppingText6::
	text "È in camera tua,"
	line "ti piacerà!"
	done

_TradingText1::
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "inviato a @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText2::
	text_start
	done

_TradingText3::
	text_ram wOTTrademonSenderName
	text " dice"
	line "addio a"
	done

_TradingText4::
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText5::
	text "Abbi cura di"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText6::
	text "Per il @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "di @"
	text_ram wPlayerTrademonSenderName
	text ","
	done

_TradingText7::
	text_ram wOTTrademonSenderName
	text " invia"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText8::
	text_ram wOTTrademonSenderName
	text " scambia"
	line "@"
	text_ram wOTTrademonSpeciesName
	text_end

	text_end ; unused

_TradingText9::
	text "per @"
	text_ram wPlayerTrademonSpeciesName
	text_start
	line "di @"
	text_ram wPlayerTrademonSenderName
	text "."
	done

_TradingText10::
	text_ram wPlayerTrademonSenderName
	text " scambia"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text_end

	text_end ; unused

_TradingText11::
	text "per @"
	text_ram wOTTrademonSpeciesName
	text_start
	line "di @"
	text_ram wOTTrademonSenderName
	text "."
	done

_TradingText12::
	text_ram wPlayerTrademonSenderName
	text " scambia"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "…"
	done

_TradingText13::
	text "Abbi cura di"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText14::
	text_ram wPlayerTrademonSenderName
	text " scambia"
	line "@"
	text_ram wPlayerTrademonSpeciesName
	text "…"
	done

_TradingText15::
	text "Abbi cura di"
	line "@"
	text_ram wOTTrademonSpeciesName
	text "."
	done

_TradingText16::
	text_ram wOTTrademonSpeciesName
	text " è"
	line "tornato!"
	done

; Oak's Pokémon Talk

_OPT_IntroText1::
	text_start
	line "LORI: Il #MON"
	done

_OPT_IntroText2::
	text_start
	line "TALK del PROF.OAK!"
	done

_OPT_IntroText3::
	text_start
	line "Con me, LORI!"
	done

_OPT_OakText1::
	text_start
	line "OAK: @"
	text_ram wMonOrItemNameBuffer
	text_end

	text_end ; unused

_OPT_OakText2::
	text_start
	line "è nei pressi del"
	done

_OPT_OakText3::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_OPT_MaryText1::
	text_start
	line "LORI: @"
	text_ram wStringBuffer1
	text_end
	done

OPT_SweetAdorably::
	text_start
	line "è adorabilmente"
	done

OPT_WigglySlickly::
	text_start
	line "è furbescamente"
	done

OPT_AptlyNamed::
	text_start
	line "è ben fatto e"
	done

OPT_UndeniablyKindOf::
	text_start
	line "è indubbiamente"
	done

OPT_Unbearably::
	text_start
	line "è davvero"
	done

OPT_WowImpressively::
	text_start
	line "è esageratamente"
	done

OPT_AlmostPoisonously::
	text_start
	line "è assolutamente"
	done

OPT_Sensually::
	text_start
	line "è terribilmente"
	done

OPT_Mischievously::
	text_start
	line "è maliziosamente"
	done

OPT_Topically::
	text_start
	line "è precisamente"
	done

OPT_Addictively::
	text_start
	line "è proprio"
	done

OPT_LooksInWater::
	text_start
	line "nell'acqua è"
	done

OPT_EvolutionMustBe::
	text_start
	line "ha un'evoluzione"
	done

OPT_Provocatively::
	text_start
	line "è così"
	done

OPT_FlippedOut::
	text_start
	line "è così agitato e"
	done

OPT_HeartMeltingly::
	text_start
	line "è superdolcemente"
	done

OPT_Cute::
	text_start
	line "carino."
	done

OPT_Weird::
	text_start
	line "strano."
	done

OPT_Pleasant::
	text_start
	line "piacevole."
	done

OPT_BoldSortOf::
	text_start
	line "sfrontato."
	done

OPT_Frightening::
	text_start
	line "spaventoso."
	done

OPT_SuaveDebonair::
	text_start
	line "spensierato!"
	done

OPT_Powerful::
	text_start
	line "potente."
	done

OPT_Exciting::
	text_start
	line "interessante."
	done

OPT_Groovy::
	text_start
	line "fantastico!"
	done

OPT_Inspiring::
	text_start
	line "esaltante."
	done

OPT_Friendly::
	text_start
	line "amichevole."
	done

OPT_HotHotHot::
	text_start
	line "travolgente!"
	done

OPT_Stimulating::
	text_start
	line "entusiasmante."
	done

OPT_Guarded::
	text_start
	line "prudente."
	done

OPT_Lovely::
	text_start
	line "amorevole."
	done

OPT_Speedy::
	text_start
	line "veloce."
	done

_OPT_PokemonChannelText::
	text "#MON"
	done

_PokedexShowText::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

; Pokémon Music Channel / Pokémusic

_BenIntroText1::
	text_start
	line "TIMMI: #MON"
	line ""
	done

_BenIntroText2::
	text_start
	line "MUSIC!"
	done

_BenIntroText3::
	text_start
	line "Sono il DJ TIMMI!"
	done

_FernIntroText1::
	text_start
	line "MITRI: #MUSIC!"
	done

_FernIntroText2::
	text_start
	line "Con il DJ MITRI!"
	done

_BenFernText1::
	text_start
	line "Oggi è @"
	text_today
	text ","
	done

_BenFernText2A::
	text_start
	line "ascoltiamoci una"
	done

_BenFernText2B::
	text_start
	line "ci vuole una bella"
	done

_BenFernText3A::
	text_start
	line "Marcia #MON!"
	done

_BenFernText3B::
	text_start
	line "# Ninnananna!"
	done

; Lucky Channel

_LC_Text1::
	text_start
	line "RINO: Ciaaao! Come"
	done

_LC_Text2::
	text_start
	line "ve la passate?"
	done

_LC_Text3::
	text_start
	line "Chi è pimpante o"
	done

_LC_Text4::
	text_start
	line "abbacchiato, non"
	done

_LC_Text5::
	text_start
	line "perde lo SHOW del"
	done

_LC_Text6::
	text_start
	line "NUMERO FORTUNATO!"
	done

_LC_Text7::
	text_start
	line "Il Num. di questa"
	done

_LC_Text8::
	text_start
	line "Number is @"
	text_pause
	text_ram wStringBuffer1
	text "!"
	done

_LC_Text9::
	text_start
	line "Ripeto!"
	done

_LC_Text10::
	text_start
	line "Corrisponde? Corri"
	done

_LC_Text11::
	text_start
	line "alla TORRE RADIO!"
	done

_LC_DragText1::
	text_start
	line "…Sono stanco"
	done

_LC_DragText2::
	text_start
	line "di ripeterlo…"
	done

; Places and People

_PnP_Text1::
	text_start
	line "POSTI E PERSONE!"
	done

_PnP_Text2::
	text_start
	line "Presentato da"
	done

_PnP_Text3::
	text_start
	line "me, DJ SILVIA!"
	done

_PnP_Text4::
	text_start
	line "@"
	text_ram wStringBuffer2
	text " @"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

_PnP_cute::
	text_start
	line "è elegante."
	done

_PnP_lazy::
	text_start
	line "m'annoia un po'!"
	done

_PnP_happy::
	text_start
	line "mette allegria."
	done

_PnP_noisy::
	text_start
	line "è assordante."
	done

_PnP_precocious::
	text_start
	line "è esaltante."
	done

_PnP_bold::
	text_start
	line "è divertente."
	done

_PnP_picky::
	text_start
	line "è particolare."
	done

_PnP_sortofok::
	text_start
	line "è ok."
	done

_PnP_soso::
	text_start
	line "è così così."
	done

_PnP_great::
	text_start
	line "è grande!"
	done

_PnP_mytype::
	text_start
	line "fa proprio per me!"
	done

_PnP_cool::
	text_start
	line "è forte, vero?"
	done

_PnP_inspiring::
	text_start
	line "è esaltante!"
	done

_PnP_weird::
	text_start
	line "è interessante."
	done

_PnP_rightforme::
	text_start
	line "fa proprio per me."
	done

_PnP_odd::
	text_start
	line "è originale!"
	done

_PnP_Text5::
	text_start
	line "@"
	text_ram wStringBuffer1
	text_end

	text_end ; unused

_RocketRadioText1::
	text_start
	line "… … Qui è"
	done

_RocketRadioText2::
	text_start
	line "TEAM ROCKET!"
	done

_RocketRadioText3::
	text_start
	line "Dopo tre anni"
	done

_RocketRadioText4::
	text_start
	line "di preparazione,"
	done

_RocketRadioText5::
	text_start
	line "siamo risorti"
	done

_RocketRadioText6::
	text_start
	line "dalla cenere!"
	done

_RocketRadioText7::
	text_start
	line "GIOVANNI! @"
	text_pause
	text "Ci"
	done

_RocketRadioText8::
	text_start
	line "senti?@"
	text_pause
	text " Ci siamo!"
	done

_RocketRadioText9::
	text_start
	line "@"
	text_pause
	text "Dov'è il capo?"
	done

_RocketRadioText10::
	text_start
	line "@"
	text_pause
	text "Ci ascolterà?"
	done

_BuenaRadioText1::
	text_start
	line "BUENA: Ciao!"
	done

_BuenaRadioText2::
	text_start
	line "La password di"
	done

_BuenaRadioText3::
	text_start
	line "oggi è…"
	done

_BuenaRadioText4::
	text_start
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

_BuenaRadioText5::
	text_start
	line "Venite alla TORRE"
	done

_BuenaRadioText6::
	text_start
	line "RADIO di"
	done

_BuenaRadioText7::
	text_start
	line "FIORDOROPOLI!"
	done

_BuenaRadioMidnightText1::
	text_start
	line "BUENA: Ehi…"
	done

_BuenaRadioMidnightText2::
	text_start
	line "È mezzanotte!"
	done

_BuenaRadioMidnightText3::
	text_start
	line "Devo chiudere!"
	done

_BuenaRadioMidnightText4::
	text_start
	line "Grazie per essere"
	done

_BuenaRadioMidnightText5::
	text_start
	line "rimasti fino alla"
	done

_BuenaRadioMidnightText6::
	text_start
	line "fine! Ora andate a"
	done

_BuenaRadioMidnightText7::
	text_start
	line "nanna però! Ciao"
	done

_BuenaRadioMidnightText8::
	text_start
	line "dalla DJ BUENA!"
	done

_BuenaRadioMidnightText9::
	text "Ora devo andare!"
	done

_BuenaRadioMidnightText10::
	text "…"
	done

_BuenaOffTheAirText::
	text_start
	line ""
	done

Text_EnemyWithdrew::
	text "<ENEMY>"
	line "ritira"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	prompt

Text_EnemyUsedOn::
	text "<ENEMY>"
	line "usa @"
	text_ram wMonOrItemNameBuffer
	text_start
	cont "su @"
	text_ram wEnemyMonNick
	text "!"
	prompt

Text_ThatCantBeUsedRightNow::
	text "Non si può usare"
	line "adesso."
	prompt

Text_ThatItemCantBePutInThePack::
	text "Non puoi mettere"
	line "questo strumento"
	cont "nello ZAINO."
	done

Text_TheItemWasPutInThePack::
	text "Strumento"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "messo nello ZAINO."
	done

Text_RemainingTime::
	text "Tempo restante"
	done

Text_YourMonsHPWasHealed::
	text "Il #MON ha"
	line "recuperato i PS."
	prompt

Text_Warping::
	text "Teletrasferimento…"
	done

UnknownText_0x1bd05e::
	text "Che numero"
	line "vuoi cambiare?"
	done

UnknownText_0x1bd07f::
	text "Vuoi giocare con"
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1bd09a::
	text "Servono due #-"
	line "MON per procreare."
	prompt

Text_BreedingIsNotPossible::
	text "Procreazione"
	line "impossibile."
	prompt

UnknownText_0x1bd0d8::
	text "The compatibility"
	line "is @"
	text_decimal wBreedingCompatibility, 1, 3
	text "."
	cont "Should they breed?"
	done

UnknownText_0x1bd109::
	text "Nessun UOVO."
	line ""
	prompt

UnknownText_0x1bd11c::
	text "Sta per"
	line "schiudersi!"
	prompt

UnknownText_0x1bd131::
	text "Test"
	line "@"
	text_decimal wStringBuffer2, 1, 2
	text "?"
	done

UnknownText_0x1bd145::
	text "Partenza!"
	done

UnknownText_0x1bd14d::
	text "Fine!"
	done

UnknownText_0x1bd153::
	text "Per un maschio!"
	done

UnknownText_0x1bd15f::
	text "Per una bambina!"
	done

UnknownText_0x1bd16c::
	text "Questo non"
	line "riguarda i maschi!"
	done

UnknownText_0x1bd188::
	text "Il BOX è pieno."
	done

UnknownText_0x1bd19a::
	text "A new CARD arrived"
	line "from @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1bd1ba::
	text "Put this CARD in"
	line "the CARD FOLDER?"
	done

UnknownText_0x1bd1dd::
	text_ram wStringBuffer2
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wStringBuffer1, 1, 2
	text "."
	prompt

UnknownText_0x1bd201::
	text "Starting link."
	done

UnknownText_0x1bd211::
	text "Link terminated."
	done

UnknownText_0x1bd223::
	text "Closing link."
	done

UnknownText_0x1bd232::
	text "Clear the time"
	line "limit?"
	done

UnknownText_0x1bd249::
	text "The time limit was"
	line "cleared."
	done

UnknownText_0x1bd266::
	text "Pick which packet"
	line "as an error?"
	done

UnknownText_0x1bd286::
	text "Scambi @"
	text_ram wStringBuffer2
	text_start
	line "per @"
	text_ram wStringBuffer1
	text "…"
	done

UnknownText_0x1bd2a0::
	text "Ottenuta"
	line "MEDAGLIA VOLTORB."
	done

UnknownText_0x1bd2bc::
	text "A che piano?"
	done

UnknownText_0x1bd2ca::
	text "ANNUNCIATORE: BIP!"

	para "Tempo scaduto!"
	done

UnknownText_0x1bd2e7::
	text "ANNUNCIATORE: La"
	line "Gara è finita."
	done

_RepelWoreOffText::
	text "Finito l'effetto"
	line "del REPELLENTE."
	done

_PlayerFoundItemText::
	text "<PLAYER> trova"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

_ButNoSpaceText::
	text "Ma <PLAYER> non"
	line "ha più spazio…"
	done

_JustSawSomeRareMonText::
	text "Ho visto un raro"
	line "@"
	text_ram wStringBuffer1
	text " a"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Se vedo un altro"
	line "#MON raro ti"
	cont "chiamo, ok?"
	prompt

_SavingRecordText::
	text "SALVAT. RECORD…"
	line "NON SPEGNERE!"
	done

_ReceiveItemText::
	text_ram wPlayerName
	text " received"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	sound_item
	text_waitbutton
	text_end

	text_end ; unused

_NoCoinsText::
	text "Non hai gettoni."
	prompt

_NoCoinCaseText::
	text "Ti manca il"
	line "SALVADANAIO."
	prompt

UnknownText_0x1bd407::
	text "Ok, connetti il"
	line "Cavo Game Link."
	prompt

UnknownText_0x1bd429::
	text "<PLAYER> scambia"
	line "@"
	text_ram wStringBuffer2
	text " con"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text ".@"
	text_end

UnknownText_0x1bd445::
	sound_dex_fanfare_80_109
	text_pause
	text_end

	text_end ; unused

_NPCTradeIntroText1::
	text "Cerco dei #MON."
	line "Hai @"
	text_ram wStringBuffer1
	text "?"

	para "Vuoi scambiarlo"
	line "con @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText1::
	text "Non vuoi fare lo"
	line "scambio? Peccato…"
	done

_NPCTradeWrongText1::
	text "Ehi, ma quello non"
	line "è @"
	text_ram wStringBuffer1
	text "."
	cont "Che delusione…"
	done

_NPCTradeCompleteText1::
	text "Grande! Ora ho un"
	line "@"
	text_ram wStringBuffer1
	text "!"
	cont "Grazie!"
	done

_NPCTradeAFterText1::
	text "Ciao, come sta il"
	line "mio @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeIntroText2::
	text "Ciao, sto cercando"
	line "un #MON."

	para "Se per caso hai"
	line "@"
	text_ram wStringBuffer1
	text ", lo"

	para "scambieresti con"
	line "il mio @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText2::
	text "Non ce l'hai"
	line "neanche tu?"

	para "Che peccato…"
	done

_NPCTradeWrongText2::
	text "Non hai"
	line "@"
	text_ram wStringBuffer1
	text "? È"
	cont "un peccato."
	done

_NPCTradeCompleteText2::
	text "Grande! Grazie!"

	para "Finalmente ho"
	line "@"
	text_ram wStringBuffer1
	text "."
	done

_NPCTradeAfterText2::
	text "Ehi, @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "che mi hai dato è"
	cont "davvero grande!"
	done

_NPCTradeIntroText3::
	text_ram wMonOrItemNameBuffer
	text " è"
	line "carino ma non ce"

	para "l'ho. Tu hai"
	line "@"
	text_ram wStringBuffer1
	text "?"

	para "Lo scambi con il"
	line "mio @"
	text_ram wStringBuffer2
	text "?"
	done

_NPCTradeCancelText3::
	text "Non lo scambi? Che"
	line "disdetta…"
	done

_NPCTradeWrongText3::
	text "Quello non è"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "Quando lo catturi"
	line "lo scambiamo, ok?"
	done

_NPCTradeCompleteText3::
	text "Ti ringrazio! Ho"
	line "sempre sognato un"
	cont "@"
	text_ram wMonOrItemNameBuffer
	text "!"
	done

_NPCTradeAfterText3::
	text "Come sta il"
	line "@"
	text_ram wStringBuffer2
	text " che"
	cont "ti ho dato?"

	para "Il tuo @"
	text_ram wMonOrItemNameBuffer
	text_start
	line "è così carino!"
	done

_NPCTradeCompleteText4::
	text "Che è successo?"
	done

_NPCTradeAfterText4::
	text "Gli scambi sono"
	line "complicati…"

	para "Ho ancora molto da"
	line "imparare."
	done

_MomLeavingText1::
	text "Che carino questo"
	line "#MON!"

	para "Dove l'hai"
	line "trovato?"

	para "…"

	para "Stai partendo"
	line "all'avventura…"

	para "E va bene! Voglio"
	line "aiutarti."

	para "Ma come posso"
	line "esserti d'aiuto?"

	para "Potrei risparmiare"
	line "dei soldi per te."

	para "Per i lunghi"
	line "viaggi il denaro"
	cont "è importante."

	para "Vuoi che ne"
	line "risparmi un po'"
	cont "per te?"
	done

_MomLeavingText2::
	text "Va bene, penserò"
	line "io ai tuoi soldi."

	para "<……><……><……>"
	prompt

_MomLeavingText3::
	text "Sii prudente."

	para "I #MON sono"
	line "tuoi amici. Dovete"
	cont "lavorare in"
	cont "squadra."

	para "Ora vai!"
	done

_MomVisitingText1::
	text "Ciao, eccoti a"
	line "casa! Vedo che ti"
	cont "stai impegnando."

	para "Ho tenuto pulita"
	line "la tua stanza."

	para "Sei qui per i"
	line "tuoi soldi?"
	done

_MomVisitingText2::
	text "Che cosa vuoi"
	line "fare?"
	done

_MomVisitingText3::
	text "Quanto vuoi"
	line "mettere da parte?"
	done

_MomVisitingText4::
	text "Quanto vuoi"
	line "prendere?"
	done

_MomVisitingText5::
	text "Vuoi risparmiare"
	line "dei soldi?"
	done

_MomVisitingText6::
	text "Non hai così tanti"
	line "risparmi."
	prompt

_MomVisitingText7::
	text "Non puoi prendere"
	line "così tanto."
	prompt

_MomVisitingText8::
	text "Non hai tutti"
	line "quei soldi."
	prompt

_MomVisitingText9::
	text "Non puoi lasciare"
	line "tutti quei soldi."
	prompt

_MomVisitingText10::
	text "Ok, risparmierò"
	line "i tuoi soldi!"

	para "<PLAYER>, non"
	line "mollare!"
	done

_MomVisitingText11::
	text "I tuoi soldi sono"
	line "al sicuro. Vai!"
	done

_MomVisitingText12::
	text "<PLAYER>, non"
	line "ti arrendere!"
	done

_MomVisitingText13::
	text "Fai del tuo"
	line "meglio!"
	done

_DaycareDummyText::
	text_start
	done

_DayCareManIntroText::
	text "Sono il PADRONE"
	line "della PENSIONE."
	cont "Vuoi che mi prenda"
	cont "cura di uno dei"
	cont "tuoi #MON?"
	done

_DayCareManOddEggText::
	text "Sono il PADRONE"
	line "della PENSIONE."
	cont "Conosci la storia"
	cont "delle UOVA?"

	para "Stavo accudendo i"
	line "#MON con"
	cont "mia moglie."

	para "E cosa troviamo?"
	line "Un UOVO!"

	para "È incredibile,"
	line "vero?"

	para "Vuoi che accudisca"
	line "un tuo #MON?"
	done

_DayCareLadyIntroText::
	text "Sono la PADRONA"
	line "della PENSIONE."

	para "Vuoi che accudisca"
	line "un tuo #MON?"
	done

_DayCareLadyOddEggText::
	text "Sono la PADRONA"
	line "della PENSIONE."
	cont "Conosci la storia"
	cont "delle UOVA?"

	para "Stavo accudendo i"
	line "#MON con"
	cont "mio marito."

	para "E cosa troviamo?"
	line "Un UOVO!"

	para "È incredibile,"
	line "vero?"

	para "Vuoi che accudisca"
	line "un tuo #MON?"
	done

_WhatShouldIRaiseText::
	text "Quale vuoi che"
	line "accudisca?"
	prompt

_OnlyOneMonText::
	text "Ma hai un solo"
	line "#MON!"
	prompt

_CantRaiseEggText::
	text "Scusa ma non posso"
	line "accettare un UOVO."
	prompt

_RemoveMailText::
	text "Torna dopo aver"
	line "tolto il"
	cont "MESSAGGIO."
	prompt

_LastHealthyMonText::
	text "Se mi dai questo,"
	line "poi come fai a"
	cont "lottare?"
	prompt

_IllRaiseYourMonText::
	text "Ok. Accudirò il"
	line "tuo @"
	text_ram wStringBuffer1
	text "."
	prompt

_ComeBackLaterText::
	text "Ritorna più tardi."
	done

_AreWeGeniusesText::
	text "Siamo dei geni!"
	line "Vuoi vedere il tuo"
	cont "@"
	text_ram wStringBuffer1
	text "?"
	done

_YourMonHasGrownText::
	text "Il tuo @"
	text_ram wStringBuffer1
	text_start
	line "è cresciuto bene!"

	para "Il suo livello è"
	line "salito di @"
	text_decimal wStringBuffer2 + 1, 1, 3
	text "."

	para "Se vuoi il tuo"
	line "#MON indietro"
	cont "ti costerà ¥@"
	text_decimal wStringBuffer2 + 2, 3, 4
	text "."
	done

_PerfectHeresYourMonText::
	text "Perfetto! Ecco il"
	line "tuo #MON."
	prompt

_GotBackMonText::
	text "<PLAYER> recupera"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

_BackAlreadyText::
	text "Già di ritorno?"
	line "Il tuo @"
	text_ram wStringBuffer1
	text_start
	para "ha ancora bisogno"
	line "delle nostre cure."

	para "Se vuoi indietro"
	line "il tuo #MON ti"
	cont "costerà ¥100."
	done

_HaveNoRoomText::
	text "Non hai posto."
	prompt

_DCNotEnoughMoneyText::
	text "Non hai abbastanza"
	line "denaro."
	prompt

_OhFineThenText::
	text "Ah, benissimo."
	prompt

_ComeAgainText::
	text "Torna a trovarci."
	done

_NotYetText::
	text "Non ancora…"
	done

_FoundAnEggText::
	text "Ah, eccoti!"

	para "Mentre accudivamo"
	line "i tuoi #MON,"

	para "non immagini cosa"
	line "è accaduto!"

	para "I #MON hanno"
	line "avuto un UOVO."

	para "Non sappiamo come"
	line "sia successo, ma"

	para "l'hanno avuto. Lo"
	line "vuoi?"
	done

_ReceivedEggText::
	text "<PLAYER> riceve"
	line "l'UOVO."
	done

_TakeGoodCareOfEggText::
	text "Abbine cura!"
	done

_RefuseEggText::
	text "Va bene, lo terrò"
	line "io. Grazie!"
	done

_NoRoomForEggText::
	text "Non c'è più posto"
	line "nella tua squadra."
	cont "Torna più tardi."
	done

_WhichMonPhotoText::
	text "Quale #MON"
	line "devo fotografare?"
	prompt

_HoldOnText::
	text "Ok. Tienilo fermo"
	line "un attimo."
	prompt

_PrestoAllDoneText::
	text "Ecco fatto. Torna"
	line "a trovarmi, ok?"
	done
