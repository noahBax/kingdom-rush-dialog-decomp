
return {
	founders = {
		coolFights = || {"SwampInvaders","CultAndOrcs","OrcBridge","ZogCamp3","WebTrap"},
		polishFights = || {"SkillTestForest1","SkillTestMountain1","SkillTestWasteland1"},
	},
	buffStore = {
		upgradecosts = {
			health_max = || {50, 100, 150, 200, 250, 300, 350, 400, 450, 500, 550, 600, 650},
			attackDamage = || {100, 200, 300},
			armor_max = || {50, 100, 150}
		},
		repaircosts = {
			health_max = || {30, 60, 90, 125, 150, 175, 200, 225, 250, 275, 300, 325, 350},
			attackDamage = || {50, 100, 150},
			armor_max = || {30, 60, 90}
		}

	},

	starLimit = {
		normal = || 2 + (1 * cinematicMapHelper.IsDifficultyEasyF()),
		hard = || 4 + (1 * cinematicMapHelper.IsDifficultyEasyF()),
		advanced = || 6 + (1 * cinematicMapHelper.IsDifficultyEasyF()),
	},

	dice = {
		diceAmount = || 1,
		diceSize = || 2,
	},

	stores = {
		reRollPrice = || 10,
	},

	rewards = {
		itemChance = {
			low = || cinematicMapHelper.RandomChance(0.25),
			mid = || cinematicMapHelper.RandomChance(0.50),
			high =|| cinematicMapHelper.RandomChance(0.75),
		},

		loot = {
			low = || 20 + (4 * cinematicMapHelper.Guild().context.GetFloat("lootBonus"))  + (5* cinematicMapHelper.IsDifficultyEasyF()),
			lowR = || dice(6,6) + (dice(2,6) * cinematicMapHelper.Guild().context.GetFloat("lootBonus"))  + (dice(2,6)* cinematicMapHelper.IsDifficultyEasyF()),
			mid = || 30 + (6 * cinematicMapHelper.Guild().context.GetFloat("lootBonus")) + (10* cinematicMapHelper.IsDifficultyEasyF()),
			midR = || dice(6,12) + (dice(2,12) * cinematicMapHelper.Guild().context.GetFloat("lootBonus")) + (dice(2,12)* cinematicMapHelper.IsDifficultyEasyF()),
			high = || 50 +(10 * cinematicMapHelper.Guild().context.GetFloat("lootBonus")) + (10* cinematicMapHelper.IsDifficultyEasyF()),
			highR = || dice(12,10) + (dice(2,10) * cinematicMapHelper.Guild().context.GetFloat("lootBonus")) + (dice(2,10)* cinematicMapHelper.IsDifficultyEasyF()),

		},

		food = {
			low = || 1,
			lowR = || dice(1,2),
			mid = || 3 ,
			midR = || dice(1,2),
			high =|| 4,
			highR = || dice(2,3),
		},

		xp = {
			low = || 150 + (15 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			mid = || 300 + (30 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			high =|| 600 + (60 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),

			eventLow = || 100 + (10 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			eventMid = || 200 + (20 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			eventHigh = || 350 + (35 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),

		},

		starXp = {
			--[[base = || 300 + (30 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			
			--former integrated values.
			--with base xp every turn.
			low = || 500 + (50 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			mid = || 750 + (75 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			high =|| 1000 + (100 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),

			eLow = || 500 + (50 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			eMid = || 750 + (75 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			eHigh = || 1000 + (100 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),--]]

			--current XP values
			--low = || 400 + (cinematicMapHelper.)

			baseLow = || 250 + (30 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			baseMid = || 300 + (30 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			baseHard = || 350 + (30 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),



			low = || 350 + (40 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")) + (100 * cinematicMapHelper.IsDifficultyEasyF()),
			mid = || 500 + (50 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")) + (100 * cinematicMapHelper.IsDifficultyEasyF()),
			high =|| 750 + (60 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")) + (150 * cinematicMapHelper.IsDifficultyEasyF()),
			advanced =|| 1500 + (90 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")) + (200 * cinematicMapHelper.IsDifficultyEasyF()),

			eLow = || 250 + (40 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")) + (50 * cinematicMapHelper.IsDifficultyEasyF()),
			eMid = || 450 + (50 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")) + (100 * cinematicMapHelper.IsDifficultyEasyF()),
			eHigh = || 700 + (70 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")) + (100 * cinematicMapHelper.IsDifficultyEasyF()),






			--[[low = || 400 + (40 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			mid = || 750 + (75 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			high =|| 1000 + (100 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),

			eLow = || 300 + (30 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			eMid = || 500 + (50 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),
			eHigh = || 750 + (75 * cinematicMapHelper.Guild().context.GetFloat("xpBonus")),--]]

		},

		darkness = {
			daily = || 5 - cinematicMapHelper.Guild().context.GetFloat("darknessBonus"),
			low = || 5,
			mid = || 15,
			high =|| 25,
			leave =|| 20,
		},

		

		buffDuration = {

			--correct durations
			--[[low = || 5,
			lowR = || dice(2,2),
			mid = || 7,
			midR = || dice(3,2),
			high =|| 11,
			highR = || dice(3,3)+2,--]]

			--duraciones viejas que aún son afectadas por los nodos intermedios.
			low = || 3,
			lowR = || dice(2,2),
			mid = || 5,
			midR = || dice(3,2),
			high =|| 7,
			highR = || dice(3,3)+2,
			luck = || 3,
			energy = || 3,
		},
		hpDamage = {
			mid = || 3,
		},
		bleepChance = {
			mid = || 0.5,
		},
	},

	roster = {
		xpPerVictory = || 500,
		xpGained = function (hero)
			--constants
			local xpPerHeroStar = 200
			local xpPerStep = 20;

			local xp = 0;

			local heroStars = cinematicMapHelper.HeroStars(hero)
			xp = xp + heroStars * xpPerHeroStar

			local stepsTaken = hero.stats.GetStatValue("stepsTaken")
			xp = xp + stepsTaken * xpPerStep

			return xp
		end
	}
}