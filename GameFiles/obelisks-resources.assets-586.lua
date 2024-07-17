custom.obelisks = {}

function custom.obelisks.checkDarkness(c)
	local node = c.GetObject("NODE")
	if(node.isIntermediate) then
		return
	end

	local qs = c.GetObject("QS")

	if qs.resolved then
		return
	end

	local obeliskNode = cinematicMapHelper.Node(qs.nodeId)

	local steps = qs.context.GetInt("steps")
	local obeliskLevel = qs.context.GetInt("obeliskLevel")
	local stateId = "state0" .. obeliskLevel
	qs.context.SetInt("steps", steps + 1)
	
	
	if steps == 3 then
		qs.context.SetInt("steps", 1)
		if obeliskLevel <= 1 then
			qs.context.SetInt("obeliskLevel", obeliskLevel + 1)
			obeliskLevel = qs.context.GetInt("obeliskLevel")
			stateId = "state0" .. obeliskLevel
			obeliskNode.SetVisualState(stateId)
		end
	end
end
