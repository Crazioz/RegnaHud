if SERVER then 
	resource.AddFile( "materials/icones16/ammunition.png" )
	resource.AddFile( "materials/icones16/armor.png" )
	resource.AddFile( "materials/icones16/burger.png" )
	resource.AddFile( "materials/icones16/gun.png" )
	resource.AddFile( "materials/icones16/heart.png" )
	resource.AddFile( "materials/icones16/cash.png" )
	resource.AddFile( "materials/icones16/money.png" )
	resource.AddFile( "materials/icones16/name.png" )
	resource.AddFile( "materials/icones16/work.png" )
	return 
end

local function RespX(x) return x/1366*ScrH() end
local function RespY(y) return y/768*ScrH() end

hook.Add("HUDPaint", "Hud", function()

	local health = math.Clamp(LocalPlayer():Health(), 0, 100)
	local armor = math.Clamp(LocalPlayer():Armor(), 0, 100)
	
	local name = LocalPlayer():Name()
	local faim = LocalPlayer():getDarkRPVar("Energy")
	local salaire = LocalPlayer():getDarkRPVar("salary")
	local money = LocalPlayer():getDarkRPVar("money")
	local job = LocalPlayer():getDarkRPVar("job")
	local iconarmure = Material( "materials/icones16/armor.png" )
	local iconvie = Material( "materials/icones16/heart.png" )
	local iconfaim = Material( "materials/icones16/burger.png" )
	local munition = Material( "materials/icones16/ammunition.png" )
	local salary = Material( "materials/icones16/cash.png" )
	local argent = Material( "materials/icones16/money.png" )
	local nom = Material( "materials/icones16/name.png" )
	local work = Material( "materials/icones16/work.png" )
	local gun = Material( "materials/icones16/gun.png" )
	local weapon = LocalPlayer():GetActiveWeapon() 
	
	--[[ backgrounds ]]--
	surface.SetDrawColor(46, 49, 49, 200)
	surface.DrawRect(RespX(10), RespY(620), RespX(550), RespY(150))							-- box principal
	surface.DrawRect(RespX(590), RespY(728), RespX(485), RespY(35))							-- box Métier
	surface.DrawRect(RespX(590), RespY(675), RespX(250), RespY(50))							-- box armes
		
	--[Box barre vie]--
	
	surface.SetDrawColor(242, 0, 0, 255)
	surface.DrawRect(RespX(75), RespY(700), RespX(health* 4.5), RespY(15))					--couleur box vie
	surface.SetMaterial( iconvie )															--IconVIE
	surface.DrawTexturedRect(RespX(20), RespY(697), RespX(40), RespY(20))					--POS IconVIE
	--[Box barre Armure]--
	
	surface.SetDrawColor(0, 184, 184, 255)
	surface.DrawRect(RespX(75), RespY(725), RespX(armor* 4.5), RespY(15))					--couleur box armure
	surface.SetMaterial( iconarmure )														--IconARMURE
	surface.DrawTexturedRect(RespX(20), RespY(720), RespX(40), RespY(20))					--POS IconARMURE
	--[Box barre Faim]--
	
	surface.SetDrawColor(255, 138, 0, 255)
	surface.DrawRect(RespX(75), RespY(750), RespX(faim * 4.5), RespY(15))					--couleur box faim
	surface.SetMaterial( iconfaim )															--IconFAIM
	surface.DrawTexturedRect(RespX(20), RespY(745), RespX(40), RespY(20))					--POS IconFAIM
	
	surface.SetDrawColor(255, 255, 255, 255)
	surface.SetMaterial( nom )
	surface.DrawTexturedRect(RespX(20), RespY(620), RespX(45), RespY(25))	
	surface.SetMaterial( argent )
	surface.DrawTexturedRect(RespX(20), RespY(645), RespX(45), RespY(25))
	surface.SetMaterial( salary )
	surface.DrawTexturedRect(RespX(20), RespY(670), RespX(45), RespY(25))
	surface.SetMaterial( gun )
	surface.DrawTexturedRect(RespX(595), RespY(685), RespX(45), RespY(25))
	surface.SetMaterial( work )
	surface.DrawTexturedRect(RespX(595), RespY(733), RespX(45), RespY(25))
	
		-- vous pouver modifier les textes entre les [""] 
		-- /!\ ne pas toucher  police-1 /!\
	
	draw.DrawText("Nom: "..name, "police-2", ScrW() * 0.084	, ScrH() * 0.815, Color(255, 255, 255), TEXT_ALIGN_CENTER )
	draw.DrawText("Métier: "..job, "police-2", ScrW() * 0.34, ScrH() * 0.96, Color(255, 255, 255), TEXT_ALIGN_CENTER )
	draw.DrawText("Salaire: "..salaire.. " €", "police-2", ScrW() * 0.081, ScrH() * 0.875, Color(255,255,255), TEXT_ALIGN_CENTER )
	draw.DrawText("Porte-monnaie: "..money.." €", "police-2",  ScrW() * 0.0970, ScrH() * 0.845, Color(255, 255, 255), TEXT_ALIGN_CENTER )
	
	
	if (LocalPlayer():GetActiveWeapon():GetPrintName() != nil) then 
		draw.SimpleText(LocalPlayer():GetActiveWeapon():GetPrintName(), "DermaDefaultBold", 365, ScrH() - 70, Color(255, 255, 255, 255), 0, 0)
end

    if weapon and IsValid( weapon ) then local clip = weapon:Clip1() 

    local ammo = LocalPlayer():GetAmmoCount( weapon:GetPrimaryAmmoType() ) 

    if clip == -1 or clip <= 0 and ammo <= 0 then 

    return end 
	surface.SetDrawColor(23, 23, 23, 255)
	surface.DrawRect(RespX(590), RespY(645), RespX(250), RespY(30))						-- box munition
    draw.DrawText(clip.."/"..ammo, "police-1", ScrW() * 0.30, ScrH() * 0.845, Color(255, 255, 255), TEXT_ALIGN_CENTER ) 	-- box text munition
	surface.SetDrawColor(255, 255, 255, 255)
	surface.SetMaterial( munition )
	surface.DrawTexturedRect(RespX(590), RespY(647.5), RespX(45), RespY(25))
    end
end)
	
surface.CreateFont( "police-1", { 		-- Ne pas suprimmer /!\ 
	font = "Roboto", 
	extended = false,
	size = 20,
	weight = 400,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
})

-------------------------------------------------------------------------------
-- Suprimé les HUD de base : Ne pas Suprimé /!\                               --
-------------------------------------------------------------------------------

local HideElementsTable = {
	
	--> DarkRP
	["DarkRP_HUD"]              = true,
    ["DarkRP_LocalPlayerHUD"]   = true,
    ["DarkRP_EntityDisplay"]    = true,
    ["DarkRP_ZombieInfo"]       = true,
    ["DarkRP_Hungermod"]        = true,
    ["DarkRP_Agenda"]           = true,
    ["CHudHealth"]              = true,
    ["CHudBattery"]             = true,
    ["CHudSuitPower"]           = true,
    ["CHudAmmo"]                = true,
    ["CHudSecondaryAmmo"]       = true,
}

local function HideElements( element )
	if HideElementsTable[ element ] then
		
		return false

	end
end
hook.Add( "HUDShouldDraw", "HideElements", HideElements )
	
local function DisplayNotify(msg) local txt = msg:ReadString() GAMEMODE:AddNotify(txt, msg:ReadShort(), msg:ReadLong()) surface.PlaySound("buttons/lightswitch2.wav") -- Log to client console MsgC(Color(255, 20, 20, 255), "[DarkRP] ", Color(200, 200, 200, 255), txt, "\n")
end
usermessage.Hook("_Notify", DisplayNotify) --Ajoute les notifications DarkRP

-- Message de démarrage  
print("\n")
MsgC(Color(0,255,0), "---->\n")
print("\n")
MsgC(Color(255, 0, 0), " > ") MsgC(Color(255,255,255), "RegnaHud Charger avec sucées ! ...\n")
MsgC(Color(255, 0, 0), " > ") MsgC(Color(255,255,255), "Version: 1.0\n")
print("\n")
MsgC(Color(255, 0, 0), " > ") MsgC(Color(255,255,255), "Mon steam: https://steamcommunity.com/id/craziozcodage\n")
MsgC(Color(255, 0, 0), " > ") MsgC(Color(255,255,255), "Mon discord Crazioz#7901\n")
print("\n")
MsgC(Color(0,255,0), "---->\n")
print("\n")
