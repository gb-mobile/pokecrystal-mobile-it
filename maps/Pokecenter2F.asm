	object_const_def ; object_event constants
	const POKECENTER2F_TRADE_RECEPTIONIST
	const POKECENTER2F_BATTLE_RECEPTIONIST
	const POKECENTER2F_TIME_CAPSULE_RECEPTIONIST
	const POKECENTER2F_OFFICER

Pokecenter2F_MapScripts:
	db 6 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_POKECENTER2F_LEAVE_TRADE_CENTER
	scene_script .Scene2 ; SCENE_POKECENTER2F_LEAVE_COLOSSEUM
	scene_script .Scene3 ; SCENE_POKECENTER2F_LEAVE_TIME_CAPSULE
	scene_script .Scene4 ; SCENE_POKECENTER2F_LEAVE_MOBILE_TRADE_ROOM
	scene_script .Scene5 ; SCENE_POKECENTER2F_LEAVE_MOBILE_BATTLE_ROOM

	db 0 ; callbacks

.Scene0:
	special CheckMysteryGift
	ifequal $0, .Scene0Done
	clearevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Scene0Done
	prioritysjump Pokecenter2F_AppearMysteryGiftDeliveryGuy

.Scene0Done:
	end

.Scene1:
	prioritysjump Script_LeftCableTradeCenter
	end

.Scene2:
	prioritysjump Script_LeftCableColosseum
	end

.Scene3:
	prioritysjump Script_LeftTimeCapsule
	end

.Scene4:
	prioritysjump Script_LeftMobileTradeRoom
	end

.Scene5:
	prioritysjump Script_LeftMobileBattleRoom
	end

Pokecenter2F_AppearMysteryGiftDeliveryGuy:
	appear POKECENTER2F_OFFICER
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	end

Script_TradeCenterClosed:
	faceplayer
	opentext
	writetext Text_TradeRoomClosed
	waitbutton
	closetext
	end

Script_BattleRoomClosed:
	faceplayer
	opentext
	writetext Text_BattleRoomClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_Trade:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_TradeCenterClosed
	opentext
	writetext Text_TradeReceptionistIntro
	yesorno
	iffalse .Cancel
	special Mobile_DummyReturnFalse ; always returns false
	iffalse .NoMobile
	writetext Text_TradeReceptionistMobile
	special AskMobileOrCable
	iffalse .Cancel
	ifequal $1, .Mobile
.NoMobile:
	special SetBitsForLinkTradeRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	scall Pokecenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext Text_FriendNotReady
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

.Mobile:
	scall .Mobile_TrySave
	iftrue .Mobile_Abort
	scall BattleTradeMobile_WalkIn
	warpcheck
	end

.Mobile_Abort:
	end

.Mobile_TrySave:
	writetext Text_MustSaveGame
	yesorno
	iffalse .Mobile_DidNotSave
	special TryQuickSave
	iffalse .Mobile_DidNotSave
	special Function1011f1
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	setval FALSE
	end

.Mobile_DidNotSave:
	writetext Text_PleaseComeAgain
	closetext
	setval TRUE
	end

BattleTradeMobile_WalkIn:
	applymovementlasttalked Pokecenter2FMobileMobileMovementData_ReceptionistWalksUpAndLeft_LookDown
	applymovement PLAYER, Pokecenter2FMobileMovementData_PlayerWalksIntoMobileBattleRoom
	end

LinkReceptionistScript_Battle:
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse Script_BattleRoomClosed
	opentext
	writetext Text_BattleReceptionistIntro
	yesorno
	iffalse .Cancel
	special Mobile_DummyReturnFalse ; always returns false
	iffalse .NoMobile
	writetext Text_BattleReceptionistMobile
	special AskMobileOrCable
	iffalse .Cancel
	ifequal $1, .Mobile
.NoMobile:
	special SetBitsForBattleRequest
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .LinkedToFirstGen
	special CheckBothSelectedSameRoom
	iffalse .IncompatibleRooms
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	scall Pokecenter2F_CheckGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext Text_FriendNotReady
	closetext
	end

.LinkedToFirstGen:
	special FailedLinkToPast
	writetext Text_CantLinkToThePast
	special CloseLink
	closetext
	end

.IncompatibleRooms:
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .AbortLink

.DidNotSave:
	writetext Text_PleaseComeAgain
.AbortLink:
	special WaitForOtherPlayerToExit
.Cancel:
	closetext
	end

.Mobile:
	scall .SelectThreeMons
	iffalse .Mobile_Abort
	scall .Mobile_TrySave
	iftrue .Mobile_Abort
	scall BattleTradeMobile_WalkIn
	warpcheck
	end

.Mobile_Abort:
	end

.Mobile_TrySave:
	writetext Text_MustSaveGame
	yesorno
	iffalse .Mobile_DidNotSave
	special Function103780
	iffalse .Mobile_DidNotSave
	special Function1011f1
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	setval FALSE
	end

.Mobile_DidNotSave:
	writetext Text_PleaseComeAgain
	closetext
	setval TRUE
	end

.SelectThreeMons:
	special Mobile_SelectThreeMons
	iffalse .Mobile_DidNotSelect
	ifequal $1, .Mobile_OK
	ifequal $2, .Mobile_OK
	ifequal $3, .Mobile_InvalidParty
	sjump .Mobile_DidNotSelect

.Mobile_InvalidParty:
	writetext Text_BrokeStadiumRules
	waitbutton
.Mobile_DidNotSelect:
	closetext
	setval FALSE
	end

.Mobile_OK:
	setval TRUE
	end

Script_TimeCapsuleClosed:
	faceplayer
	opentext
	writetext Text_TimeCapsuleClosed
	waitbutton
	closetext
	end

LinkReceptionistScript_TimeCapsule:
	checkevent EVENT_MET_BILL
	iftrue Script_TimeCapsuleClosed
	checkflag ENGINE_TIME_CAPSULE
	iftrue Script_TimeCapsuleClosed
	special SetBitsForTimeCapsuleRequest
	faceplayer
	opentext
	writetext Text_TimeCapsuleReceptionistIntro
	yesorno
	iffalse .Cancel
	special CheckTimeCapsuleCompatibility
	ifequal $1, .MonTooNew
	ifequal $2, .MonMoveTooNew
	ifequal $3, .MonHasMail
	writetext Text_PleaseWait
	special WaitForLinkedFriend
	iffalse .FriendNotReady
	writetext Text_MustSaveGame
	yesorno
	iffalse .DidNotSave
	special TryQuickSave
	iffalse .DidNotSave
	writetext Text_PleaseWait
	special CheckLinkTimeout
	iffalse .LinkTimedOut
	readmem wOtherPlayerLinkMode
	iffalse .OK
	special CheckBothSelectedSameRoom
	writetext Text_IncompatibleRooms
	special CloseLink
	closetext
	end

.OK:
	special EnterTimeCapsule
	writetext Text_PleaseComeIn2
	waitbutton
	closetext
	scall TimeCapsuleScript_CheckPlayerGender
	warpcheck
	end

.FriendNotReady:
	special WaitForOtherPlayerToExit
	writetext Text_FriendNotReady
	closetext
	end

.LinkTimedOut:
	writetext Text_LinkTimedOut
	sjump .Cancel

.DidNotSave:
	writetext Text_PleaseComeAgain
.Cancel:
	special WaitForOtherPlayerToExit
	closetext
	end

.MonTooNew:
	writetext Text_RejectNewMon
	closetext
	end

.MonMoveTooNew:
	writetext Text_RejectMonWithNewMove
	closetext
	end

.MonHasMail:
	writetext Text_RejectMonWithMail
	closetext
	end

Script_LeftCableTradeCenter:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkTradeRoom
	setscene SCENE_DEFAULT
	setmapscene TRADE_CENTER, SCENE_DEFAULT
	end

Script_LeftMobileTradeRoom:
	special Function101220
	scall Script_WalkOutOfMobileTradeRoom
	setscene SCENE_DEFAULT
	setmapscene MOBILE_TRADE_ROOM, SCENE_DEFAULT
	end

Script_WalkOutOfMobileTradeRoom:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksUpAndLeft
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksOutOfMobileRoom
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksRightAndDown
	end

Script_LeftCableColosseum:
	special WaitForOtherPlayerToExit
	scall Script_WalkOutOfLinkBattleRoom
	setscene SCENE_DEFAULT
	setmapscene COLOSSEUM, SCENE_DEFAULT
	end

Script_LeftMobileBattleRoom:
	special Function101220
	scall Script_WalkOutOfMobileBattleRoom
	setscene SCENE_DEFAULT
	setmapscene MOBILE_BATTLE_ROOM, SCENE_DEFAULT
	end

Script_WalkOutOfMobileBattleRoom:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksUpAndLeft
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksOutOfMobileRoom
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMobileMovementData_ReceptionistWalksRightAndDown
	end

Pokecenter2F_CheckGender:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsUp
	end

.Female:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsUp
	opentext
	writetext Text_OhPleaseWait
	waitbutton
	closetext
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistLooksRight
	turnobject PLAYER, RIGHT
	opentext
	writetext Text_ChangeTheLook
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special ReplaceKrisSprite
	opentext
	writetext Text_LikeTheLook
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepUp
	end

Script_WalkOutOfLinkTradeRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown_2
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	special ReplaceKrisSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2
	applymovement POKECENTER2F_TRADE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

Script_WalkOutOfLinkBattleRoom:
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesThreeStepsDown
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

.Female:
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown_2
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special ReplaceKrisSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2
	applymovement POKECENTER2F_BATTLE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightAndDown
	end

TimeCapsuleScript_CheckPlayerGender:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	readvar VAR_FACING
	ifequal LEFT, .MaleFacingLeft
	ifequal RIGHT, .MaleFacingRight
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsUp_2
	end

.MaleFacingLeft:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksLeftAndUp
	end

.MaleFacingRight:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsRightLooksDown
	applymovement PLAYER, Pokecenter2FMovementData_PlayerWalksRightAndUp
	end

.Female:
	readvar VAR_FACING
	ifequal RIGHT, .FemaleFacingRight
	ifequal LEFT, .FemaleFacingLeft
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepUp_2
	sjump .FemaleContinue

.FemaleFacingRight:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsRightLooksLeft_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepRight
	sjump .FemaleContinue

.FemaleFacingLeft:
	applymovementlasttalked Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight_2
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepLeft
.FemaleContinue:
	opentext
	writetext Text_OhPleaseWait
	waitbutton
	closetext
	readvar VAR_FACING
	ifnotequal UP, .FemaleChangeApperance
	turnobject PLAYER, LEFT
.FemaleChangeApperance:
	opentext
	writetext Text_ChangeTheLook
	waitbutton
	closetext
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_RED << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingDown
	faceobject PLAYER, POKECENTER2F_TIME_CAPSULE_RECEPTIONIST
	setflag ENGINE_KRIS_IN_CABLE_CLUB
	special ReplaceKrisSprite
	opentext
	writetext Text_LikeTheLook
	waitbutton
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepUp_2
	end

Script_LeftTimeCapsule:
	special WaitForOtherPlayerToExit
	checkflag ENGINE_KRIS_IN_CABLE_CLUB
	iftrue .Female
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesTwoStepsDown
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2
	sjump .Done

.Female:
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown
	clearflag ENGINE_KRIS_IN_CABLE_CLUB
	playsound SFX_TINGLE
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight
	setval (PAL_NPC_BLUE << 4)
	special SetPlayerPalette
	applymovement PLAYER, Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft
	special ReplaceKrisSprite
	applymovement PLAYER, Pokecenter2FMovementData_PlayerTakesOneStepDown
	applymovement POKECENTER2F_TIME_CAPSULE_RECEPTIONIST, Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2
.Done:
	setscene SCENE_DEFAULT
	setmapscene TIME_CAPSULE, SCENE_DEFAULT
	end

Pokecenter2FLinkRecordSign:
	refreshscreen
	special DisplayLinkRecord
	closetext
	end

Pokecenter2FOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
	iftrue .AlreadyGotGift
	writetext Text_MysteryGiftDeliveryGuy_Intro
	yesorno
	iffalse .RefusedGift
	writetext Text_MysteryGiftDeliveryGuy_HereYouGo
	buttonsound
	waitsfx
	special GetMysteryGiftItem
	iffalse .BagIsFull
	itemnotify
	setevent EVENT_MYSTERY_GIFT_DELIVERY_GUY
.AlreadyGotGift:
	writetext Text_MysteryGiftDeliveryGuy_Outro
	waitbutton
	closetext
	end

.BagIsFull:
	writetext Text_MysteryGiftDeliveryGuy_NoRoom
	waitbutton
	closetext
	end

.RefusedGift:
	writetext Text_MysteryGiftDeliveryGuy_SaidNo
	waitbutton
	closetext
	end

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMobileMobileMovementData_ReceptionistWalksUpAndLeft_LookDown:
	slow_step UP
	slow_step LEFT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsLeftLooksDown:
	slow_step LEFT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown:
	slow_step RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistWalksUpAndLeft_LookRight_2:
	slow_step UP
	slow_step RIGHT
	turn_head LEFT
	step_end

Pokecenter2FMovementData_ReceptionistLooksRight:
	turn_head LEFT
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsUp:
	step UP
	step UP
	step LEFT
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsUp:
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepUp:
	step LEFT
	step UP
	step_end

Pokecenter2FMobileMovementData_PlayerWalksIntoMobileBattleRoom:
	step UP
	step UP
	step RIGHT
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsUp_2:
	step UP
	step UP
	step_end

Pokecenter2FMovementData_PlayerWalksLeftAndUp:
	step LEFT
	step UP
	step_end

Pokecenter2FMovementData_PlayerWalksRightAndUp:
	step RIGHT
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesThreeStepsDown:
	step DOWN
	step RIGHT
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsDown:
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepDown:
	step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightAndDown:
	slow_step LEFT
	slow_step DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_2:
	slow_step RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksDown_3:
	slow_step UP
	slow_step RIGHT
	turn_head LEFT
	step_end

Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight:
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMobileMovementData_ReceptionistWalksUpAndLeft:
	slow_step UP
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerWalksOutOfMobileRoom:
	step DOWN
	step LEFT
	step DOWN
	step DOWN
	step_end

Pokecenter2FMobileMovementData_ReceptionistWalksRightAndDown:
	slow_step RIGHT
	slow_step DOWN
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingRight:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingLeft:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head LEFT
	step_end

Pokecenter2FMovementData_PlayerSpinsClockwiseEndsFacingDown:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepDown_2:
	step DOWN
	step RIGHT
	step_end

Pokecenter2FMovementData_PlayerTakesTwoStepsDown_2:
	step DOWN
	step DOWN
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepUp_2:
	step UP
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepRight:
	step RIGHT
	step_end

Pokecenter2FMovementData_PlayerTakesOneStepLeft:
	step LEFT
	step_end

Pokecenter2FMovementData_ReceptionistStepsLeftLooksRight_2:
	slow_step LEFT
	turn_head RIGHT
	step_end

Pokecenter2FMovementData_ReceptionistStepsRightLooksLeft_2:
	slow_step RIGHT
	turn_head LEFT
	step_end

Text_BattleReceptionistMobile:
	text "Would you like to"
	line "battle over a GAME"

	para "LINK cable or by"
	line "mobile phone?"
	done

Text_TradeReceptionistMobile:
	text "Would you like to"
	line "trade over a GAME"

	para "LINK cable or by"
	line "mobile phone?"
	done

Text_ThisWayToMobileRoom:
	text "This way to the"
	line "MOBILE ROOM."
	done

Text_BattleReceptionistIntro:
	text "Ti do il benvenuto"
	line "nel COLOSSEO del"
	cont "CLUB VIA CAVO."

	para "Qui puoi sfidare"
	line "un amico."

	para "Hai voglia di"
	line "lottare?"
	done

Text_TradeReceptionistIntro:
	text "Ti do il benvenuto"
	line "nel CENTRO SCAMBI"
	cont "del CLUB VIA CAVO."

	para "Qui puoi scambiare"
	line "i tuoi #MON con"
	cont "quelli di"
	cont "un amico."

	para "Vuoi scambiare?"
	done

Text_TimeCapsuleReceptionistIntro:
	text "Ti do il benvenuto"
	line "nella TEMPOCAPSULA"
	cont "del CLUB VIA CAVO."

	para "Puoi viaggiare nel"
	line "passato per scam-"
	cont "biare i #MON."

	para "Vorresti fare un"
	line "viaggio nel tempo?"
	done

Text_FriendNotReady:
	text "Il tuo avversario"
	line "non è pronto."
	prompt

Text_MustSaveGame:
	text "Prima di aprire il"
	line "collegamento,"
	cont "salva il gioco."
	done

Text_PleaseWait:
	text "Attendi."
	done

Text_LinkTimedOut:
	text "Il collegamento è"
	line "stato interrotto"
	cont "perché inattivo."

	para "Contatta il tuo"
	line "amico e riprovate!"
	prompt

Text_PleaseComeAgain:
	text "Arrivederci!"
	prompt

Text_PleaseComeIn:
	text "Prego, entra."
	prompt

Text_TemporaryStagingInLinkRoom:
	text "Puoi accedere alla"
	line "stanza di"
	cont "collegamento per"
	cont "il momento."
	done

Text_CantLinkToThePast:
	text "Da qui non puoi"
	line "collegarti al"
	cont "passato."
	prompt

Text_IncompatibleRooms:
	text "Il tuo amico ha"
	line "scelto un'altra"
	cont "stanza."
	prompt

Text_PleaseComeIn2:
	text "Prego, entra."
	done

Text_PleaseEnter:
	text "Entra, prego."
	prompt

Text_RejectNewMon:
	text "Non puoi portare"
	line "@"
	text_ram wStringBuffer1
	text "."
	prompt

Text_RejectMonWithNewMove:
	text "Non puoi portare"
	line "@"
	text_ram wStringBuffer1
	text ": ha"
	cont "@"
	text_ram wStringBuffer2
	text "."
	prompt

Text_RejectMonWithMail:
	text "Non puoi portare"
	line "@"
	text_ram wStringBuffer1
	text ":"
	cont "ha un MESSAGGIO."
	prompt

Text_TimeCapsuleClosed:
	text "Spiacenti, ma la"
	line "TEMPOCAPSULA è"
	cont "in riparazione."
	done

Text_TradeRoomClosed:
	text "Spiacenti, ma la"
	line "MACCHINA SCAMBI"
	cont "è in riparazione."
	done

Text_BattleRoomClosed:
	text "Spiacenti, ma la"
	line "MACCHINA LOTTE"
	cont "è in riparazione."
	done

Text_MysteryGiftDeliveryGuy_Intro:
	text "Salve! Tu sei"
	line "<PLAYER>, vero?"

	para "Ho qualcosa da"
	line "darti."
	done

Text_MysteryGiftDeliveryGuy_HereYouGo:
	text "Ecco a te!"
	done

Text_MysteryGiftDeliveryGuy_Outro:
	text "Speriamo di"
	line "rivederti presto."
	done

Text_MysteryGiftDeliveryGuy_NoRoom:
	text "Oh, non hai spazio"
	line "per questo."

	para "Fermati a"
	line "prenderlo in un"

	para "CENTRO #MON."
	done

Text_MysteryGiftDeliveryGuy_SaidNo:
	text "No? Questo è"
	line "molto strano…"
	done

Text_OhPleaseWait:
	text "Aspetta un attimo."
	done

Text_ChangeTheLook:
	text "Prima dovrai"
	line "cambiare"
	cont "abbigliamento…"
	done

Text_LikeTheLook:
	text "Ti piace questo"
	line "look?"
	done

Text_BrokeStadiumRules:
	text "Scusami!"

	para "Per le regole di"
	line "STADIUM, devi"

	para "portare sei"
	line "#MON diversi."

	para "Le UOVA non sono"
	line "ammesse."

	para "I sei #MON"
	line "devono essere"
	cont "tutti diversi."

	para "E non possono"
	line "tenere gli stessi"
	cont "strumenti."

	para "Bene, preparati e"
	line "poi torna qui."
	done

Pokecenter2F_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  0,  7, POKECENTER_2F, -1
	warp_event  4,  0, TRADE_CENTER, 1
	warp_event  8,  0, COLOSSEUM, 1
	warp_event 13,  2, TIME_CAPSULE, 1
	warp_event  6,  0, MOBILE_TRADE_ROOM, 1
	warp_event 10,  0, MOBILE_BATTLE_ROOM, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7,  3, BGEVENT_READ, Pokecenter2FLinkRecordSign

	db 4 ; object events
	object_event  5,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Trade, -1
	object_event  9,  2, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_Battle, -1
	object_event 13,  3, SPRITE_LINK_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LinkReceptionistScript_TimeCapsule, -1
	object_event  1,  1, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Pokecenter2FOfficerScript, EVENT_MYSTERY_GIFT_DELIVERY_GUY
