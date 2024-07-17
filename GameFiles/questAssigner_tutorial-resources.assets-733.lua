{
    "adventures" : [
        {
            "id" : "tutorial",
            "level" : 1,

            "mapPrefab" : "MapTutorial",
            //"mapPrefab" : "MapContentTestVertical",

            "defaultQuest": "rlDefault",
            "defaultQuestGroup": "empty",
            "defaultEmergentQuestGroup" : "allEmergents",
             "globalQuests" : ["add_xp_when_exploring", "count_steps_taken_in_map", "healing_when_walking_with_food_item", "basic_achievements"],
            "emergentInterruptChance" : 0.01,
            "mapOrientation" : "Custom",

            "newMapGenerationConfig" : {
                "enabled" : true,
               // "roads" : [
                 //   {
                   //     "roadId" : "Ruta1",
                     //   "nodes" : ["tut2","tut3","tut4","tut5"]
                   // }
                //],
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
                            "name": "IntroTutorial"
                        }
                    ]
                },
                {
                   "name": "tut2",
                    "questGroup": "empty",
                    "quests": [
                        {
                            "name": "AFriendInNeed"
                        }
                    ]                
                },
                {
                    "name": "tut3",
                    "questGroup": "empty",
                    "quests": [
                        {
                            "name": "RangedTutorial"
                        }
                    ]
                },
                {
                    "name": "tut4",
                    "quests": [
                        {
                            "name": "CatchUsIfYouCan"
                        }
                    ]
                },
                {
                    "name": "tut5",
                    "quests": [
                        {
                            "name": "TutorialMarket"
                        }
                    ]
                },
                {
                    "name": "tut6",
                    "quests": [
                        {
                            "name": "AnOldAlly"
                        }
                    ]
                },
                {
                    "name": "boss",
                    "quests": [
                        {
                            "name": "TutorialBreach"
                        }
                    ]
                },
                {
                    "name": "start-tut2",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefault"  
                },
                {
                    "name": "tut2-tut3",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefault"  
                },
                {
                    "name": "tut3-tut4",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefault"  
                },

                {
                    "name": "tut4-tut5",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefault"  
                },
                {
                    "name": "tut5-tut6",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefault"  
                },
                {
                    "name": "tut6-boss",
                    "questGroup": "empty",
                    "quests": [],
                    "forcedQuest" : "rlDefault"  
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
                        "WheatField",
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
                        //"WolfHunt",
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
                        "UnmarkedPotion",

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
                        "WheatField",
                        "OrcLooters",
                        "PondFarm",
                        "OrcAmbush",
                        "UnmarkedPotion",
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
                        //"WolfHunt",
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
                        "UnmarkedPotion",

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
                        "AltarOfElynie",
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
                        //"WolfHunt",
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
                        "UnmarkedPotion",

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
                        //"WolfHunt",
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
                        "UnmarkedPotion",

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
                        "AltarOfElynie",
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
                        "UnmarkedPotion",

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
                        "UnmarkedPotion",

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
                        "WanderingSalesman",
                        "GlowingWell",
                        "Campgrounds",
                        "HiddenChest",
                        "CrystalCave",

                        ///ForestTerrain Challenges
                        "HiddenSpring",
                        "OrcishTotem",
                        "TrapTunnel",

                        ///ForestTerrain Diálogo
                        "AshHermit",
                        "UnmarkedPotion"

                        ///ForestTerrain Santuario

                    ]
                },
                 {
                    "name": "allEmergents",
                    "quests": [

                        //genericos
                        "ItsAKindOfMagic"
                    ]
                }


            ]
        }
    ]
}





