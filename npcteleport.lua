--[[    Como agregar ujbicaciones!
               
               
                using Map, X, Y, Z, O (Here 1, 1503, -4415.5, 22, 0)
               
                [1] = { "Horde Cities", 1,      --  
                        {"Orgrimmar", 1, 1503, -4415.5, 22, 0},
                },
         By OwnerGamers      
              
]]
 
 
local UnitEntry = 190005
 
local T = {
        [1] = { "Cuidad Horda", 1,
                {"Orgrimmar", 1, 1503, -4415.5, 22, 0},
                {"Entranas", 0, 1831, 238.5, 61.6, 0},
                {"Cima del Trueno", 1, -1278, 122, 132, 0},
                {"Luna argenta", 530, 9484, -7294, 15, 0},
        },
        [2] = { "Cuidad Alianza", 0,
                {" Ventormenta", 0, -8905, 560, 94, 0.62},
                {"Forjas", 0, -4795, -1117, 499, 0},
                {"Darnassus", 1, 9952, 2280.5, 1342, 1.6},
                {"El Exodar", 530, -3863, -11736, -106, 2},
        },
        [3] = { "Zonas PvP", 2,
                {"Gurubashi Arena", 0, -13233.189453, 219.459229, 31.936506, 1.0},
                {"Zona de Duelos", 530, -2239, 5245, -9, 3},
				{"Conquisa De Invierno", 571, 5135, 2840, 408, 3},
        },
        [4] = { "Mascotas De Cazador", 2,
                {"Mascotas", 1, -10736.500000, 2469.550049, 6.459510, 4.487670},
        },
        [5] = { "Zona Shop y Donacion", 2,
                {"Shop Principal", 0, -9338.179688, -2181.830078, 61.8987701, 4.429590},
				{"Shop Donacion ", 530, 2977.419922, 5139.339844, 263.480011, 2.641220},
        },
        [6] = { "Instancias Level 80", 2,
                {"Ulduar ", 571, 9333.600586, -1114.650146, 1245.146362, 6.238948},
		        {"Ciudadela de la Corona", 571, 5855.220215, 2102.030029, 635.991028, 3.5},
		        {"Sagrario rubi", 571, 3471.664307, 266.830566, -120.144188, 5.1},
		        {"Naxxrramas", 571, 3668.719971, -1262.459961, 243.621994, 4.785000},
		        {"Cruzada argenta", 571, 8517, 676, 559, 4.7},
				{"Camaras De Archavon", 571, 5467.589844, 2847.060059, 418.757996, 1.396260},
		},
		[7] = { "Eventos", 2,
		        {"La Masacre", 1, -3669, 1094, 160, 3},
		        {"Laberinto", 1, -5226.200195, -4456.540039, 87.978302, 3.585290},
		        {"Escalada", 1, -6932.789551, -4951.740723, 0.322688, 4.627750},
		        {"Carrera", 1, -8569.990234, -4684.109375, 10.055400, 0.802084},
	       }                    
};            

 
 
--[[ NO TOCAR CODIGO ABAJO PLS ]]--
--[[ UNLESS YOU KNOW WHAT YOU'RE DOING! ]]--
 
function Teleporter_Gossip(event, player, unit)
        if (#T <= 10) then
                for i, v in ipairs(T) do
                        if(v[2] == 2 or v[2] == player:GetTeam()) then
                                player:GossipMenuAddItem(0, v[1], 0, i)
                        end
                end
                player:GossipSendMenu(1, unit)
        else
                print("This teleporter only supports 10 different menus.")
        end
end    
 
function Teleporter_Event(event, player, unit, sender, intid, code)
        if(intid == 0) then
                Teleporter_Gossip(event, player, unit)
        elseif(intid <= 10) then
                for i, v in ipairs(T[intid]) do
                        if (i > 2) then
                                player:GossipMenuAddItem(0, v[1], 0, intid..i)
                        end
                end
                player:GossipMenuAddItem(0, "Back", 0, 0)
                player:GossipSendMenu(1, unit)
        elseif(intid > 10) then
                for i = 1, #T do
                        for j, v in ipairs(T[i]) do
                                if(intid == tonumber(i..j)) then
                                        player:GossipComplete()
                                        player:Teleport(v[2], v[3], v[4], v[5], v[6])
                                end
                        end
                end
        end
end
 
RegisterCreatureGossipEvent(UnitEntry, 1, Teleporter_Gossip)
RegisterCreatureGossipEvent(UnitEntry, 2, Teleporter_Event)