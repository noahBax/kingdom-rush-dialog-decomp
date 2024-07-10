local encounterLogic = encounterHelper.CreateEncounterLogic()

encounterLogic.AddCinematic("OnStart",cinematicHelper.Cinematic({
	    cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.SetCurtain(true),
		cinematicHelper.StartFight(),
		cinematicHelper.Instant(function ()
			local unitView = cinematicHelper.FindCinematicUnit("enemy")
			local unit = unitView.GetUnit()
			abilitiesHelper.RegisterModifier("dev_modifier_check", {
					events = {
						OnRemoved = function (context)
							cinematicHelper.DebugEnqueueCinematic("OnDeath")
						end
					}
				})

			abilitiesHelper.ApplyModifier(unit, "dev_modifier_check")


		end),
	}))

encounterLogic.AddCinematic("OnDeath",cinematicHelper.Cinematic({

		cinematicHelper.Parallel({
			cinematicHelper.While(|| true, cinematicHelper.Sequence({
				cinematicHelper.Sequence({
					cinematicHelper.Sleep(1),
					cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos("fxDeathPos")),
				}),
			})),
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(10),
				cinematicHelper.Instant(|| cinematicHelper.DebugMakeSkipCoverTransparent())
			})
		})
	}))

encounterLogic.AddCinematic("OnEnd",cinematicHelper.Cinematic({

		cinematicHelper.While(|| true, cinematicHelper.Sequence({
			cinematicHelper.Sequence({
				cinematicHelper.Sleep(1),
				cinematicHelper.AddFxToPosition(|| "WBFMountainShakeFXMega", || cinematicHelper.FindCinematicPos("fxEndPos")),
			}),
		})),
		cinematicHelper.SetCinematicBarsVisibility(false),
		cinematicHelper.ShowMoveForwardButton(),
	}))



return encounterLogic;
