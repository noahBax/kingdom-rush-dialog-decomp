{
    "adventures" : [
        {
            "id" : "silveroak",
            "level" : 1,

            "mapPrefab" : "MapSilveroak",
            
            "defaultQuest": "rlDefault",
            "defaultQuestGroup": "empty",
            "defaultEmergentQuestGroup" : "allEmergents",
             "globalQuests" : ["add_xp_when_exploring","count_steps_taken_in_map", "healing_when_walking_with_food_item", "basic_achievements"],
            "emergentInterruptChance" : 0.75,
            "mapOrientation" : "Custom",
            "guild" : {
                "food" : 9,
                "loot" : 50    
            },
            "inventory" : ["food","food","food","tent","rope","pick","coffee","coffee"],

            "newMapGenerationConfig" : {
                "enabled" : true,
                "roads" : [
                    {
                        "roadId" : "Ruta1",
                        "nodes" : ["left1","left2","left3","left4","left5","left6","left7"]
                    },
                    {
                        "roadId" : "Ruta2",
                        "nodes" : ["right1","right2","right3","right4","right5","right6","right7","right8"]
                    },
                    {
                        "roadId" : "Ruta3",
                        "nodes" : ["mid1","mid2","mid3","mid4"]
                    },
                    {
                        "roadId" : "Ruta4",
                        "nodes" : ["mid5","mid6","mid7"]
                    }
                ],
                "rules" : [
                    {
                        "key" : [],
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
                        "key" : ["C"],
                        "results" : [
                           {
                                "token" : "C",
                                "chance" : 6
                            },
                            {
                                "token" : "N",
                                "chance" : 3
                            },
                            {
                                "token" : "S",
                                "chance" : 1
                            }
                        ]
                    },
                    {
                        "key" : ["N"],
                        "results" : [
                           {
                                "token" : "C",
                                "chance" : 9
                            },
                            {
                                "token" : "N",
                                "chance" : 0
                            },
                            {
                                "token" : "S",
                                "chance" : 1
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
                                "chance" : 8
                            },
                            {
                                "token" : "S",
                                "chance" : 2
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
                                "chance" : 10
                            },
                            {
                                "token" : "N",
                                "chance" : 0
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
                                "chance" : 10
                            },
                            {
                                "token" : "N",
                                "chance" : 0
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
                                "chance" : 4
                            },
                            {
                                "token" : "SS",
                                "chance" : 6
                            },
                            {
                                "token" : "SR",
                                "chance" : 0
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
                            "name": "IntroSilveroak"
                        }
                    ]
                },
                {
                    "name": "left1",
                    "questGroup": "introSilveroak",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "left2",
                    "questGroup": "easy",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "left3",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "left4",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "left5",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "left6",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "left7",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["hard"]
                },
            
                {
                    "name": "mid1",
                    "questGroup": "introSilveroak",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "mid2",
                    "questGroup": "easy",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "mid3",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "mid4",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "mid5",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "mid6",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["normal"] 
                },
                {
                    "name": "mid7",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["hard"]
                },
              
                {
                    "name": "right1",
                    "questGroup": "introSilveroak",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "right2",
                    "questGroup": "easy",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "right3",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "right4",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "right5",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "right6",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "SilveroakTavern",
                    "tags" : ["normal"]
                },
                {
                    "name": "right7",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "right8",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "preStore1",
                    "questGroup": "preBossQuests",
                    "quests": [],
                    "tags" : ["hard"]  
                },
                {
                    "name": "preStore2",
                    "questGroup": "preBossQuests",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "preStore3",
                    "questGroup": "preBossQuests",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "boss",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "SilveroakBF"  
                },
                {
                    "name": "start-right1",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "start-left1",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "start-mid1",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "left7-preStore1",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "left7-preStore2",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "mid7-preStore2",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "right8-preStore2",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "right8-preStore3",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "preStore1-boss",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                
                {
                    "name": "preStore2-boss",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "preStore3-boss",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                   "name": "right1-right2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "right2-mid2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "mid1-mid2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "mid1-left2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "left1-left2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "right2-right3",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "right3-right4",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "mid2-right3",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "mid2-mid3",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "right4-mid4",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "right4-right5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "mid3-mid4",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "left2-left3",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "mid3-left3",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "left3-left4",
                   "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                   "name": "mid4-right6",
                   "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                   "name": "right5-right6",
                   "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                   "name": "left4-mid5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "mid5-right7",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "right6-right7",
                   "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                   "name": "mid5-mid6",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "left4-left5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "mid6-right8",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "right7-right8",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "left5-left6",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "mid6-mid7",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "left6-left7",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "left6-mid7",
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
                        "OrcishDeforestation",
                        "BoulderBlock",
                        "AllEvilRoots",
                        "SleepyWillow"
                        
                    ]
                },
                {
                    "name": "preBossQuests",
                    "quests": [
                        "HealstalkField",
                        "WanderingWeaponsmith2",
                        "PreBossSalesman"
                    ]
                },

                {
                    "name": "introSilveroak",
                    "quests": [

                        ///Silveroak Challenges

                        //"OrcishDeforestation",
                        //"DialogueWithTheStars",
                        "AnUnexpectedFeast",
                        "TheAngryForestDwellers",
                        "ElfByHerself",
                        "TheAshenLass",
                        "AshervanSentinels",

                        ///Silveroak Combats
                        "Ashervanished",
                        "BeatingAroundBushes",
                        "SticksAndStones"
                        
                    ]
                },

                {
                    "name": "easy",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCamp2",
                        "BuriedLoot",
                        "DarkTunnel",

                        ///Genéricos Diálogo
                        //"TavernNew",
                        //"WellOfWonders",
                        "Riddlemaster",
                        "TheHandOfFate2",
                        "ShroudedGift", 

                        ///Genéricos Santuario
                        //"CrystalCaveMountains",
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith", 
                        "WanderingSalesman",
                        "HiddenChest",
                        "Campgrounds",

                        ///Silveroak Challenges
                        //"SleepyWillow",
                        //"AllEvilRoots",
                        //"OrcishDeforestation",
                        "AnUnexpectedFeast",
                        "ElfByHerself",
                        "MagicMysteryTrip",
                        "AshervanSentinels",
                        "TheAngryForestDwellers",
                        "LostAndFoundPit",
                        "OvergrownLab",
                        "ArachnidScholar",
                        "HatchingGrounds",

                        ///Silveroak Diálogo
                        "TheAshenLass",
                        "TheCryingOrc",
                        "PlayfulLights",
                        "BathedInMoonlight",
                        //"DialogueWithTheStars",

                        ///Silveroak Santuario
                        //"HealstalkField",
                        //"SilveroakTavern",
                        "CrystallineCascade",
                        "SecretsOfTheForest",
                        "AGatheringOfSorts",

                        ///Silveroak Combates
                        "Arachnospit",
                        "BarkingBark",
                        "CloverleafGlade",
                        "Fungivitis",
                        "GreenBlockade",
                        "MycelialGrounds",
                        "Treeforce",
                        "VerdantOffenders",
                        "WickedSprouts",
                        "WebsAndSplinters",
                        "OldBarkTree"
                    ]
                },
                {
                    "name": "normal",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCamp2",
                        "BuriedLoot",
                        "DarkTunnel",

                        ///Genéricos Diálogo
                        //"TavernNew",
                        //"WellOfWonders",
                        "Riddlemaster",
                        "TheHandOfFate2",
                        "ShroudedGift", 

                        ///Genéricos Santuario
                        //"CrystalCaveMountains",
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith", 
                        "WanderingSalesman",
                        "HiddenChest",
                        "Campgrounds",

                        ///Silveroak Challenges
                        //"SleepyWillow",
                        //"AllEvilRoots",
                        //"OrcishDeforestation",
                        "AnUnexpectedFeast",
                        "ElfByHerself",
                        "MagicMysteryTrip",
                        "AshervanSentinels",
                        "TheAngryForestDwellers",
                        "LostAndFoundPit",
                        "OvergrownLab",
                        "ArachnidScholar",
                        "HatchingGrounds",

                        ///Silveroak Diálogo
                        "DialogueWithTheStars",
                        "TheAshenLass",
                        "TheCryingOrc",
                        "PlayfulLights",
                        "BathedInMoonlight",

                        ///Silveroak Santuario
                        //"HealstalkField",
                        "SilveroakTavern",
                        "CrystallineCascade",
                        "SecretsOfTheForest",
                        "AGatheringOfSorts",

                        ///Silveroak Combates
                        "Arachnospit",
                        "BarkingBark",
                        "CloverleafGlade",
                        "Fungivitis",
                        "GreenBlockade",
                        "MycelialGrounds",
                        "Treeforce",
                        "VerdantOffenders",
                        "WickedSprouts",
                        "WebsAndSplinters",
                        "OldBarkTree",
                        "BlightAndDarkness",
                        "CreakingWoods",
                        "CreepyCanopies",
                        "DampPassage",
                        "DeepWeb",
                        "LostWoods",
                        "MossyRuins",
                        "WallOfSleep",
                        "WitchesGetStitches",
                        "UnderCoven",
                        "ArborealMadness"

                    ]
                },
                {
                    "name": "hard",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCamp2",
                        "BuriedLoot",
                        "DarkTunnel",

                        ///Genéricos Diálogo
                        //"TavernNew",
                        //"WellOfWonders",
                        "Riddlemaster",
                        "TheHandOfFate2",
                        "ShroudedGift", 

                        ///Genéricos Santuario
                        //"CrystalCaveMountains",
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith", 
                        "WanderingSalesman",
                        "HiddenChest",
                        "Campgrounds",

                        ///Silveroak Challenges
                        //"SleepyWillow",
                        //"AllEvilRoots",
                        //"OrcishDeforestation",
                        "AnUnexpectedFeast",
                        "ElfByHerself",
                        "MagicMysteryTrip",
                        "AshervanSentinels",
                        "TheAngryForestDwellers",
                        "LostAndFoundPit",
                        "OvergrownLab",
                        "ArachnidScholar",
                        "HatchingGrounds",

                        ///Silveroak Diálogo
                        "DialogueWithTheStars",
                        "TheAshenLass",
                        "TheCryingOrc",
                        "PlayfulLights",
                        "BathedInMoonlight",

                        ///Silveroak Santuario
                        //"HealstalkField",
                        "SilveroakTavern",
                        "CrystallineCascade",
                        "SecretsOfTheForest",
                        "AGatheringOfSorts",

                        ///Silveroak Combates
                        "BlightAndDarkness",
                        "CreakingWoods",
                        "CreepyCanopies",
                        "DampPassage",
                        "DeepWeb",
                        "LostWoods",
                        "MossyRuins",
                        "WallOfSleep",
                        "WitchesGetStitches",
                        "UnderCoven",
                        "ArborealMadness"

                    ]
                },

                {
                    "name": "allEmergents",
                    "quests": [

                        //genericos
                        //"AstralCultist",
                        //"PreBossSalesman",
                        //"SpareACoin",
                        "LonesomeCamperEmergent",
                        "MorningQuarrel",
                        "PotionIdentifier",

                        //Silveroak Emergents
                        "AlbeitItDoesMove",
                        "SwarmEnemy",
                        "BurntOfferings",
                        "LikeAShadowInTheNight",
                        "AllThatGlittersIsOurs",
                        "WatchYourStep",
                        "SilveroakRapids",
                        "AsDarknessFalls",
                        "AshervanAmbush",

                        //Ambush

                        "SilveroakEmergentCombat",
                        "SilveroakEmergentCombat2"



                    ]
                }

            ]
        }
    ]
}





