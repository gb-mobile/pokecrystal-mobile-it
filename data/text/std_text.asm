NurseMornText:
	text "Buongiorno! Sei al"
	line "CENTRO #MON."
	done

NurseDayText:
	text "Salve! Sei al"
	line "CENTRO #MON."
	done

NurseNiteText:
	text "Buonasera! Vedo"
	line "che stai in giro"

	para "fino a tardi! Sei"
	line "al CENTRO #MON."
	done

PokeComNurseMornText:
	text "Buongiorno!"

	para "Sei al CENTRO"
	line "COMUNICAZIONE"

	para "#MON, o"
	line "CENTRO #COM."
	done

PokeComNurseDayText:
	text "Ciao!"

	para "Sei al CENTRO"
	line "COMUNICAZIONE"

	para "#MON, o"
	line "CENTRO #COM."
	done

PokeComNurseNiteText:
	text "Vedo che lavori"
	line "fino a tardi!"

	para "Sei al CENTRO"
	line "COMUNICAZIONE"

	para "#MON, o"
	line "CENTRO #COM."
	done

NurseAskHealText:
	text "Rimettiamo in"
	line "sesto i #MON."

	para "Vuoi che guariamo"
	line "anche i tuoi?"
	done

NurseTakePokemonText:
	text "Benissimo. Posso"
	line "vederli?"
	done

NurseReturnPokemonText:
	text "Grazie per"
	line "l'attesa."

	para "Ora i tuoi #MON"
	line "sono in perfetta"
	cont "forma!"
	done

NurseGoodbyeText:
	text "Arrivederci!"
	done

; not used
	text "Arrivederci!"
	done

NursePokerusText:
	text "Pare che strani"
	line "organismi viventi"

	para "si siano legati"
	line "ai tuoi #MON."

	para "I #MON sono"
	line "in salute e"
	cont "sembrano non avere"
	cont "problemi."

	para "Ma non possiamo"
	line "dirti di più qui"
	cont "al CENTRO #MON."
	done

PokeComNursePokerusText:
	text "Pare che i tuoi"
	line "#MON siano"

	para "stati infettati da"
	line "piccole forme"
	cont "viventi."

	para "I #MON godono"
	line "di ottima salute."

	para "Ma non posso dirti"
	line "di più."
	done

DifficultBookshelfText:
	text "È pieno di libri"
	line "complicati."
	done

PictureBookshelfText:
	text "Un'intera"
	line "collezione di"
	cont "libri illustrati"
	cont "dei #MON!"
	done

MagazineBookshelfText:
	text "Riviste #MON…"
	line "AMICO #MON,"

	para "MANUALE #MON,"
	line "GRAFICA #MON…"
	done

TeamRocketOathText:
	text "Il GIURAMENTO"
	line "di TEAM ROCKET"

	para "Ruba i #MON per"
	line "trarne profitto!"

	para "Sfrutta i #MON"
	line "per trarne"
	cont "profitto!"

	para "I #MON esistono"
	line "solo per la gloria"
	cont "di TEAM ROCKET!"
	done

IncenseBurnerText:
	text "E questo cos'è?"

	para "Ah, un incensiere:"
	line "serve per bruciare"
	cont "l'incenso."
	done

MerchandiseShelfText:
	text "È tutta merce de-"
	line "dicata ai #MON!"
	done

TownMapText:
	text "È la MAPPA CITTÀ."
	done

WindowText:
	text "La mia immagine"
	line "riflessa!"
	cont "Niente male!"
	done

TVText:
	text "Un televisore."
	done

HomepageText:
	text "L'HOME PAGE del"
	line "GIORNALE #MON…"

	para "Non è ancora stata"
	line "aggiornata…"
	done

; not used
	text "RADIO #MON!"

	para "Chiama ora e fai"
	line "la tua dedica!"
	done

TrashCanText:
	text "Qui non c'è"
	line "proprio niente…"
	done

; not used
	text "Forse un #MON"
	line "è in grado di"
	cont "spostarlo."
	done

; not used
	text "Forse un #MON"
	line "è in grado di"
	cont "frantumarla."
	done

PokecenterSignText:
	text "CENTRO #MON"
	line "Rimetti in sesto"
	cont "i tuoi #MON!"
	done

MartSignText:
	text "Per ogni esigenza"
	line "dei tuoi #MON"

	para "#MON-MARKET"
	done

ContestResults_ReadyToJudgeText:
	text "Ora giudicheremo"
	line "i #MON da voi"
	cont "catturati."

	para "<……>"
	line "<……>"

	para "Abbiamo scelto i"
	line "vincitori!"

	para "Allora, siete"
	line "pronti?"
	done

ContestResults_PlayerWonAPrizeText:
	text "<PLAYER> vince il"
	line "premio Nº@"
	text_ram wStringBuffer3
	text ","
	cont "@"
	text_ram wStringBuffer4
	text "!"
	done

ReceivedItemText:
	text "<PLAYER> riceve"
	line "@"
	text_ram wStringBuffer4
	text "."
	done

ContestResults_JoinUsNextTimeText:
	text "Partecipa alla"
	line "prossima Gara!"
	done

ContestResults_ConsolationPrizeText:
	text "Tutti gli altri"
	line "avranno una BACCA"
	cont "come consolazione."
	done

ContestResults_DidNotWinText:
	text "Andrà meglio la"
	line "prossima volta."
	done

ContestResults_ReturnPartyText:
	text "Vi restituiamo i"
	line "#MON che vi"

	para "abbiamo tenuto."
	line "Ecco qui."
	done

ContestResults_PartyFullText:
	text "La tua squadra è"
	line "completa, il"

	para "#MON è stato"
	line "mandato al BOX"
	cont "del PC di BILL."
	done

GymStatue_CityGymText:
	text "PALESTRA di"
	line "@"
	text_ram wStringBuffer3
	text_end
	done

GymStatue_WinningTrainersText:
	text "CAPO: @"
	text_ram wStringBuffer4
	text_start
	para "ALLENAT. VINCENTI:"
	line "<PLAYER>"
	done

CoinVendor_WelcomeText:
	text "Questo è il"
	line "CASINÒ."
	done

CoinVendor_NoCoinCaseText:
	text "Ti servono"
	line "dei gettoni?"

	para "Oh, ti manca un"
	line "SALVADANAIO per i"
	cont "gettoni."
	done

CoinVendor_IntroText:
	text "Ti servono altri"
	line "gettoni?"

	para "50 gettoni"
	line "costano ¥1000."
	cont "Quanti ne vuoi?"
	done

CoinVendor_Buy50CoinsText:
	text "Grazie."
	line "Eccoti 50 gettoni."
	done

CoinVendor_Buy500CoinsText:
	text "Grazie. Eccoti"
	line "500 gettoni."
	done

CoinVendor_NotEnoughMoneyText:
	text "Non hai abbastanza"
	line "denaro."
	done

CoinVendor_CoinCaseFullText:
	text "Ah, il tuo SALVA-"
	line "DANAIO è pieno."
	done

CoinVendor_CancelText:
	text "Nessun gettone?"
	line "Arrivederci."
	done

BugContestPrizeNoRoomText:
	text "Eh? Il tuo ZAINO"
	line "è pieno."

	para "Per oggi te lo"
	line "terremo noi, torna"

	para "dopo aver liberato"
	line "del posto."
	done

HappinessText3:
	text "Grande! Tu e i"
	line "tuoi #MON siete"
	cont "proprio affiatati!"
	done

HappinessText2:
	text "I #MON sono"
	line "più amichevoli se"

	para "dedichi loro un"
	line "po' del tuo tempo."
	done

HappinessText1:
	text "Il tuo #MON non"
	line "è ben"
	cont "addomesticato."

	para "Se non lo tratti"
	line "con amore mette"
	cont "il broncio."
	done

RegisteredNumber1Text:
	text "<PLAYER> registra"
	line "il numero di"
	cont "@"
	text_ram wStringBuffer3
	text "."
	done

RegisteredNumber2Text:
	text "<PLAYER> registra"
	line "il numero di"
	cont "@"
	text_ram wStringBuffer3
	text "."
	done
