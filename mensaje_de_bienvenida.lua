function New_Char(event, player)
	SendWorldMessage("Demos todos la bienvenida al nuevo player "..player:GetName().." al servidor.", 2)
	player:SendBroadcastMessage("Hola "..player:GetName()..", todo el mundo te da la bienvenida al servidor.")
end

RegisterPlayerEvent(30, New_Char)