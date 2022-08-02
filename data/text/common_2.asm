UnknownText_0x1c0000::
	text "Non vuoi una foto?"
	line "Torna quando vuoi."
	done

UnknownText_0x1c0021::
	text "Un UOVO? Niente da"
	line "fare…"
	done

UnknownText_0x1c0043::
	text "Ehi, ciao! Sono il"
	line "GIUDICE ONOMASTICO"

	para "e valuto i nomi"
	line "dei #MON."

	para "Vuoi che valuti i"
	line "nomi dei tuoi?"
	done

UnknownText_0x1c00a0::
	text "Di quale #MON"
	line "vuoi che valuti"
	cont "il soprannome?"
	prompt

UnknownText_0x1c00cd::
	text "Dunque… @"
	text_ram wStringBuffer1
	text_start
	line "non è male."

	para "Ma che ne dici"
	line "di qualcosa di"
	cont "meglio?"

	para "Vuoi che gli trovi"
	line "un nome migliore?"
	done

UnknownText_0x1c0142::
	text "Va bene. Che nome"
	line "potremmo dargli?"
	prompt

UnknownText_0x1c0171::
	text "È sicuramente"
	line "meglio di prima."

	para "Bel lavoro!"
	done

UnknownText_0x1c019e::
	text "Come vuoi. Torna"
	line "a trovarmi!"
	done

UnknownText_0x1c01be::
	text "Ehm… @"
	text_ram wStringBuffer1
	text "?"
	line "Gran bel nome!"
	cont "È perfetto."

	para "Tratta @"
	text_ram wStringBuffer1
	text_start
	line "con amore!"
	done

UnknownText_0x1c0208::
	text "Ehi… Ma è solo"
	line "un UOVO!"
	done

UnknownText_0x1c0222::
	text "Può sembrare come"
	line "l'altro, ma in"

	para "realtà questo nome"
	line "è molto meglio!"

	para "Bel lavoro!"
	done

UnknownText_0x1c0272::
	text "Va bene. Questo"
	line "#MON ora si"
	cont "chiama @"
	text_ram wStringBuffer1
	text "."
	prompt

Text_Gained::
	text_ram wStringBuffer1
	text " riceve@"
	text_end

Text_ABoostedStringBuffer2ExpPoints::
	text_start
	line "la bellezza di"
	cont "@"
	text_decimal wStringBuffer2, 2, 4
	text " Punti ESP.!"
	prompt

Text_StringBuffer2ExpPoints::
	text_start
	line "@"
	text_decimal wStringBuffer2, 2, 4
	text " Punti ESP."
	prompt

Text_GoMon::
	text "Los! @"
	text_end

Text_DoItMon::
	text "Dai! @"
	text_end

Text_GoForItMon::
	text "Vai,"
	line "@"
	text_end

Text_YourFoesWeakGetmMon::
	text "Nemico debole!"
	line "Dai, @"
	text_end

Text_BattleMonNick01::
	text_ram wBattleMonNick
	text "!"
	done

Text_BattleMonNickComma::
	text_ram wBattleMonNick
	text ",@"
	text_end

Text_ThatsEnoughComeBack::
	text " basta!"
	line "Rientra!@"
	text_end

Text_OKComeBack::
	text " OK!"
	line "Rientra!@"
	text_end

Text_GoodComeBack::
	text " bene!"
	line "Rientra!@"
	text_end

Text_ComeBack::
	text " OK!"
	line "Rientra!@"
	text_end
	done

UnknownText_0x1c0373::
	text "Estratta una MT."
	prompt

UnknownText_0x1c0384::
	text "Estratta una MN."
	prompt

UnknownText_0x1c0396::
	text "Contiene"
	line "@"
	text_ram wStringBuffer2
	text "."

	para "Vuoi insegnare"
	line "@"
	text_ram wStringBuffer2
	text_start
	cont "ad un #MON?"
	done

UnknownText_0x1c03c2::
	text_ram wStringBuffer2
	text " non"
	line "è compatibile con"
	cont "@"
	text_ram wStringBuffer1
	text "."

	para "Non può imparare"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c03fa::
	text "Non hai posto per"
	line "un altro"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0421::
	text "Ricevi"
	line "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UnknownText_0x1c0436::
	text "Collegamento"
	line "annullato."
	prompt

UnknownText_0x1c0454::
	text "Errore di"
	line "comunicazione."
	prompt

UnknownText_0x1c046a::
	text "Devi ritirare DONO"
	line "al CENTRO #MON."
	prompt

UnknownText_0x1c048e::
	text "Il tuo amico non"
	line "è pronto."
	prompt

UnknownText_0x1c04a7::
	text "Mi spiace, solo"
	line "5 DONI al giorno."
	prompt

UnknownText_0x1c04c6::
	text "Mi spiace, un solo"
	line "DONO a testa"
	cont "al giorno."
	prompt

UnknownText_0x1c04e9::
	text_ram wMysteryGiftPartnerName
	text " manda"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c04fa::
	text_ram wMysteryGiftPartnerName
	text " invia"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "a casa di @"
	text_ram wMysteryGiftPlayerName
	text "."
	prompt

UnknownText_0x1c051a::
	text "Ricevuta CARTA di"
	line "@"
	text_ram wc850
	text "."
	prompt

UnknownText_0x1c0531::
	text_ram wc850
	text "'s CARD was"
	line "listed as no.@"
	text_decimal wDeciramBuffer, 1, 2
	text "."
	prompt

UnknownText_0x1c0555::
	text "The CARD was not"
	line "registered."
	prompt

UnknownText_0x1c0573::
	text "Collegamento"
	line "annullato."
	prompt

UnknownText_0x1c0591::
	text "Errore di"
	line "comunicazione."
	prompt

_BadgeRequiredText::
	text "Mi spiace, serve"
	line "un'altra MEDAGLIA."
	prompt

UnknownText_0x1c05c8::
	text "Non si può usare"
	line "qui."
	prompt

UnknownText_0x1c05dd::
	text_ram wStringBuffer2
	text " usa"
	line "TAGLIO!"
	prompt

UnknownText_0x1c05ec::
	text "Non c'è nulla su"
	line "cui usare TAGLIO."
	prompt

UnknownText_0x1c0609::
	text "Un forte FLASH"
	line "illumina l'area!@"
	text_waitbutton
	text_end

	text_end ; unused

_UsedSurfText::
	text_ram wStringBuffer2
	text " usa"
	line "SURF!"
	done

_CantSurfText::
	text "Non puoi usare"
	line "SURF qui."
	prompt

_AlreadySurfingText::
	text "Stai già usando"
	line "SURF."
	prompt

_AskSurfText::
	text "L'acqua è calma."
	line "Vuoi usare SURF?"
	done

UnknownText_0x1c068e::
	text_ram wStringBuffer2
	text " usa"
	line "CASCATA!"
	done

UnknownText_0x1c06a3::
	text "Ma è una"
	line "cascata enorme!"
	done

UnknownText_0x1c06bf::
	text "Vuoi usare"
	line "CASCATA?"
	done

UnknownText_0x1c06de::
	text_ram wStringBuffer2
	text " usa"
	line "FOSSA!"
	done

UnknownText_0x1c06ed::
	text "<PLAYER> usa"
	line "FUNE DI FUGA."
	done

UnknownText_0x1c0705::
	text "Non si può usare"
	line "qui."
	done

UnknownText_0x1c071a::
	text "Torna all'ultimo"
	line "CENTRO #MON."
	done

UnknownText_0x1c073b::
	text "Non si può usare"
	line "qui."
	done

UnknownText_0x1c0751::
	text "Un #MON sta già"
	line "usando FORZA."
	prompt

UnknownText_0x1c0774::
	text_ram wStringBuffer2
	text " usa"
	line "FORZA!"
	done

UnknownText_0x1c0788::
	text_ram wStringBuffer1
	text " può"
	line "spostare i massi."
	prompt

UnknownText_0x1c07a0::
	text "Forse un #MON"
	line "può spostarlo."

	para "Vuoi usare"
	line "FORZA?"
	done

UnknownText_0x1c07d8::
	text "Ora è possibile"
	line "spostare i massi!"
	done

UnknownText_0x1c07f4::
	text "Forse un #MON"
	line "è in grado di"
	cont "spostarlo."
	done

UnknownText_0x1c0816::
	text_ram wStringBuffer2
	text " usa"
	line "MULINELLO!"
	prompt

UnknownText_0x1c082b::
	text "È un insidioso"
	line "mulinello."

	para "Forse un #MON"
	line "può attraversarlo."
	done

UnknownText_0x1c0864::
	text "C'è un mulinello"
	line "davanti a te."

	para "Vuoi usare"
	line "MULINELLO?"
	done

UnknownText_0x1c0897::
	text_ram wStringBuffer2
	text " usa"
	line "BOTTINTESTA!"
	prompt

UnknownText_0x1c08ac::
	text "Niente…"
	done

UnknownText_0x1c08bc::
	text "Potrebbe esserci"
	line "un #MON "
	cont "nell'albero."

	para "Vuoi usare"
	line "BOTTINTESTA?"
	done

UnknownText_0x1c08f0::
	text_ram wStringBuffer2
	text " usa"
	line "SPACCAROCCIA!"
	prompt

UnknownText_0x1c0906::
	text "Forse un #MON"
	line "è in grado di"
	cont "frantumarla."
	done

UnknownText_0x1c0924::
	text "Questa roccia si"
	line "può frantumare."

	para "Vuoi usare"
	line "SPACCAROCCIA?"
	done

UnknownText_0x1c0958::
	text "Ehi!"
	line "Ha abboccato!"
	prompt

UnknownText_0x1c0965::
	text "Neanche una"
	line "vecchia ciabatta!"
	prompt

UnknownText_0x1c0979::
	text "Sembra che non ci"
	line "sia niente qua."
	prompt

UnknownText_0x1c099a::
	text "Non puoi scendere"
	line "qui!"
	done

UnknownText_0x1c09b2::
	text "<PLAYER> sale su"
	line "@"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c09c7::
	text "<PLAYER> scende "
	line "da @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c09dd::
	text "L'albero si può"
	line "tagliare (TAGLIO)."

	para "Vuoi usare TAGLIO?"
	done

UnknownText_0x1c0a05::
	text "L'albero si può"
	line "tagliare (TAGLIO)."
	done

UnknownText_0x1c0a1c::
	text "<PLAYER> trova"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

UnknownText_0x1c0a2c::
	text "Ma <PLAYER> non"
	line "può trasportare"
	cont "altri strumenti."
	done

UnknownText_0x1c0a4e::
	text "<PLAYER> non ha più"
	line "#MON utili!"

	para "<PLAYER> è fuori"
	line "combattimento!"
	done

UnknownText_0x1c0a77::
	text "Bene! Il DETECTOR"
	line "ha rilevato uno"
	cont "strumento vicino."
	prompt

UnknownText_0x1c0aa9::
	text "No! Il DETECTOR"
	line "non risponde."
	prompt

UnknownText_0x1c0acc::
	text_ram wStringBuffer3
	text_start
	line "è esausto!"
	prompt

UnknownText_0x1c0ada::
	text "<PLAYER> non ha più"
	line "#MON utili!"

	para "<PLAYER> è fuori"
	line "combattimento!"
	prompt

UnknownText_0x1c0b03::
	text_ram wStringBuffer3
	text_start
	line "usa PROFUMINO!"
	done

UnknownText_0x1c0b1a::
	text "Pare che non ci"
	line "sia nulla qui…"
	done

UnknownText_0x1c0b3b::
	text "<PLAYER> spruzza"
	line "dell'acqua."

	para "Ma non accade"
	line "nulla…"
	done

UnknownText_0x1c0b65::
	text "I #MON di"
	line "<PLAYER> sono"
	cont "guariti!"
	done

Text_AnEGGCantHoldAnItem::
	text "Un UOVO non può"
	line "tenere strumenti."
	prompt

UnknownText_0x1c0b9a::
	text "Nessuno strumento."
	done

UnknownText_0x1c0ba5::
	text "Quantità da"
	line "buttare?"
	done

UnknownText_0x1c0bbb::
	text "Buttare @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c0bd8::
	text "Hai buttato"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c0bee::
	text "OAK: <PLAYER>!"
	line "Questo non è il"
	cont "momento adatto!"
	prompt

Text_YouDontHaveAMon::
	text "Non hai #MON!"
	prompt

UnknownText_0x1c0c2e::
	text "Assegnato:"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c0c45::
	text "Strumento non"
	line "assegnabile."
	prompt

UnknownText_0x1c0c63::
	text "Dove vuoi"
	line "spostarlo?"
	done

UnknownText_0x1c0c83::
	text_start
	done

Text_YouCantUseItInABattle::
	text "Non si può usare"
	line "durante la lotta."
	prompt

Text_AreYouABoyOrAreYouAGirl::
	text "Sei un bambino o"
	line "una bambina?"
	done

UnknownText_0x1c0cc6::
	text_ram wStringBuffer2
	text " di"
	line "<USER>"

	text_end ; unused

UnknownText_0x1c0cd0::
	text_pause
	text "<SCROLL>sale di molto!@"
	text_end
	prompt

UnknownText_0x1c0ce0::

	cont "sale!"
	prompt

UnknownText_0x1c0ceb::
	text_ram wStringBuffer2
	text " di"
	line "<TARGET>"

	text_end ; unused

UnknownText_0x1c0cf5::
	text_pause
	text "<SCROLL>cala di molto!@"
	text_end
	prompt

UnknownText_0x1c0d06::

	cont "cala!"
	prompt

UnknownText_0x1c0d0e::
	text "<USER>@"
	text_end

UnknownText_0x1c0d12::
	text_start
	line "genera un turbine!"
	prompt

UnknownText_0x1c0d26::
	text_start
	line "assorbe la luce!"
	prompt

UnknownText_0x1c0d3a::
	text_start
	line "abbassa la testa!"
	prompt

UnknownText_0x1c0d4e::
	text_start
	line "sta brillando!"
	prompt

UnknownText_0x1c0d5c::
	text_start
	line "è volato in alto!"
	prompt

UnknownText_0x1c0d6c::
	text_start
	line "scava una fossa!"
	prompt

_ActorNameText::
	text "<USER>@"
	text_end

_UsedMove1Text::
	text_start
	line "usa @"
	text_end

_UsedMove2Text::
	text_start
	line "usa @"
	text_end

_UsedInsteadText::
	text "invece,"
	cont ""

_MoveNameText::
	text_ram wStringBuffer2
	text_end

	text_end ; unused

_EndUsedMove1Text::
	text "!"
	done

_EndUsedMove2Text::
	text "!"
	done

_EndUsedMove3Text::
	text "!"
	done

_EndUsedMove4Text::
	text "!"
	done

_EndUsedMove5Text::
	text "!"
	done

UnknownText_0x1c0db0::
	text "Eh?"

	para "@"
	text_end

UnknownText_0x1c0db8::
	text_start
	done

UnknownText_0x1c0dba::
	text_ram wStringBuffer1
	text " came"
	line "out of its EGG!@"
	sound_caught_mon
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c0dd8::
	text "Vuoi dare un"
	line "soprannome a"
	cont "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c0df3::
	text "È @"
	text_ram wBreedMon2Nick
	text ","
	line "che hai lasciato"
	cont "con la PADRONA"
	cont "DELLA PENSIONE."
	done

UnknownText_0x1c0e24::
	text "È @"
	text_ram wBreedMon1Nick
	text ","
	line "che hai lasciato"
	cont "con il PADRONE"
	cont "DELLA PENSIONE."
	done

UnknownText_0x1c0e54::
	text "È pieno di"
	line "energia."
	prompt

UnknownText_0x1c0e6f::
	text "Nessun interesse"
	line "per @"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0e8d::
	text "Sembra interessato"
	line "a @"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0eac::
	text "È amichevole con"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c0ec6::
	text "Mostra interesse"
	line "per @"
	text_ram wStringBuffer1
	text "."
	prompt

_EmptyMailboxText::
	text "Qui non c'è alcun"
	line "MESSAGGIO."
	prompt

ClearedMailPutAwayText::
	text "Il MESSAGGIO "
	line "cancellato è stato"
	cont "messo via."
	prompt

MailPackFullText::
	text "Lo ZAINO è pieno."
	prompt

MailMessageLostText::
	text "Il contenuto del"
	line "MESSAGGIO andrà"
	cont "perso. Continui?"
	done

MailAlreadyHoldingItemText::
	text "Tiene già uno"
	line "strumento."
	prompt

MailEggText::
	text "Un UOVO non può"
	line "tenere un"
	cont "MESSAGGIO."
	prompt

MailMovedFromBoxText::
	text "Tolto il MESSAGGIO"
	line "dal BOX MESSAGGI."
	prompt

UnknownText_0x1c0fb3::
	text "Sì"
	prompt

UnknownText_0x1c0fb8::
	text "No"
	prompt

UnknownText_0x1c0fbc::
	text_decimal wcf64, 1, 3
	text " @"
	text_ram wStringBuffer1
	text_start
	line "Animation type @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c0fdd::
	text "#MON number?"
	done

Text_WasSentToBillsPC::
	text_ram wStringBuffer1
	text " inviato"
	line "al PC di BILL."
	prompt

UnknownText_0x1c1006::
	text "Devi avere dei"
	line "#MON per"
	cont "chiamare!"
	prompt

UnknownText_0x1c1024::
	text "Come?"
	done

UnknownText_0x1c102b::
	text "Un #MON ha"
	line "un MESSAGGIO."

	para "Rimuovi il"
	line "MESSAGGIO."
	prompt

UnknownText_0x1c1062::
	text "Non hai neanche"
	line "un #MON!"
	prompt

UnknownText_0x1c1080::
	text "Non puoi: è il tuo"
	line "ultimo #MON."
	prompt

UnknownText_0x1c10a2::
	text "Non puoi portare"
	line "altri #MON."
	prompt

UnknownText_0x1c10c0::
	text "Preso @"
	text_ram wStringBuffer1
	text "!"
	prompt

UnknownText_0x1c10cf::
	text "Spostare #MON?"
	done

UnknownText_0x1c10dd::
	text "Hai già un"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

ContestJudging_FirstPlaceText::
	text "Vince la Gara"
	line "Pigliamosche@"
	text_pause
	text "…"

	para "@"
	text_ram wBugContestWinnerName
	text ","
	line "che ha catturato"
	cont "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_FirstPlaceScoreText::
	text_start

	para "Il vincitore ha"
	line "@"
	text_decimal wBugContestFirstPlaceScore, 2, 3
	text " punti!"
	prompt

ContestJudging_SecondPlaceText::
	text "Al secondo posto è"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "che ha preso"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_SecondPlaceScoreText::
	text_start

	para "Ha totalizzato"
	line "@"
	text_decimal wBugContestSecondPlaceScore, 2, 3
	text " punti!"
	prompt

ContestJudging_ThirdPlaceText::
	text "Al terzo posto c'è"
	line "@"
	text_ram wBugContestWinnerName
	text ","

	para "che ha preso"
	line "@"
	text_ram wStringBuffer1
	text "!@"
	text_end

ContestJudging_ThirdPlaceScoreText::
	text_start

	para "Ha totalizzato"
	line "@"
	text_decimal wBugContestThirdPlaceScore, 2, 3
	text " punti!"
	prompt

UnknownText_0x1c1203::
	text "Fammi misurare"
	line "quel MAGIKARP."

	para "… Misura"
	line "@"
	text_ram wStringBuffer1
	text " cm."
	prompt

UnknownText_0x1c123a::
	text "CURRENT RECORD"

	para "@"
	text_ram wStringBuffer1
	text " caught by"
	line "@"
	text_ram wMagikarpRecordHoldersName
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c1261::
	text "Complimenti!"

	para "C'è corrispondenza"
	line "con il num. d'id."

	para "di @"
	text_ram wStringBuffer1
	text ","
	line "della tua squadra."
	prompt

UnknownText_0x1c12ae::
	text "Complimenti!"

	para "C'è corrispondenza"
	line "con il num. d'id."

	para "di @"
	text_ram wStringBuffer1
	text_start
	line "nel tuo BOX PC."
	prompt

UnknownText_0x1c12fc::
	text "Dai un soprannome"
	line "a @"
	text_ram wStringBuffer1
	text_start
	cont "che hai ricevuto?"
	done

UnknownText_0x1c1328::
	text "Ehi! Devi avere un"
	line "#MON per"
	cont "usare questo!"
	prompt

UnknownText_0x1c1353::
	text "<PLAYER> accende"
	line "il PC."
	prompt

UnknownText_0x1c1368::
	text "Che cosa vuoi"
	line "fare?"
	done

_PlayersPCHowManyWithdrawText::
	text "Quantità da"
	line "ritirare?"
	done

_PlayersPCWithdrewItemsText::
	text "Operazione"
	line "completata."
	prompt

_PlayersPCNoRoomWithdrawText::
	text "Non hai spazio per"
	line "altri strumenti."
	prompt

UnknownText_0x1c13df::
	text "Non hai strumenti"
	line "da depositare."
	prompt

_PlayersPCHowManyDepositText::
	text "Quantità da"
	line "depositare?"
	done

_PlayersPCDepositItemsText::
	text "Operazione"
	line "completata."
	prompt

_PlayersPCNoRoomDepositText::
	text "Non c'è spazio per"
	line "altri strumenti."
	prompt

UnknownText_0x1c144d::
	text "<PLAYER> accende"
	line "il PC."
	prompt

UnknownText_0x1c1462::
	text "A quale PC"
	line "vuoi accedere?"
	done

UnknownText_0x1c1474::
	text "Accesso al"
	line "PC di BILL."

	para "Aperto il Sistema"
	line "Memoria #MON."
	prompt

UnknownText_0x1c14a4::
	text "Accesso al tuo PC."

	para "Aperto il Sistema"
	line "Memoria Strumenti."
	prompt

UnknownText_0x1c14d2::
	text "Accesso al PC del"
	line "PROF.OAK."

	para "Aperto il Sistema"
	line "Valutaz. #DEX."
	prompt

UnknownText_0x1c1505::
	text "…"
	line "Fine collegamento…"
	done

_OakPCText1::
	text "Vuoi far valutare"
	line "il tuo #DEX?"
	done

_OakPCText2::
	text "Attuale livello di"
	line "completamento del"
	cont "#DEX:"
	prompt

_OakPCText3::
	text "#MON visti: @"
	text_ram wStringBuffer3
	text_start
	line "#MON presi: @"
	text_ram wStringBuffer4
	text_start

	para "Valutazione del"
	line "PROF.OAK:"
	done

_OakRating01::
	text "Cerca i #MON"
	line "nelle aree erbose!"
	done

_OakRating02::
	text "Bene, vedo che hai"
	line "capito come usare"
	cont "le # BALL."
	done

_OakRating03::
	text "Stai facendo"
	line "progressi. Ma devi"

	para "fare ancora molta"
	line "strada."
	done

_OakRating04::
	text "Devi riempire il"
	line "#DEX."

	para "Cattura #MON"
	line "di diverso tipo!"
	done

_OakRating05::
	text "Ti impegni, si"
	line "vede."

	para "Il tuo #DEX sta"
	line "prendendo forma."
	done

_OakRating06::
	text "Certi #MON si"
	line "evolvono crescendo"

	para "di livello, altri"
	line "usando le PIETRE."
	done

_OakRating07::
	text "Hai un AMO?"
	line "Pescando puoi"

	para "catturare dei"
	line "#MON."
	done

_OakRating08::
	text "Eccellente! Ti"
	line "piacciono le"
	cont "collezioni, vero?"
	done

_OakRating09::
	text "Certi #MON si"
	line "fanno vedere solo"

	para "in determinate ore"
	line "del giorno."
	done

_OakRating10::
	text "Il tuo #DEX sta"
	line "facendo progressi:"
	cont "continua così!"
	done

_OakRating11::
	text "Bene, vedo che fai"
	line "evolvere i #MON"

	para "senza limitarti a"
	line "cacciarli."
	done

_OakRating12::
	text "Hai già incontrato"
	line "FRANZ? Le sue #"
	cont "BALL potrebbero"
	cont "servirti."
	done

_OakRating13::
	text "Ehi! Hai catturato"
	line "più #MON tu"

	para "che nell'ultima"
	line "ricerca #DEX!"
	done

_OakRating14::
	text "Scambi i tuoi"
	line "#MON?"

	para "È dura farcela"
	line "da soli!"
	done

_OakRating15::
	text "Hai raggiunto i"
	line "200! Il tuo"
	cont "#DEX è super!"
	done

_OakRating16::
	text "Hai catturato"
	line "tanti #MON!"
	cont "Stai dando un"

	para "grande aiuto"
	line "ai miei studi!"
	done

_OakRating17::
	text "Magnifico!"
	line "Vedo che conosci i"
	cont "#MON alla"
	cont "perfezione!"
	done

_OakRating18::
	text "Il tuo #DEX è"
	line "impressionante!"

	para "Potresti davvero"
	line "diventare"
	cont "professionista."
	done

_OakRating19::
	text "Ma questo è un"
	line "#DEX perfetto!"

	para "È sempre stato il"
	line "mio sogno."
	cont "Complimenti!"
	done

_OakPCText4::
	text "Collegamento con"
	line "il PC del PROF."
	cont "OAK terminato."
	done

UnknownText_0x1c19cd::
	text "Triple-theme"
	line "trainer ranking!"

	para "The SAVE file you"
	line "just sent might"
	cont "make the rankings!"

	para ""
	done

UnknownText_0x1c1a22::
	text "There is no"
	line "ranking data."

	para "Link to obtain"
	line "ranking data."

	para ""
	done

UnknownText_0x1c1a5b::
	text ", sì!"
	done

UnknownText_0x1c1a65::
	text "Acc…"
	done

UnknownText_0x1c1a6c::
	text "Vuoi terminare la"
	line "gara?"
	done

UnknownText_0x1c1a90::
	text "Quantità da"
	line "buttare?"
	done

UnknownText_0x1c1aad::
	text "Buttare @"
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text_start
	line "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c1aca::
	text "Operazione"
	line "completata."
	prompt

UnknownText_0x1c1adf::
	text "Troppo importante"
	line "per disfarsene!"
	prompt

UnknownText_0x1c1b03::
	text "OAK: <PLAYER>!"
	line "Questo non è il"
	cont "momento adatto!"
	done

UnknownText_0x1c1b2c::
	text "Preso(a)"
	line "@"
	text_ram wStringBuffer1
	text_start
	cont "da @"
	text_ram wMonOrItemNameBuffer
	text " e"

	para "sostituito(a) con"
	line "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c1b57::
	text_ram wMonOrItemNameBuffer
	text " tiene"
	line "@"
	text_ram wStringBuffer2
	text " ora."
	prompt

UnknownText_0x1c1b6f::
	text "Prima devi"
	line "togliere il"
	cont "MESSAGGIO!"
	prompt

UnknownText_0x1c1b8e::
	text_ram wMonOrItemNameBuffer
	text " non"
	line "sta tenendo nulla."
	prompt

UnknownText_0x1c1baa::
	text "Non hai più spazio"
	line "per gli strumenti."
	prompt

UnknownText_0x1c1bc4::
	text "Togli @"
	text_ram wStringBuffer1
	text_start
	line "a @"
	text_ram wMonOrItemNameBuffer
	text "."
	prompt

UnknownText_0x1c1bdc::
	text_ram wMonOrItemNameBuffer
	text_start
	line "tiene già"

	para "@"
	text_ram wStringBuffer1
	text "."
	line "Sostituire?"
	done

UnknownText_0x1c1c09::
	text "Questo strumento"
	line "non si può tenere."
	prompt

UnknownText_0x1c1c22::
	text "Il MESSAGGIO per-"
	line "derà il contenuto."
	cont "Proseguire?"
	done

UnknownText_0x1c1c47::
	text "Preso MESSAGGIO da"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c1c62::
	text "Non c'è spazio per"
	line "spostare il"
	cont "MESSAGGIO."
	prompt

UnknownText_0x1c1c86::
	text "Vuoi spedire il"
	line "MESSAGGIO"
	cont "al tuo PC?"
	done

UnknownText_0x1c1ca9::
	text "Il BOX MESSAGGI"
	line "del PC è pieno."
	prompt

UnknownText_0x1c1cc4::
	text "MESSAGGIO spedito"
	line "al tuo PC."
	prompt

UnknownText_0x1c1ce3::
	text "PS insufficienti!"
	prompt

UnknownText_0x1c1cf3::
	text "Puoi assegnare uno"
	line "strumento dello"
	cont "ZAINO a SELECT."
	done

_OakText1::
	text "Ciao! Scusa se"
	line "ti ho fatto"
	cont "attendere."

	para "Questo è il mondo"
	line "dei #MON!"

	para "Mi chiamo OAK."

	para "Ma per tutti sono"
	line "PROF.#MON."
	prompt

_OakText2::
	text "Questo mondo è"
	line "abitato da"
	cont "creature che"
	cont "chiamiamo #MON.@"
	text_end

_OakText3::
	text_waitbutton
	text_end

	text_end ; unused

_OakText4::
	text "I #MON e gli"
	line "umani convivono"

	para "aiutandosi a"
	line "vicenda."

	para "Alcuni giocano con"
	line "i #MON, altri"
	cont "li fanno lottare."
	prompt

_OakText5::
	text "Ma sappiamo ancora"
	line "troppo poco sui"
	cont "#MON."

	para "Molti misteri"
	line "devono ancora"
	cont "essere svelati."

	para "Per questo studio"
	line "i #MON tutti"
	cont "i giorni."
	prompt
