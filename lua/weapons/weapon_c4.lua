AddCSLuaFile()
DEFINE_BASECLASS( "weapon_basecsgrenade" )

SWEP.ProjectileClass = "planted_c4"

CSParseWeaponInfo( SWEP , [[WeaponData
{
	"MaxPlayerSpeed"		"250"
	"WeaponType"			"C4"
	"WeaponPrice"			"0"
	"WeaponArmorRatio"		"1.0"
	"CrosshairMinDistance"		"6"
	"CrosshairDeltaDistance"	"3"
	"Team"				"TERRORIST"
	"BuiltRightHanded" 		"0"
	"PlayerAnimationExtension"	"c4"
	"MuzzleFlashScale"		"1"
	
	"CanEquipWithShield"		"1"
	"AllowFlipping" 		"0"
	
	// Weapon characteristics:
	"Penetration"			"1"
	"Damage"			"50"
	"Range"				"4096"
	"RangeModifier"			"0.99"
	"Bullets"			"1"
		
	// Weapon data is loaded by both the Game and Client DLLs.
	"printname"			"#Cstrike_WPNHUD_C4"
	"viewmodel"			"models/weapons/v_c4.mdl"
	"playermodel"			"models/weapons/w_c4.mdl"
	"shieldviewmodel"		"models/weapons/v_c4.mdl"
	"anim_prefix"			"anim"
	"bucket"			"4"
	"bucket_position"		"0"

	"clip_size"			"30"
	
	"primary_ammo"			"None"
	"secondary_ammo"		"None"

	"weight"			"0"
	"item_flags"			"0"

	// Sounds for the weapon. There is a max of 16 sounds per category (i.e. max 16 "single_shot" sounds)
	SoundData
	{
	}

	// Weapon Sprite data is loaded by the Client DLL.
	TextureData
	{
		"weapon"
		{
				"font"		"CSweaponsSmall"
				"character"	"\"
		}
		"weapon_s"
		{	
				"font"		"CSweapons"
				"character"	"\"
		}
		"ammo"
		{
				"file"		"sprites/640hud1"
				"x"		"182"
				"y"		"24"
				"width"		"26"
				"height"		"24"
		}
		"crosshair"
		{
				"file"		"sprites/crosshairs"
				"x"			"0"
				"y"			"48"
				"width"		"24"
				"height"	"24"
		}
		"autoaim"
		{
				"file"		"sprites/crosshairs"
				"x"			"0"
				"y"			"48"
				"width"		"24"
				"height"	"24"
		}
	}
	ModelBounds
	{
		Viewmodel
		{
			Mins	"-4 -8 -17"
			Maxs	"20 13 1"
		}
		World
		{
			Mins	"-3 0 -4"
			Maxs	"7 12 4"
		}
	}
}]] )

SWEP.Spawnable = true
SWEP.Slot = 4

function SWEP:Initialize()
	BaseClass.Initialize( self )
	--self:SetHoldType( "ar2" )
	self:SetWeaponID( CS_WEAPON_C4 )
end

function SWEP:EmitGrenade( vecSrc , vecAngles , vecVel , angImpulse , pPlayer )
	local pGrenade = ents.Create( self.ProjectileClass )
	if not pGrenade then return end
	
	pGrenade:Spawn()
	pGrenade:SetOwner( pPlayer )
	pGrenade:SetPos( vecSrc )
	pGrenade:SetAngles( vecAngles )

	
end

SWEP.AdminOnly = true
