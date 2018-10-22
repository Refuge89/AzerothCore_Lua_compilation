local scriptName = 'npc_promo'

local charactersSQL = [[
	CREATE TABLE IF NOT EXISTS `promociones_entregadas` ( 
		`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT , 
		`promocion_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' , 
		`personaje_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' , 
		`cuenta_id` INT(10) UNSIGNED NOT NULL DEFAULT '0' , 
		`ip` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.0.0.0' , 
		`fecha` INT(10) UNSIGNED NOT NULL DEFAULT '0', 
		PRIMARY KEY (`id`)
	) ENGINE = InnoDB;
]]
CharDBQuery(charactersSQL)

local worldSQL = [[
	CREATE TABLE IF NOT EXISTS `promociones` ( 
		`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT , 
		`nombre` VARCHAR(999) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' , 
		`unica_personaje` TINYINT(1) NOT NULL DEFAULT '0' , 
		`unica_cuenta` TINYINT(1) NOT NULL DEFAULT '0' , 
		`unica_ip` TINYINT(1) NOT NULL DEFAULT '0' , 
		`promo_padre` INT(10) UNSIGNED NOT NULL DEFAULT '0' ,
		PRIMARY KEY (`id`)
	) ENGINE = InnoDB;
]]
WorldDBQuery(worldSQL)

worldSQL = [[
	CREATE TABLE IF NOT EXISTS `promocion_requerimientos` ( 
		`promo_id` INT(20) UNSIGNED NOT NULL , 
		`clase` TINYINT(3) NOT NULL DEFAULT '0' , 
		`raza` TINYINT(3) NOT NULL DEFAULT '0' , 
		`nivel` TINYINT(3) NOT NULL DEFAULT '0' , 
		`nivel_gm` TINYINT(2) NOT NULL DEFAULT '0' , 
		`oro` INT(20) NOT NULL DEFAULT '0' , 
		`puntos_honor` INT(20) NOT NULL DEFAULT '0' , 
		`puntos_arena` INT(20) NOT NULL DEFAULT '0' , 
		`logro_1` INT(20) NOT NULL DEFAULT '0' , 
		`logro_2` INT(20) NOT NULL DEFAULT '0' , 
		`logro_3` INT(20) NOT NULL DEFAULT '0' , 
		PRIMARY KEY (`promo_id`)
	) ENGINE = InnoDB;
]]
WorldDBQuery(worldSQL)

worldSQL = [[
	CREATE TABLE IF NOT EXISTS `promocion_recompensas` ( 
		`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT , 
		`promocion_id` INT(10) UNSIGNED NOT NULL , 
		`tipo_recompensa` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'item' , 
		`valor` INT(20) NOT NULL DEFAULT '0' , 
		PRIMARY KEY (`id`), INDEX (`promocion_id`)
	) ENGINE = InnoDB;
]]
WorldDBQuery(worldSQL)

worldSQL = [[
	CREATE TABLE IF NOT EXISTS `npc_lua` ( 
		`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT , 
		`npc_entry` INT(10) UNSIGNED NOT NULL , 
		`lua_script` VARCHAR(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' ,
		PRIMARY KEY (`id`)
	) ENGINE = InnoDB;
]]
WorldDBQuery(worldSQL)


local maxLevelServer = 80


function OnGossipHello(event, player, creature)
	reset()
    player:GossipClearMenu() -- required for player gossip
    
    local contador = 1
    local promociones = WorldDBQuery( "SELECT `id`, `nombre`, `unica_personaje`, `unica_cuenta`, `unica_ip` FROM `promociones`;" )
		if (promociones) then
		  repeat
		  	local promocion_id = promociones:GetUInt32(0)
		  	local nombre = promociones:GetString(1)
		  	local unica_personaje = promociones:GetUInt32(2)
		  	local unica_cuenta = promociones:GetUInt32(3)
		  	local unica_ip = promociones:GetUInt32(4)

		  	local correcto = true

		  	local player_guid = 0
		  	local player_name = player:GetName()
		  	personaje = CharDBQuery( "SELECT `guid` FROM `characters` WHERE UPPER(`name`) = UPPER('"..player_name.."');" )
				if (personaje) then
		  		repeat
		  			player_guid = personaje:GetUInt32(0)
		  		until not personaje:NextRow()
				end

				local player_account_id = player:GetAccountId()
				local player_ip = player:GetPlayerIP()


				-- Comprobamos si la promo ya ha sido entregada

		  	if(unica_ip == 1) then
		  		promocion_entregada = CharDBQuery( "SELECT * FROM `promociones_entregadas` WHERE `promocion_id` = '"..promocion_id.."' AND (`personaje_id` = '"..player_guid.."' OR `cuenta_id` = '"..player_account_id.."' OR `ip` = '"..player_ip.."');" )
					if (promocion_entregada) then
			  		repeat
			  			correcto = false
			  		until not promocion_entregada:NextRow()
					end
		  	end

		  	if(unica_cuenta == 1) then
		  		promocion_entregada = CharDBQuery( "SELECT * FROM `promociones_entregadas` WHERE `promocion_id` = '"..promocion_id.."' AND (`personaje_id` = '"..player_guid.."' OR `cuenta_id` = '"..player_account_id.."');" )
					if (promocion_entregada) then
			  		repeat
			  			correcto = false
			  		until not promocion_entregada:NextRow()
					end
		  	end

		  	if(unica_personaje == 1) then
		  		promocion_entregada = CharDBQuery( "SELECT * FROM `promociones_entregadas` WHERE `promocion_id` = '"..promocion_id.."' AND (`personaje_id` = '"..player_guid.."');" )
					if (promocion_entregada) then
			  		repeat
			  			correcto = false
			  		until not promocion_entregada:NextRow()
					end
		  	end



		  	-- Comprobamos si se cumplen los requisitos para la promo

		  	promocion_requerimientos = WorldDBQuery( "SELECT `clase`, `raza`, `nivel`, `nivel_gm`, `oro`, `puntos_honor`, `puntos_arena`, `logro_1`, `logro_2`, `logro_3` FROM `promocion_requerimientos` WHERE `promo_id` = '"..promocion_id.."';" )
				if (promocion_requerimientos) then
		  		repeat
		  			
		  			local req_clase = promocion_requerimientos:GetUInt32(0)
		  			local req_raza = promocion_requerimientos:GetUInt32(1)
		  			local req_nivel = promocion_requerimientos:GetUInt32(2)
		  			local req_nivel_gm = promocion_requerimientos:GetUInt32(3)
		  			local req_oro = promocion_requerimientos:GetUInt32(4)
		  			local req_puntos_honor = promocion_requerimientos:GetUInt32(5)
		  			local req_puntos_arena = promocion_requerimientos:GetUInt32(6)
		  			local req_logro_1 = promocion_requerimientos:GetUInt32(7)
		  			local req_logro_2 = promocion_requerimientos:GetUInt32(8)
		  			local req_logro_3 = promocion_requerimientos:GetUInt32(9)

		  			if(req_clase ~= 0) then
		  				if(player:GetClass() ~= req_clase) then
		  					correcto = false
		  				end
		  			end

		  			if(req_raza ~= 0) then
		  				if(player:GetRace() ~= req_raza) then
		  					correcto = false
		  				end
		  			end

		  			if(req_nivel ~= 0) then
		  				if(player:GetLevel() < req_nivel) then
		  					correcto = false
		  				end
		  			end

		  			if(req_nivel_gm ~= 0) then
		  				if(player:GetGMRank() < req_nivel_gm) then
		  					correcto = false
		  				end
		  			end

		  			if(req_oro ~= 0) then
		  				if(player:GetCoinage() < req_oro) then
		  					correcto = false
		  				end
		  			end

		  			if(req_puntos_honor ~= 0) then
		  				if(player:GetHonorPoints() < req_puntos_honor) then
		  					correcto = false
		  				end
		  			end

		  			if(req_puntos_arena ~= 0) then
		  				if(player:GetArenaPoints() < req_puntos_arena) then
		  					correcto = false
		  				end
		  			end

		  			if(req_logro_1 ~= 0) then
		  				if(player:HasAchieved(req_logro_1) == false) then
		  					correcto = false
		  				end
		  			end

		  			if(req_logro_2 ~= 0) then
		  				if(player:HasAchieved(req_logro_2) == false) then
		  					correcto = false
		  				end
		  			end

		  			if(req_logro_3 ~= 0) then
		  				if(player:HasAchieved(req_logro_3) == false) then
		  					correcto = false
		  				end
		  			end

		  		until not promocion_requerimientos:NextRow()
				end



		  	-- Si es correcto añadimos la promo a la lista

		  	if(correcto == true) then
		  		player:GossipMenuAddItem(0, nombre, 1, contador)
		  	end


		  	contador = contador + 1



		  until not promociones:NextRow()
		end


    player:GossipMenuAddItem(0, "No quiero nada...", 1,0)
    player:GossipSendMenu(1, creature, MenuId) -- MenuId required for player gossip
end

function OnGossipSelect(event, player, creature, sender, intid, code, menuid)
  if (intid == 0) then
    player:GossipComplete()
	end

	local contador = 1
  local promociones = WorldDBQuery( "SELECT `id`, `nombre`, `unica_personaje`, `unica_cuenta`, `unica_ip` FROM `promociones`;" )
	if (promociones) then
	  repeat
	  	local promo_id = promociones:GetUInt32(0)
	  	local nombre = promociones:GetString(1)
	  	local unica_personaje = promociones:GetUInt32(2)
	  	local unica_cuenta = promociones:GetUInt32(3)
	  	local unica_ip = promociones:GetUInt32(4)

	  	if (intid == contador) then
	  		local recompensas = WorldDBQuery( "SELECT `tipo_recompensa`, `valor` FROM `promocion_recompensas` WHERE `promocion_id` = '"..promo_id.."';" )
				if (recompensas) then
				  repeat
				  	local tipo_recompensa = recompensas:GetString(0)
	  				local valor = recompensas:GetUInt32(1)

	  				if(tipo_recompensa == 'item') then
	  					player:AddItem(valor, 1)
	  				end

	  				if(tipo_recompensa == 'oro') then
	  					player:ModifyMoney(valor)
	  				end

	  				if(tipo_recompensa == 'honor') then
	  					player:ModifyHonorPoints(valor)
	  				end

	  				if(tipo_recompensa == 'arena') then
	  					player:ModifyArenaPoints(valor)
	  				end

	  				if(tipo_recompensa == 'titulo') then
	  					player:SetKnownTitle(valor)
	  				end

	  				if(tipo_recompensa == 'nivel') then
	  					player:SetLevel(player:GetLevel() + valor)
	  					if(player:GetLevel() > maxLevelServer) then
	  						player:SetLevel(maxLevelServer)
	  					end
	  				end

	  				if(tipo_recompensa == 'spell') then
	  					player:LearnSpell(valor)
	  				end

				  until not recompensas:NextRow()
				end

				local player_name = player:GetName()
				personaje = CharDBQuery( "SELECT `guid` FROM `characters` WHERE UPPER(`name`) = UPPER('"..player_name.."');" )
				local player_guid = 0
				if (personaje) then
		  		repeat
		  			player_guid = personaje:GetUInt32(0)
		  		until not personaje:NextRow()
				end
				local player_account_id = player:GetAccountId()
				local player_ip = player:GetPlayerIP()
				local timestamp = os.time()

				CharDBQuery( "INSERT INTO `promociones_entregadas` (`promocion_id`, `personaje_id`, `cuenta_id`, `ip`, `fecha`) VALUES ('"..promo_id.."', '"..player_guid.."', '"..player_account_id.."', '"..player_ip.."', '"..timestamp.."')" )
				

		    player:GossipComplete()
			end

	  	contador = contador + 1

	  until not promociones:NextRow()
	end

end



local events = WorldDBQuery( "SELECT `npc_entry`, `lua_script` FROM `npc_lua` WHERE  UPPER(`lua_script`) =  UPPER('"..scriptName.."')" )
if (events) then
  repeat
    local npc_entry = events:GetUInt32(0)
		--RegisterCreatureGossipEvent(npc_entry, 1, OnGossipHello)
		--RegisterCreatureGossipEvent(npc_entry, 2, OnGossipSelect)
	until not events:NextRow()
end



