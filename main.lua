local Descriptions = {"Test1", "Test2", "Test3", "Test4", "Test5"}

function Initialize(Plugin)
	Plugin:SetName("RandomDescription");
	Plugin:SetVersion(1);
	cPluginManager:AddHook(cPluginManager.HOOK_SERVER_PING, OnServerPing);
	LOG("Initialized " .. Plugin:GetName() .. " v." .. Plugin:GetVersion());
	LOG("There are " .. #Descriptions .. " random descriptions");
	return true;
end

function OnServerPing(ClientHandle, ServerDescription, OnlinePlayers, MaxPlayers, Favicon)
	
	ServerDescription = Descriptions[ GetTime() % #Descriptions + 1 ];
	
	return false, ServerDescription, OnlinePlayers, MaxPlayers, Favicon
end				