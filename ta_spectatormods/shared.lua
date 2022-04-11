local Plugin = {}
local Shine = Shine

Plugin.Version = "1.0"
Plugin.HasConfig = true
Plugin.ConfigName = "SpectatorMods.json"
Plugin.DefaultConfig = {
	SpecsCanHearAllVoiceComms = true,
	SendMessageOnJoinSpec = true,
	JoinSpecMessage = "Control which team voices you hear (M > TA > Spec Voice)",
}
Plugin.CheckConfig = true
Plugin.CheckConfigTypes = true

Plugin.DefaultState = true

Shine:RegisterExtension("ta_spectatormods", Plugin )
