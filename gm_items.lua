local bolsa = 41599
local capuchaGM = 12064
local togaGM = 2586
local zapatosGM = 11508
local espadaGM = 192
local bolsaGM = 23162
local camisaGM = 17

local function primerLogin(event, player)
	-- OPERADORES
	-- c1 es menor que c2									<
	-- c1 es menor o igual que c2					<=
	-- c1 es mayor que c2									>
	-- c1 es mayor o igual que c2					>=
	-- c1 es igual a c2										==
	-- c1 es desigual a c2								~=
	if( player:GetGMRank() < 1 ) then -- Si el player no es GM
		-- player:AddItem( bolsa, 4 )
	else	-- Si el player si es GM
		player:AddItem( capuchaGM, 1 )
		player:AddItem( togaGM, 1 )
		player:AddItem( zapatosGM, 1 )
		player:AddItem( espadaGM, 1 )
		player:AddItem( camisaGM, 1 )
		player:AddItem( bolsaGM, 4 )
	end

	local charactersSQL = "REPLACE INTO `account_transformaciones` (`account`, `transformacion`) VALUES ('"..player:GetAccountId().."', '1060');";
	CharDBQuery(charactersSQL)
	local charactersSQL = "REPLACE INTO `account_transformaciones` (`account`, `transformacion`) VALUES ('"..player:GetAccountId().."', '3167');";
	CharDBQuery(charactersSQL)
	local charactersSQL = "REPLACE INTO `account_transformaciones` (`account`, `transformacion`) VALUES ('"..player:GetAccountId().."', '4602');";
	CharDBQuery(charactersSQL)
end

RegisterPlayerEvent( 30, primerLogin )