local Plugin = {}
local Shine = Shine

Plugin.Version = "1.0"
Plugin.HasConfig = true
Plugin.ConfigName = "AdminMenu.json"
Plugin.DefaultConfig = {
	RebalanceTimeInSeconds = 90,
	AdvertiseUponRoundEnd = true,
	WelcomeUponConnect = true,
	IntroduceUponConnect = true,
	IntroduceDelayInSeconds = 6,
	AdvertiseDelayInSeconds = 12,
	WarnMessage = "Please stay cool and be respectful",
	IntroMessage = "Just one rule: Don't be a dick!",
	GoodLuckHaveFunMessage = "Good luck, have fun!",
	AdvertMessage = "gg, well played.",
	ModeratorWelcomeMessage = "Welcome back, %s. You have full admin (M > TA)",
	DonorWelcomeMessage = "Thanks for donating! Hit ESC to manage your badges.",
	MemberWelcomeMessage = "Welcome back, %s. You have partial admin (M > TA)",
	SeederWelcomeMessage = "Welcome, %s. Play against bots! (M > TA)",
	StrangerWelcomeMessage = "Welcome, %s.",
	SendMessagesAfterReloadingUsers = false,
	ClientsToAutoSpectate = {},
	AutoSpecMessage = "You have been moved to spectate due to server settings.",
	ClientsToAutoGag = {},
	AutoGagMessagePart1 = "You have been auto-gagged due to past hostility.",
	AutoGagMessagePart2 = "Contact [TA] Red"
}
Plugin.CheckConfig = true
Plugin.CheckConfigTypes = false

Plugin.DefaultState = true

function Plugin:SetupDataTable()
	self:AddNetworkMessage( "TAMenu", {}, "Client" )
	self:AddNetworkMessage( "TAForceBalance", {}, "Client" )
	self:AddNetworkMessage( "TAForceScramble", {}, "Client" )
	self:AddNetworkMessage( "TARebalance", {}, "Client" )
	self:AddNetworkMessage( "TAWarn", {}, "Client" )
end

Shine:RegisterExtension("ta_adminmenu", Plugin )
