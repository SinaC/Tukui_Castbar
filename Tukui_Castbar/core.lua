---------------------------------------------------------------------------------------------
-- AddOn Name: Tukui_Castbar
-- License: MIT
-- Author: Sinaris @ Das Syndikat, Vaecia @ Blackmoore
-- Description: Standalone Castbar for default Tukui
-- Credits: All credits goes to the original author: Krevlorne @ EU-Ulduar
---------------------------------------------------------------------------------------------

local T, C, L, G = unpack( Tukui )

if( C == nil or C["unitframes"] == nil or C["unitframes"]["enable"] ~= true ) then return end

if( C["unitframes"]["unitcastbar"] ~= true ) then return end

local addon, ns = ...
config = ns.config

local oUF = oUFTukui

print("Tukui_Castbar")

local function placeCastbar( unit )
	local font1 = C["media"]["uffont"]
	local castbar = nil
	local castbarpanel = nil

	if( unit == "player" ) then
		castbar = G.UnitFrames.Player.Castbar
	elseif( unit == "target" ) then
		castbar = TukuiTargetCastBar
	elseif( unit == "focus" ) then
		castbar = TukuiFocusCastBar
	elseif( unit == "focustarget" ) then
		castbar = TukuiFocusTargetCastBar
	else
		print( "Tukui_Castbar: Cannot place castbar for unit: " .. unit )
		return
	end

	local castbarpanel = CreateFrame( "Frame", castbar:GetName() .. "_Panel", castbar )
	castbarpanel:CreateShadow( "Default" )
	castbarpanel:SetFrameStrata( "BACKGROUND" )
	castbarpanel:SetFrameLevel( 1 )

	local anchor = CreateFrame( "Button", castbar:GetName() .. "_PanelAnchor", UIParent )
	anchor:SetTemplate( "Default" )
	anchor:SetBackdropBorderColor( 1, 0, 0, 1 )
	anchor:SetMovable( true )

	anchor.text = T.SetFontString( anchor, font1, 12 )
	anchor.text:SetPoint( "CENTER" )
	anchor.text:SetText( castbar:GetName() )
	anchor.text.Show = function() anchor:Show() end
	anchor.text.Hide = function() anchor:Hide() end
	anchor:Hide()

	if( unit == "player" ) then
		anchor:SetSize( config["player"]["width"], config["player"]["height"] )
		anchor:SetPoint( "CENTER", UIParent, "CENTER", 0, -200 )

		castbarpanel:Size( config["player"]["width"], config["player"]["height"] )
		castbarpanel:SetPoint( "CENTER", anchor, "CENTER", 0, 0 )
		castbarpanel:SetTemplate( "Default" )
	elseif( unit == "target" ) then
		anchor:SetSize( config["target"]["width"], config["target"]["height"] )
		anchor:SetPoint( "CENTER", UIParent, "CENTER", 0, -150 )

		castbarpanel:Size( config["target"]["width"], config["target"]["height"] )
		castbarpanel:SetPoint( "CENTER", anchor, "CENTER", 0, 0 )
		castbarpanel:SetTemplate( "Default" )
	elseif( unit == "focus" ) then
		anchor:SetSize( config["focus"]["width"], config["focus"]["height"] )
		anchor:SetPoint( "CENTER", UIParent, "CENTER", 0, 250 )

		castbarpanel:Size( config["focus"]["width"], config["focus"]["height"] )
		castbarpanel:SetPoint( "CENTER", anchor, "CENTER", 0, 0 )
		castbarpanel:SetTemplate( "Default" )
	elseif( unit == "focustarget" ) then
		anchor:SetSize( config["focustarget"]["width"], config["focustarget"]["height"] )
		anchor:SetPoint( "CENTER", UIParent, "CENTER", 0, 210 )

		castbarpanel:Size( config["focustarget"]["width"], config["focustarget"]["height"] )
		castbarpanel:SetPoint( "CENTER", anchor, "CENTER", 0, 0 )
		castbarpanel:SetTemplate( "Default" )
	end

	castbar:ClearAllPoints()
	castbar:Point( "TOPLEFT", castbarpanel, 2, -2 )
	castbar:Point( "BOTTOMRIGHT", castbarpanel, -2, 2 )

	castbar.time = T.SetFontString( castbar, font1, 12 )
	castbar.time:Point( "RIGHT", castbarpanel, "RIGHT", -4, 0 )
	castbar.time:SetTextColor( 0.84, 0.75, 0.65 )
	castbar.time:SetJustifyH( "RIGHT" )

	castbar.Text = T.SetFontString( castbar, font1, 12 )
	castbar.Text:Point( "LEFT", castbarpanel, "LEFT", 4, 0 )
	castbar.Text:SetTextColor( 0.84, 0.75, 0.65 )

	if( C["unitframes"]["cbicons"] == true ) then
		if( unit == "player" ) then
			castbar:Size( config["player"]["width"], config["player"]["height"] )
			castbar.button:ClearAllPoints()
			castbar.button:Point( "RIGHT", castbar, "LEFT", -10, 0 )
		elseif( unit == "target" ) then
			castbar.button:ClearAllPoints()
			castbar.button:Point( "LEFT", castbar, "RIGHT", 10, 0 )
		elseif( unit == "focus" ) then
			castbar.button:ClearAllPoints()
			castbar.button:Point( "BOTTOM", castbar, "TOP", 0, 10 )
			castbar.button:Size( 50 )
			castbar.button:CreateShadow( "Default" )

			castbar.icon:Point( "TOPLEFT", castbar.button, 2, -2 )
			castbar.icon:Point( "BOTTOMRIGHT", castbar.button, -2, 2 )
			castbar.icon:SetTexCoord( 0.08, 0.92, 0.08, .92 )
		elseif( unit == "focustarget" ) then
			castbar.button:Size( 26 )
			castbar.button:CreateShadow( "Default" )
			castbar.button:Point( "LEFT", castbar, "RIGHT", 10, 0 )
		end
	end

	if( C["unitframes"]["cblatency"] == true and ( unit == "player" or unit == "target" ) ) then
		castbar.safezone = castbar:CreateTexture( nil, "ARTWORK" )
		castbar.safezone:SetTexture( C["media"]["normTex"] )
		castbar.safezone:SetVertexColor( 0.69, 0.31, 0.31, 0.75 )
		castbar.SafeZone = castbar.safezone
	end

	castbar.Castbar = castbar
	castbar.Castbar.Time = castbar.time
	castbar.Castbar.Icon = castbar.icon
end


if( config.separateplayer ) then
	placeCastbar( "player" )
	table.insert( T.AllowFrameMoving, TukuiPlayerCastBar_PanelAnchor )
end

if( config.separatetarget ) then
	placeCastbar( "target" )
	table.insert( T.AllowFrameMoving, TukuiTargetCastBar_PanelAnchor )
end

if( config.separatefocus ) then
	placeCastbar( "focus" )
	table.insert( T.AllowFrameMoving, TukuiFocusCastBar_PanelAnchor )
end

if( config.separatefocustarget and C["unitframes"]["showfocustarget"] == true ) then
	placeCastbar( "focustarget" )
	table.insert( T.AllowFrameMoving, TukuiFocusTargetCastBar_PanelAnchor )
end