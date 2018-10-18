----------------------------------------------
-- TOP 5 per class                          //
-- Edit by Poszer            //
-- http://wowdarklegion.com                      //
----------------------------------------------
 
local NPC_ID = 500100                                       -- Put your ID from Creature_Template table

local T = { 
	[1] = {"Warrior", "660000"},
	[2] = {"Paladin", "FF0099"},
	[3] = {"Hunter", "CC6611"},
	[4] = {"Rogue", "CCFF00"},
	[5] = {"Priest", "FFFFFF"},
	[6] = {"Death Knight", "4D4D51"},
	[7] = {"Shaman", "0000CC"},
	[8] = {"Mage", "33FFFF"},
	[9] = {"Warlock", "660099"},
	[11] = {"Druid", "FF6600"}
};
 
function clica(event, plr, unit)
	plr:GossipMenuAddItem(0, "Choose the class : ", 0, 0)
	
	for k, v in pairs(T) do
		plr:GossipMenuAddItem(0, "TOP 5 |cff"..v[2]..v[1], 0, k)
	end
	
	plr:GossipSendMenu(1, unit)
end
 
function seleciona(event, plr, unit, arg2, intid)
    if (intid > 0) then
        plr:SendBroadcastMessage("|cff"..T[intid][2]..T[intid][1])
		
		local resultado = CharDBQuery("SELECT name,totalKills FROM characters WHERE class='"..intid.."' ORDER BY totalKills DESC LIMIT 5")
        repeat
			local playername = resultado:GetString(0);
			local kills = resultado:GetUInt32(1);
			plr:SendBroadcastMessage("|cFF33CCFFPlayer : |r ".. playername .." ,  |cFF33CCFFwith : |r" .. kills .. " Kills")
        until not resultado:NextRow()
    end
end
RegisterCreatureGossipEvent(NPC_ID, 1, clica)
RegisterCreatureGossipEvent(NPC_ID, 2, seleciona)