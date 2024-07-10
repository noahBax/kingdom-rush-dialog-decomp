return {

	{
		id = "lowHealing",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "healthPotion", quantity = ||1, chanceSlots = 5},
				{type = "item", id = "rope", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "pick", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "crowbar", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "bandage", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "torch", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "coffee", quantity = ||1, chanceSlots = 1},
				
				
				{type = "item", id = "unidentifiedPotion", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "food", quantity = ||2, chanceSlots = 2},
				{type = "item", id = "food", quantity = ||1, chanceSlots = 2},
				
			}}
		}
	},
	{
		id = "midHealing",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "healthPotion", quantity = ||1, chanceSlots = 6},
				{type = "item", id = "coffee", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "elixirOfLife", quantity = ||1, chanceSlots = 1},
				
				{type = "item", id = "unidentifiedPotion", quantity = ||1, chanceSlots = 1},
				
				{type = "item", id = "bandage", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "food", quantity = ||3, chanceSlots = 1},
				{type = "item", id = "tent", quantity = ||1, chanceSlots = 2},
			}}
		}
	},
	{
		id = "highHealing",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "healthPotion", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "coffee", quantity = ||2, chanceSlots = 2},
				{type = "item", id = "invigoratingPotion", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "healthPotion", quantity = ||2, chanceSlots = 5},
				{type = "item", id = "bandage", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "bandage", quantity = ||2, chanceSlots = 1},
				{type = "item", id = "elixirOfLife", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "tent", quantity = ||1, chanceSlots = 3},
			}}
		}
	},
	
	{
		id = "lowLoot",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "rope", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "pick", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "crowbar", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "torch", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "blessedRing", quantity = ||1, chanceSlots = 1},
			}}
		}
	},
	{
		id = "midLoot",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "rope", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "pick", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "crowbar", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "blessedRing", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "ringOfVitality", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "horn", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "torch", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "healthPotion", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "armorersKit", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "sharpeningStone", quantity = ||1, chanceSlots = 1},
			}}
		}
	},
	
	{
		id = "highLoot",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "elixirOfLife", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "armorersKit", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "sharpeningStone", quantity = ||1, chanceSlots = 1},
			}}
		}
	},
	{
		id = "lowPotion",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "healthPotion", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "healthPotion", quantity = ||2, chanceSlots = 2},
				{type = "item", id = "coffee", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "unidentifiedPotion", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "elixirOfLife", quantity = ||1, chanceSlots = 1},
			}}
		}
	},
	{
		id = "midPotion",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "healthPotion", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "healthPotion", quantity = ||2, chanceSlots = 3},
				{type = "item", id = "healthPotion", quantity = ||3, chanceSlots = 1},
				{type = "item", id = "unidentifiedPotion", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "coffee", quantity = ||2, chanceSlots = 3},
				{type = "item", id = "invigoratingPotion", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "elixirOfLife", quantity = ||1, chanceSlots = 3},
			}}
		}
	},
	{
		id = "highPotion",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "healthPotion", quantity = ||2, chanceSlots = 1},
				{type = "item", id = "healthPotion", quantity = ||3, chanceSlots = 3},
				{type = "item", id = "invigoratingPotion", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "elixirOfLife", quantity = ||1, chanceSlots = 9},
				{type = "item", id = "coffee", quantity = ||2, chanceSlots = 1},
				{type = "item", id = "elixirOfLife", quantity = ||2, chanceSlots = 1},
			}}
		}
	},
	{
		id = "lowItems",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "bandage", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "tent", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "rope", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "rope", quantity = ||2, chanceSlots = 1},
				{type = "item", id = "pick", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "pick", quantity = ||2, chanceSlots = 1},
				{type = "item", id = "crowbar", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "crowbar", quantity = ||2, chanceSlots = 1},
				{type = "item", id = "torch", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "torch", quantity = ||2, chanceSlots = 1},
				{type = "item", id = "blessedRing", quantity = ||1, chanceSlots = 1},
				
				
				{type = "item", id = "food", quantity = ||3, chanceSlots = 2},
			}}
		}
	},
	{
		id = "midItems",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "bandage", quantity = ||2, chanceSlots = 3},
				{type = "item", id = "bandage", quantity = ||1, chanceSlots = 1},
				
				{type = "item", id = "tent", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "rope", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "rope", quantity = ||2, chanceSlots = 3},
				{type = "item", id = "pick", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "pick", quantity = ||2, chanceSlots = 3},
				{type = "item", id = "crowbar", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "crowbar", quantity = ||2, chanceSlots = 3},
				{type = "item", id = "torch", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "torch", quantity = ||2, chanceSlots = 3},
				{type = "item", id = "armorersKit", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "ringOfVitality", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "blessedRing", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "horn", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "sharpeningStone", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "food", quantity = ||3, chanceSlots = 2},
				{type = "item", id = "food", quantity = ||5, chanceSlots = 3},
			}}
		}
	},
	{
		id = "highItems",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "bandage", quantity = ||3, chanceSlots = 1},
				{type = "item", id = "bandage", quantity = ||2, chanceSlots = 3},
				{type = "item", id = "tent", quantity = ||2, chanceSlots = 2},
				{type = "item", id = "rope", quantity = ||3, chanceSlots = 1},
				{type = "item", id = "pick", quantity = ||3, chanceSlots = 1},
				{type = "item", id = "crowbar", quantity = ||3, chanceSlots = 1},
				
				{type = "item", id = "torch", quantity = ||3, chanceSlots = 1},
				{type = "item", id = "armorersKit", quantity = ||2, chanceSlots = 1},
				{type = "item", id = "armorersKit", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "ringOfVitality", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "greaterHorn", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "sharpeningStone", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "sharpeningStone", quantity = ||2, chanceSlots = 1},
				{type = "item", id = "food", quantity = ||5, chanceSlots = 2},
			}}
		}
	},

	{
		id = "buffItem",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "armorersKit", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "sharpeningStone", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "unidentifiedPotion", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "coffee", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "invigoratingPotion", quantity = ||1, chanceSlots = 1},
			}}
		}
	},
	{
		id = "arenaHealing",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "healthPotion", quantity = ||1, chanceSlots = 10},
				{type = "item", id = "healthPotion", quantity = ||2, chanceSlots = 1},
				{type = "item", id = "bandage", quantity = ||1, chanceSlots = 3},
				{type = "item", id = "bandage", quantity = ||2, chanceSlots = 1},
				{type = "item", id = "elixirOfLife", quantity = ||1, chanceSlots = 1},
				{type = "item", id = "tent", quantity = ||1, chanceSlots = 1},
			}}
		}
	},
	{
		id = "arenaUpgrade",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "armorersKit", quantity = ||1, chanceSlots = 4},
				{type = "item", id = "sharpeningStone", quantity = ||1, chanceSlots = 4},
				{type = "item", id = "ringOfVitality", quantity = ||1, chanceSlots = 2},

			}}
		}
	},
	{
		id = "maskTable",
		items = {
			{type = "oneOf", quantity = || 1, items = {
				{type = "item", id = "food", quantity = ||1, chanceSlots = 97},
				{type = "item", id = "glareMask", quantity = ||1, chanceSlots = 3},
			}}
		}
	},
}
