--[[
    RuffoSchool <http://www.ruffoschool.com>
    Eluna Lua Engine <https://github.com/ElunaLuaEngine/Eluna>
    Eluna Scripts <https://github.com/ElunaLuaEngine/Scripts>
    Eluna Wiki <http://wiki.emudevs.com/doku.php?id=eluna>
    -= Script Information =-
    * Zone: Varias
    * Script Type: NPC Gossip
    * Npc: <MJ>Ruffomaker <90000>
--]]


local NpcId = 90001
local MenuId = 123 -- Unique ID to recognice player gossip menu among others
local entryMax = 99999
local entryMin = 90000

-- CONFIGURACION DE LA ROPA
local casco = 12064
local hombreras = 0
local camisa = 0
local pechera = 2586
local cinturon = 0
local pantalones = 0
local botas = 11508
local brazaletes = 0
local guantes = 0
local capa = 0
local tabardo = 0
local arma1 = 13246
local arma2 = 0
local arma3 = 0

-- -------------------------

local prefijoNombre = '<MJ>'
local personaje = ''
local subnombre = ''
local capucha = true

local emoteCasting = 173
local emoteFinishCast = 439

local estado = ''
local entry = '0'
local outfit = '0'
local guid = '0'
local errores = false

local tiempo = 0
local tiempoBuscandoPersonaje = 4000
local buscandoPersonajeDicho = false
local tiempoPersonajeEncontrado = 2000
local personajeEncontradoDicho = false
local tiempoCreandoPersonaje = 5000
local creandoPersonajeDicho = false
local tiempoPersonajeCreado = 4000
local personajeCreadoDicho = false
local tiempoRecordatorio = 2000
local recordatorioDicho = false

local queryBuscarPersonaje = false
local queryCrearPersonaje = false

local raza = 0
local clase = 0
local genero = 0
local piel = 0
local cara = 0
local pelo = 0
local color = 0
local barba = 0





function OnGossipHello(event, player, object)
	reset()
    player:GossipClearMenu() -- required for player gossip
    player:GossipMenuAddItem(0, "Crear un NPC a partir de un Personaje.", 1, 1)
    player:GossipMenuAddItem(0, "Ver lista de NPC creados.", 7, 1)
    player:GossipSendMenu(1, object, MenuId) -- MenuId required for player gossip
end

function OnGossipSelect(event, player, object, sender, intid, code, menuid)
    if (intid == 1) then
        player:GossipMenuAddItem(0, "Escribir el Nombre del Personaje.", 1, 2, true, nil)
        player:GossipMenuAddItem(0, "Cancelar", 1, 3)
		player:GossipSendMenu(1, object, MenuId)
	elseif (intid == 2) then
		personaje = code
		
		player:GossipMenuAddItem(0, "Escribir el SubNombre del Personaje.", 1, 4, true, nil)
        player:GossipMenuAddItem(0, "Cancelar", 1, 3)
		
		player:GossipSendMenu(1, object, MenuId)
	elseif (intid == 4) then
		subnombre = code
		
		player:GossipMenuAddItem(0, "El personaje lleva la capucha puesta.", 1, 5)
		player:GossipMenuAddItem(0, "El personaje NO lleva la capucha puesta.", 1, 6)
        player:GossipMenuAddItem(0, "Cancelar", 1, 3)
		
		player:GossipSendMenu(1, object, MenuId)
	elseif (intid == 5) then
		capucha = true
		estado = 'buscandoPersonaje'
		player:GossipComplete()
	elseif (intid == 6) then
		capucha = false
		estado = 'buscandoPersonaje'
		player:GossipComplete()
	elseif (intid == 3) then
		reset()
		player:GossipComplete()
	elseif (intid == 7) then
		
	end
	
	
	--creature:SendUnitSay(mensaje, 0)
	--player:SendBroadcastMessage(mensaje)
	--player:GossipComplete()
end

function creatureAI(event, creature, diff)
	if(estado == 'buscandoPersonaje') then
		if(buscandoPersonajeDicho == false) then
			creature:SendUnitSay('Veamos...', 0)
			buscandoPersonajeDicho = true
			tiempo = 0
			buscarPersonaje(creature)
		end
		if(tiempo > tiempoPersonajeEncontrado) then
			if(queryBuscarPersonaje == true) then
				estado = 'personajeEncontrado'
				tiempo = 0
			end
		end
		
		creature:Emote(emoteCasting)
	end
	
	if(estado == 'personajeEncontrado') then
		if(personajeEncontradoDicho == false) then
			creature:SendUnitSay('He encontrado el personaje '..personaje..' en la base de datos.', 0)
			personajeEncontradoDicho = true
			tiempo = 0
		end
		if(tiempo > tiempoBuscandoPersonaje) then
			estado = 'creandoPersonaje'
			tiempo = 0
		end
		
		creature:Emote(emoteCasting)
	end
	
	if(estado == 'creandoPersonaje') then
		if(creandoPersonajeDicho == false) then
			creature:SendUnitSay('Estoy creando el NPC...', 0)
			creandoPersonajeDicho = true
			tiempo = 0
			crearPersonaje(creature)
		end
		if(tiempo > tiempoCreandoPersonaje) then
			if(queryCrearPersonaje == true) then
				estado = 'personajeCreado'
				tiempo = 0
			end
		end
		
		creature:Emote(emoteFinishCast)
	end
	
	if(estado == 'personajeCreado') then
		if(personajeCreadoDicho == false) then
			creature:SendUnitSay('Ya esta... El entry del NPC que he creado es el '..entry..'.', 0)
			personajeCreadoDicho = true
			tiempo = 0
		end
		if(tiempo > tiempoPersonajeCreado) then
			estado = 'recordatorio'
			tiempo = 0
		end
	end
	
	if(estado == 'recordatorio') then
		if(recordatorioDicho == false) then
			creature:SendUnitSay('Recuerda que debes ejecutar el comando ".reload creatures" seguido de ".reload all" y finalmente ".reload creature_template '..entry..'" para poder spawnearlo.', 0)
			recordatorioDicho = true
			tiempo = 0
		end
		if(tiempo > tiempoRecordatorio) then
			estado = ''
			tiempo = 0
			reset()
		end
	end
	
	
	
	tiempo = tiempo + diff
end

function reset()
	estado = ''
	entry = '0'
	outfit = '0'
	guid = '0'
	errores = false
	tiempo = 0
	personaje = ''
	subnombre = ''
	capucha = true
	buscandoPersonajeDicho = false
	personajeEncontradoDicho = false
	creandoPersonajeDicho = false
	personajeCreadoDicho = false
	recordatorioDicho = false
	queryBuscarPersonaje = false

	raza = 0
	clase = 0
	genero = 0
	piel = 0
	cara = 0
	pelo = 0
	color = 0
	barba = 0
end

function buscarPersonaje(creature)
	local results = CharDBQuery( "SELECT `guid` FROM `characters` WHERE  UPPER(`name`) =  UPPER('"..personaje.."') LIMIT 1" )
	if (results) then
        repeat
            guid = results:GetString(0)
        until not results:NextRow()
    end
	
	if(guid == '0') then
		lanzarError(creature, 'Oops!! No encuentro el personaje en la base de datos... ¿Lo has escrito correctamente?')
		
	else
		queryBuscarPersonaje = true
	end
end

function crearPersonaje(creature)
	local results = CharDBQuery( "SELECT `race`, `class`, `gender`, `skin`, `face`, `hairStyle`, `hairColor`, `facialStyle` FROM `characters` WHERE  UPPER(`name`) =  UPPER('"..personaje.."') LIMIT 1" )
	if (results) then
    repeat
	    raza = results:GetUInt32(0)
			clase = results:GetUInt32(1)
			genero = results:GetUInt32(2)
			piel = results:GetUInt32(3)
			cara = results:GetUInt32(4)
			pelo = results:GetUInt32(5)
			color = results:GetUInt32(6)
			barba = results:GetUInt32(7)
  	until not results:NextRow()
  end

  if(capucha == false) then
  	casco = 0
  end

  local sqlGetNextEntry = "SELECT `entry` + 1 FROM `creature_template` WHERE `entry` BETWEEN '"..entryMin.."' AND '"..entryMax.."' ORDER BY `entry` DESC LIMIT 1;"
  local resultGetNextEntry = WorldDBQuery(sqlGetNextEntry)
  if (resultGetNextEntry) then
  	repeat
  		entry = resultGetNextEntry:GetUInt32(0)
  	until not resultGetNextEntry:NextRow()
  end


  local sqlGetOutfitId = "SELECT MAX(`entry`) + 1 FROM `creature_template_outfits`;"
  local resultGetOutfitId = WorldDBQuery(sqlGetOutfitId)
  if (resultGetOutfitId) then
  	repeat
  		outfit = resultGetOutfitId:GetUInt32(0)
  	until not resultGetOutfitId:NextRow()
  end

  local sqlCreatureTemplateOutfits = "REPLACE INTO `creature_template_outfits` (`entry`, `race`, `class`, `gender`, `skin`, `face`, `hair`, `haircolor`, `facialhair`, `head`, `shoulders`, `body`, `chest`, `waist`, `legs`, `feet`, `wrists`, `hands`, `back`, `tabard`) VALUES ("..outfit..", "..raza..", "..clase..", "..genero..", "..piel..", "..cara..", "..pelo..", "..color..", "..barba..", "..casco..", "..hombreras..", "..camisa..", "..pechera..", "..cinturon..", "..pantalones..", "..botas..", "..brazaletes..", "..guantes..", "..capa..", "..tabardo..");"
  local resultCreatureTemplateOutfits = WorldDBQuery(sqlCreatureTemplateOutfits)

  local sqlCreatureTemplate = "REPLACE INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid1`, `modelid2`, `modelid3`, `modelid4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `exp`, `faction`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `dmgschool`, `BaseAttackTime`, `RangeAttackTime`, `BaseVariance`, `RangeVariance`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `spell1`, `spell2`, `spell3`, `spell4`, `spell5`, `spell6`, `spell7`, `spell8`, `PetSpellDataId`, `VehicleId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `HoverHeight`, `HealthModifier`, `ManaModifier`, `ArmorModifier`, `DamageModifier`, `ExperienceModifier`, `RacialLeader`, `movementId`, `RegenHealth`, `mechanic_immune_mask`, `spell_school_immune_mask`, `flags_extra`, `ScriptName`, `VerifiedBuild`) VALUES ("..entry..", 0, 0, 0, 0, 0, "..outfit..", 0, 0, 0, '"..prefijoNombre..""..personaje.."', '"..subnombre.."', NULL, 0, 80, 80, 2, 35, 1, 1, 1.14286, 1, 0, 0, 2000, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 7, 138936390, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, '', 0);"
  local resultCreatureTemplate = WorldDBQuery(sqlCreatureTemplate)

  local sqlCreatureEquipTemplate = "REPLACE INTO `creature_equip_template` (`CreatureID`, `ID`, `ItemID1`, `ItemID2`, `ItemID3`, `VerifiedBuild`) VALUES ("..entry..", 1, "..arma1..", "..arma2..", "..arma3..", 0);"
	local resultCreatureEquipTemplate = WorldDBQuery(sqlCreatureEquipTemplate)
	
	if(entry == '0') then
		lanzarError(creature, 'Oops!! Ha habido un error al intentar crear el NPC...')
		
	else
		queryCrearPersonaje = true
	end
end

function lanzarError(creature, mensaje)
	errores = true
	creature:SendUnitSay(mensaje, 0)
	reset()
end

RegisterCreatureGossipEvent(NpcId, 1, OnGossipHello)
RegisterCreatureGossipEvent(NpcId, 2, OnGossipSelect)

RegisterCreatureEvent(NpcId, 7, creatureAI)