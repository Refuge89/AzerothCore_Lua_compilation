local mensagens = {

    [1] = "www.", 
    [2] = ".com",
    [3] = ".net",
    [4] = "servegame",
    [5] = ".br",
    [6] = ".www",
    [7] = "zapto",
    [8] = ".org",
    [9] = "http",
    [10] = "venha jogar",
    [11] = "-wow",
    [12] = "no-ip",
	[13] = "sulvus",
	[14] = "wow",
	[15] = "w w w",
	[16] = ".es",

};

local cont = 0;



local function OnEvents(event, player, msg, Type, lang)
    for k, v in pairs(mensagens) do
        if string.find(string.lower(msg), v) then
        local plr = player:GetName();
        SendWorldMessage("|cffffffff[" .. plr .. "] says : I love playing wow Dark Legion !!")
        player:SendBroadcastMessage("|cffff0000The Advertisements of another server or website is strictly forbidden here. If you continue to do same, you will get Ban. Have a good day, Dark Legion Staff Team")
        player:SendBroadcastMessage("If you continue, server will automatically send reports, and kick you from game.")
        cont=cont+1;
        if (cont==5) then
            player:KickPlayer()
        end
        return false;
    end
end
end

RegisterPlayerEvent(18, OnEvents)
RegisterPlayerEvent(19, OnEvents)
RegisterPlayerEvent(20, OnEvents)
RegisterPlayerEvent(21, OnEvents)
RegisterPlayerEvent(22, OnEvents)