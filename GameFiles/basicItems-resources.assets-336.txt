itemsHelper.RegisterItem("healthPotion",
{
	targetUnit = true,
	baseCost = 50,
	icon = "Asst_ItemHealthPotion",
	parameters = {health = 3},
	mapCanUseOnTarget = function (instance, target)
		local hero = target
		local health_max = hero.stats.GetStatValue("health_max")
		local health = hero.stats.GetStatValue("health")
		return health < health_max
	end,
	mapUseHandler = function (instance, target)
		target.DoHeal(instance.itemDefinition.parameters.health)
		instance.Consume()
	end
})

itemsHelper.RegisterItem("sharpeningStone",
{
	targetUnit = true,
	baseCost = 100,
	icon = "Asst_ItemSharpeningStone",
	parameters = {increase = 1, maxIncrease = 3},
	mapCanUseOnTarget = function (instance, target)
		local hero = target
		local addedDamage = hero.GetStatOffset("baseDamage") 
		return addedDamage < instance.itemDefinition.parameters.maxIncrease
	end,
	mapUseHandler = function (instance, target)
		local hero = target
        cinematicMapHelper.ImmediateResults({
		{type="unit.attribute", kind = "baseDamage", amount = instance.itemDefinition.parameters.increase, targets = {target}}
		})
        instance.Consume();
	end
})

itemsHelper.RegisterItem("armorersKit",
{
	targetUnit = true,
	baseCost = 50,
	icon = "Asst_ItemArmorersKit",
	parameters = {increase = 1, maxIncrease = 3},
	mapCanUseOnTarget = function (instance, target)
		local hero = target
		local addedArmor = hero.GetStatOffset("armor_max") 
		return addedArmor < instance.itemDefinition.parameters.maxIncrease
	end,
	mapUseHandler = function (instance, target)
		local hero = target
        cinematicMapHelper.ImmediateResults({
		{type="unit.attribute", kind = "armor_max", amount = instance.itemDefinition.parameters.increase, targets = {target}}
		})
        instance.Consume();
	end
})

itemsHelper.RegisterItem("ringOfVitality",
{
	targetUnit = true,
	baseCost = 100,
	icon = "Asst_ItemAmuletGreen",
	parameters = {increase = 1, maxIncrease = 3},
	mapCanUseOnTarget = function (instance, target)
		local hero = target
		local addedHealth = hero.GetStatOffset("health_max") 
		return addedHealth < instance.itemDefinition.parameters.maxIncrease
	end,
	mapUseHandler = function (instance, target)
		local hero = target
        cinematicMapHelper.ImmediateResults({
		{type="unit.attribute", kind = "health_max", amount = instance.itemDefinition.parameters.increase, targets = {target}}
		})
        instance.Consume();
	end
})

itemsHelper.RegisterItem("tent",
{
	targetUnit = false,
	baseCost = 75,
	icon = "Asst_ItemTent",
	parameters = {topHeal = 3},
	mapUseHandler = function (instance, target)
		cinematicMapHelper.EnqueueEphemeralQuest("TentItemEphemeral")
		cinematicMapHelper.ReenterNode()
		
		
		
		instance.Consume()
	end
})

itemsHelper.RegisterItem("horn",
{
	targetUnit = false,
	baseCost = 75,
	icon = "Asst_ItemHorn",
	parameters = {level = 1},
	mapUseHandler = function (instance, target)
		cinematicMapHelper.EnqueueEphemeralQuest("HornItemEphemeral")
		cinematicMapHelper.ReenterNode()
		instance.Consume()
	end
})

itemsHelper.RegisterItem("greaterHorn",
{
	targetUnit = false,
	baseCost = 200,
	icon = "Asst_ItemGreatHorn",
	parameters = {level = 2},
	mapUseHandler = function (instance, target)
		cinematicMapHelper.EnqueueEphemeralQuest("GreaterHornItemEphemeral")
		cinematicMapHelper.ReenterNode()
		instance.Consume()
	end
})

itemsHelper.RegisterItem("necronomicon",
{	
	targetUnit = false,
	baseCost = 0,
	icon = "Asst_ItemPlaceholder",
	mapUseHandler = function (instance, target)
		cinematicMapHelper.EnqueueEphemeralQuest("DarkGrimoire")
		cinematicMapHelper.ReenterNode()
		
	end
})

itemsHelper.RegisterItem("unidentifiedPotion",
{	
	targetUnit = false,
	baseCost = 20,
	icon = "Asst_ItemElixirMystery",
	mapUseHandler = function (instance, target)
		cinematicMapHelper.EnqueueEphemeralQuest("DrinkUnidentifiedPotion")
		cinematicMapHelper.ReenterNode()
		
	end
})

itemsHelper.RegisterItem("OrcTreasureMap",
{
	targetUnit = false,
	baseCost = 20,
	icon = "Asst_ItemPlaceholder",
	mapUseHandler = function (instance, target)
		cinematicMapHelper.EnqueueEphemeralQuest("TreasureMap")
		cinematicMapHelper.ReenterNode()
		
	end
})

itemsHelper.RegisterItem("notoquesnomicon",
{
	targetUnit = false,
	baseCost = 65,
	icon = "notoquesnomicom",
	mapUseHandler = function (instance, target)
		cinematicMapHelper.EnqueueEphemeralQuest("ItemFightTest")
		cinematicMapHelper.ReenterNode()
		instance.Consume()
	end
})



itemsHelper.RegisterItem("teleportinomicon",
{
	targetUnit = false,
	baseCost = 65,
	icon = "notoquesnomicom",
	mapUseHandler = function (instance, target)
		cinematicMapHelper.EnqueueEphemeralQuest("TeleporterTest")
		cinematicMapHelper.ReenterNode()
		instance.Consume()
	end
})

itemsHelper.RegisterItem("encolonomicon",
{
	targetUnit = false,
	baseCost = 65,
	icon = "notoquesnomicom",
	mapUseHandler = function (instance, target)
		cinematicMapHelper.EnqueueEphemeralQuest("TeleporterTest")
		cinematicMapHelper.EnqueueEphemeralQuest("ItemFightTest")
		cinematicMapHelper.EnqueueEphemeralQuest("TeleporterTest")
		cinematicMapHelper.ReenterNode()
		instance.Consume()
	end
})

itemsHelper.RegisterItem("elixirOfLife",
{
	targetUnit = true,
	baseCost = 150,
	icon = "Asst_ItemElixirOfLife",
	mapCanUseOnTarget = function (instance, target)
		local hero = target

        local energyMod = hero.GetModifierInCategory("energyMod")
        local affectsModifier =  energyMod != nil and energyMod.modifier.level < 0

		local health_max = hero.stats.GetStatValue("health_max")
		local health = hero.stats.GetStatValue("health")
		local affectsHealth = health < health_max

		local health_offset = hero.GetStatOffset("health_max")
        local affectsWounds = health_offset != nil and  health_offset < 0

		return affectsModifier or affectsHealth or affectsWounds
	end,
	mapUseHandler = function (instance, target)
		local hero = target

        local energyMod = hero.GetModifierInCategory("energyMod")
        if energyMod != nil and energyMod.modifier.level < 0 then
            hero.RemoveModifier(energyMod);
        end

        hero.ApplyStatOverrideLimited("health_max", 1000);

        hero.DoHeal(100);
        instance.Consume();
	end
})

itemsHelper.RegisterItem("coffee",
{
	targetUnit = true,
	baseCost = 20,
	icon = "Asst_ItemAntiExhaustionPotion",
	mapCanUseOnTarget = function (instance, target)
		local hero = target

        local energyMod = hero.GetModifierInCategory("energyMod")
        return energyMod != nil and energyMod.modifier.level < 0
	end,
	mapUseHandler = function (instance, target)
		local hero = target
        local energyMod = hero.GetModifierInCategory("energyMod")
        hero.RemoveModifier(energyMod);
        instance.Consume()
	end
})

itemsHelper.RegisterItem("invigoratingPotion",
{
	targetUnit = true,
	baseCost = 75,
	icon = "Asst_ItemInvigoratingPotion",
	parameters = {modifierDuration = config.rewards.buffDuration.energy()},
	mapCanUseOnTarget = function (instance, target)
		local hero = target

        local energyMod = hero.GetModifierInCategory("energyMod")
        return energyMod == nil or energyMod.modifier.level < 0
	end,
	mapUseHandler = function (instance, target)
			local hero = target

			cinematicMapHelper.ImmediateResults({
				{type="applyModifier", category="energyMod", level = 1, duration = instance.itemDefinition.parameters.modifierDuration, targets = {target}},
			})
			instance.Consume()
	end
})

itemsHelper.RegisterItem("blessedRing",
{
	targetUnit = true,
	baseCost = 50,
	icon = "Asst_ItemAmuletYellow",
	parameters = {modifierDuration = config.rewards.buffDuration.luck()},
	mapCanUseOnTarget = function (instance, target)
		local hero = target

        local luckMod = hero.GetModifierInCategory("luckMod")
        return luckMod == nil or luckMod.modifier.level < 0
	end,
	mapUseHandler = function (instance, target)
		local hero = target
        cinematicMapHelper.ImmediateResults({
			{type="applyModifier", category="luckMod", level = 1, duration = instance.itemDefinition.parameters.modifierDuration, targets = {target}},
		})
        instance.Consume()
	end
})

itemsHelper.RegisterItem("bandage",
{
	targetUnit = true,
	baseCost = 50,
	icon = "Asst_ItemBandage",
	parameters = {woundsHealed = 1},
	mapCanUseOnTarget = function (instance, target)
		local hero = target

        local heroWounds = hero.GetStatOffset("health_max")
        return heroWounds != nil and  heroWounds < 0
	end,
	mapUseHandler = function (instance, target)
		local hero = target

		hero.ApplyStatOverrideLimited("health_max", instance.itemDefinition.parameters.woundsHealed);
		instance.Consume();
	end
})

itemsHelper.RegisterItem("glareMask",
{
	targetUnit = false,
	baseCost = 100,
	icon = "Asst_ItemGlareMask",
	parameters = {increase = 1, maxIncrease = 3},
	mapUseHandler = function (instance, target)
		cinematicMapHelper.EnqueueEphemeralQuest("GlareMaskEphemeral")
		cinematicMapHelper.ReenterNode()
		
		
		
		instance.Consume()
	end
})

itemsHelper.RegisterItem("ashervanAmulet",
{
	baseCost = 100,
	icon = "Asst_ItemAshervanAmulet",
})

itemsHelper.RegisterItem("rope",
{
	baseCost = 15,
	icon = "Asst_ItemRope",
})

itemsHelper.RegisterItem("torch",
{
	baseCost = 15,
	icon = "Asst_ItemTorch",
})

itemsHelper.RegisterItem("crowbar",
{
	baseCost = 15,
	icon = "Asst_ItemCrowbar",
})

itemsHelper.RegisterItem("shovel",
{
	baseCost = 15,
	icon = "Asst_ItemShovel",
})

itemsHelper.RegisterItem("pick",
{
	baseCost = 15,
	icon = "Asst_ItemPickaxe",
})

itemsHelper.RegisterItem("architectsHammer",
{
	baseCost = 0,
	icon = "Asst_ItemArchitectHammer",
})



itemsHelper.RegisterItem("food",
{
	baseCost = 0,
	parameters = {health = 1},
	icon = "Asst_ItemSupplies"
})

itemsHelper.RegisterItem("treasureMap",
{
	baseCost = 0,
	icon = "Asst_ItemPlaceholder",
})





