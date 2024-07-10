local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	    cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.StartFight(),

		cinematicHelper.Instant(function ()
			local unitView = cinematicHelper.FindCinematicUnit("Monitor")
			local unit = unitView.GetUnit()

			abilitiesHelper.RegisterModifier("monitor_modifier", {
				events = {

					OnTurnStarted = function (context)
						print("Monitor - OnTurnStarted")
					end,
					
					OnUnitDamaged = function (context)
						print("OnUnitDamaged\n" .. context.ToString())
					end
				}
			})

			abilitiesHelper.ApplyModifier(unit, "monitor_modifier")
		end),
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
	}))

return encounterLogic;
