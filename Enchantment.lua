-- Made by: ElNaig

local npcid = 500400

local T = {
["Menu"] = {
{"Headpiece / Casco", 0},
{"Shoulders / Hombros", 2},
{"Chest / Pecho", 4},
{"Legs / Piernas", 6},
{"Boots / Botas", 7},
{"Bracers / Brazales", 8},
{"Gloves / Manos", 9},
{"Cloak / Espalda", 14},
{"Main-Hand Weapons / Arma Principal", 15},
{"Two-Handed Weapons / Arma 2 Manos", 151},
{"Shields / Escudos", 161};
},

[0] = { -- Headpiece
{"30 Spell-20 Critic / 30 Hechizo-20 Critico", 3820, false},
{"30 Spell-Mana 5s / 30 Hechizo-maná 5s", 3819, false},
{"37 Stamina-20 Defense / 37 aguante-20 defensa", 3818, false},
{"50 attack-20 critic / 50 ataque-20 critico", 3817, false},
{"30 endurance-25 temple / 30 aguante-25 temple", 3842, false},
{"50 attack-20 temple / 50 ataque-20 temple", 3795, false},
{"29 spell-20 temple / 29 hechizo-20 temple", 3797, false};
},

[2] = { -- Shoulders
{"40 attack-15 temple / 40 ataque-15 temple", 3793, false},
{"23hechizo-15 temple / 23 hechizo-15 temple", 3794, false},
{"30 Stamina-15 temple / 30 Aguante-15 temple", 3852, false},
{"40 Attack-15 critic / 40 Ataque-15 critico", 3808, false},
{"24 spell-8 mana 5s / 24 hechizo-8 mana 5s", 3809, false},
{"20 dodge-15 defense / 20 esquivar-15 defensa", 3811, false},
{"24 spell-5 critical / 24  hechizo-5 critico", 3810, false};
},

[4] = { -- Chest
{"10 all statistics / 10 todas las estadisticas ", 3832, false},
{"275 Health / 275 Salud", 3297, false},
{"10 mana 5s ", 2381, false},
{"20 temple", 3245, false},
{"22 Defense / 22 Defensa", 1953, false};
},

[6] = { -- Legs
{"40 temple-28 stamina / 40 temple-28 aguante", 3853, false},
{"55 aguante-22 agility / 55 aguante-22 agilidad", 3822, false},
{"75 attack-22 critic / 75 ataque-22 critico", 3823, false},
{"50 spell-20 spirit / 50 hechizo-20 espiritu", 3719, false},
{"50 spell-30 stamina / 50 hechizo-30 aguante", 3721, false};
},

[7] = { -- Boots
{"32 attack / 32 ataque", 1597, false},
{"15 Stamina and minimum speed increase", 3232, false},
{"16 agility", 983, false},
{"18 spirit", 1147, false},
{"7 health-mana 5s / 7 salud-maná 5s", 3244, false},
{"12 blow and critic / 12 golpe y critico", 3826, false},
{"22 Stamina / 22 aguante", 1075, false};
},

[8] = { -- Bracers
{"40 Stamina / 40 aguante", 3850, false},
{"30 spell / 30 hechizo", 2332, false},
{"50 attack / 50 ataque ", 3845, false},
{"18 spirit", 1147, false},
{"15 expertise / 15 pericia", 3231, false},
{"6 all statistics", 2661, false},
{"16 intellect", 1119, false};
},

[9] = { -- Gloves
{"16 critical", 3249, false},
{"2% threat-10 stop / 2% amenaza-10 parada", 3253, false},
{"44 attack / 44 ataque", 1603, false},
{"20 agility", 3222, false},
{"20 blow / 20 golpe", 3234, false},
{"15 expertise / 15 pericia", 3231, false},
{"28 spell / 28 hechizo", 3246, false};
},

[14] = { -- Cloak
{"Century increased-10 agility / Siglo aumentado-10 agilidad", 3256, false},
{"10 Spirit-2% reduced threat / 10 espiritu-2% amenaza reducida", 3296, false},
{"16 defense", 1951, false},
{"23 celerity", 3831, false},
{"225 armor", 3294, false},
{"22 agility", 1099, false};
},

[15] = {
-- Main Hand
{"Berserking / Rabiar", 3789, false},
{"Black Magic / Magia Negra", 3790, false},
{"63 spell / 63 hechizo", 3834, false},
{"65 attack / 65 ataque", 3833, false},
{"Lifeward / Guardián de vida", 3241, false},
{"Blood Draining / Drenador de Sangre", 3870, false},
{"Blade Ward / Amparo de hojas", 3869, false},
{"26 agility", 1103, false},
{"45 spirit", 3844, false},
{"Executioner / Verdugo", 3225, false},
{"Mongoose / Mangosta", 2673, false};

-- Two-Handed
{"Berserking / Rabiar", 3789, false},
{"Executioner / Verdugo", 3225, false},
{"Mongoose / Mangosta", 2673, false},
{"Massacre / Masacre ", 3827, true},
{"140 attack power against undead / 140 poder de ataque contra no muerto ", 3247, true},
{"81 spell / 81 hechizo", 3854, true};
},

[16] = {
-- Shields
{"20 defense", 1952, true},
{"25 intellect", 1128, true},
{"15 block with shield / 15 bloqueo con escudo", 2655, true},
{"12 temple", 3229, true},
{"18 stamina / 18 aguante ", 1071, true},
{"36 Blocking value / 36 Valor de Bloqueo", 2653, true};
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