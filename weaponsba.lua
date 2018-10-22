function On_Gossip(unit, event, player)
unit:GossipCreateMenu(50, player, 0)
unit:GossipMenuAddItem(0, "Riding Skills!", 1, 0)
unit:GossipSendMenu(player)
end

function Gossip_Submenus(unit, event, player, id, intid, code)
    if(intid == 1) then
    player:LearnSpell(33389)
    player:LearnSpell(34093)
    player:LearnSpell(33392)
    player:LearnSpell(34092)
    player:LearnSpell(54197)
    player:GossipComplete()
    end
end

RegisterUnitGossipEvent(95025, 1, "On_Gossip")
RegisterUnitGossipEvent(95025, 2, "Gossip_Submenus")