local Plugin = Plugin
local Shine = Shine

function Plugin:ReceiveTAMenu()
	Shine.VoteMenu:AddPage( "Spec Voice", function( self )
		self:AddTopButton( "Back", function()
			self:SetPage( "TA" )
		end )
	end )

	Shine.VoteMenu:EditPage( "Spec Voice", function( self )
		self:AddSideButton( "Marines Only", function()
			Shared.ConsoleCommand( "sh_specvoice 1" )
			self:SetPage( "Main" )
			self:SetIsVisible( false )
		end )

		self:AddSideButton( "Aliens Only", function()
			Shared.ConsoleCommand( "sh_specvoice 2" )
			self:SetPage( "Main" )
			self:SetIsVisible( false )
		end )

		self:AddSideButton( "Spectators Only", function()
			Shared.ConsoleCommand( "sh_specvoice 3" )
			self:SetPage( "Main" )
			self:SetIsVisible( false )
		end )

		self:AddSideButton( "Everyone", function()
			Shared.ConsoleCommand( "sh_specvoice 4" )
			self:SetPage( "Main" )
			self:SetIsVisible( false )
		end )
	end )

	Shine.VoteMenu:AddPage( "TA", function( self )
		self:AddTopButton( "Back", function()
			self:SetPage( "Main" )
		end )

		self:AddBottomButton( "Contact Admin", function()
			self:SetPage( "Main" )
			self:SetIsVisible( false )
			Client.ShowWebpage( "https://discordapp.com/invite/TbrkfWH" )
		end )

		self:AddSideButton( "Spec Voice", function()
			self:SetPage( "Spec Voice" )
		end )
	end )

	Shine.VoteMenu:EditPage( "Main", function( self )
		self:AddSideButton( "TA", function()
			self:SetPage( "TA" )
		end )
	end )
end
