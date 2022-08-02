_OakText6::
	text "Come hai detto"
	line "che ti chiami?"
	prompt

_OakText7::
	text "<PLAYER>, vuoi"
	line "iniziare?"

	para "Stai per scrivere"
	line "la tua personalis-"
	cont "sima storia nel"
	cont "mondo dei"
	cont "#MON."

	para "Vivrai esperienze"
	line "divertenti e"
	cont "affronterai"
	cont "impegnative sfide."

	para "Con i #MON ti"
	line "attende un mondo"

	para "di sogno"
	line "e avventura."
	cont "Cosa aspetti?"

	para "Ci vediamo fra un"
	line "po'!"
	done

UnknownText_0x1c40e6::
	text "L'ora potrebbe"
	line "essere sbagliata."

	para "Regola di nuovo"
	line "l'orologio."
	prompt

UnknownText_0x1c411c::
	text "Regola con la"
	line "pulsantiera di"
	cont "comando."

	para "Conferma: A"
	line "Annulla: B"
	done

UnknownText_0x1c415b::
	text "È ok?"
	done

UnknownText_0x1c4168::
	text "Hai regolato"
	line "l'orologio."
	done

UnknownText_0x1c4183::
	text "È trascorso"
	line "troppo tempo."
	cont "Riprova."
	prompt

UnknownText_0x1c41b1::
	text "Se scambi quel"
	line "#MON non"
	cont "potrai lottare."
	prompt

UnknownText_0x1c41e6::
	text_ram wStringBuffer1
	text_start
	line "del tuo amico"
	cont "sembra irregolare."
	prompt

UnknownText_0x1c4212::
	text "Scambi @"
	text_ram wd004
	text_start
	line "per @"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c422a::
	text "To enter a mobile"
	line "battle, you must"

	para "pick a team of"
	line "three #MON."

	para "Is that OK?"
	done

UnknownText_0x1c4275::
	text "Need more info on"
	line "mobile battles?"
	done

UnknownText_0x1c4298::
	text "For a mobile"
	line "battle, choose"
	cont "three #MON."

	para "The maximum daily"
	line "play time is ten"

	para "minutes for each"
	line "linked player."

	para "If a battle isn't"
	line "finished within"

	para "the time limit,"
	line "the player with"

	para "the fewest fainted"
	line "#MON wins."

	para "If tied, the team"
	line "that lost the"

	para "least amount of HP"
	line "wins."
	done

UnknownText_0x1c439c::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."

	para "Would you like to"
	line "battle?"
	done

UnknownText_0x1c43dc::
	text "There are only @"
	text_decimal wStringBuffer2, 1, 2
	text_start
	line "min. left today."

	para "Want a quick"
	line "battle?"
	done

UnknownText_0x1c4419::
	text "There is only"
	line "1 min. left today!"

	para "Want to rush"
	line "through a battle?"
	done

UnknownText_0x1c445a::
	text "There is less than"
	line "1 min. left today!"

	para "Please try again"
	line "tomorrow."
	done

UnknownText_0x1c449c::
	text "Try again using"
	line "the same settings?"
	done

UnknownText_0x1c44c0::
	text "There is less than"
	line "1 min. left today!"
	done

UnknownText_0x1c44e7::
	text "No time left for"
	line "linking today."
	done

UnknownText_0x1c4508::
	text "Scegli tre #MON"
	line "per lottare."
	done

UnknownText_0x1c4525::
	text "Today's remaining"
	line "time is @"
	text_decimal wStringBuffer2, 1, 2
	text " min."
	done

UnknownText_0x1c454b::
	text "Vuoi salvare il"
	line "gioco?"
	done

UnknownText_0x1c456d::
	text "SALVATAGGIO…"
	line "NON SPEGNERE."
	done

UnknownText_0x1c4590::
	text "<PLAYER> ha"
	line "salvato il gioco."
	done

UnknownText_0x1c45a3::
	text "C'è già un gioco"
	line "salvato in"
	cont "memoria. Vuoi"
	cont "sostituirlo?"
	done

UnknownText_0x1c45d9::
	text "C'è già un file di"
	line "salvataggio. Vuoi"
	cont "sostituirlo?"
	done

UnknownText_0x1c460d::
	text "Il file di"
	line "salvataggio è"
	cont "danneggiato!"
	prompt

UnknownText_0x1c462a::
	text "Quando cambi "
	line "BOX #MON i"
	cont "dati vengono"
	cont "salvati. Va bene?"
	done

UnknownText_0x1c465f::
	text "Quando sposti un"
	line "#MON i dati"
	cont "vengono salvati."
	cont "Va bene?"
	done

UnknownText_0x1c4693::
	text "La finestra di"
	line "area was exceeded."
	done

UnknownText_0x1c46b7::
	text "No windows avail-"
	line "able for popping."
	done

UnknownText_0x1c46dc::
	text "Corrupted event!"
	prompt

_ObjectEventText::
	text "Object event."
	done

UnknownText_0x1c46fc::
	text "BG event"
	done

UnknownText_0x1c4706::
	text "Coordinates event"
	done

UnknownText_0x1c4719::
	text "<PLAYER> riceve"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

UnknownText_0x1c472c::
	text "<PLAYER> mette"
	line "@"
	text_ram wStringBuffer1
	text " nella"
	cont "@"
	text_ram wStringBuffer3
	text "."
	prompt

UnknownText_0x1c474b::
	text "La @"
	text_ram wStringBuffer3
	text_start
	line "è piena…"
	text_pause
	prompt

UnknownText_0x1c475f::
	text "Vedo tutto."
	line "So tutto…"

	para "Soprattutto,"
	line "conosco i tuoi"
	cont "#MON!"
	done

UnknownText_0x1c4797::
	text "Ma come?! Non"
	line "vedo nulla!"

	para "Non ci posso"
	line "credere!"
	done

UnknownText_0x1c47d4::
	text "Vedo… vedo…"
	line "Hai trovato"

	para "@"
	text_ram wSeerNickname
	text " qui:"
	line "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

UnknownText_0x1c47fa::
	text "Era"
	line "@"
	text_ram wSeerTimeOfDay
	text "!"

	para "Il suo livello era"
	line "@"
	text_ram wSeerCaughtLevelString
	text "!"

	para "Sono brava, vero?"
	prompt

UnknownText_0x1c4837::
	text_ram wSeerOTName
	text " ti ha"
	line "dato @"
	text_ram wSeerNickname
	text_start
	cont "in uno scambio?"

	para "@"
	text_ram wSeerOTName
	text " aveva"
	line "trovato @"
	text_ram wSeerNickname
	text_start
	cont "qui:"
	cont "@"
	text_ram wSeerCaughtLocation
	text "!"
	prompt

UnknownText_0x1c487f::
	text "Incredibile!"

	para "Non so perché, ma"
	line "penso che tu sia"

	para "un tipo davvero"
	line "speciale."

	para "Non so dove l'hai"
	line "trovato, ma il suo"
	cont "livello era @"
	text_ram wSeerCaughtLevelString
	text "."

	para "Sono brava, vero?"
	prompt

UnknownText_0x1c491d::
	text "Ehi!"

	para "Ma è un UOVO!"

	para "Come faccio a"
	line "dirti dove l'hai"
	cont "trovato?"
	done

UnknownText_0x1c4955::
	text "Fufufu! Vedo che"
	line "non farai nulla!"
	done

UnknownText_0x1c497a::
	text "A proposito…"

	para "Dovresti avere"
	line "un po' più di"

	para "attenzione per i"
	line "tuoi #MON."
	done

UnknownText_0x1c49c6::
	text "A proposito…"

	para "Vedo che è"
	line "cresciuto un po'."

	para "@"
	text_ram wSeerNickname
	text " sembra"
	line "un po' più sicuro"
	cont "di sé."
	done

UnknownText_0x1c4a21::
	text "A proposito…"

	para "@"
	text_ram wSeerNickname
	text " è"
	line "cresciuto. Ora è"
	cont "molto più forte."
	done

UnknownText_0x1c4a5b::
	text "A proposito…"

	para "È cresciuto"
	line "parecchio!"

	para "Questo @"
	text_ram wSeerNickname
	text_start
	line "deve aver vinto"

	para "parecchie lotte di"
	line "#MON!"

	para "Sembra davvero"
	line "sicuro di sé."
	done

UnknownText_0x1c4ae5::
	text "A proposito…"

	para "Hai fatto un"
	line "ottimo lavoro!"

	para "Era da tanto che"
	line "non vedevo"

	para "un #MON così"
	line "forte come il tuo"
	cont "@"
	text_ram wSeerNickname
	text "."

	para "Veder lottare"
	line "@"
	text_ram wSeerNickname
	text_start

	para "dev'essere una"
	line "grande esperienza!"
	done

UnknownText_0x1c4b92::
	text "Complimenti! Il"
	line "tuo @"
	text_ram wStringBuffer2
	text_end

	text_end ; unused

UnknownText_0x1c4baf::
	text_start

	para "si è evoluto in"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

UnknownText_0x1c4bc5::
	text "Bloccata evoluzio-"
	line "ne di @"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c4be3::
	text "Cosa?! @"
	text_ram wStringBuffer2
	text_start
	line "si sta evolvendo!"
	done

UnknownText_0x1c4bfd::
	text "Quanti/e?"
	done

UnknownText_0x1c4c08::
	text_ram wStringBuffer2
	text ":"
	line "in tutto fa"
	cont "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4c28::
	text "Ciao!"

	para "Vendo erbe"
	line "medicinali a"
	cont "basso prezzo."

	para "Fanno bene, ma"
	line "sono un po' amare."

	para "Forse ai #MON"
	line "non piaceranno."

	para "Eheheh…"
	done

UnknownText_0x1c4ca3::
	text "Quanti/e?"
	done

UnknownText_0x1c4cae::
	text_ram wStringBuffer2
	text ":"
	line "in tutto fa"
	cont "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4cce::
	text "Grazie!"
	line "Eheheh…"
	done

UnknownText_0x1c4cea::
	text "Oh, il tuo ZAINO"
	line "è pieno."
	done

UnknownText_0x1c4d08::
	text "Eheheh… Non hai"
	line "abbastanza soldi."
	done

UnknownText_0x1c4d2a::
	text "Torna a trovarmi."
	line "Eheheh…"
	done

UnknownText_0x1c4d47::
	text "Ehi, vuoi fare un"
	line "affare?"

	para "Vendo strumenti"
	line "che ho solo io, ma"

	para "solo un esemplare"
	line "per ognuno."
	done

UnknownText_0x1c4db0::
	text_ram wStringBuffer2
	text " costa"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text ". Va bene?"
	done

UnknownText_0x1c4dcd::
	text "Grazie."
	done

UnknownText_0x1c4dd6::
	text "Ops, il tuo ZAINO"
	line "è pieno zeppo."
	done

UnknownText_0x1c4df7::
	text "Hai già acquistato"
	line "questo strumento."
	cont "Non ne ho più."
	done

UnknownText_0x1c4e28::
	text "Ops, sei a corto"
	line "di denaro."
	done

UnknownText_0x1c4e46::
	text "Torna a trovarmi"
	line "quando vuoi."
	done

UnknownText_0x1c4e5f::
	text "Che c'è? Vuoi"
	line "qualche medicina?"
	done

UnknownText_0x1c4e7e::
	text "Quanti/e?"
	done

UnknownText_0x1c4e89::
	text_decimal wItemQuantityChangeBuffer, 1, 2
	text " @"
	text_ram wStringBuffer2
	text ":"
	line "spendi ¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."
	done

UnknownText_0x1c4eab::
	text "Grazie mille!"
	done

UnknownText_0x1c4eb9::
	text "Non hai abbastanza"
	line "spazio."
	done

UnknownText_0x1c4ed8::
	text "Come? Non hai"
	line "abbastanza soldi."
	done

UnknownText_0x1c4ef6::
	text "Ok."
	line "Ci si vede."
	done

UnknownText_0x1c4f12::
	text "Non hai nulla da"
	line "vendere."
	prompt

UnknownText_0x1c4f33::
	text "Quanti/e?"
	done

UnknownText_0x1c4f3e::
	text "Posso darti"
	line "¥@"
	text_decimal hMoneyTemp, 3, 6
	text "."

	para "Che ne dici?"
	done

UnknownText_0x1c4f62::
	text "Salve, cosa posso"
	line "fare per te?"
	done

UnknownText_0x1c4f80::
	text "Ecco qui."
	line "Grazie."
	done

UnknownText_0x1c4f9a::
	text "Non hai abbastanza"
	line "denaro."
	done

UnknownText_0x1c4fb7::
	text "Non puoi portare"
	line "altri strumenti."
	done

UnknownText_0x1c4fd7::
	text "Non posso comprare"
	line "questo strumento."
	prompt

UnknownText_0x1c4ff9::
	text "Torna a trovarmi!"
	done

UnknownText_0x1c500d::
	text "Cos'altro posso"
	line "fare per te?"
	done

UnknownText_0x1c502e::
	text "Ricevuti ¥@"
	text_decimal hMoneyTemp, 3, 6
	text_start
	line "per @"
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c5049::
	text "Quanto vuoi"
	line "puntare?"
	done

UnknownText_0x1c505e::
	text "Partenza!"
	done

UnknownText_0x1c5066::
	text "Non hai abbastanza"
	line "gettoni."
	prompt

UnknownText_0x1c5079::
	text "Acc… Non"
	line "hai più gettoni…"
	done

UnknownText_0x1c5092::
	text "Rigiochi?"
	done

UnknownText_0x1c509f::
	text "allineati!"
	line "@"
	text_ram wStringBuffer2
	text " gettoni!"
	done

UnknownText_0x1c50bb::
	text "Che sfortuna!"
	done

_MobileStadiumEntryText::
	text "Data for use in"
	line "the MOBILE STADIUM"

	para "of the N64 #MON"
	line "STADIUM 2 can be"
	cont "read here."

	para "Read the data?"
	done

_MobileStadiumSuccessText::
	text "Data transfer is"
	line "complete."

	para "We hope you enjoy"
	line "MOBILE STADIUM"

	para "battles in the N64"
	line "#MON STADIUM 2."

	para ""
	done

UnknownText_0x1c5182::
	text "Ora sconosciuta"
	done

UnknownText_0x1c5196::
	text "Delete the saved"
	line "LOG-IN PASSWORD?"
	done

UnknownText_0x1c51b9::
	text "Deleted the LOG-IN"
	line "PASSWORD."
	done

UnknownText_0x1c51d7::
	text "Scegli tre #MON"
	line "per lottare."
	prompt

UnknownText_0x1c51f4::
	text_ram wMobileParticipant1Nickname
	text ","
	line "@"
	text_ram wMobileParticipant2Nickname
	text " e"
	cont "@"
	text_ram wMobileParticipant3Nickname
	text "."

	para "Usi questi tre?"
	done

UnknownText_0x1c521c::
	text "Devi avere"
	line "esattamente tre"
	cont "#MON."
	prompt

UnknownText_0x1c5238::
	text "The CARD FOLDER"
	line "stores your and"

	para "your friends'"
	line "CARDS."

	para "A CARD contains"
	line "information like"

	para "the person's name,"
	line "phone number and"
	cont "profile."

	para ""
	done

UnknownText_0x1c52bc::
	text "This is your CARD."

	para "Once you've"
	line "entered your phone"

	para "number, you can"
	line "trade CARDS with"
	cont "your friends."

	para ""
	done

UnknownText_0x1c531e::
	text "If you have your"
	line "friend's CARD, you"

	para "can use it to make"
	line "a call from a"

	para "mobile phone on"
	line "the 2nd floor of a"
	cont "#MON CENTER."

	para ""
	done

UnknownText_0x1c5394::
	text "To safely store"
	line "your collection of"

	para "CARDS, you must"
	line "set a PASSCODE for"
	cont "your CARD FOLDER."

	para ""
	done

UnknownText_0x1c53ee::
	text "If the CARD FOLDER"
	line "is deleted, all"

	para "its CARDS and the"
	line "PASSCODE will also"
	cont "be deleted."

	para "Beware--a deleted"
	line "CARD FOLDER can't"
	cont "be restored."

	para "Want to delete"
	line "your CARD FOLDER?"
	done

UnknownText_0x1c5494::
	text "Vuoi davvero"
	line "cancellarlo?"
	done

UnknownText_0x1c54b9::
	text "The CARD FOLDER"
	line "has been deleted."

	para ""
	done

UnknownText_0x1c54dd::
	text "There is an older"
	line "CARD FOLDER from a"
	cont "previous journey."

	para "Do you want to"
	line "open it?"
	done

UnknownText_0x1c552d::
	text "Delete the old"
	line "CARD FOLDER?"
	done

UnknownText_0x1c554a::
	text "Finish registering"
	line "CARDS?"
	done

UnknownText_0x1c5565::
	text "Eh? Mi spiace,"
	line "numero errato."
	done

UnknownText_0x1c5580::
	text "Clic!"
	done

UnknownText_0x1c5588::
	text "<……>"
	done

UnknownText_0x1c558b::
	text "Il numero è fuori"
	line "dall'area coperta."
	done

UnknownText_0x1c55ac::
	text "Potete parlarvi"
	line "di persona!"
	done

UnknownText_0x1c55ca::
	text "Grazie!"
	done

UnknownText_0x1c55d6::
	text "  :"
	done

UnknownText_0x1c55db::
	text "Password corretta."
	line "Seleziona CONTINUA"
	cont "per modificare le"
	cont "impostazioni."
	prompt

UnknownText_0x1c560b::
	text "Password errata!"
	prompt

UnknownText_0x1c561c::
	text "Regolare l'ora?"
	done

UnknownText_0x1c562e::
	text "Inserisci la"
	line "password."
	done

UnknownText_0x1c564a::
	text "Cancellare tutti"
	line "i dati salvati?"
	done

UnknownText_0x1c5660::
	text_ram wMonOrItemNameBuffer
	text " learned"
	line "@"
	text_ram wStringBuffer2
	text "!@"
	sound_dex_fanfare_50_79
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5678::
	text "Quale mossa vuoi"
	next "che dimentichi?"
	done

UnknownText_0x1c5699::
	text "Bloccare"
	line "l'apprendimento di"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c56af::
	text_ram wMonOrItemNameBuffer
	text_start
	line "non ha imparato"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c56c9::
	text_ram wMonOrItemNameBuffer
	text " sta"
	line "provando ad"
	cont "apprendere"
	cont "@"
	text_ram wStringBuffer2
	text "."

	para "Ma @"
	text_ram wMonOrItemNameBuffer
	text " non"
	line "può conoscere più"
	cont "di quattro mosse."

	para "Vuoi cancellare"
	line "una mossa per"
	cont "far posto a"
	cont "@"
	text_ram wStringBuffer2
	text "?"
	done

UnknownText_0x1c5740::
	text "1, 2 e…@"
	text_pause
	text_end

	text_end ; unused

UnknownText_0x1c574e::
	text " puf!@"
	text_pause
	text_start

	para "@"
	text_ram wMonOrItemNameBuffer
	text " scorda"
	line "@"
	text_ram wStringBuffer1
	text "."

	para "E…"
	prompt

UnknownText_0x1c5772::
	text "Ora è impossibile"
	line "scordare mosse MN."
	prompt

UnknownText_0x1c5793::
	text "Punti tre gettoni?"
	done

UnknownText_0x1c57ab::
	text "Pochi gettoni…"
	prompt

UnknownText_0x1c57be::
	text "Scegli una carta."
	done

UnknownText_0x1c57ce::
	text "Fai una puntata."
	done

UnknownText_0x1c57df::
	text "Vuoi giocare"
	line "ancora?"
	done

UnknownText_0x1c57f4::
	text "Le carte sono"
	line "state mischiate."
	prompt

UnknownText_0x1c5813::
	text "Sì!"
	done

UnknownText_0x1c581a::
	text "Acc…"
	done

UnknownText_0x1c5821::
	text_today
	text_end

	text_end ; unused

UnknownText_0x1c5824::
	text "<……>"
	done

UnknownText_0x1c5827::
	text "Sei fuori dall'"
	line "area coperta."
	prompt

UnknownText_0x1c5847::
	text "Chi desideri"
	line "chiamare?"
	done

UnknownText_0x1c5862::
	text "Premi un pulsante"
	line "per uscire."
	done

UnknownText_0x1c587d::
	text "Vuoi cancellare"
	line "questo numero?"
	done

UnknownText_0x1c589f::
	text "Che premio"
	line "preferisci?"
	done

UnknownText_0x1c58bc::
	text_ram wStringBuffer1
	text "?"
	line "È esatto?"
	done

UnknownText_0x1c58d1::
	text "Ecco qui!"
	done

UnknownText_0x1c58e0::
	text "Non hai abbastanza"
	line "punti."
	done

UnknownText_0x1c58ff::
	text "Non hai spazio."
	done

UnknownText_0x1c591a::
	text "Torna a trovarmi,"
	line "mi raccomando!"
	done

UnknownText_0x1c5937::
	text "Scusami!"
	done

Text_ExcuseMeYoureNotReady::
	text "Qualcosa non va:"
	line "non puoi ancora"
	cont "partecipare."

	para ""
	done

UnknownText_0x1c5962::
	text "Torna dopo aver"
	line "messo apposto ciò"
	cont "che non va."
	done

_NeedAtLeastThreeMonText::
	text "Devi avere almeno"
	line "tre #MON."
	done

_EggDoesNotQualifyText::
	text "Un UOVO non può"
	line "partecipare."
	done

_OnlyThreeMonMayBeEnteredText::
	text "Devi avere"
	line "esattamente tre"
	cont "#MON."
	done

_TheMonMustAllBeDifferentKindsText::
	text "I @"
	text_ram wStringBuffer2
	text " #MON"
	line "devono essere"
	cont "tutti diversi."

	para ""
	done

_TheMonMustNotHoldTheSameItemsText::
	text "I @"
	text_ram wStringBuffer2
	text " #MON non"
	line "possono tenere gli"
	cont "stessi strumenti."

	para ""
	done

_YouCantTakeAnEggText::
	text "Non puoi portare"
	line "un UOVO!"
	done

UnknownText_0x1c5a5a::
	text "Ha schivato la"
	line "BALL!"

	para "Questo #MON"
	line "non può essere"
	cont "catturato."
	prompt

UnknownText_0x1c5a90::
	text "Ti è sfuggito"
	line "il #MON!"
	prompt

UnknownText_0x1c5aa6::
	text "Oh no! Il #MON"
	line "si è liberato!"
	prompt

UnknownText_0x1c5ac3::
	text "Ah! Sembrava preso"
	line "eh? E invece no!"
	prompt

UnknownText_0x1c5ae3::
	text "Argh!"
	line "Per un pelo!"
	prompt

UnknownText_0x1c5afa::
	text "Nooo! Era così"
	line "vicino!"
	prompt

UnknownText_0x1c5b17::
	text "Preso! @"
	text_ram wEnemyMonNick
	text_start
	line "è catturato!@"
	sound_caught_mon
	text_end

	text_end ; unused

Text_Waitbutton_2::
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5b38::
	text_ram wMonOrItemNameBuffer
	text " inviato"
	line "al PC di BILL."
	prompt

UnknownText_0x1c5b53::
	text_ram wEnemyMonNick
	text "'s data"
	line "was newly added to"
	cont "the #DEX.@"
	sound_slot_machine_start
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5b7f::
	text "Vuoi dare un"
	line "soprannome a"
	cont "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c5b9a::
	text "Sale @"
	text_ram wStringBuffer2
	text " di"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

UnknownText_0x1c5bac::
	text "Non si può usare"
	line "su questo #MON."
	prompt

Text_RepelUsedEarlierIsStillInEffect::
	text "Il REPELLENTE"
	line "usato prima è"
	cont "ancora attivo."
	prompt

UnknownText_0x1c5bf9::
	text "Hai suonato il"
	line "# FLAUTO."

	para "Ah, che melodia"
	line "orecchiabile!"
	prompt

UnknownText_0x1c5c28::
	text "Tutti i #MON"
	line "addormentati si"
	cont "sono svegliati."
	prompt

UnknownText_0x1c5c44::
	text "<PLAYER> suona"
	line "il # FLAUTO.@"
	text_waitbutton
	text_end

	text_end ; unused

UnknownText_0x1c5c5e::
	text "Ora hai"
	line "@"
	text_decimal wBlueCardBalance, 1, 2
	text " punto/i."
	done

UnknownText_0x1c5c7b::
	text "Gettoni:"
	line "@"
	text_decimal wCoins, 2, 4
	text_end

	text_end ; unused

Text_RaiseThePPOfWhichMove::
	text "Aumenta i PP di"
	line "quale mossa?"
	done

Text_RestoreThePPOfWhichMove::
	text "Ricarica i PP di"
	line "quale mossa?"
	done

Text_PPIsMaxedOut::
	text "PP di @"
	text_ram wStringBuffer2
	text_start
	line "al massimo."
	prompt

Text_PPsIncreased::
	text "Aumentati i PP"
	line "di @"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5cf1::
	text "PP ricaricati."
	prompt

UnknownText_0x1c5d03::
	text "Dentro c'era un"
	line "trofeo!@"
	sound_dex_fanfare_50_79
	text_start

	para "@"
	text_ram wPlayerName
	text " manda"
	line "il trofeo a casa."
	prompt

UnknownText_0x1c5d3e::
	text "Sembra amara…"
	prompt

UnknownText_0x1c5d50::
	text "Non si può usare"
	line "con un UOVO."
	prompt

UnknownText_0x1c5d6e::
	text "OAK: <PLAYER>!"
	line "Questo non è il"
	cont "momento adatto!"
	prompt

UnknownText_0x1c5d97::
	text "Appartiene a"
	line "qualcun altro!"
	prompt

UnknownText_0x1c5db6::
	text "Non avrebbe alcun"
	line "effetto."
	prompt

UnknownText_0x1c5dd0::
	text "La BALL è stata"
	line "bloccata!"
	prompt

UnknownText_0x1c5def::
	text "Non si ruba!"
	prompt

UnknownText_0x1c5e01::
	text "Non si può andare"
	line "in bici qui."
	prompt

UnknownText_0x1c5e1d::
	text "Non puoi salire su"
	line "@"
	text_ram wStringBuffer1
	text " ora."
	prompt

UnknownText_0x1c5e3a::
	text "Il BOX #MON è"
	line "pieno! Non puoi"
	cont "usare questo"
	cont "strumento ora."
	prompt

UnknownText_0x1c5e68::
	text "<PLAYER> usa@"
	text_low
	text_ram wStringBuffer2
	text "."
	done

UnknownText_0x1c5e7b::
	text "<PLAYER> got on the@"
	text_low
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5e90::
	text "<PLAYER> got off@"
	text_low
	text "the @"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5ea8::
	text_ram wStringBuffer1
	text " sa"
	line "già @"
	text_ram wStringBuffer2
	text "."
	prompt

UnknownText_0x1c5eba::
	text "Quel #MON sa"
	line "solo una mossa."
	done

UnknownText_0x1c5eda::
	text "Vuoi che scordi"
	line "@"
	text_ram wStringBuffer1
	text "?"
	done

UnknownText_0x1c5ef5::
	text "Il #MON ha"
	line "scordato la mossa."
	done

UnknownText_0x1c5f17::
	text "Un UOVO non"
	line "conosce mosse!"
	done

UnknownText_0x1c5f36::
	text "No? Torna quando"
	line "vuoi."
	done

UnknownText_0x1c5f50::
	text "Quale mossa vuoi"
	line "che dimentichi?"
	prompt

UnknownText_0x1c5f74::
	text "Ecco… Sono"
	line "l'ELIMINAMOSSE."

	para "Posso far scordare"
	line "delle mosse ai"
	cont "tuoi #MON."

	para "Vuoi che faccia"
	line "scordare una mossa"
	cont "ad un tuo #MON?"
	done

UnknownText_0x1c5fd1::
	text "A quale #MON?"
	prompt

Text_DSTIsThatOK::
	text " OL, vero?"
	done

UnknownText_0x1c5ff1::
	text ","
	line "è giusto?"
	done

UnknownText_0x1c6000::
	text "Vuoi passare"
	line "all'ora legale?"
	done

UnknownText_0x1c6030::
	text "Ho spostato"
	line "l'orologio avanti"
	cont "di un'ora."
	prompt

UnknownText_0x1c6056::
	text "Vuoi tornare"
	line "all'ora solare?"
	done

UnknownText_0x1c6075::
	text "Ho spostato l'"
	line "orologio indietro"
	cont "di un'ora."
	prompt

UnknownText_0x1c6095::
	text "Vuoi passare all'"
	line "ora legale, o a"
	cont "quella solare?"
	done

UnknownText_0x1c60d1::
	text "Ho perso il manua-"
	line "le d'istruzioni"
	cont "del #GEAR."

	para "Puoi tornare fra"
	line "un po'?"
	prompt
