{
	"adventures" : [
		{
			"id" : "tutorial",
			"isTutorial" : true,
			"victoryAchievements" : ["adventure_completed_tutorial", "after_tutorial"]
		},
		{
			"id" : "forest",
			"unlockAchievement" : "after_tutorial",
			"victoryAchievements" : ["adventure_completed_forest"]
		},
		{
			"id" : "mountain",
			"unlockAchievement" : "adventure_completed_forest",
			"victoryAchievements" : ["adventure_completed_mountain"]
		},
		{
			"id" : "wasteland",
			"unlockAchievement" : "adventure_completed_mountain",
			"victoryAchievements" : ["adventure_completed_wasteland"]
		},
		{
			"id" : "silveroak",
			"unlockAchievement" : "adventure_completed_wasteland",
			"victoryAchievements" : ["adventure_completed_silveroak"]
		},
		{
			"id" : "arena",
			"unlockAchievement" : "adventure_completed_forest",
			"victoryAchievements" : []
		}
	]
}