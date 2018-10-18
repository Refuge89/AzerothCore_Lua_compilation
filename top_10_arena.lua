----------------------------------------------
-- TOP 5 per class                          //
-- Edit by Poszer           //
-- http://wowdarklegion.com                       //
----------------------------------------------
local NPC_ID = 500000                           -- Put your ID from Creature_Template table

 local arena = {
	[2] = {"TOP 10 arena 2v2"},
	[3]	= {"TOP 10 arena 3v3"},
	[5] = {"TOP 10 arena 5v5"},	
};
	
 
function seleciona(event, plr, unit)
    	for k, v in pairs(arena) do
		plr:GossipMenuAddItem(0, v[1], 0, k)
	end
	plr:GossipSendMenu(1, unit)
end

function clica(event, plr, unit, arg2, intid)
    if (intid > 0) then
        local resultado = CharDBQuery("SELECT name,rating FROM arena_team WHERE type='"..intid.."' ORDER BY rating DESC LIMIT 10")
        repeat
        time = resultado:GetString(0);
        pontos = resultado:GetUInt32(1);
        plr:SendBroadcastMessage("|cFF33CCFFName of team : |r ".. time .." ,  |cFF33CCFFRating : |r" .. pontos .. "  Personal Arena Rating ")
        until not resultado:NextRow()    
    end
end
RegisterCreatureGossipEvent(NPC_ID, 1, seleciona)
RegisterCreatureGossipEvent(NPC_ID, 2, clica)