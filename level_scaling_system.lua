local levelScalingSystem = {};

function levelScalingSystem.CreatureSetLevel(event, player, enemy)
	--enemy:SendUnitSay('Hola puto', 0)
	--player:SendUnitSay('Hola puto', 0)
	--if(enemy:GetObjectType() == "Creature") then
		--enemy:SetLevel(player:GetLevel())
	--end
end

RegisterPlayerEvent(33, levelScalingSystem.CreatureSetLevel)