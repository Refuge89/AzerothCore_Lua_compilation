function onUpdateZone(event, player, newZone, newArea)
	player:SetFFA(true)
end

RegisterPlayerEvent(27, onUpdateZone)