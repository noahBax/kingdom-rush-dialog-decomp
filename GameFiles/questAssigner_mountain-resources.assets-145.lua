{
    "adventures" : [
        {
            "id" : "mountain",
            "level" : 1,

            "mapPrefab" : "MapTrollTavern",
            //"mapPrefab" : "MapContentTestVertical",

            "defaultQuest": "rlDefault",
            "defaultQuestGroup": "empty",
            "defaultEmergentQuestGroup" : "allEmergents",
            //"globalQuests" : ["darkness_cost", "check_defeat_when_all_injured", "count_steps_taken_in_map", "healing_when_walking_with_food_item"],
            //"globalQuests" : ["darkness_cost", "check_defeat_when_all_injured", "count_steps_taken_in_map", "healing_when_walking_with_food_item","add_xp_when_exploring","check_darkness_rising", "darkness_effects", "fire_controller"],
             "globalQuests" : ["add_xp_when_exploring","count_steps_taken_in_map", "healing_when_walking_with_food_item", "basic_achievements", "oloch_unlock_achievement"],
            "emergentInterruptChance" : 0.75,
            "mapOrientation" : "Vertical",
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
                        "nodes" : ["left1","left2","left3","left4"]
                    },
                    {
                        "roadId" : "Ruta2",
                        "nodes" : ["right1","right2","right3","right4"]
                    },
                    {
                        "roadId" : "Ruta3",
                        "nodes" : ["mid1","mid2","mid3","mid4"]
                    },
                    {
                        "roadId" : "Ruta4",
                        "nodes" : ["mid6","left6"]
                    },
                    {
                        "roadId" : "Ruta5",
                        "nodes" : ["left5","left7", "left8"]
                    },
                    {
                        "roadId" : "Ruta6",
                        "nodes" : ["right5","right6","right7"]
                    },
                    {
                        "roadId" : "Ruta7",
                        "nodes" : ["mid6","mid7","mid8"]
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
                            "name": "IntroMountain"
                        }
                    ]
                },
                {
                    "name": "left1",
                    "questGroup": "introMountain",
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
                    "tags" : ["normal"]
                },
                {
                    "name": "left6",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "left7",
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "left8",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "left9",
                    "questGroup": "hardFights",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "mid1",
                    "questGroup": "introMountain",
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
                    "questGroup": "midNode",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "mid6",
                    "questGroup": "normal",
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
                    "name": "mid8",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "mid9",
                    "questGroup": "hardFights",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "right1",
                    "questGroup": "introMountain",
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
                    "questGroup": "normal",
                    "quests": [],
                    "tags" : ["hard"] 
                },
                {
                    "name": "right7",
                    "questGroup": "hard",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "right8",
                    "questGroup": "hardFights",
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
                    "forcedQuest" : "testMBF"  
                },
                {
                    "name": "left1-start",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "mid1-start",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "right1-start",
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
                    "name": "preStore2-mid9",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "left9-preStore1",
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
                    "name": "boss-preStore3",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "boss-preStore1",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                   "name": "left1-left2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "left3-left2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "left3-left4",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "left8-left7",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "mid1-mid2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "left1-mid2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "mid3-mid2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "mid4-mid3",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "mid4-mid5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "mid6-mid5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "mid6-left6",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "mid6-mid7",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "mid8-mid7",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "mid8-left6",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "left3-mid2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "right1-right2",
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
                   "name": "right6-right5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "right6-right7",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "mid1-right2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "mid7-right5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "mid4-right3",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "right4-mid5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["easy"]
                },
                {
                   "name": "left4-mid5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "right4-right3",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "right5-mid5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "mid5-left5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "left6-left5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "left7-left5",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
                },
                {
                   "name": "mid8-mid9",
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
                   "name": "right7-mid9",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "left8-mid9",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "left9-left8",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["hard"]
                },
                {
                   "name": "mid4-left3",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["normal"]
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
                        "BoulderBlock",
                        "ReinforcementsCall",
                        "Pitfall"
                        //"FieldOfThorns2",
                        //"SilkGarden",
                        
                    ]
                },
                {
                    "name": "preBossQuests",
                    "quests": [
                        "Auroras",
                        "WanderingWeaponsmith2",
                        "PreBossSalesman"
                    ]
                },

                {
                    "name": "easy",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCampMountains",
                        "BuriedLootMountains",
                        "DarkTunnelMountains",

                        ///Genéricos Diálogo
                        "Riddlemaster",
                        //"TavernNew",
                        "WellOfWonders",
                        "TheHandOfFate2",
                        "ShroudedGift", 

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith", 
                        "WanderingSalesman",
                        "CampgroundsMountains",
                        "HiddenChestMountains",
                        "CrystalCaveMountains",

                        ///MountainTerrain Challenges
                        "CagedSorcerer",
                        "CrevasseEscape",
                        "VillagerQuarrel",
                        "FrozenLoot",
                        "GlaciarPass",
                        "GoldjayNest",
                        "IceWall",
                        "OwlMessengers",
                        "PeltCache",
                        "ShoddyBridge",
                        "SuffocatedSorcerer",
                        "ToCatchASasquatch",
                        "WinterBerries",

                        ///MountainTerrain Diálogo
                        //"Auroras",
                        "HeCameFromTheNorth",
                        "MountainRoots",
                        "Sasquashed",

                        ///MountainTerrain Santuario
                        "IceFishing",

                        ///MountainTerrain Combates
                        "BoulderValley",
                        //"CrystalForest",
                        //"DarkPitCliff",
                        "FrozenStrait",
                        "RockyPath",
                        //"TrollOutpost",
                        "WoodhavenRock",


                        ///Mountain Ha'Kraj Challenges
                        "IceIceRabies",
                        "CliffRitual",
                        "CrystalClear",
                        "AncientShrine",

                        ///Mountain Ha'Kraj Diálogo
                        "IcingOnTheCrate",
                        "IceMaidens",
                        "RenegadeTroll",

                        ///Mountain Ha'Kraj Combates
                        "ChilltownRecovery",
                        "FrostBitten",
                        "UphillCamp",
                        "IcyBrook",
                        "SnowpileHeights",
                        "EvergreenGlade",
                        "ColdBrood",
                        "CrystalGrotto",
                        "Cliffhanger"
                        
                    ]
                },
                {
                    "name": "normal",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCampMountains",
                        "BuriedLootMountains",
                        "DarkTunnelMountains",
                        
                        ///Genéricos Diálogo
                        "Riddlemaster",
                        //"TavernNew",
                        "WellOfWonders",
                        "TheHandOfFate2",
                        //"DoubtfulPeasant",
                        //"RegretfulInitiate",
                        "ShroudedGift",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith",
                        "WanderingSalesman",
                        "CampgroundsMountains",
                        "HiddenChestMountains",
                        "CrystalCaveMountains",

                        ///Genéricos Combate
                        "CultRitual",

                        ///MountainTerrain Challenges
                        "CagedSorcerer",
                        "CrevasseEscape",
                        "FrozenLoot",
                        "GlaciarPass",
                        "GoldjayNest",
                        "IceWall",
                        "VillagerQuarrel",
                        "OwlMessengers",
                        "PeltCache",
                        "ShoddyBridge",
                        "SuffocatedSorcerer",
                        "ToCatchASasquatch",
                        "WinterBerries",

                        ///MountainTerrain Diálogo
                        

                        ///MountainTerrain Santuario
                        "IceFishing",

                        ///MountainTerrain Combates
                        "BoulderValley",
                        "ChilledStockade",
                        "ChilltownRecovery",
                        //"CrystalForest",
                        "DarkPitCliff",
                        "DrumspearSkirmish",
                        "EvergreenGlade",
                        "FrostSages",
                        "FrozenStrait",
                        "KrajKampNew",
                        "RockyPath",
                        "SnowpileHeights",
                        "TrollOutpost",
                        "WoodhavenRock",

                        ///Mountain Ha'Kraj Challenges
                        "IceIceRabies",
                        "CrystalClear",
                        "CliffRitual",
                        "AncientShrine",

                        ///Mountain Ha'Kraj Diálogo
                        "IcingOnTheCrate",
                        "IceMaidens",
                        "RenegadeTroll",

                        ///Mountain Ha'Kraj Combates
                        "Cliffhanger",
                        "BrokenBridge",
                        "FurElysium",
                        "FrostBitten",
                        //"ForgottenPath",
                        "MatriarchEntangle",
                        "TempleRush",
                        "DarkPitCliff",
                        "IcyBrook",
                        "UphillCamp",
                        "ColdBrood",
                        "MeltingPass",
                        "CrystalGrotto",
                        "FrostyWebs"
                        
                    ]
                },
                {
                    "name": "hard",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCampMountains",
                        "BuriedLootMountains",
                        "DarkTunnelMountains",

                        ///Genéricos Diálogo
                        "Riddlemaster",
                        //"TavernNew",
                        //"DoubtfulPeasant",
                        "WellOfWonders",
                        //"RegretfulInitiate",
                        "TheHandOfFate2",
                        //"ShroudedGift",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith",
                        "WanderingSalesman",
                        "CampgroundsMountains",
                        "HiddenChestMountains",
                        "CrystalCaveMountains",

                        ///Genéricos Combate
                        "CultRitual",

                        ///MountainTerrain Challenges
                        "CagedSorcerer",
                        "CrevasseEscape",
                        "FrozenLoot",
                        "GlaciarPass",
                        "GoldjayNest",
                        "IceWall",
                        "VillagerQuarrel",
                        "OwlMessengers",
                        "PeltCache",
                        "ShoddyBridge",
                        "SuffocatedSorcerer",
                        "ToCatchASasquatch",
                        "WinterBerries",

                        ///MountainTerrain Diálogo
                        

                        ///MountainTerrain Santuario
                        "IceFishing",

                        ///MountainTerrain Combates
                        //"CrystalForest",
                        "DrumspearSkirmish",
                        "FrostSages",
                        "KrajKampNew",
                        "MeltingPass",

                        ///Mountain Ha'Kraj Challenges
                        "IceIceRabies",
                        "CrystalClear",
                        "CliffRitual",
                        "AncientShrine",


                        ///Mountain Ha'Kraj Diálogo
                        "IcingOnTheCrate",
                        "IceMaidens",
                        "RenegadeTroll",

                        ///Mountain Ha'Kraj Combates
                        "ChilledStockade",
                        //"ForgottenPath",
                        "DarkPitCliff",
                        "TempleRush",
                        "MatriarchEntangle",
                        "FrostyWebs",
                        "BrokenBridge",
                        "RockyRuckus"
                        
                        
                    ]
                },
                {
                    "name": "introMountain",
                    "quests": [
                        "TheAbandonedCampMountains",
                        "BuriedLootMountains",
                        "DarkTunnelMountains",
                        "IceIceRabies",
                        "HiddenChestMountains",
                        "CrystalClear",
                        "CliffRitual",
                        "AncientShrine",
                        "IceWall",
                        "VillagerQuarrel",
                        "PeltCache",
                        "ShoddyBridge",

                        "IceFishing",

                        "WhitetopQuarrel",
                        "ColdOpen",
                        "HowlingPeak"
                    ]
                },
                {
                    "name": "midNode",
                    "quests": [
                        "TownBrawlTrolls",
                        "TownBrawlYeti",
                        "TownBrawlTavern"
                    ]
                },
                {
                    "name": "hardFights",
                    "quests": [
                        "AsteriskObelisk",
                        "ForgottenPath",
                        "CultistGathering"
                    ]
                },
                {
                    "name": "zogLands",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCampMountains",
                        "BuriedLootMountains",
                        "DarkTunnelMountains",

                        ///Genéricos Diálogo
                        "Riddlemaster",
                        //"TavernNew",
                        "WellOfWonders",
                        //"RegretfulInitiate",
                        "TheHandOfFate2",
                        //"DoubtfulPeasant",
                        //"ShroudedGift",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith",
                        "WanderingSalesman",
                        "CampgroundsMountains",
                        "HiddenChestMountains",
                        "CrystalCave",

                        ///ForestTerrain Challenges
                        "HiddenSpring",
                        "OrcishTotem",
                        "TrapTunnel",
                        //"JumppleTree",
                        //"WildBerries",

                        ///ForestTerrain Diálogo
                        "AshHermit",
                        "UnmarkedPotion"
                        //"TheOrcFarm", //Demasiado tarde en el mapa como para que se triggeree el emergente.

                        ///ForestTerrain Santuario
                        //"LostRuins",  // muy tarde en el mapa en caso de que salga la quest secundaria.
                        //"WoundedHound"

                    ]
                },

                {
                    "name": "allEmergents",
                    "quests": [

                        //genericos
                        //"InitiateReturns",
                        //"LonesomeCamperVariants1",
                        "AstralCultist",
                        "LonesomeCamperEmergent",
                        "MorningQuarrel",
                        //"PreBossSalesman",
                        "PotionIdentifier",
                        "SpareACoin",

                        //mountain
                        "RenegadeTroll",
                        "Avalanche",
                        "ColdNight",
                        "FallingRocks",
                        "BlizzardStrike",
                        "FlyingAxes",
                        "SnowBlinded",
                        "LivingSnow",
                        "Frostbite",
                        "MountainEmergentCombat",
                        "MountainEmergentCombat2",
                        "GuardDuty",
                        "HelpingHand",
                        "HitchARide",
                        "IceBreaker",
                        "RoadBarter",
                        "TroubleBreathing"
                    ]
                }

            ]
        }
    ]
}





