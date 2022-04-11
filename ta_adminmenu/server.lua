local Plugin = Plugin
local Shine = Shine

local RebalanceMaxTime

local UsersLoaded = false
local ClientsThatReceivedMessages = {}

function Plugin:Notify( Player, Message, Format, ... )
	Shine:NotifyDualColour( Player, 81, 194, 243, "[TA]", 255, 255, 255, Message, Format, ... )
end

function Plugin:CreateCommands()

end

function Plugin:SetGameState( Gamerules, State, OldState )
	if OldState == State then return end

	if State == kGameState.Started then
		RebalanceMaxTime = Shared.GetTime() + Plugin.Config.RebalanceTimeInSeconds
		Plugin:Notify( nil, "%s", true, Plugin.Config.GoodLuckHaveFunMessage )
	end

end

function Plugin:Introduce( Client )

end

function Plugin:Initialise()
	self.Enabled = true

	for _, Client in ipairs( Shine.GetAllClients() ) do
		self:ClientConfirmConnect( Client )
	end

	RebalanceMaxTime = Shared.GetTime() + Plugin.Config.RebalanceTimeInSeconds

	self:CreateCommands()

	return true
end

function Plugin:OnUserReload()
	if not Plugin.Config.SendMessagesAfterReloadingUsers then return end

	local Clients, Count = Shine.GetAllClients()

	for i = 1, Count do
		local Client = Clients[ i ]
		ClientsThatReceivedMessages[ Client:GetUserId() ] = true
		self:SendMessagesToClient( Client )
	end

	UsersLoaded = true
end

function Plugin:ClientConnect( Client )
	local UserId = Client:GetUserId()

end

function Plugin:ClientConfirmConnect( Client )
	if not Plugin.Config.SendMessagesAfterReloadingUsers then
		self:SendMessagesToClient( Client )
	else
		if (UsersLoaded == false) then return end

		if (not ClientsThatReceivedMessages[ Client:GetUserId() ]) then
			self:SendMessagesToClient( Client )
		end
	end
end

function Plugin:SendMessagesToClient( Client )

	local Player = Client and Client:GetControllingPlayer()
	local PlayerName = Player and Player:GetName() or "Player"

	--if Shine:HasAccess( Client, "sh_adminmenu" ) then
		--self:SendNetworkMessage( Client, "ShineAdminMenu", {}, true )
	--end

	self:SendNetworkMessage( Client, "TAMenu", { }, true )

	local Gamerules = GetGamerules()

	local HumanCount = Shine.GetHumanPlayerCount()
	local SpectatorCount = Gamerules:GetTeam( kSpectatorIndex ):GetNumPlayers()
	local PlayerCount = HumanCount - SpectatorCount

	end

function Plugin:EndGame( Gamerules, WinningTeam )


end

function Plugin:ClientDisconnect( Client )
	ClientsThatReceivedMessages[ Client:GetUserId() ] = false
end