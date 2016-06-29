killedby = {}
if SERVER then
function Killed( victim, inflictor, attacker )
	if ( victim != attacker ) then
		killedby[victim:Nick()] = attacker:Nick()
	end
end
hook.Add( "PlayerDeath", "LastKiller", Killed)
else
function GetKiller( victim )
	if killedby[victim] != nil then
		return killedby[victim]
	else
		return "Player hasn't been killed this session"
	end
end
local Frame = vgui.Create( "DFrame" )
Frame:SetTitle( "Report" )
Frame:SetSize( 300, 300 )
Frame:Center()
Frame:MakePopup()
Frame.Paint = function( self, w, h ) -- 'function Frame:Paint( w, h )' works too
	draw.RoundedBox( 0, 0, 0, w, h, Color( 231, 76, 60, 255 ) ) -- Draw a red box instead of the frame
end

local DComboBox = vgui.Create( "DComboBox" )
DComboBox:SetPos( 5, 5 )
DComboBox:SetSize( 100, 20 )
DComboBox:SetValue( "Choose One" )
DComboBox:AddChoice( "RDM" )
DComboBox:AddChoice( "NLR" )
DComboBox:AddChoice( "RDA" )
DComboBox:AddChoice( "Other" )
DComboBox.OnSelect = function( panel, index, value )
	if (value == "RDM") then
	  print(GetKiller(self:Nick))
	end
end
