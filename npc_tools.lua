local npcid = 60001
 
function morph_gossip(unit, player, creature)
    player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_ChargePositive:30:30:-15:0|t ¡Dame Buffos!|r", 0, 1)
    player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Nature_Rejuvenation:30:30:-15:0|t ¡Curame!|r", 0, 2)
    player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Holy_BlessedRecovery:30:30:-15:0|t Quitar Dolencia de Resurrección.|r", 0, 3)
    player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_reputation_01:30:30:-15:0|t Hasta pronto...|r", 0, 999)
    player:GossipSendMenu(1, creature)
end
 
function morph_select(event, player, creature, sender, intid)
    if (intid == 1) then -- Buffs
        player:AddAura(25898, player)
        player:AddAura(48469, player)
        player:AddAura(42995, player)
        player:AddAura(48169, player)
        player:AddAura(48073, player)
        player:AddAura(48161, player)
        player:AddAura(26035, player)
        player:GossipComplete()
    end
   
    if (intid == 2) then -- Heal
        player:SetHealth(player:GetMaxHealth())
        player:SetPower(player:GetMaxPower(0), 0)
        player:GossipComplete()
    end
   
    if (intid == 3) then -- Remove Sickness
        player:RemoveAura(15007)
        player:GossipComplete()
    end
   
    if (intid == 999) then -- Nevermind
        player:GossipComplete()
    end
end
 
--RegisterCreatureGossipEvent(npcid, 1, morph_gossip)
--RegisterCreatureGossipEvent(npcid, 2, morph_select)