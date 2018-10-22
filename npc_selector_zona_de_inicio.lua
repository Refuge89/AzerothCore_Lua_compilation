-- INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES (60000, 0, 0, 0, 0, 0, -4, -5, 0, 0, 'Cambiar Zona de Inicio', 'Ayudantes del Servidor', '', 0, 80, 80, 2, 35, 1, 1, 1.14286, 1, 1, 0, 2000, 2000, 1, 1, 8, 33536, 2048, 0, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 500, 500, 1, 4.6, 1, 0, 0, 1, 0, 0, '', 12340);


local NPCID = 60000
local maximo_nivel = 10

local zones = {
  [0] = { -- Alianza
    [1] = {"Humanos", 0, -8949.950195, -132.492996, 83.531197, 0},
    [2] = {"Elfos de la Noche", 1, 10311.299805, 832.463013, 1326.407837, 5.696320},
    [3] = {"Enanos", 0, -6240.319824, 331.032990, 382.757996, 6.177160},
    [4] = {"Gnomos", 0, -6240.319824, 331.032990, 382.757996, 6.177160},
    [5] = {"Draeneis", 530, -3961.639893, -13931.200195, 100.613525, 2.083640},
  },

  [1] = { -- Horda
    [6] = {"Orcos", 1, -618.518005, -4251.669922, 38.717999, 0},
    [7] = {"Troll", 1, -618.518005, -4251.669922, 38.717999, 0},
    [8] = {"No-Muertos", 0, 1676.709961, 1678.310059, 121.669998, 3.163933},
    [9] = {"Tauren", 1, -2917.580078, -257.980011, 52.996799, 0},
    [10] = {"Elfos de Sangre", 530, 10349.599609, -6357.290039, 33.402599, 5.316050},
  }
}

function On_Gossip(event, player, unit)
  if player:GetLevel() <= maximo_nivel then
    player:GossipMenuAddItem(0, "Escoge una zona de inicio.", 0, 11)
    local playerTeam = player:GetTeam()
    local options = zones[playerTeam]

    for k, v in pairs(options) do 
      player:GossipMenuAddItem(4, v[1], 0, k)
    end
  else
    player:GossipMenuAddItem(0, "Tu nivel es muy alto.", 0, 0)
  end

  player:GossipSendMenu(1, unit)
end

function On_Select(event, player, unit, sender, intid, code)
  if intid >= 1 and intid <= 10 then
    local options = zones[player:GetTeam()]
    local coords = options[intid]
    player:Teleport(coords[2], coords[3], coords[4], coords[5], coords[6])
  end

  player:GossipComplete()
end

--RegisterCreatureGossipEvent(NPCID, 1, On_Gossip)
--RegisterCreatureGossipEvent(NPCID, 2, On_Select)