-- Made by: ElNaig
-- Script edited / translated by Poszer

local npcid = 500400     -- Your NPC ID Here

local T = {
["Menu"] = {
{"Headpiece", 0},
{"Shoulders", 2},
{"Chest", 4},
{"Legs", 6},
{"Boots", 7},
{"Bracers", 8},
{"Gloves", 9},
{"Cloak", 14},
{"Main-Hand Weapons", 15},
{"Two-Handed Weapons", 151},
{"Shields", 161};
},

[0] = { -- Headpiece
{"30 Spell Power + 20 Critical strike", 3820, false},
{"+30 Spell Power and 10 mana per 5 seconds", 3819, false},
{"37 Stamina + 20 Defense rating", 3818, false},
{"50 Attack Power + 20 Critical Strike", 3817, false},
{"30 Stamina + 25 Resilience Rating", 3842, false},
{"50 Attack Power + 20 Resilience Rating", 3795, false},
{"29 spell Power + 20 Resillience Rating", 3797, false};
},

[2] = { -- Shoulders
{"40 Attack Power + 15 Resillience Rating", 3793, false},
{"23 Spell Power +15 Resilience Rating", 3794, false},
{"30 Stamina + 15 Resillience Rating", 3852, false},
{"40 Attack Power + 15 Critical Rating", 3808, false},
{"24 Spell Power + 8 mana per 5s", 3809, false},
{"20 Dodge + 15 Defense Rating", 3811, false},
{"24 Spell Power + 5 Critical Strike Rating", 3810, false};
},

[4] = { -- Chest
{"10 All Stats", 3832, false},
{"275 Health", 3297, false},
{"10 mana 5s", 2381, false},
{"20 Resilience Rating", 3245, false},
{"22 Defense Rating", 1953, false};
},

[6] = { -- Legs
{"40 Resilience Rating + 28 Stamina", 3853, false},
{"55 Stamina + 22 Agility", 3822, false},
{"75 Attack Power + 22 Critical Strike Rating", 3823, false},
{"50 Spell Power + 20 Spirit", 3719, false},
{"50 Spell Power + 30 stamina", 3721, false};
},

[7] = { -- Boots
{"32 Attack Power", 1597, false},
{"15 Stamina and Minor Speed Increase", 3232, false},
{"16 Agility", 983, false},
{"18 Spirit", 1147, false},
{"7 Health and Mana every 5 sec", 3244, false},
{"12 Hit Rating and + 12 Critical Strike Rating", 3826, false},
{"22 Stamina", 1075, false};
},

[8] = { -- Bracers
{"40 Stamina", 3850, false},
{"30 Spell Power", 2332, false},
{"50 Attack Power", 3845, false},
{"18 Spirit", 1147, false},
{"15 Expertise Rating", 3231, false},
{"6 All Stats", 2661, false},
{"16 Intellect", 1119, false};
},

[9] = { -- Gloves
{"16 Critical Strike Rating", 3249, false},
{"2% Threat and 10 Parry Rating", 3253, false},
{"44 Attack Power", 1603, false},
{"20 Agility", 3222, false},
{"20 Hit Rating", 3234, false},
{"15 Expertise Rating", 3231, false},
{"28 Spell Power", 3246, false};
},

[14] = { -- Cloak
{"Increased Stealth and +10 Agility", 3256, false},
{"10 Spirit and 2% Reduced Threat", 3296, false},
{"16 Defense Rating", 1951, false},
{"23 Haste Rating", 3831, false},
{"225 Armor", 3294, false},
{"22 Agility", 1099, false};
},

[15] = {
-- Main Hand
{"Berserking", 3789, false},
{"Black Magic", 3790, false},
{"63 Spell Power", 3834, false},
{"65 Attack Power", 3833, false},
{"Lifeward", 3241, false},
{"Blood Draining", 3870, false},
{"Blade Ward", 3869, false},
{"26 Agility", 1103, false},
{"45 Spirit", 3844, false},
{"Executioner", 3225, false},
{"Mongoose", 2673, false};

-- Two-Handed
{"Berserking", 3789, false},
{"Executioner", 3225, false},
{"Mongoose", 2673, false},
{"Massacre", 3827, true},
{"140 Attack Power versus Undead", 3247, true},
{"81 Spell Power", 3854, true};
},

[16] = {
-- Shields
{"20 Defense", 1952, true},
{"25 Intellect", 1128, true},
{"15 Shield Block Rating", 2655, true},
{"12 Resilience Rating", 3229, true},
{"18 Stamina", 1071, true},
{"36 Blocking Value", 2653, true};
},
};
local pVar = {};

function Enchanter(event, plr, unit)
pVar[plr:GetName()] = nil;

for _, v in ipairs(T["Menu"]) do
plr:GossipMenuAddItem(3, ""..v[1]..".|R", 0, v[2])
end
plr:GossipSendMenu(1, unit)
end

function EnchanterSelect(event, plr, unit, sender, intid, code)
if (intid < 500) then
local ID = intid
local f
if(intid == 161 or intid == 151) then
ID = math.floor(intid/10)
f = true
end
pVar[plr:GetName()] = intid;
if(T[ID]) then
for i, v in ipairs(T[ID]) do
if((not f and not v[3]) or (f and v[3])) then
plr:GossipMenuAddItem(3, ""..v[1]..".|R", 0, v[2])
end
end
end
plr:GossipMenuAddItem(3, "[Back]", 0, 500)
plr:GossipSendMenu(1, unit)
elseif (intid == 500) then
Enchanter(event, plr, unit)
elseif (intid >= 900) then
local ID = pVar[plr:GetName()]
if(ID == 161 or ID == 151) then
ID = math.floor(ID/10)
end
for k, v in pairs(T[ID]) do
if v[2] == intid then
local item = plr:GetEquippedItemBySlot(ID)
if item then
if v[3] then
local WType = item:GetSubClass()
if pVar[plr:GetName()] == 151 then
if(WType == 1 or WType == 5 or WType == 6 or WType == 8 or WType == 10) then
item:ClearEnchantment(0,0)
item:SetEnchantment(intid, 0, 0)
else
plr:SendAreaTriggerMessage("You do not have a Two-Handed Weapon equipped!")
end
elseif pVar[plr:GetName()] == 161 then
if(WType == 6) then
item:ClearEnchantment(0,0)
item:SetEnchantment(intid, 0, 0)
else
plr:SendAreaTriggerMessage("You do not have a Shield equipped!")
end
end
else
item:ClearEnchantment(0,0)
item:SetEnchantment(intid, 0, 0)
plr:CastSpell(plr, 36937)
end
else
plr:SendAreaTriggerMessage("You have no item to enchant in the selected slot!")
end
end
end
EnchanterSelect(event, plr, unit, sender, pVar[plr:GetName()], nil)
end
end

RegisterCreatureGossipEvent(npcid, 1, Enchanter)
RegisterCreatureGossipEvent(npcid, 2, EnchanterSelect)
