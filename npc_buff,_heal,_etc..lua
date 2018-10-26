local npcid = 190018
 
function morph_gossip(unit, player, creature)
    player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_ChargePositive:30:30:-15:0|t Buffs|r", 0, 1)
    player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Nature_Rejuvenation:30:30:-15:0|t Heal me|r", 0, 2)
    player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Holy_BlessedRecovery:30:30:-15:0|t Remove ressurection sickness|r", 0, 3)
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Parry:30:30:-15:0|t Reset Combat|r", 0, 4)
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Arcane_MassDispel:30:30:-15:0|t Reset Cooldowns|r", 0, 5)
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Arcane_FocusedPower:30:30:-15:0|t Reset Talents|r", 0, 6, false, "Tem certeza de que deseja Resetar seus Pontos de Talento?")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Spell_Shadow_UnstableAffliction_1:30:30:-15:0|t Reset Instances|r", 0, 7, false, "Tem certeza de que deseja descinvular-se de todas as instâncias?")
	player:GossipMenuAddItem(0, "|TInterface\\icons\\Ability_Repair:30:30:-15:0|t Repair Items|r", 0, 8)
    player:GossipMenuAddItem(0, "|TInterface\\icons\\achievement_reputation_01:30:30:-15:0|t Nevermind...|r", 0, 999)
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
	
	if (intid == 4) then -- Reset Combat
        player:ClearInCombat()
        player:GossipComplete()
    end
	
	if (intid == 5) then -- Reset Cooldown
        player:ResetAllCooldowns()
        player:GossipComplete()
    end
	
	if (intid == 6) then -- Reset Talents
        player:ResetTalents(true)
        player:GossipComplete()
    end
	
	if (intid == 7) then -- Reset Instances
        player:UnbindAllInstances()
        player:GossipComplete()
    end
	
	if (intid == 8) then -- Repair Itens
        player:DurabilityRepairAll(false)
        player:GossipComplete()
    end
   
    if (intid == 999) then -- Nevermind
        player:GossipComplete()
    end
end
 
RegisterCreatureGossipEvent(npcid, 1, morph_gossip)
RegisterCreatureGossipEvent(npcid, 2, morph_select)
