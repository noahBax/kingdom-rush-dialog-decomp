"stats" 
{
	//"baseMeleeDamage" "(stat(#wpnDamage)) * stat(#wpnAttackCost) +  stat(#StrengthBonus) * stat(#wpnAtributeBonusMultiplier)"

	//"baseRangedDamage" "(stat(#wpnDamage)) * stat(#wpnAttackCost) +  stat(#AgilityBonus) * stat(#wpnAtributeBonusMultiplier)"

	//"baseWandDamage" "(stat(#wpnDamage)) * stat(#wpnAttackCost) +  stat(#IntelligenceBonus) * stat(#wpnAtributeBonusMultiplier)"




	"attackDamage" "(stat(#baseDamage)) * stat(#bonusDamageMultiplier) + stat(#extraDamage)" //+proc va despues

	//"AttDPAP" "stat(#attackDamage) / stat(#attackCostAP)" // Usamos para Skills de Attaque con armas






	//"SpellDPAP" "stat(#spellPower) + modifiers" // WIP hay que definir como es bien



	"health_max_available" "stat(#health_max) * stat(#health_max_available_percent)"


	//PRECALCULADAS PARA FACILITAR FORMULAS
	"health_missing" "stat(#health_max) - stat(#health)"
	"health_missing_percent" "1 - stat(#health) / stat(#health_max)"

	"health_missing_available" "stat(#health_missing) - stat(#health)"
	"health_missing_available_percent" "1 - stat(#health) / stat(#health_missing)"
}