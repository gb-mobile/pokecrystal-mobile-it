BattleText:: ; used only for BANK(BattleText)

BattleText_PlayerPickedUpPayDayMoney:
	text "<PLAYER> raccoglie"
	line "¥@"
	text_decimal wPayDayMoney, 3, 6
	text "!"
	prompt

WildPokemonAppearedText:
	text "Appare @"
	text_ram wEnemyMonNick
	text_start
	line "selvatico!"
	prompt

HookedPokemonAttackedText:
	text_ram wEnemyMonNick
	text_start
	line "pescato attacca!"
	prompt

PokemonFellFromTreeText:
	text_ram wEnemyMonNick
	text_start
	line "cade dall'albero!"
	prompt

WildCelebiAppearedText:
	text "Appare @"
	text_ram wEnemyMonNick
	text_start
	line "selvatico!"
	prompt

WantsToBattleText::
	text "<ENEMY>"
	line "vuole lottare!"
	prompt

BattleText_WildFled:
	text_ram wEnemyMonNick
	text_start
	line "selvatico fugge!"
	prompt

BattleText_EnemyFled:
	text_ram wEnemyMonNick
	text " nemico"
	line "fugge!"
	prompt

HurtByPoisonText:
	text "Il veleno ha"
	line "effetto su"
	cont "<USER>!"
	prompt

HurtByBurnText:
	text "<USER>"
	line "soffre per la"
	cont "scottatura!"
	prompt

LeechSeedSapsText:
	text "PARASSISEME toglie"
	line "energia a"
	cont "<USER>!"
	prompt

HasANightmareText:
	text "<USER>"
	line "ha un INCUBO!"
	prompt

HurtByCurseText:
	text "MALEDIZIONE"
	line "agisce su"
	cont "<USER>!"
	prompt

SandstormHitsText:
	text "TERREMPESTA"
	line "colpisce"
	cont "<USER>!"
	prompt

PerishCountText:
	text "ULTIMOCANTO di"
	line "<USER>:"
	cont "meno @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

BattleText_TargetRecoveredWithItem:
	text "<TARGET>"
	line "si riprende con"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_UserRecoveredPPUsing:
	text "<USER>"
	line "recupera PP con"
	cont "@"
	text_ram wStringBuffer1
	text "."
	prompt

BattleText_TargetWasHitByFutureSight:
	text "<TARGET>"
	line "è colpito da "
	cont "DIVINAZIONE!"
	prompt

BattleText_SafeguardFaded:
	text "Cade"
	line "SALVAGUARDIA di"
	cont "<USER>!"
	prompt

BattleText_MonsLightScreenFell:
	text "SCHERMO-LUCE del"
	line "#MON @"
	text_ram wStringBuffer1
	text_start
	cont "è caduto!"
	prompt

BattleText_MonsReflectFaded:
	text "RIFLESSO del"
	line "#MON @"
	text_ram wStringBuffer1
	text_start
	cont "è svanito!"
	prompt

BattleText_RainContinuesToFall:
	text "Continua a"
	line "piovere."
	prompt

BattleText_TheSunlightIsStrong:
	text "La luce del sole è"
	line "fortissima."
	prompt

BattleText_TheSandstormRages:
	text "La TERREMPESTA è"
	line "impetuosa."
	prompt

BattleText_TheRainStopped:
	text "Non piove più."
	prompt

BattleText_TheSunlightFaded:
	text "La luce del sole"
	line "è tornata normale."
	prompt

BattleText_TheSandstormSubsided:
	text "La TERREMPESTA si"
	line "è calmata."
	prompt

BattleText_EnemyMonFainted:
	text_ram wEnemyMonNick
	text " nemico"
	line "è esausto!"
	prompt

GotMoneyForWinningText:
	text "<PLAYER> vince"
	line "¥@"
	text_decimal wBattleReward, 3, 6
	text "!"
	prompt

BattleText_EnemyWasDefeated:
	text "<ENEMY>"
	line "ha perso la sfida!"
	prompt

TiedAgainstText:
	text "Tu e"
	line "<ENEMY>"
	cont "avete pareggiato!"
	prompt

SentSomeToMomText:
	text "<PLAYER> riceve"
	line "¥@"
	text_decimal wBattleReward, 3, 6
	text ". Ne manda"
	cont "parte alla mamma."
	prompt

SentHalfToMomText:
	text "Metà alla mamma!"
	prompt

SentAllToMomText:
	text "Tutto alla mamma!"
	prompt

BattleText_0x80a4f:
	text "<RIVAL>: Avrei"
	line "dovuto scegliere"
	cont "il tuo #MON!"
	prompt

BattleText_MonFainted:
	text_ram wBattleMonNick
	text_start
	line "è esausto!"
	prompt

BattleText_UseNextMon:
	text "Usarne un altro?"
	done

BattleText_0x80a93:
	text "<RIVAL>: Sììì!"
	line "Ho scelto proprio"
	cont "il #MON giusto!"
	prompt

LostAgainstText:
	text "<ENEMY>"
	line "ti ha battuto!"
	prompt

BattleText_EnemyIsAboutToUseWillPlayerChangeMon:
	text "<ENEMY>"
	line "sta per usare"
	cont "@"
	text_ram wEnemyMonNick
	text "."

	para "<PLAYER>, vuoi"
	line "cambiare #MON?"
	done

BattleText_EnemySentOut:
	text "<ENEMY>"
	line "manda in campo"
	cont "@"
	text_ram wEnemyMonNick
	text "!"
	done

BattleText_TheresNoWillToBattle:
	text "Troppo esausto"
	line "per lottare!"
	prompt

BattleText_AnEGGCantBattle:
	text "Un UOVO non può"
	line "lottare!"
	prompt

BattleText_CantEscape2:
	text "Non si scappa!"
	prompt

BattleText_TheresNoEscapeFromTrainerBattle:
	text "Non puoi sottrarti"
	line "alla lotta con un"
	cont "allenatore!"
	prompt

BattleText_GotAwaySafely:
	text "Scampato pericolo!"
	prompt

BattleText_UserFledUsingAStringBuffer1:
	text "<USER>"
	line "è fuggito con"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_CantEscape:
	text "Non si scappa!"
	prompt

BattleText_UserHurtBySpikes:
	text "<USER>"
	line "soffre per le"
	cont "PUNTE!"
	prompt

RecoveredUsingText:
	text "<TARGET>"
	line "si riprende con"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

BattleText_UsersStringBuffer1Activated:
	text "Attivato:"
	line "@"
	text_ram wStringBuffer1
	text " di"
	cont "<USER>!"
	prompt

BattleText_ItemsCantBeUsedHere:
	text "Qui non si possono"
	line "usare strumenti."
	prompt

BattleText_MonIsAlreadyOut:
	text_ram wBattleMonNick
	text_start
	line "è già in campo!"
	prompt

BattleText_MonCantBeRecalled:
	text_ram wBattleMonNick
	text " non può"
	line "essere richiamato!"
	prompt

BattleText_TheresNoPPLeftForThisMove:
	text "Non ha più PP"
	line "per questa mossa!"
	prompt

BattleText_TheMoveIsDisabled:
	text "Questa mossa è"
	line "fuori uso!"
	prompt

BattleText_MonHasNoMovesLeft:
	text_ram wBattleMonNick
	text " non ha"
	line "più mosse utili."
	done

BattleText_TargetsEncoreEnded:
	text "Finito effetto di"
	line "RIPETI su"
	cont "<TARGET>!"
	prompt

BattleText_StringBuffer1GrewToLevel:
	text_ram wStringBuffer1
	text_start
	line "sale al L. @"
	text_decimal wCurPartyLevel, 1, 3
	text "!@"
	sound_dex_fanfare_50_79
	text_end

	text_end ; unused

BattleText_WildMonIsEating:
	text_ram wEnemyMonNick
	text_start
	line "selvatico mangia!"
	prompt

BattleText_WildMonIsAngry:
	text_ram wEnemyMonNick
	text_start
	line "selvatico è"
	cont "infuriato."
	prompt

FastAsleepText:
	text "<USER>"
	line "dorme!"
	prompt

WokeUpText:
	text "<USER>"
	line "si è svegliato!"
	prompt

FrozenSolidText:
	text "<USER>"
	line "è congelato!"
	prompt

FlinchedText:
	text "<USER>"
	line "tentenna!"
	prompt

MustRechargeText:
	text "<USER>"
	line "deve ricaricarsi!"
	prompt

DisabledNoMoreText:
	text "Termina l'effetto"
	line "di INIBITORE su"
	cont "<USER>!"
	prompt

IsConfusedText:
	text "<USER>"
	line "è confuso!"
	prompt

HurtItselfText:
	text "Così confuso da"
	line "colpirsi da solo!"
	prompt

ConfusedNoMoreText:
	text "<USER>"
	line "non è più confuso!"
	prompt

BecameConfusedText:
	text "<TARGET>"
	line "è stato confuso!"
	prompt

BattleText_ItemHealedConfusion:
	text "Con @"
	text_ram wStringBuffer1
	text ","
	line "<TARGET>"
	cont "non è più confuso."
	prompt

AlreadyConfusedText:
	text "<TARGET>"
	line "è già confuso!"
	prompt

BattleText_UsersHurtByStringBuffer1:
	text_ram wStringBuffer1
	text_start
	line "ha effetto su"
	cont "<USER>!"
	prompt

BattleText_UserWasReleasedFromStringBuffer1:
	text "<USER>"
	line "si libera da"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

UsedBindText:
	text "<USER>"
	line "ha usato"
	cont "LEGATUTTO su"
	cont "<TARGET>!"
	prompt

WhirlpoolTrapText:
	text "<TARGET>"
	line "è intrappolato!"
	prompt

FireSpinTrapText:
	text "<TARGET>"
	line "è intrappolato!"
	prompt

WrappedByText:
	text "<USER>"
	line "ha usato"
	cont "AVVOLGIBOTTA su"
	cont "<TARGET>!"
	prompt

ClampedByText:
	text "<USER>"
	line "ha usato"
	cont "TENAGLIA su"
	cont "<TARGET>!"
	prompt

StoringEnergyText:
	text "<USER>"
	line "accumula energia!"
	prompt

UnleashedEnergyText:
	text "<USER>"
	line "libera energia!"
	prompt

HungOnText:
	text "<TARGET>"
	line "resiste con"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

EnduredText:
	text "<TARGET>"
	line "RESISTE!"
	prompt

InLoveWithText:
	text "<USER>"
	line "è innamorato di"
	cont "<TARGET>!"
	prompt

InfatuationText:
	text "<USER>"
	line "è innamorato: non"
	cont "può attaccare!"
	prompt

DisabledMoveText:
	text_ram wStringBuffer1
	text " di"
	line "<USER>"
	cont "è fuori uso!"
	prompt

LoafingAroundText:
	text_ram wBattleMonNick
	text_start
	line "sta ciondolando."
	prompt

BeganToNapText:
	text_ram wBattleMonNick
	text_start
	line "fa un riposino!"
	prompt

WontObeyText:
	text_ram wBattleMonNick
	text_start
	line "non obbedisce!"
	prompt

TurnedAwayText:
	text_ram wBattleMonNick
	text_start
	line "disobbedisce!"
	prompt

IgnoredOrdersText:
	text_ram wBattleMonNick
	text_start
	line "ignora l'ordine!"
	prompt

IgnoredSleepingText:
	text_ram wBattleMonNick
	text " ignora"
	line "gli ordini… dorme!"
	prompt

NoPPLeftText:
	text "Ma non ha più"
	line "PP per la mossa!"
	prompt

HasNoPPLeftText:
	text "<USER>"
	line "non ha più PP per"
	cont "@"
	text_ram wStringBuffer2
	text "!"
	prompt

WentToSleepText:
	text "<USER>"
	line "va a dormire!"
	done

RestedText:
	text "<USER>"
	line "s'è addormentato"
	cont "e si riprende!"
	done

RegainedHealthText:
	text "<USER>"
	line "s'è ripreso!"
	prompt

AttackMissedText:
	text "<USER>"
	line "fallisce!"
	prompt

AttackMissed2Text:
	text "<USER>"
	line "fallisce!"
	prompt

CrashedText:
	text "<USER>"
	line "si sbilancia e"
	cont "si schianta!"
	prompt

UnaffectedText:
	text "<TARGET>"
	line "è incolume!"
	prompt

DoesntAffectText:
	text "Non ha effetto su"
	line "<TARGET>!"
	prompt

CriticalHitText:
	text "Brutto colpo!"
	prompt

OneHitKOText:
	text "KO in un attacco!"
	prompt

SuperEffectiveText:
	text "È superefficace."
	prompt

NotVeryEffectiveText:
	text "Non è molto"
	line "efficace…"
	prompt

TookDownWithItText:
	text "<TARGET>"
	line "si porta dietro"
	cont "<USER>!"
	prompt

RageBuildingText:
	text "Cresce l'IRA di"
	line "<USER>!"
	prompt

GotAnEncoreText:
	text "<TARGET>"
	line "colpito da RIPETI!"
	prompt

SharedPainText:
	text "I due avversari si"
	line "dividono i PS!"
	prompt

TookAimText:
	text "<USER>"
	line "prende la mira!"
	prompt

SketchedText:
	text "<USER>"
	line "disegna uno"
	cont "SCHIZZO di"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

DestinyBondEffectText:
	text "<USER>"
	line "vuole portarsi"
	cont "dietro"
	cont "l'avversario!"
	prompt

SpiteEffectText:
	text_ram wStringBuffer1
	text " di"
	line "<TARGET>"
	cont "cala di @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

BellChimedText:
	text "Din don dan!"
	line ""
	prompt

FellAsleepText:
	text "<TARGET>"
	line "s'è addormentato!"
	prompt

AlreadyAsleepText:
	text "<TARGET>"
	line "sta dormendo!"
	prompt

WasPoisonedText:
	text "<TARGET>"
	line "è avvelenato!"
	prompt

BadlyPoisonedText:
	text "<TARGET>"
	line "è iperavvelenato!"
	prompt

AlreadyPoisonedText:
	text "<TARGET>"
	line "è già avvelenato!"
	prompt

SuckedHealthText:
	text "Succhia energia a"
	line "<TARGET>!"
	prompt

DreamEatenText:
	text "Mangia il sogno di"
	line "<TARGET>!"
	prompt

WasBurnedText:
	text "<TARGET>"
	line "è scottato!"
	prompt

DefrostedOpponentText:
	text "<TARGET>"
	line "è scongelato!"
	prompt

WasFrozenText:
	text "<TARGET>"
	line "è congelato!"
	prompt

WontRiseAnymoreText:
	text_ram wStringBuffer2
	text " di"
	line "<USER>"
	cont "non può più"
	cont "crescere!"
	prompt

WontDropAnymoreText:
	text_ram wStringBuffer2
	text " di"
	line "<TARGET>"
	cont "non può più"
	cont "calare!"
	prompt

FledFromBattleText::
	text "<USER>"
	line "se la dà a gambe!"
	prompt

FledInFearText:
	text "<TARGET>"
	line "fugge spaventato!"
	prompt

BlownAwayText:
	text "<TARGET>"
	line "è spazzato via!"
	prompt

PlayerHitTimesText:
	text "Colpito @"
	text_decimal wPlayerDamageTaken, 1, 1
	text " volte!"
	prompt

EnemyHitTimesText:
	text "Colpito @"
	text_decimal wEnemyDamageTaken, 1, 1
	text " volte!"
	prompt

MistText:
	text "La NEBBIA avvolge"
	line "<USER>!"
	prompt

ProtectedByMistText:
	text "La NEBBIA protegge"
	line "<TARGET>."
	prompt

GettingPumpedText:
	text_pause
	text "<USER>"
	line "si gonfia!"
	prompt

RecoilText:
	text "Contraccolpo su"
	line "<USER>!"
	prompt

MadeSubstituteText:
	text "<USER>"
	line "crea un SOSTITUTO!"
	prompt

HasSubstituteText:
	text "<USER>"
	line "ha un SOSTITUTO!"
	prompt

TooWeakSubText:
	text "Debole! Non può"
	line "creare SOSTITUTO!"
	prompt

SubTookDamageText:
	text "Il SOSTITUTO è"
	line "colpito invece di"
	cont "<TARGET>!"
	prompt

SubFadedText:
	text "Svanisce SOSTITUTO"
	line "<TARGET>."
	prompt

LearnedMoveText:
	text "<USER>"
	line "ha imparato"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

WasSeededText:
	text "<TARGET>"
	line "è pieno di semi!"
	prompt

EvadedText:
	text "<TARGET>"
	line "schiva l'attacco!"
	prompt

WasDisabledText:
	text_ram wStringBuffer1
	text " di"
	line "<TARGET>"
	cont "è fuori uso!"
	prompt

CoinsScatteredText:
	text "Monete lanciate"
	line "ovunque!"
	prompt

TransformedTypeText:
	text "<USER>"
	line "si trasforma nel"
	cont "tipo @"
	text_ram wStringBuffer1
	text "!"
	prompt

EliminatedStatsText:
	text "Eliminato ogni"
	line "cambio nelle"
	cont "statistiche."
	prompt

TransformedText:
	text "<USER>"
	line "si TRASFORMA in"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

LightScreenEffectText:
	text "Aumenta"
	line "DIFESA SPECIALE di"
	cont "<USER>!"
	prompt

ReflectEffectText:
	text "Aumenta DIFESA di"
	line "<USER>!"
	prompt

NothingHappenedText:
	text "Ma non succede"
	line "nulla!"
	prompt

ButItFailedText:
	text "Ma fallisce!"
	prompt

ItFailedText:
	text "Fallisce!"
	prompt

DidntAffect1Text:
	text "Non ha avuto"
	line "effetto su"
	cont "<TARGET>!"
	prompt

DidntAffect2Text:
	text "Non ha avuto"
	line "effetto su"
	cont "<TARGET>!"
	prompt

HPIsFullText:
	text "<USER>"
	line "ha tutti i PS!"
	prompt

DraggedOutText:
	text "<USER>"
	line "è tirato dentro!"
	prompt

ParalyzedText:
	text "<TARGET>"
	line "è paralizzato!"
	cont "Potrà attaccare?"
	prompt

FullyParalyzedText:
	text "<USER>"
	line "è paralizzato!"
	prompt

AlreadyParalyzedText:
	text "<TARGET>"
	line "è già paralizzato!"
	prompt

ProtectedByText:
	text "<TARGET>"
	line "è protetto da"
	cont "@"
	text_ram wStringBuffer1
	text "!"
	prompt

MirrorMoveFailedText:
	text "La SPECULMOSSA"
	next "ha fallito!"
	prompt

StoleText:
	text "<USER>"
	line "ruba @"
	text_ram wStringBuffer1
	text_start
	cont "al nemico!"
	prompt

CantEscapeNowText:
	text "<TARGET>"
	line "non può scappare!"
	prompt

StartedNightmareText:
	text "<TARGET>"
	line "inizia ad avere un"
	cont "INCUBO!"
	prompt

WasDefrostedText:
	text "<USER>"
	line "è scongelato!"
	prompt

PutACurseText:
	text "<USER>"
	line "perde PS e lancia"

	para "MALEDIZIONE su"
	line "<TARGET>!"
	prompt

ProtectedItselfText:
	text "<USER>"
	line "si PROTEGGE!"
	prompt

ProtectingItselfText:
	text "PROTEZIONE"
	line "agisce su"
	cont "<TARGET>!"
	done

SpikesText:
	text "PUNTE circondano"
	line "<TARGET>!"
	prompt

IdentifiedText:
	text "<USER>"
	line "identifica"
	cont "<TARGET>!"
	prompt

StartPerishText:
	text "In 3 turni saranno"
	line "entrambi esausti!"
	prompt

SandstormBrewedText:
	text "Una TERREMPESTA"
	line "è nell'aria!"
	prompt

BracedItselfText:
	text "<USER>"
	line "si rinvigorisce!"
	prompt

FellInLoveText:
	text "<TARGET>"
	line "è innamorato!"
	prompt

CoveredByVeilText:
	text "Un velo ricopre"
	line "<USER>!"
	prompt

SafeguardProtectText:
	text "<TARGET>"
	line "è protetto da"
	cont "SALVAGUARDIA!"
	prompt

MagnitudeText:
	text "Magnitudo @"
	text_decimal wDeciramBuffer, 1, 1
	text "!"
	prompt

ReleasedByText:
	text "<USER>"
	line "si libera da"
	cont "<TARGET>!"
	prompt

ShedLeechSeedText:
	text "<USER>"
	line "sparge"
	cont "PARASSISEME!"
	prompt

BlewSpikesText:
	text "<USER>"
	line "scaccia le PUNTE!"
	prompt

DownpourText:
	text "È iniziato un"
	line "acquazzone!"
	prompt

SunGotBrightText:
	text "La luce solare"
	line "diventa intensa!"
	prompt

BellyDrumText:
	text "<USER>"
	line "taglia i PS e"
	cont "potenzia ATTACCO"
	cont "al massimo!"
	prompt

CopiedStatsText:
	text "<USER>"
	line "copia modifiche"

	para "statistiche di"
	line "<TARGET>!"
	prompt

ForesawAttackText:
	text "<USER>"
	line "prevede attacco."
	prompt

BeatUpAttackText:
	text "Attacco di"
	line "@"
	text_ram wStringBuffer1
	text "!"
	done

RefusedGiftText:
	text "<TARGET>"
	line "non può ricevere"
	cont "il dono!"
	prompt

IgnoredOrders2Text:
	text "<USER>"
	line "ignora l'ordine!"
	prompt

BattleText_LinkErrorBattleCanceled:
	text "Errore di"
	line "collegamento…"

	para "La lotta è stata"
	line "annullata…"
	prompt

BattleText_0x8188e:
	text "Per oggi hai"
	line "esaurito il tempo."
	done
