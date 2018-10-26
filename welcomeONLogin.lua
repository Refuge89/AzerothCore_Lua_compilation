function New_Char(event, player)
	SendWorldMessage("Let's all welcome the new player "..player:GetName().." on server.", 2)
	player:SendBroadcastMessage("Hello "..player:GetName()..", everyone welcomes you to the server.")
end

RegisterPlayerEvent(30, New_Char)
