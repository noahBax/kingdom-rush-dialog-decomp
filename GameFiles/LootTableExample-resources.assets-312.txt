return {

	{
		id = "pipote",
		items = {
			{type = "item", id = "rope", quantity = || 2},
			{type = "itemList", id = "any-armor", quantity = ||1},
			{type = "oneOf", quantity = || 2, items = {
				{type = "item", id = "rope", quantity = ||1, chanceSlots = 2},
				{type = "item", id = "torch", quantity = ||1, chanceSlots = 1},
			}},
			{type = "anyOf", quantity = || 1, items = {
				{type = "item", id = "rope", quantity = ||2, chance = 0.3},
				{type = "item", id = "torch", quantity = ||2, chance = 0.5},
			}}
		}
	},
	{
		id = "any-armor",
		items = {
			{type = "oneOf", items = {
				{type = "item", id = "chestArmor", quantity = ||1},
				{type = "item", id = "helmet", quantity = ||1},
			}}
		}
	}
}
