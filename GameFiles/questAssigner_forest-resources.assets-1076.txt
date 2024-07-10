{
    "adventures" : [
        {
            "id" : "forest",
            "level" : 1,

            "mapPrefab" : "MapContentZogMapWIP",
            //"mapPrefab" : "MapContentTestVertical",

            "defaultQuest": "rlDefault",
            "defaultQuestGroup": "empty",
            "defaultEmergentQuestGroup" : "allEmergents",
            //"globalQuests" : ["darkness_cost", "check_defeat_when_all_injured", "count_steps_taken_in_map", "healing_when_walking_with_food_item"],
            //"globalQuests" : ["darkness_cost", "check_defeat_when_all_injured", "count_steps_taken_in_map", "healing_when_walking_with_food_item","add_xp_when_exploring","check_darkness_rising", "darkness_effects", "fire_controller"],
             "globalQuests" : ["add_xp_when_exploring", "count_steps_taken_in_map", "healing_when_walking_with_food_item", "basic_achievements", "asra_unlock_achievement"],
            "emergentInterruptChance" : 0.75,
            "mapOrientation" : "Horizontal",
            "guild" : {
                "food" : 9,
                "loot" : 0    
            },
            "inventory" : [],

            "newMapGenerationConfig" : {
                "enabled" : true,
                "roads" : [
                    {
                        "roadId" : "Ruta1",
                        "nodes" : ["woods1","woods2","woods4","woods5","woods6","woods7","woods8"]
                    },
                    //{
                      //  "roadId" : "Ruta2",
                        //"nodes" : ["woods1","woods2","woods4","plains5","plains6","plains7","plains8"]
                    //},
                    {
                        "roadId" : "Ruta2",
                        "nodes" : ["plains1","plains2","plains4","plains5","plains7","plains8"]
                    }//,
                    //{
                      //  "roadId" : "Ruta3",
                       // "nodes" : ["plains1","plains2","plains3"]
                    //},
                    //{
                       // "roadId" : "Ruta4",
                       // "nodes" : ["woods1","woods2","woods3"]
                    //}
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
                            "name": "IntroForest"
                        }
                    ]
                },
                {
                    "name": "woods1",
                    "questGroup": "introWoods",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "woods2",
                    "questGroup": "woods-easy",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "woods3",
                    "questGroup": "woods-easy",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "woods4",
                    "questGroup": "woods-normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "woods5",
                    "questGroup": "woods-normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "woods6",
                    "questGroup": "woods-normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "woods7",
                    "questGroup": "woods-hard",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "woods8",
                    "questGroup": "woods-hard",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "plains1",
                    "questGroup": "introPlains",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "plains2",
                    "questGroup": "plains-easy",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "plains3",
                    "questGroup": "plains-easy",
                    "quests": [],
                    "tags" : ["easy"]
                },
                {
                    "name": "plains4",
                    "questGroup": "plains-normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "plains5",
                    "questGroup": "plains-normal",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "plains6",
                    "questGroup": "stores",
                    "quests": [],
                    "tags" : ["normal"]
                },
                {
                    "name": "plains7",
                    "questGroup": "plains-hard",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "plains8",
                    "questGroup": "plains-hard",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "zog1",
                    "questGroup": "zogCombats",
                    "quests": []
                },
                {
                    "name": "zog2",
                    "questGroup": "zogCombats",
                    "quests": []
                },
                {
                    "name": "zog3",
                    "questGroup": "zogCombats",
                    "quests": []
                },
                {
                    "name": "zog4",
                    "questGroup": "preBossQuests",
                    "quests": [],
                    "tags" : ["hard"]
                },
                {
                    "name": "zog5",
                    "questGroup": "preBossQuests",
                    "quests": [],
                    "tags" : ["hard"]
                },
                //{
                  //  "name": "preStore1",
                   // "questGroup": "empty",
                   // "quests": [],
                    //"forcedQuest" : "PreBossSalesman"  
                //},
                //{
                  //  "name": "preStore2",
                   // "questGroup": "empty",
                    //"quests": [],
                    //"forcedQuest" : "PreBossSalesman"  
                //},
                {
                    "name": "boss",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "KrumThrone"  
                },
                {
                    "name": "start-woods1",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                    "name": "start-plains1",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                //{
                  //  "name": "boss-preStore2",
                   // "questGroup": "empty",
                   // "quests": [],
                   // "forcedQuest" : "rlDefaultNoInterrupt"  
               // },
                //{
                  //  "name": "preStore1-zog4",
                    //"questGroup": "empty",
                    //"quests": [],
                    //"forcedQuest" : "rlDefaultNoInterrupt"  
                //},
                //{
                    //"name": "preStore2-zog5",
                    //"questGroup": "empty",
                    //"quests": [],
                    //"forcedQuest" : "rlDefaultNoInterrupt"  
                //},
                //{
                  //  "name": "boss-preStore1",
                    //"questGroup": "empty",
                    //"quests": [],
                    //"forcedQuest" : "rlDefaultNoInterrupt"  
                //},
                {
                   "name": "boss-zog4",
                   "questGroup": "empty",
                   "quests": [],
                   "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                   "name": "boss-zog5",
                   "questGroup": "empty",
                   "quests": [],
                   "forcedQuest" : "rlDefaultNoInterrupt"  
                },
                {
                   "name": "woods1-woods2",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["woods","easy"]
                },
                {
                   "name": "woods2-woods3",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["woods","easy"]
                },
                {
                   "name": "woods4-woods2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["woods","easy"]
                },  
                {
                   "name": "woods5-woods4",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["woods","normal"]
                },  
                {
                   "name": "woods5-woods3",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["woods","normal"]
                },
                {
                   "name": "woods5-woods6",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["woods","normal"]
                }, 
                {
                   "name": "woods7-woods6",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["woods","hard"]
                },
                {
                   "name": "woods5-woods7",
                   "questGroup": "subNodes",
                   "quests": [],
                   "forcedQuest" : "rlDefault",  
                   "tags" : ["woods","hard"]
                },
                {
                   "name": "woods7-woods8",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["woods","hard"]
                },
                {
                   "name": "zog1-woods8",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["woods","hard"]
                },
                {
                   "name": "zog2-woods8",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["woods","hard"]
                },
                {
                   "name": "zog2-zog4",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["zog","hard"]
                },
                {
                   "name": "zog1-zog4",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["zog","hard"]
                },
                {
                   "name": "plains1-plains2",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["farms","easy"]
                },
                {
                   "name": "plains3-plains2",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["farms","easy"]
                },
                {
                   "name": "plains3-plains4",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["farms","normal"]
                },
                {
                   "name": "plains2-plains4",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["farms","normal"]
                },
                {
                   "name": "plains5-woods4",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["woods"]
                },
                {
                   "name": "plains5-plains6",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["farms","normal"]
                },
                {
                   "name": "plains5-plains7",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["farms","hard"]
                },
                {
                   "name": "plains7-plains6",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["farms","hard"]
                },
                {
                   "name": "plains7-plains8",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["farms","hard"]
                },
                {
                   "name": "plains8-zog3",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["farms","hard"]
                },
                {
                   "name": "zog3-zog5",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["zog","hard"]
                },
                {
                   "name": "zog2-zog5",
                   "questGroup": "subNodes",
                   "quests": [],
                   //"forcedQuest" : "rlDefault",  
                   "tags" : ["zog","hard"]
                },
                {
                   "name": "plains7-zog2",
                   "questGroup": "subNodes",
                   "quests": [],
                   "tags" : ["farms","hard"]
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
                        "Pitfall",
                        "FieldOfThorns2",
                        //"SilkGarden",
                        "DarkArmyCheckpoint"
                    ]
                },
                {
                    "name": "stores",
                    "quests": [
                        "WanderingArmorsmith2",
                        //"WanderingWeaponsmith2",
                        "TavernNew",
                        //"TavernVariants",
                        "WanderingSalesman2"
                    ]
                },
                {
                    "name": "introPlains",
                    "quests": [
                        "BuriedLoot",
                        "HiddenChest",
                        "ForestRuins",
                        "WildBerries",
                        "WolfRoad",
                        //"OgreArgue",
                        "StrayedKeeper",
                        "RiverbankArchers",
                        "LinireanCamp",
                        "GoblinPillagers",
                        //"WheatField",
                        "OrcLooters",
                        "PondFarm",
                        "Riddlemaster",
                        "OrcAmbush",
                        "VillagePeril"
                    ]
                },

                {
                    "name": "plains-easy",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCamp2",
                        "BuriedLoot",
                        "DarkTunnel",

                        ///Genéricos Diálogo
                        "Riddlemaster",
                        "WellOfWonders",
                        "ChestGuardian",
                        "TheHandOfFate2",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingSalesman",
                        "Campgrounds",
                        "HiddenChest",
                        "CrystalCave",

                        ///ForestTerrain Challenges
                        "JumppleTree",
                        "ForestRuins",
                        "WildBerries",

                        ///ForestTerrain Diálogo
                        "AshHermit",
                        "TheOrcFarm",
                        "MirrorPond",

                        ///ForestTerrain Santuario

                        ///ForestTerrain Combates
                        "WolfRoad",
                        "OgreArgue",
                        "WolfAlpha",
                        //"TheWolfDen",

                        ///Forest MapaOrcos Challenges
                        "StrayedKeeper",
                        "RiverbankArchers",
                        "LinireanCamp",
                        "OrcishTotem",
                        "TrapTunnel",
                        "CreekTrail",
                        "RagingRapids",
                        "DeerHerd",

                        ///Forest MapaOrcos Diálogo
                        //"UnmarkedPotion",

                        ///Forest MapaOrcos Combates
                        "GoblinPillagers",
                        "WheatField",
                        "IntoASpiderMess",
                        "OrcLooters",
                        "OrcAmbush2",
                        "PondFarm",
                        "FarmVillains",
                        "PumpkinPatch",
                        "OrcAmbush",
                        "VillagePeril"
                    ]
                },
                {
                    "name": "introWoods",
                    "quests": [
                        "BuriedLoot",
                        "HiddenChest",
                        "ForestRuins",
                        "WildBerries",
                        "WolfRoad",
                        //"OgreArgue",
                        "StrayedKeeper",
                        "RiverbankArchers",
                        "Riddlemaster",
                        "GoblinPillagers",
                        //"WheatField",
                        "OrcLooters",
                        "PondFarm",
                        "OrcAmbush",
                        //"UnmarkedPotion",
                        "TrapTunnel",
                        "WoodsCrossroads"
                    ]
                },
                {
                    "name": "woods-easy",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCamp2",
                        "BuriedLoot",
                        "DarkTunnel",

                        ///Genéricos Diálogo
                        "Riddlemaster",
                        "WellOfWonders",
                        "ChestGuardian",
                        "TheHandOfFate2",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingSalesman",
                        "Campgrounds",
                        "HiddenChest",
                        "CrystalCave",

                        ///ForestTerrain Challenges
                        "JumppleTree",
                        "ForestRuins",
                        "BanditBlock",
                        "WildBerries",

                        ///ForestTerrain Diálogo
                        "AshHermit",
                        "TheOrcFarm",
                        "MirrorPond",

                        ///ForestTerrain Santuario

                        ///ForestTerrain Combates
                        "WolfRoad",
                        "SpiderWoods",
                        "OgreArgue",
                        "WolfAlpha",
                        //"TheWolfDen",

                        ///Forest MapaOrcos Challenges
                        "StrayedKeeper",
                        "RiverbankArchers",
                        "OrcishDance",
                        "RagingRapids",
                        "OrcishTotem",
                        "LinireanCamp",
                        "TrapTunnel",
                        "DeerHerd",

                        ///Forest MapaOrcos Diálogo
                        //"UnmarkedPotion",

                        ///Forest MapaOrcos Combates
                        "GoblinPillagers",
                        "PondFarm",
                        "OrcLooters",
                        "OrcAmbush2",
                        "IntoASpiderMess",
                        "CreekTrail",
                        "OrcAmbush",
                        "PumpkinPatch",
                        "FarmVillains",
                        "WheatField",
                        "GhostTown",
                        "VillagePeril"
                    ]
                },
                {
                    "name": "plains-normal",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCamp2",
                        "BuriedLoot",
                        "DarkTunnel",
                        
                        ///Genéricos Diálogo
                        "Riddlemaster",
                        //"AltarOfElynie",
                        "WellOfWonders",
                        "ChestGuardian",
                        "TheHandOfFate2",
                        //"RegretfulInitiate",
                        "ShroudedGift",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith",
                        "WanderingSalesman",
                        "Campgrounds",
                        "HiddenChest",
                        "CrystalCave",

                        ///Genéricos Combate
                        //"CultRitual", //muy temprano en la narrativa para meter al culto.

                        ///ForestTerrain Challenges
                        "HiddenSpring",
                        "JumppleTree",
                        "ForestRuins",
                        "WildBerries",

                        ///ForestTerrain Diálogo
                        "AshHermit",
                        "TheOrcFarm",
                        "Heirloom",
                        "MirrorPond",

                        ///ForestTerrain Santuario
                        "CozyFarm",
                        "GlowingWell",

                        ///ForestTerrain Combates
                        "WolfAlpha",
                        "WolfRoad",
                        //"DungeonSkitteringDepths2",
                        //"TheWolfDen",
                        "SheepClothing",
                        "OgreArgue",
                        "FungiCave",

                        ///Forest MapaOrcos Challenges
                        "StrayedKeeper",
                        "RiverbankArchers",
                        "OrcishTotem",
                        "LinireanCamp",
                        "RagingRapids",
                        "TrapTunnel",
                        "DeerHerd",

                        ///Forest MapaOrcos Diálogo
                        "TheTranquilGrove",
                        //"UnmarkedPotion",

                        ///Forest MapaOrcos Combates
                        "OrcPalisade",
                        "OrcShrine",
                        "GoblinPillagers",
                        "PondFarm",
                        "OrcAmbush",
                        "JoustingGrounds",
                        "FireVillage",
                        "OrcKennels",
                        "OrcAmbush2",
                        "Quarry",
                        "OrcLooters",
                        "PumpkinPatch",
                        "TradingPost",
                        "CaveWolves",
                        "SwampInvaders",
                        "HamletRaid",
                        "FarmVillains",
                        "Shipwreck",
                        "VillagePeril",
                        "WebTrap",
                        "IntoASpiderMess",
                        "WheatField",
                        "CreekTrail",
                        "ArachnidPit",
                        "DancingWithWulves",
                        "OrcBridge"
                    ]
                },
                {
                    "name": "woods-normal",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCamp2",
                        "BuriedLoot",
                        "DarkTunnel",

                        ///Genéricos Diálogo
                        "Riddlemaster",
                        "WellOfWonders",
                        "ChestGuardian",
                        "TheHandOfFate2",
                        //"RegretfulInitiate",
                        "ShroudedGift",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith",
                        "WanderingSalesman",
                        "GlowingWell",
                        "Campgrounds",
                        "HiddenChest",
                        "CrystalCave",

                        ///Genéricos Combate
                        //"CultRitual", //muy temprano en la narrativa para meter al culto.
                        "CultAndOrcs",

                        ///ForestTerrain Challenges
                        "HiddenSpring",
                        "ForestRuins",
                        "JumppleTree",
                        "BanditBlock",
                        "WildBerries",

                        ///ForestTerrain Diálogo
                        "AshHermit",
                        "LeafAltar",
                        "TheOrcFarm",
                        "Heirloom",
                        "MirrorPond",

                        ///ForestTerrain Santuario
                        "CozyFarm",

                        ///ForestTerrain Combates
                        "WolfAlpha",
                        "OgreArgue",
                        "WolfRoad",
                        //"TheWolfDen",
                        //"DungeonSkitteringDepths2",
                        "SheepClothing",
                        "FungiCave",
                        "SpiderWoods",

                        ///Forest MapaOrcos Challenges
                        "StrayedKeeper",
                        "RiverbankArchers",
                        "LinireanCamp",
                        "OrcishTotem",
                        "RagingRapids",
                        "OrcishDance",
                        "TrapTunnel",
                        "DeerHerd",

                        ///Forest MapaOrcos Diálogo
                        "TheTranquilGrove",
                        //"UnmarkedPotion",

                        ///Forest MapaOrcos Combates
                        "OrcPalisade",
                        "OrcShrine",
                        "FireVillage",
                        "JoustingGrounds",
                        "Quarry",
                        "GoblinPillagers",
                        "Lumberjack",
                        "PondFarm",
                        "OrcKennels",
                        "WheatField",
                        "VillagePeril",
                        "DancingWithWulves",
                        "OrcAmbush",
                        "OrcAmbush2",
                        "OrcLooters",
                        "IntoASpiderMess",
                        "TradingPost",
                        "ArachnidPit",
                        "FarmVillains",
                        "PumpkinPatch",
                        "Shipwreck",
                        "CaveWolves",
                        "SwampInvaders",
                        "WebTrap",
                        "CreekTrail",
                        "HamletRaid",
                        "OrcBridge",
                        "GhostTown"
                    ]
                },
                {
                    "name": "plains-hard",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCamp2",
                        "BuriedLoot",
                        "DarkTunnel",

                        ///Genéricos Diálogo
                        "Riddlemaster",
                        //"AltarOfElynie",
                        "ChestGuardian",
                        "WellOfWonders",
                        //"RegretfulInitiate",
                        "TheHandOfFate2",
                        "ShroudedGift",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith",
                        "WanderingSalesman",
                        "Campgrounds",
                        "HiddenChest",
                        "CrystalCave",

                        ///Genéricos Combate
                        //"CultRitual", //muy temprano en la narrativa para meter al culto.

                        ///ForestTerrain Challenges
                        "HiddenSpring",
                        "JumppleTree",
                        "ForestRuins",
                        "WildBerries",

                        ///ForestTerrain Diálogo
                        "AshHermit",
                        "TheOrcFarm",
                        "MirrorPond",
                        "Heirloom",

                        ///ForestTerrain Santuario
                        //"WoundedHound",
                        "GlowingWell",
                        "CozyFarm",

                        ///ForestTerrain Combates
                        //"DungeonSkitteringDepths2",
                        "SheepClothing",
                        "FungiCave",

                        ///Forest MapaOrcos Challenges
                        "StrayedKeeper",
                        "RiverbankArchers",
                        "OrcishTotem",
                        "LinireanCamp",
                        "RagingRapids",
                        "TrapTunnel",
                        "DeerHerd",

                        ///Forest MapaOrcos Diálogo
                        "TheTranquilGrove",
                        //"UnmarkedPotion",

                        ///Forest MapaOrcos Combates
                        "JoustingGrounds",
                        "OrcShrine",
                        "OrcPalisade",
                        "HamletRaid",
                        "CaveWolves",
                        "ArachnidPit",
                        "SwampInvaders",
                        "Quarry",
                        "Shipwreck",
                        "DancingWithWulves",
                        "TradingPost",
                        "WebTrap",
                        "FireVillage",
                        "OrcKennels",
                        "OrcBridge"
                    ]
                },
                {
                    "name": "woods-hard",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCamp2",
                        "BuriedLoot",
                        "DarkTunnel",

                        ///Genéricos Diálogo
                        "Riddlemaster",
                        "WellOfWonders",
                        "ChestGuardian",
                        "LeafAltar",
                        //"RegretfulInitiate",
                        "TheHandOfFate2",
                        "ShroudedGift",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith",
                        "WanderingSalesman",
                        "Campgrounds",
                        "HiddenChest",
                        "CrystalCave",

                        ///Genéricos Combate
                        //"CultRitual", //muy temprano en la narrativa para meter al culto.
                        //"CultAndOrcs",

                        ///ForestTerrain Challenges
                        "ForestRuins",
                        "HiddenSpring",
                        "JumppleTree",
                        "BanditBlock",
                        "WildBerries",

                        ///ForestTerrain Diálogo
                        "AshHermit",
                        "TheOrcFarm",
                        "MirrorPond",
                        "Heirloom",

                        ///ForestTerrain Santuario
                        //"WoundedHound",
                        "CozyFarm",
                        "GlowingWell",

                        ///ForestTerrain Combates
                         //"DungeonSkitteringDepths2",
                         "SheepClothing",
                         "FungiCave",

                        ///Forest MapaOrcos Challenges
                        "StrayedKeeper",
                        "RiverbankArchers",
                        "LinireanCamp",
                        "RagingRapids",
                        "OrcishTotem",
                        "TrapTunnel",
                        "OrcishDance",
                        "DeerHerd",

                        ///Forest MapaOrcos Diálogo
                        "TheTranquilGrove",
                        //"UnmarkedPotion",

                        ///Forest MapaOrcos Combates
                        "JoustingGrounds",
                        "OrcPalisade",
                        "OrcShrine",
                        "OrcKennels",
                        "Lumberjack",
                        "Quarry",
                        "WebTrap",
                        "TradingPost",
                        "ArachnidPit",
                        "Shipwreck",
                        "SwampInvaders",
                        "DancingWithWulves",
                        "CaveWolves",
                        "FireVillage",
                        "HamletRaid",
                        "OrcBridge"
                    ]
                },
                {
                    "name": "zogCombats",
                    "quests": [
                        "ZogCamp1",
                        "ZogCamp2",
                        "ZogCamp3",
                        "ZogCamp4",
                        "ZogCamp5"
                    ]
                },
                {
                    "name": "preBossQuests",
                    "quests": [
                        "AltarOfElynie",
                        "PreBossSalesman"
                    ]
                },
                //{
                  //  "name": "recruits",
                    //"quests": [
                        //"TavernNew",
                        //"LonesomeCamper1",
                        //"LonesomeCamper2"
                    //]
                //},
                {
                    "name": "zogLands",
                    "quests": [
                        ///Genéricos Challenge
                        "TheAbandonedCamp2",
                        "BuriedLoot",
                        "DarkTunnel",

                        ///Genéricos Diálogo
                        "Riddlemaster",
                        "WellOfWonders",
                        //"RegretfulInitiate",
                        "TheHandOfFate2",
                        //"DoubtfulPeasant",
                        "ShroudedGift",

                        ///Genéricos Santuario
                        "WanderingArmorsmith",
                        "WanderingWeaponsmith",
                        //"WanderingSalesman",
                        "GlowingWell",
                        "Campgrounds",
                        "HiddenChest",
                        "CrystalCave",

                        ///ForestTerrain Challenges
                        "HiddenSpring",
                        "OrcishTotem",
                        "TrapTunnel",

                        ///ForestTerrain Diálogo
                        "AshHermit"//,
                        //"UnmarkedPotion"

                        ///ForestTerrain Santuario

                    ]
                },
                 {
                    "name": "allEmergents",
                    "quests": [

                        //genericos
                        "AstralCultist",
                        "InitiateReturns",
                        "LonesomeCamperEmergent",
                        //"LonesomeCamperVariants1",
                        "MorningQuarrel",
                        "PotionIdentifier",
                        //"PreBossSalesman",
                        "SpareACoin",

                        //forest
                        //"DefenseInstructions",
                        "FollowedByOrcs",
                        "ForestEmergentCombat",
                        "ForestEmergentCombat2",
                        "ForestKeepers",
                        "MesmerizingLight",
                        //"MissingCoachman",
                        "PagranExiles",
                        "PouringRain",
                        //"RaidersOfTheLostRuins",
                        //"SavingGeneral",
                        //"ScholarReturns",
                        "ShabbyGear",
                        "Shrooms",
                        "StoryTime",
                        "Timber"
                    ]
                }


            ]
        }
    ]
}





