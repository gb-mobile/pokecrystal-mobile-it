landmark: MACRO
; x, y, name
	db \1 + 8, \2 + 16
	dw \3
ENDM

Landmarks:
; entries correspond to constants/landmark_constants.asm
	dbbw       0,   0, SpecialMapName
	landmark 140, 100, NewBarkTownName
	landmark 128, 100, Route29Name
	landmark 100, 100, CherrygroveCityName
	landmark 100,  80, Route30Name
	landmark  96,  60, Route31Name
	landmark  84,  60, VioletCityName
	landmark  85,  58, SproutTowerName
	landmark  84,  92, Route32Name
	landmark  76,  76, RuinsOfAlphName
	landmark  84, 124, UnionCaveName
	landmark  82, 124, Route33Name
	landmark  68, 124, AzaleaTownName
	landmark  70, 122, SlowpokeWellName
	landmark  52, 120, IlexForestName
	landmark  52, 112, Route34Name
	landmark  52,  92, GoldenrodCityName
	landmark  50,  92, RadioTowerName
	landmark  52,  76, Route35Name
	landmark  52,  60, NationalParkName
	landmark  64,  60, Route36Name
	landmark  68,  52, Route37Name
	landmark  68,  44, EcruteakCityName
	landmark  70,  42, TinTowerName
	landmark  66,  42, BurnedTowerName
	landmark  52,  44, Route38Name
	landmark  36,  48, Route39Name
	landmark  36,  60, OlivineCityName
	landmark  38,  62, LighthouseName
	landmark  28,  56, BattleTowerName
	landmark  28,  64, Route40Name
	landmark  28,  92, WhirlIslandsName
	landmark  28, 100, Route41Name
	landmark  20, 100, CianwoodCityName
	landmark  92,  44, Route42Name
	landmark  84,  44, MtMortarName
	landmark 108,  44, MahoganyTownName
	landmark 108,  36, Route43Name
	landmark 108,  28, LakeOfRageName
	landmark 120,  44, Route44Name
	landmark 130,  38, IcePathName
	landmark 132,  44, BlackthornCityName
	landmark 132,  36, DragonsDenName
	landmark 132,  64, Route45Name
	landmark 112,  72, DarkCaveName
	landmark 124,  88, Route46Name
	landmark 148,  68, SilverCaveName
	landmark  52, 108, PalletTownName
	landmark  52,  92, Route1Name
	landmark  52,  76, ViridianCityName
	landmark  52,  64, Route2Name
	landmark  52,  52, PewterCityName
	landmark  64,  52, Route3Name
	landmark  76,  52, MtMoonName
	landmark  88,  52, Route4Name
	landmark 100,  52, CeruleanCityName
	landmark 100,  44, Route24Name
	landmark 108,  36, Route25Name
	landmark 100,  60, Route5Name
	landmark 108,  76, UndergroundName
	landmark 100,  76, Route6Name
	landmark 100,  84, VermilionCityName
	landmark  88,  60, DiglettsCaveName
	landmark  88,  68, Route7Name
	landmark 116,  68, Route8Name
	landmark 116,  52, Route9Name
	landmark 132,  52, RockTunnelName
	landmark 132,  56, Route10Name
	landmark 132,  60, PowerPlantName
	landmark 132,  68, LavenderTownName
	landmark 140,  68, LavRadioTowerName
	landmark  76,  68, CeladonCityName
	landmark 100,  68, SaffronCityName
	landmark 116,  84, Route11Name
	landmark 132,  80, Route12Name
	landmark 124, 100, Route13Name
	landmark 116, 112, Route14Name
	landmark 104, 116, Route15Name
	landmark  68,  68, Route16Name
	landmark  68,  92, Route17Name
	landmark  80, 116, Route18Name
	landmark  92, 116, FuchsiaCityName
	landmark  92, 128, Route19Name
	landmark  76, 132, Route20Name
	landmark  68, 132, SeafoamIslandsName
	landmark  52, 132, CinnabarIslandName
	landmark  52, 120, Route21Name
	landmark  36,  68, Route22Name
	landmark  28,  52, VictoryRoadName
	landmark  28,  44, Route23Name
	landmark  28,  36, IndigoPlateauName
	landmark  28,  92, Route26Name
	landmark  20, 100, Route27Name
	landmark  12, 100, TohjoFallsName
	landmark  20,  68, Route28Name
	landmark 140, 116, FastShipName

NewBarkTownName:     	db "BORGO¯FOGLIANOVA@"
CherrygroveCityName: 	db "FIORPESCO-POLI@"
VioletCityName:      	db "VIOLAPOLI@"
AzaleaTownName:      	db "AZALINA@"
GoldenrodCityName:   	db "FIORDORO-POLI@"
EcruteakCityName:    	db "AMARANTO-POLI@"
OlivineCityName:     	db "OLIVINO-POLI@"
CianwoodCityName:    	db "FIORLISO-POLI@"
MahoganyTownName:    	db "MOGANIA@"
BlackthornCityName:  	db "EBANOPOLI@"
LakeOfRageName:      	db "LAGO D'IRA@"
SilverCaveName:      	db "MONTE¯ARGENTO@"
SproutTowerName:     	db "TORRE¯SPROUT@"
RuinsOfAlphName:     	db "ROVINE¯D'ALFA@"
UnionCaveName:       	db "GROTTA DI¯MEZZO@"
SlowpokeWellName:    	db "POZZO¯SLOWPOKE@"
RadioTowerName:      	db "TORRE RADIO@"
PowerPlantName:      	db "CENTRALE¯ELETT.@"
NationalParkName:    	db "PARCO¯NAZIONALE@"
TinTowerName:        	db "TORRE DI¯LATTA@"
LighthouseName:      	db "FARO@"
WhirlIslandsName:    	db "ISOLE¯VORTICOSE@"
MtMortarName:        	db "MONTE¯SCODELLA@"
DragonsDenName:      	db "TANA DEL¯DRAGO@"
IcePathName:         	db "VIA¯GELATA@"
NotApplicableName:   	db "N/A@" ; "オバケやしき" ("HAUNTED HOUSE") in Japanese
PalletTownName:      	db "BIANCAVILLA@"
ViridianCityName:    	db "SMERALDO-POLI@"
PewterCityName:      	db "PLUMBEOPOLI@"
CeruleanCityName:    	db "CELESTOPOLI@"
LavenderTownName:    	db "LAVANDONIA@"
VermilionCityName:   	db "ARANCIO-POLI@"
CeladonCityName:     	db "AZZURROPOLI@"
SaffronCityName:     	db "ZAFFERANO-POLI@"
FuchsiaCityName:     	db "FUCSIAPOLI@"
CinnabarIslandName:  	db "ISOLA¯CANNELLA@"
IndigoPlateauName:   	db "ALTOPIANO¯BLU@"
VictoryRoadName:     	db "VIA¯VITTORIA@"
MtMoonName:          	db "MONTELUNA@"
RockTunnelName:      	db "TUNNEL-ROCCIOSO@"
LavRadioTowerName:   	db "TORRE RADIO¯LAV@"
SilphCoName:         	db "SILPH SPA@"
SafariZoneName:      	db "ZONA SAFARI@"
SeafoamIslandsName:  	db "ISOLE¯SPUMARINE@"
PokemonMansionName:  	db "VILLA¯#MON@"
CeruleanCaveName:    	db "GROTTA¯CELESTE@"
Route1Name:          	db "PERCORSO 1@"
Route2Name:          	db "PERCORSO 2@"
Route3Name:          	db "PERCORSO 3@"
Route4Name:          	db "PERCORSO 4@"
Route5Name:          	db "PERCORSO 5@"
Route6Name:          	db "PERCORSO 6@"
Route7Name:          	db "PERCORSO 7@"
Route8Name:          	db "PERCORSO 8@"
Route9Name:          	db "PERCORSO 9@"
Route10Name:         	db "PERCORSO 10@"
Route11Name:         	db "PERCORSO 11@"
Route12Name:         	db "PERCORSO 12@"
Route13Name:         	db "PERCORSO 13@"
Route14Name:         	db "PERCORSO 14@"
Route15Name:         	db "PERCORSO 15@"
Route16Name:         	db "PERCORSO 16@"
Route17Name:         	db "PERCORSO 17@"
Route18Name:         	db "PERCORSO 18@"
Route19Name:         	db "PERCORSO 19@"
Route20Name:         	db "PERCORSO 20@"
Route21Name:         	db "PERCORSO 21@"
Route22Name:         	db "PERCORSO 22@"
Route23Name:         	db "PERCORSO 23@"
Route24Name:         	db "PERCORSO 24@"
Route25Name:         	db "PERCORSO 25@"
Route26Name:         	db "PERCORSO 26@"
Route27Name:         	db "PERCORSO 27@"
Route28Name:         	db "PERCORSO 28@"
Route29Name:         	db "PERCORSO 29@"
Route30Name:         	db "PERCORSO 30@"
Route31Name:         	db "PERCORSO 31@"
Route32Name:         	db "PERCORSO 32@"
Route33Name:         	db "PERCORSO 33@"
Route34Name:         	db "PERCORSO 34@"
Route35Name:         	db "PERCORSO 35@"
Route36Name:         	db "PERCORSO 36@"
Route37Name:         	db "PERCORSO 37@"
Route38Name:         	db "PERCORSO 38@"
Route39Name:         	db "PERCORSO 39@"
Route40Name:         	db "PERCORSO 40@"
Route41Name:         	db "PERCORSO 41@"
Route42Name:         	db "PERCORSO 42@"
Route43Name:         	db "PERCORSO 43@"
Route44Name:         	db "PERCORSO 44@"
Route45Name:         	db "PERCORSO 45@"
Route46Name:         	db "PERCORSO 46@"
DarkCaveName:        	db "GROTTA¯SCURA@"
IlexForestName:      	db "BOSCO DI¯LECCI@"
BurnedTowerName:     	db "TORRE¯BRUCIATA@"
FastShipName:        	db "NAVE VELOCE@"
ViridianForestName:  	db "BOSCO-SMERALDO@"
DiglettsCaveName:    	db "GROTTA¯DIGLETT@"
TohjoFallsName:      	db "CASCATE¯TOHJO@"
UndergroundName:     	db "SOTTERRANEI@"
BattleTowerName:     	db "TORRE¯LOTTA@"
SpecialMapName:      	db "SPECIALE@"
