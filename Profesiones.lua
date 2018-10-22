local NPC_ID = 500400
 
local prof = {
    [1] = {
        --  {skill, spell, "name",      "npc_trainer reference IDs"},
        {171, 51303, "Alchemy",         "201001, 201002, 201003"},
        {164, 51298, "Blacksmithing",   "201004, 201005, 201006"},
        {333, 51312, "Enchanting",      "201009, 201010, 201011"},
        {202, 51305, "Engineering",     "201012, 201013, 201014"},
        {182, 50301, "Herbalism",       "201018, 201019, 201020"},
        {773, 45380, "Inscription",     "201021, 201022, 201023"},
        {755, 51310, "Jewelcrafting",   "201024, 201025, 201026"},
        {165, 51301, "Leatherworking",  "201027, 201028, 201029"},
        {186, 50309, "Mining",          "201033, 201034, 201035"},
        {393, 50307, "Skinning",        "201036, 201037, 201038"},
        {197, 51308, "Tailoring",       "201039, 201040, 201041"},
    },
   
    [2] = {
        --  {skill, spell, "name",  "npc_trainer reference IDs"},
        {356, 51293, "Fishing",     "202001, 202002, 202003"},
        {185, 51295, "Cooking",     "202004, 202005, 202006"},
        {129, 50299, "First Aid",   "202007, 202008, 202009"},
    },
}
 
for _, p in ipairs(prof) do
    for k, v in ipairs(p) do
        local skill, spell, name, profrefs = table.unpack(v)
        local q = WorldDBQuery("SELECT SpellID FROM npc_trainer WHERE ID in("..profrefs..")")
        v[4] = {};
        local recipes = v[4]
        if q then
            repeat
                table.insert(recipes, q:GetUInt32(0))
            until not q:NextRow()
        end
    end
end
 
local function On_Gossip(event, player, unit)
    player:GossipClearMenu()
    player:GossipMenuAddItem(3, "Primary Professions", 0, 1)
    player:GossipMenuAddItem(3, "Secondary Professions", 0, 2)
    player:GossipSendMenu(100, unit)
end
 
local function On_Select(event, player, unit, id, intid, code)
    player:GossipClearMenu()
    if id == 0 then
        if intid == 1 or intid == 2 then
            for k, v in ipairs(prof[intid]) do
                local skill, spell, name, recipes = table.unpack(v)
                if not player:HasSkill(skill) then
                    player:GossipMenuAddItem(3, "Learn "..name, 3+intid, k)
                else
                    player:GossipMenuAddItem(3, "Unlearn "..name, 3+intid, k)
                end
            end
            player:GossipMenuAddItem(7, "Back..", 0, 3)
            player:GossipSendMenu(100, unit)
            return
        elseif intid == 3 then
            On_Gossip(event, player, unit)
            return
        end
    end
   
    if id == 4 or id == 5 then
        id = id-3
       
        local skill, spell, name, recipes = table.unpack(prof[id][intid])
        if not player:HasSkill(skill) then
            -- if id is primary prof and we cant learn more
            if id == 1 and player:GetUInt32Value(1021) <= 0 then
                player:SendNotification("You can not learn more primary professions")
            else
                player:CastSpell(player, spell)
                player:AdvanceSkill(skill, 450)
                for k, v in ipairs(recipes) do
                    if not player:HasSpell(v) then
                        player:LearnSpell(v)
                    end
                end
            end
        else
            player:SetSkill(skill, 0, 0, 0)
        end
       
        On_Select(event, player, unit, 0, id)
        return
    end
   
    player:GossipComplete()
end
 
RegisterCreatureGossipEvent(NPC_ID, 1, On_Gossip)
RegisterCreatureGossipEvent(NPC_ID, 2, On_Select)