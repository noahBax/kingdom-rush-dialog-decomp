{
    "adventures" : [
        {
            "id" : "wasteland",
            "level" : 1,

            "mapPrefab" : "MapContentWasteland",

            "defaultQuest": "rlDefault",
            "defaultQuestGroup": "empty",
            "defaultEmergentQuestGroup" : "allEmergents",
            "globalQuests" : ["add_xp_when_exploring","count_steps_taken_in_map", "healing_when_walking_with_food_item", "basic_achievements", "wasteland_multiple_legends_achievement"],
            "emergentInterruptChance" : 0.60,
            "mapOrientation" : "Custom",
            "guild" : {
                "food" : 9,
                "loot" : 100    
            },
            "inventory" : ["food","food","food","food","food","tent","coffee","bandage"],


            "newMapGenerationConfig" : {
                "enabled" : true,
                "roads" : [
                    {
                        "roadId" : "Ruta1",
                        "nodes" : ["right1"]
                    },
                    {
                        "roadId" : "Ruta2",
                        "nodes" : ["left1","center2","left3","center4", "left5", "center6", "left8", "left9", "left10", "center11", "left12", "center13", "left14"]
                    },
                    {
                        "roadId" : "Ruta3",
                        "nodes" : ["right3"]
                    },
                    {
                        "roadId" : "Ruta4",
                        "nodes" : ["right5"]
                    },
                    {
                        "roadId" : "Ruta5",
                        "nodes" : ["right7", "right8", "right9", "right10"]
                    },
                    {
                        "roadId" : "Ruta6",
                        "nodes" : ["right12"]
                    },
                    {
                        "roadId" : "Ruta7",
                        "nodes" : ["right14"]
                    }
                ],
                "rules" : [
                    {
                        "key" : [],
                        "results" : [
                            {
                                "token" : "C",
                                "chance" : 7
                            },
                            {
                                "token" : "N",
                                "chance" : 3
                            },
                            {
                                "token" : "S",
                                "chance" : 0
                            }
                        ]
                    },
                    {
                        "key" : ["C"],
                        "results" : [
                           {
                                "token" : "C",
                                "chance" : 5
                            },
                            {
                                "token" : "N",
                                "chance" : 3
                            },
                            {
                                "token" : "S",
                                "chance" : 3
                            }
                        ]
                    },
                    {
                        "key" : ["N"],
                        "results" : [
                           {
                                "token" : "C",
                                "chance" : 7
                            },
                            {
                                "token" : "N",
                                "chance" : 0
                            },
                            {
                                "token" : "S",
                                "chance" : 3
                            }
                        ]
                    },
                    {
                        "key" : ["S"],
                        "results" : [
                           {
                                "token" : "C",
                                "chance" : 8
                            },
                            {
                                "token" : "N",
                                "chance" : 2
                            },
                            {
                                "token" : "S",
                                "chance" : 0
                            }
                        ]
                    },
                    {
                        "key" : ["C","C"],
                        "results" : [
                           {
                                "token" : "C",
                                "chance" : 0
                            },
                            {
                                "token" : "N",
                                "chance" : 6
                            },
                            {
                                "token" : "S",
                                "chance" : 4
                            }
                        ]
                    },
                    {
                        "key" : ["N", "N"],
                        "results" : [
                           {
                                "token" : "C",
                                "chance" : 8
                            },
                            {
                                "token" : "N",
                                "chance" : 0
                            },
                            {
                                "token" : "S",
                                "chance" : 2
                            }
                        ]
                    },
                    {
                        "key" : ["N", "S"],
                        "results" : [
                           {
                                "token" : "C",
                                "chance" : 9
                            },
                            {
                                "token" : "N",
                                "chance" : 1
                            },
                            {
                                "token" : "S",
                                "chance" : 0
                            }
                        ]
                    },
                    {
                        "key" : ["C", "S"],
                        "results" : [
                           {
                                "token" : "C",
                                "chance" : 6
                            },
                            {
                                "token" : "N",
                                "chance" : 4
                            },
                            {
                                "token" : "S",
                                "chance" : 0
                            }
                        ]
                    }
                ],
                "refineRules" : [
                    {
                        "key" : ["S"],
                        "results" : [
                            {
                                "token" : "ST",
                                "chance" : 3
                            },
                            {
                                "token" : "SS",
                                "chance" : 6
                            },
                            {
                                "token" : "SR",
                                "chance" : 1
                            }
                        ]
                    }
                ]
            },

            "limits": [
                { "limitId" : "BLOCKER", "max" : 3}
            ],
            
            "nodes": [
                {
                    "name": "start",
                    "questGroup": "empty",
                    "quests": [
                        {
                            "name": "IntroWasteland"
                        }
                    ]
                },
                {
                    "name": "left1",
                    "questGroup": "introWasteland",
                    "quests": [],
                    "tags" : ["easy"]
                },
                
                {
                    "name": "left3",
                    "questGroup": "easy",
                    "quests": [],
                    "tags" : ["easy"]
                },
                
                {
                    "name": "left5",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "left8",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "left9",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "left10",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "left12",
                    "questGroup": "advanced",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "left14",
                    "questGroup": "advanced",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "left15",
                    "questGroup": "preBossQuests",
                    "quests": [],
                    "tags" : ["advanced"]  
                },
                {
                    "name": "right1",
                    "questGroup": "introWasteland",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "right3",
                    "questGroup": "easy",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "right5",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "right7",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "right8",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },

                {
                    "name": "right9",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "right10",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "right12",
                    "questGroup": "advanced",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "right14",
                    "questGroup": "advanced",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "right15",
                    "questGroup": "preBossQuests",
                    "quests": [],
                    "tags" : ["advanced"]    
                },
                {
                    "name": "center2",
                    "questGroup": "easy",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "center4",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "center6",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "center10",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "WastelandTavern"  
                },
                {
                    "name": "center11",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "center13",
                    "questGroup": "advanced",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "boss",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "WastelandBF"  
                },
                {
                    "name": "start-left1",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "start-right1",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "left15-boss",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "right15-boss",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                   "name": "left1-center2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "center2-left3",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "center2-right3",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "left3-center4",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "right3-center4",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "center4-left5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "center4-right5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "right5-center6",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "left5-center6",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "center6-left8",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "center6-right7",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "right7-right8",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "right8-right9",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "left8-left9",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "right9-right10",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "right9-center10",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "left9-center10",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "left9-left10",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "center10-center11",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "right10-center11",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "left10-center11",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "center11-left12",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "center11-right12",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "left12-center13",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "right12-center13",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "center13-right14",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "center13-left14",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "left14-left15",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "right14-right15",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                }
            ],
            "questGroups": [
                {
                    "name": "empty",
                    "quests": []
                },
                {
                    "name": "subNodes",
                    "quests": [
                        //"BoulderBlock|blockers",
                        //"Pitfall"
                        "MagicBarrier",
                        "BoulderBlock",
                        "RoadblockCamp",
                        "BlazingChasm"
                        //"TaintedCave"
                    ]
                },
                {
                    "name": "preBossQuests",
                    "quests": [
                        "MarkOfSorrow",
                        "PreBossSalesman"
                    ]
                },
                {
                    "name": "introWasteland",
                    "quests": [

                        ///Wasteland Challenges

                        //"HopefulPresent", //treasure
                        "SquealingTide", //narrative
                        "AncientWorkshop",//narrative
                        "SulfuricBreach",//narrative
                        "NightWarriors",//narrative
                        "TaintedCave",//narrative

                        ///Wasteland Combats
                        "Rottingham",
                        "OculusSinister",
                        "HotRocking"
                        
                    ]
                },


                {
                    "name": "easy",
                    "quests": [
                        ///Genéricos Challenge
                        //"TheAbandonedCampMountains",
                        "BuriedLootWasteland",
                        "DarkTunnelWasteland",

                        ///Genéricos Diálogo
                        "WellOfWonders",
                        "ShroudedGift", 
                        "Riddlemaster",
                        "TheHandOfFate2",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith", 
                        "WanderingSalesman",
                        "WanderingArmorsmith2",
                        "WanderingWeaponsmith2", 
                        "WanderingSalesman2",
                        "HiddenChestWasteland",
                        "CrystalCaveWasteland",

                        ///Wasteland Challenges
                        "AshesAndDust",
                        "NightWarriors",
                        "PitchBlackNight",
                        "SquealingTide",
                        "AncientWorkshop",
                        "SulfuricBreach",
                        "DemonSpawnSpa",
                        "TalesFromTheCrypt",

                        ///Wasteland Diálogo
                        "WickedSisters",
                        "Boneflute",

                        ///Wasteland Santuario
                        "DarkPresent",
                        "HopefulPresent",

                        ///Wasteland Combates
                        "HeatWave",
                        "BestFiendsForever",
                        "TellNoTales",
                        "TestYourMight",
                        "BoredAsHell",
                        "PeekAGoon",
                        "SmokeOnTheLava",
                        "UndeadRedemption",
                        "BoneVoyage",
                       
                        ///Wasteland Cult Challenges
                        //"MagicBarrier",
                        "DistressCall",
                        "RattlingHorde",
                        "LucidNightmare",
                        "ObsidianCave",
                        "TaintedCave",
                        "RitualCrashers",
                        "BlackCorridors",


                        ///Wasteland Cult Diálogo
                        "UnblindedPrisoner",
                        "SecondWind",
                        "SecondWind2",
                        "SecondWind3",

                        ///Wasteland Cult Santuario
                        "BooksOfTheGlare",
                        //"MarkOfSorrow",

                        ///Wasteland Cult Combates
                        "DieAnotherDay",
                        "Deadlock",
                        "UndeadEnd",
                        "FranticFanatics"
                        
                    ]
                },
                {
                    "name": "normal",
                    "quests": [
                        ///Genéricos Challenge
                        //"TheAbandonedCampMountains",
                        "BuriedLootWasteland",
                        "DarkTunnelWasteland",
                        
                        ///Genéricos Diálogo
                        "Riddlemaster",
                        "WellOfWonders",
                        "TheHandOfFate2",
                        "ShroudedGift",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith",
                        "WanderingSalesman",
                        "WanderingArmorsmith2",
                        "WanderingWeaponsmith2", 
                        "WanderingSalesman2",
                        //"CampgroundsMountains",
                        "HiddenChestWasteland",
                        "CrystalCaveWasteland",

                        ///Genéricos Combate
                        //"CultRitual",

                        ///Wasteland Challenges
                        "AshesAndDust",
                        "NightWarriors",
                        "PitchBlackNight",
                        "SquealingTide",
                        "AncientWorkshop",
                        "SulfuricBreach",
                        "DemonSpawnSpa",
                        "TalesFromTheCrypt",

                        ///Wasteland Diálogo
                        "WickedSisters",
                        "Boneflute",

                        ///Wasteland Santuario
                        "DarkPresent",
                        "HopefulPresent",

                        ///Wasteland Combates
                        "HeatWave",
                        "BestFiendsForever",
                        "TellNoTales",
                        "TestYourMight",
                        "BoredAsHell",
                        "PeekAGoon",
                        "SmokeOnTheLava",
                        "UndeadRedemption",
                        "BoneVoyage",
                        "BurningBridges",
                        "DownUnder",
                        "MaliceAndFire",
                        "MoltenPass",

                        ///Wasteland Cult Challenges
                        //"MagicBarrier",
                        "DistressCall",
                        "RattlingHorde",
                        "LucidNightmare",
                        "ObsidianCave",
                        "TaintedCave",
                        "RitualCrashers",
                        "BlackCorridors",

                        ///Wasteland Cult Diálogo
                        "UnblindedPrisoner",
                        "SecondWind",
                        "SecondWind2",
                        "SecondWind3",

                        ///Wasteland Cult Santuario
                        "BooksOfTheGlare",
                        //"MarkOfSorrow",

                        ///Wasteland Cult Combates
                        "DieAnotherDay",
                        "LifeGiver",
                        "UndeadEnd",
                        "FieryPassage",
                        "Glarewhere",
                        "EyeWorshippers",
                        "Crossfire",
                        "UndeadEnd",
                        "Deadlock",
                        "Bookworms",
                        "HillsHaveEyes",
                        "FranticFanatics",
                        "ThirdEye",
                        "EyesWithoutFace"
                        
                    ]
                },
                {
                    "name": "hard",
                    "quests": [
                        ///Genéricos Challenge
                        //"TheAbandonedCampMountains",
                        "BuriedLootWasteland",
                        "DarkTunnelWasteland",

                        ///Genéricos Diálogo
                        "Riddlemaster",
                        "WellOfWonders",
                        "TheHandOfFate2",
                        "ShroudedGift",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith",
                        "WanderingSalesman",
                        "WanderingArmorsmith2",
                        "WanderingWeaponsmith2", 
                        "WanderingSalesman2",
                        //"CampgroundsMountains",
                        "HiddenChestWasteland",
                        "CrystalCaveWasteland",

                        ///Genéricos Combate
                        //"CultRitual",

                        ///Wasteland Challenges
                        "AshesAndDust",
                        "NightWarriors",
                        "PitchBlackNight",
                        "SquealingTide",
                        "AncientWorkshop",
                        "SulfuricBreach",
                        "DemonSpawnSpa",
                        "TalesFromTheCrypt",

                        ///Wasteland Diálogo
                        "WickedSisters",
                        "Boneflute",

                        ///Wasteland Santuario
                        "DarkPresent",
                        "HopefulPresent",

                        ///Wasteland Combates
                        "BlazingIdols",
                        "DealBreaker",
                        "LordOfTheLies",
                        "RingOfFire",
                        "DownUnder",
                        "BurningBridges",
                        "HeatWave",
                        "MaliceAndFire",
                        "MoltenPass",


                        ///Wasteland Cult Challenges
                        //"MagicBarrier",
                        "DistressCall",
                        "RattlingHorde",
                        "LucidNightmare",
                        "ObsidianCave",
                        "TaintedCave",
                        "RitualCrashers",
                        "BlackCorridors",

                        ///Wasteland Cult Diálogo
                        "UnblindedPrisoner",
                        "SecondWind",
                        "SecondWind2",
                        "SecondWind3",

                        ///Wasteland Cult Santuario
                        "BooksOfTheGlare",
                        //"MarkOfSorrow",

                        ///Wasteland Cult Combates
                        "LifeGiver",
                        "FieryPassage",
                        "Glarewhere",
                        "EyeWorshippers",
                        "EyesWithoutFace",
                        "Crossfire",
                        "HillsHaveEyes",
                        "DesecratedTemple",
                        "TentacleDebacle",
                        "ThirdEye",
                        "InfestedGrounds"
                        
                    ]
                },
                {
                    "name": "advanced",
                    "quests": [
                        ///Genéricos Challenge
                        //"TheAbandonedCampMountains",
                        "BuriedLootWasteland",
                        "DarkTunnelWasteland",

                        
                        ///Genéricos Diálogo
                        "WellOfWonders",
                        "ShroudedGift",
                        "Riddlemaster",
                        "TheHandOfFate2",
                        "WellOfWonders",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith",
                        "WanderingSalesman",
                        "WanderingArmorsmith2",
                        "WanderingWeaponsmith2", 
                        "WanderingSalesman2",
                        //"CampgroundsMountains",
                        "HiddenChestWasteland",
                        "CrystalCaveWasteland",

                        ///Genéricos Combate
                        //"CultRitual",

                        ///Wasteland Challenges
                        "AshesAndDust",
                        "NightWarriors",
                        "PitchBlackNight",
                        "SquealingTide",
                        "AncientWorkshop",
                        "SulfuricBreach",
                        "DemonSpawnSpa",
                        "TalesFromTheCrypt",

                        ///Wasteland Diálogo
                        "WickedSisters",
                        "Boneflute",

                        ///Wasteland Santuario
                        "DarkPresent",
                        "HopefulPresent",

                        ///Wasteland Combates
                        "BlazingIdols",
                        "DealBreaker",
                        "LordOfTheLies",
                        "RingOfFire",


                        ///Wasteland Cult Challenges
                        //"MagicBarrier",
                        "DistressCall",
                        "RattlingHorde",
                        "LucidNightmare",
                        "ObsidianCave",
                        "TaintedCave",
                        "RitualCrashers",
                        "BlackCorridors",

                        ///Wasteland Cult Diálogo
                        "UnblindedPrisoner",
                        "SecondWind",
                        "SecondWind2",
                        "SecondWind3",

                        ///Wasteland Cult Santuario
                        "BooksOfTheGlare",
                       // "MarkOfSorrow",

                        ///Wasteland Cult Combates
                        "TentacleDebacle",
                        "DesecratedTemple",
                        "InfestedGrounds"
                        
                    ]
                },

                {
                    "name": "allEmergents",
                    "quests": [

                        //genericos
                        "AstralCultist",
                        //"InitiateReturns",
                        "LonesomeCamperEmergent",
                        "MorningQuarrel",
                        "PotionIdentifier",
                        

                        //wasteland
                        "CinderStorm",
                        "TheFloorIsLava",
                        "LethalLandslide",
                        "SearingBoulder",
                        "InnerDemon",
                        "WarmHandshake",
                        "BoulderOutOfSpace",
                        "Quickcinder",
                        "GoldFever",

                        //wasteland Cult
                        //"RattlingHorde",
                        "MoltenSurprise",
                        "CrimsonParade",
                        "RunAcolyteRun",
                        "GlareEmissary",
                        "UnblindedFan",
                        "SecondHandGoods",
                        


                        //"Ambush"
                        "WastelandEmergentCombat",
                        "WastelandEmergentCombat2"
                    ]
                }

            ]
        }
    ]
}





