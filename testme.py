class QuestDefinition:
    def __init__(self):
        self.id = ''
        self.visual = ''
        self.kindFlag = ''
        self.encounters = []
        self.tags = []
        self.results = {}

class DialogType:
    Dialog = "Dialog"
    Custom = "Custom"
    Response = "Response"

def create_dialog(id, dialog):
    return {"id": id, "dialog": dialog}

class CinematicMapHelper:
    @staticmethod
    def current_node():
        return {"tags": ["hard", "normal"]}

    @staticmethod
    def result(params):
        return {"type": params["type"], "amount": params["amount"]}

    @staticmethod
    def party():
        return ["party"]

    @staticmethod
    def party_random(num):
        return ["random_party_member"]

    @staticmethod
    def guild():
        return {"GetLoot": lambda: 50}

class Config:
    rewards = {
        "starXp": {
            "eHigh": lambda: 100,
            "eMid": lambda: 50,
            "eLow": lambda: 25,
        },
        "buffDuration": {
            "energy": lambda: 10
        }
    }

config = Config()
cinematicMapHelper = CinematicMapHelper()

def add_quest(quest):
    print("Quest added:", quest.id)

def create_dialog_instance(dialog):
    return dialog

# Define the quest
quest = QuestDefinition()
quest.id = 'BanditBlock'
quest.visual = "Bandit"
quest.kindFlag = "Challenge"
quest.encounters = []
quest.tags = ["NARRATIVE", "NORMAL", "TERRAIN_WOODS"]

theDialog = create_dialog("intro", [
    {
        "type": DialogType.Dialog,
        "narrator": lambda: "The Bandit Roadblock",
        "text": lambda: "We come across a group of bandits blocking the road.\n\nThey haven't seen us yet, but there are too many of them to beat in a fight, and they will most likely demand a toll.",
        "icon": lambda: "Asst_BanditBlock",
        "who": lambda: "mapCinematicId",
        "children": [
            {
                "type": DialogType.Custom,
                "subtype": "diceChallenge",
                "text": lambda: "Sneak past them.",
                "challenge": {
                    "requirements": lambda t: t("ct_stealth")
                },
                "children": [
                    {
                        "type": DialogType.Dialog,
                        "condition": lambda d: d["challenge"]["result"] == "success",
                        "onEnter": lambda d, n: setattr(d["data"], "hero", d["challenge"]["heroesSuccess"][0]),
                        "text": lambda: "We moved along the forest edge using the dense bushes as cover until we were safely past the bandits.",
                        "who": lambda: "mapCinematicId",
                        "children": [
                            {
                                "type": DialogType.Custom,
                                "subtype": "rewards",
                                "rewards": lambda: quest.results["stealthSuccess"],
                                "rewardsParams": lambda d: {"hero": d["data"]["hero"], "hard": "hard" in cinematicMapHelper.current_node()["tags"], "normal": "normal" in cinematicMapHelper.current_node()["tags"]},
                                "exit": True
                            }
                        ]
                    },
                    {
                        "type": DialogType.Dialog,
                        "condition": lambda d: d["challenge"]["result"] == "failure",
                        "onEnter": lambda d, n: setattr(d["data"], "hero", d["challenge"]["heroesFailure"][0]),
                        "text": lambda: "We attempted to sneak past the bandits but were immediately spotted by them.\n\nThey shot a heavy onslaught of bolts at us, but we eventually managed to escape their reach.",
                        "who": lambda: "mapCinematicId",
                        "children": [
                            {
                                "type": DialogType.Custom,
                                "subtype": "rewards",
                                "rewards": lambda: quest.results["stealthFailure"],
                                "rewardsParams": lambda d: {"hero": d["data"]["hero"], "hard": "hard" in cinematicMapHelper.current_node()["tags"], "normal": "normal" in cinematicMapHelper.current_node()["tags"]},
                                "exit": True
                            }
                        ]
                    }
                ]
            },
            {
                "type": DialogType.Custom,
                "subtype": "diceChallenge",
                "text": lambda: "Convince them\nto let you\nthrough.",
                "challenge": {
                    "requirements": lambda t: t("ct_social")
                },
                "children": [
                    {
                        "type": DialogType.Dialog,
                        "condition": lambda d: d["challenge"]["result"] == "success",
                        "onEnter": lambda d, n: setattr(d["data"], "hero", d["challenge"]["heroesSuccess"][0]),
                        "text": lambda: "Putting our charm to the test, we managed to convince the bandits that they shouldn't interfere with our mission to take down the Unblinded.\n\nThey eventually let us through.",
                        "who": lambda: "mapCinematicId",
                        "children": [
                            {
                                "type": DialogType.Custom,
                                "subtype": "rewards",
                                "rewards": lambda: quest.results["socialSuccess"],
                                "rewardsParams": lambda d: {"hero": d["data"]["hero"], "hard": "hard" in cinematicMapHelper.current_node()["tags"], "normal": "normal" in cinematicMapHelper.current_node()["tags"]},
                                "exit": True
                            }
                        ]
                    },
                    {
                        "type": DialogType.Dialog,
                        "condition": lambda d: d["challenge"]["result"] == "failure",
                        "onEnter": lambda d, n: setattr(d["data"], "hero", d["challenge"]["heroesFailure"][0]),
                        "text": lambda: "We tried to convince the bandits to let us through, but they simply laughed and took all the loot they could find on us, as well as some of our weapons.",
                        "who": lambda: "mapCinematicId",
                        "children": [
                            {
                                "type": DialogType.Custom,
                                "subtype": "rewards",
                                "rewards": lambda: quest.results["socialFailure"],
                                "rewardsParams": lambda d: {"hero": d["data"]["hero"]},
                                "exit": True
                            }
                        ]
                    }
                ]
            },
            {
                "type": DialogType.Custom,
                "subtype": "loot",
                "amount": lambda: 25,
                "text": lambda: "Pay the toll.",
                "children": [
                    {
                        "type": DialogType.Dialog,
                        "text": lambda: "We walked toward the bandits and paid the customary bandit toll.\n\nThey grinned, counting our coins as they let us through.",
                        "who": lambda: "mapCinematicId",
                        "children": [
                            {
                                "type": DialogType.Custom,
                                "subtype": "rewards",
                                "rewards": lambda: quest.results["payToll"],
                                "rewardsParams": lambda: {"hard": "hard" in cinematicMapHelper.current_node()["tags"], "normal": "normal" in cinematicMapHelper.current_node()["tags"]},
                                "exit": True
                            }
                        ]
                    }
                ]
            },
            {
                "type": DialogType.Response,
                "text": lambda: "Take a detour.",
                "children": [
                    {
                        "type": DialogType.Dialog,
                        "text": lambda: "We decided to look for an alternative route.\n\nIt was more tiring than simply passing through the bandits, but definitely safer.",
                        "who": lambda: "mapCinematicId",
                        "children": [
                            {
                                "type": DialogType.Custom,
                                "subtype": "rewards",
                                "rewards": lambda: quest.results["detour"],
                                "rewardsParams": lambda: {},
                                "exit": True
                            }
                        ]
                    }
                ]
            },
        ]
    }
])

quest.results = {
    "stealthSuccess": cinematicMapHelper.result({
        "type": "giveXP",
        "amount": config.rewards["starXp"]["eHigh"]() if "hard" in cinematicMapHelper.current_node()["tags"] else (config.rewards["starXp"]["eMid"]() if "normal" in cinematicMapHelper.current_node()["tags"] else config.rewards["starXp"]["eLow"]())
    }),
    "stealthFailure": cinematicMapHelper.result({
        "type": "unit.attribute",
        "kind": "health_max",
        "amount": -1,
        "targets": ["hero"]
    }),
    "socialSuccess": cinematicMapHelper.result({
        "type": "giveXP",
        "amount": config.rewards["starXp"]["eHigh"]() if "hard" in cinematicMapHelper.current_node()["tags"] else (config.rewards["starXp"]["eMid"]() if "normal" in cinematicMapHelper.current_node()["tags"] else config.rewards["starXp"]["eLow"]())
    }),
    "socialFailure": cinematicMapHelper.result({
        "type": "guild.attribute",
        "kind": "loot",
        "amount": -(cinematicMapHelper.guild()["GetLoot"]() / 2)
    }),
    "payToll": cinematicMapHelper.result({
        "type": "guild.attribute",
        "kind": "loot",
        "amount": -25
    }),
    "detour": cinematicMapHelper.result({
        "type": "applyModifier",
        "category": "energyMod",
        "level": -1,
        "duration": config.rewards["buffDuration"]["energy"](),
        "targets": cinematicMapHelper.party_random(1)
    })
}

quest.cinematic = [
    create_dialog_instance(theDialog),
    lambda: setattr(cinematicMapHelper.current_node(), "visual_state", "shown")
]

add_quest(quest)
