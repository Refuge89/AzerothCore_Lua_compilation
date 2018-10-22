--[==[
    = Como agregar ubicaciones =
   
    using Map, X, Y, Z, O (Here 1, 1503, -4415.5, 22, 0)
    [1] = { "Horde Cities", 1,	--  facion. 0 = Alliance, 1 = Horde, 2 = Both
        {"Orgrimmar", 1, 1503, -4415.5, 22, 0},
    },
    Codigo BY: OwnerGamers 
]==]

local ItemEntry = 6948

local T = {
	[1] = { "Ciudades de Horda", 1,
		{"Orgrimmar", 1, 1503, -4415.5, 22, 0},
		{"Entranas", 0, 1831, 238.5, 61.6, 0},
		{"Cima del trueno", 1, -1278, 122, 132, 0},
		{"Luna argenta", 530, 9484, -7294, 15, 0},
	},
	[2] = { "Ciudades de Alianza", 0,
		{"Ventormenta", 0, -8905, 560, 94, 0.62},
		{"Forjas", 0, -4795, -1117, 499, 0},
		{"Darnassus", 1, 9952, 2280.5, 1342, 1.6},
		{"El Exodar", 530, -3863, -11736, -106, 2},
	},
	[3] = { "Zonas Shop y Donacion", 2,
		{"Shop Principal", 0, -9338.179688, -2181.830078, 61.8987701, 4.429590},
		{"Shop Donacion ", 530, 2977.419922, 5139.339844, 263.480011, 2.641220},
  	},
	[4] = { "Mascotas De Cazador", 2,
        {"Mascotas", 1, -10736.500000, 2469.550049, 6.459510, 4.487670},
	},
	[5] = { "Instancias Level 80", 2,
		{"Ulduar ", 571, 9333.600586, -1114.650146, 1245.146362, 6.238948},
		{"Ciudadela de la Corona", 571, 5855.220215, 2102.030029, 635.991028, 3.5},
		{"Sagrario rubi", 571, 3471.664307, 266.830566, -120.144188, 5.1},
		{"Naxxrramas", 571, 3668.719971, -1262.459961, 243.621994, 4.785000},
		{"Cruzada argenta", 571, 8517, 676, 559, 4.7},
		{"Camaras De Archavon", 571, 5467.589844, 2847.060059, 418.757996, 1.396260}
	},
	[6] = { "PvP Zonas", 2,
		{"Gurubashi Arena", 0, -13229, 226, 33, 1},
		{"Conquista De invierno", 571, 5135, 2840, 408, 3},
        {"Zona de Duelos", 0, -1816.574463, -4204.617676, 3.240805, 4.470539},
	},
	[7] = { "Eventos",2,	
		{"La Masacre", 1, -3669, 1094, 160, 3},
		{"Laberinto", 1, -5226.200195, -4456.540039, 87.978302, 3.585290},
		{"Escalada", 1, -6932.789551, -4951.740723, 0.322688, 4.627750},
		{"Carrera", 1, -8569.990234, -4684.109375, 10.055400, 0.802084},
	},
}

-- Codigo para NO NOOBS NO TOQUE EL SIGUIENTE CODIGO O LA CAGA
-- SI NO SABE LO QUE HACE NO TOQUE!

local function OnGossipHello(event, player, item)
    -- Show main menu
    for i, v in ipairs(T) do
        if (v[2] == 2 or v[2] == player:GetTeam()) then
            player:GossipMenuAddItem(0, v[1], i, 0)
        end
    end
    player:GossipSendMenu(1, item)
end	

local function OnGossipSelect(event, player, item, sender, intid, code)
    if (sender == 0) then
        -- return to main menu
        OnGossipHello(event, player, item)
        return
    end

    if (intid == 0) then
        -- Show teleport menu
        for i, v in ipairs(T[sender]) do
            if (i > 2) then
                player:GossipMenuAddItem(0, v[1], sender, i)
            end
        end
        player:GossipMenuAddItem(0, "Back", 0, 0)
        player:GossipSendMenu(1, item)
        return
    else
        -- teleport
        local name, map, x, y, z, o = table.unpack(T[sender][intid])
        player:Teleport(map, x, y, z, o)
    end
    
    player:GossipComplete()
end

RegisterItemGossipEvent(ItemEntry, 1, OnGossipHello)
RegisterItemGossipEvent(ItemEntry, 2, OnGossipSelect)