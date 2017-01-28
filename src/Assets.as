package
{
	public final class Assets
	{
		 /***************************************************************************************************
		 * Fonts
		 * 
		 **/
		
		// Font '8-BIT WONDER' #modified (added some chars)
		[Embed(source = 'Assets/Fonts/8-BIT WONDER.ttf', embedAsCFF = 'false', fontFamily = 'Wonder')]
		public static const FONT_WONDER:Class;
		
		// Font 'OCR A Extended'
		[Embed(source = 'Assets/Fonts/OCR.ttf', embedAsCFF = 'false', fontFamily = 'OCR')]
		public static const FONT_OCR:Class;
		
		// Font 'Optimus'
		[Embed(source = 'Assets/Fonts/Optimus.ttf', embedAsCFF = 'false', fontFamily = 'Optimus')]
		public static const FONT_OPTIMUS:Class;
		
		/***************************************************************************************************
		* GUI
		* 
		**/
		
		/***************************************************************************************************
		* Menu
		* 
		**/
		
		// Background (Planet)
		[Embed(source = 'Assets/Menu/planet.png')]
		public static const MENU_BACKGROUND:Class;
		
		// Logo (Operation Nautak)
		[Embed(source = 'Assets/Menu/logo_operation_nautak.png')]
		public static const MENU_LOGO:Class;
		
		// Marine art (left)
		[Embed(source = 'Assets/Menu/marine.png')]
		public static const MENU_MARINE:Class;
		
		// Nauk art (right)
		[Embed(source = 'Assets/Menu/nauk.png')]
		public static const MENU_NAUK:Class;
		
		
		// Menu Buttons
		
		// New Game (button)
		[Embed(source = 'Assets/Menu/Buttons/NewGame/normal_newgame.png')]
		public static const NEWGAME_NORMAL:Class;
		
		[Embed(source = 'Assets/Menu/Buttons/NewGame/hover_newgame.png')]
		public static const NEWGAME_HOVER:Class;
		
		// Cheat Mode (button)
		[Embed(source = 'Assets/Menu/Buttons/CheatMode/normal_cheatmode.png')]
		public static const CHEATMODE_NORMAL:Class;
		
		[Embed(source = 'Assets/Menu/Buttons/CheatMode/hover_cheatmode.png')]
		public static const CHEATMODE_HOVER:Class;
		
		
		// Continue (button)
		[Embed(source = 'Assets/Menu/Buttons/Continue/normal_continue.png')]
		public static const CONTINUE_NORMAL:Class;
		
		[Embed(source = 'Assets/Menu/Buttons/Continue/hover_continue.png')]
		public static const CONTINUE_HOVER:Class;
		[Embed(source = 'Assets/Menu/Buttons/Continue/disabled_continue.png')]
		public static const CONTINUE_DISABLED:Class;
		
		
		// Credits (button)
		[Embed(source = 'Assets/Menu/Buttons/Credits/normal_credits.png')]
		public static const CREDITS_NORMAL:Class;
		
		[Embed(source = 'Assets/Menu/Buttons/Credits/hover_credits.png')]
		public static const CREDITS_HOVER:Class;
		
		
		// More Games (button)
		[Embed(source = 'Assets/Menu/Buttons/MoreGames/normal_moregames.png')]
		public static const MOREGAMES_NORMAL:Class;
		
		[Embed(source = 'Assets/Menu/Buttons/MoreGames/hover_moregames.png')]
		public static const MOREGAMES_HOVER:Class;
		
		
		// Sponsor Logo (button)
		[Embed(source = 'Assets/Menu/Buttons/SponsorLogo/normal.png')]
		public static const SPONSORLOGO_NORMAL:Class;
		
		[Embed(source = 'Assets/Menu/Buttons/SponsorLogo/hover.png')]
		public static const SPONSORLOGO_HOVER:Class;
		
		
		// Sponsor Logo (button) SMALL
		[Embed(source = 'Assets/Menu/Buttons/SponsorLogo/normal_small.png')]
		public static const SPONSORLOGO_NORMAL_SMALL:Class;
		
		[Embed(source = 'Assets/Menu/Buttons/SponsorLogo/hover_small.png')]
		public static const SPONSORLOGO_HOVER_SMALL:Class;
		
		
		// Facebook (button)
		[Embed(source = 'Assets/Menu/Buttons/Facebook/normal.png')]
		public static const FACEBOOK_NORMAL:Class;
		
		[Embed(source = 'Assets/Menu/Buttons/Facebook/hover.png')]
		public static const FACEBOOK_HOVER:Class;
		
		
		// Twitter (button)
		[Embed(source = 'Assets/Menu/Buttons/Twitter/normal.png')]
		public static const TWITTER_NORMAL:Class;
		
		[Embed(source = 'Assets/Menu/Buttons/Twitter/hover.png')]
		public static const TWITTER_HOVER:Class;
		
		
		// Mute ON (button)
		[Embed(source = 'Assets/Menu/Buttons/Mute/on.png')]
		public static const MENU_MUTE_ON:Class;
		
		// Mute OFF (button)
		[Embed(source = 'Assets/Menu/Buttons/Mute/off.png')]
		public static const MENU_MUTE_OFF:Class;
		
		
		// Music 'Ditto Ditto' by 'DoKashiteru'
		[Embed(source = 'Assets/Menu/music.mp3')]
		public static const MENU_MUSIC:Class;
		
		
		// Sound 'Click'
		[Embed(source = 'Assets/Misc/Sounds/click.mp3')]
		public static const MISC_CLICK:Class;
		
		
		/***************************************************************************************************
		* Credits
		* 
		**/
		
		// Developer Logo (Igniter Games)
		[Embed(source = 'Assets/Menu/Credits/developer.png')]
		public static const CREDITS_DEVELOPER:Class;
		
		// Developer Logo (Igniter Games) - Hover
		[Embed(source = 'Assets/Menu/Credits/developer_hover.png')]
		public static const CREDITS_DEVELOPER_HOVER:Class;
		
		
		// Author (Andrei Regiani)
		[Embed(source = 'Assets/Menu/Credits/author.png')]
		public static const CREDITS_AUTHOR:Class;
		
		
		// Sponsor Logo
		[Embed(source = 'Assets/Menu/Credits/sponsor.png')]
		public static const CREDITS_SPONSOR:Class;
		
		// Sponsor Logo - Hover
		[Embed(source = 'Assets/Menu/Credits/sponsor_hover.png')]
		public static const CREDITS_SPONSOR_HOVER:Class;
		
		
		// Others
		[Embed(source = 'Assets/Menu/Credits/others.png')]
		public static const CREDITS_OTHERS:Class;
		
		
		/***************************************************************************************************
		* Shop (Upgrades)
		* 
		**/
		
		// Title (Upgrades)
		[Embed(source = 'Assets/Shop/upgrades.png')]
		public static const SHOP_TITLE:Class;
		
		// Units
		[Embed(source = 'Assets/Shop/units.png')]
		public static const SHOP_UNITS:Class;
		
		// Towers
		[Embed(source = 'Assets/Shop/towers.png')]
		public static const SHOP_TOWERS:Class;
		
		// Base
		[Embed(source = 'Assets/Shop/base.png')]
		public static const SHOP_BASE:Class;
		
		// Marine's Base
		[Embed(source = 'Assets/Shop/Marines/base.png')]
		public static const SHOP_BASE_IMAGE:Class;
		
		// Ready (Normal)
		[Embed(source = 'Assets/Shop/Ready/normal.png')]
		public static const SHOP_READY_NORMAL:Class;
		
		// Ready (Hover)
		[Embed(source = 'Assets/Shop/Ready/hover.png')]
		public static const SHOP_READY_HOVER:Class;
		
		// Menu Button (Normal)
		[Embed(source = 'Assets/Shop/Menu/normal.png')]
		public static const SHOP_MENU_NORMAL:Class;
		
		// Menu Button (Hover)
		[Embed(source = 'Assets/Shop/Menu/hover.png')]
		public static const SHOP_MENU_HOVER:Class;
		
		
		// Music 'Not Too Quiet' by 'zikweb'
		[Embed(source = 'Assets/Shop/music.mp3')]
		public static const SHOP_MUSIC:Class;
		
		// Sound: Unlock 'bang' by 'jenc'
		[Embed (source = 'Assets/Shop/unlock.mp3')]
		public static const SHOP_UNLOCK:Class;
		
		
		/***************************************************************************************************
		* Map (Level Selection)
		* 
		**/
		
		// Background
		[Embed(source = 'Assets/Map/background.png')]
		public static const MAP_BACKGROUND:Class;
		
		// Background Effect
		[Embed(source = 'Assets/Map/back_effect.png')]
		public static const MAP_EFFECT:Class;
		
		// Countries
		[Embed(source = 'Assets/Map/countries.png')]
		public static const MAP_COUNTRIES:Class;
		
		// Bottom Bar (black)
		[Embed(source = 'Assets/Map/bottomBar.png')]
		public static const MAP_BOTTOM_BAR:Class;
		
		// Top Bar (black)
		[Embed(source = 'Assets/Map/topBar.png')]
		public static const MAP_TOP_BAR:Class;
		
		// City (pin)
		[Embed(source = 'Assets/Map/city.png')]
		public static const MAP_CITY:Class;
		
		// Current City (pin)
		[Embed(source = 'Assets/Map/currentCity.png')]
		public static const MAP_CURRENT_CITY:Class;
		
		
		// buttons
		
		// Go
		[Embed(source = 'Assets/Map/go/normal.png')]
		public static const MAP_GO_NORMAL:Class;
		
		[Embed(source = 'Assets/Map/go/hover.png')]
		public static const MAP_GO_HOVER:Class;
		
		
		// upgrades
		[Embed(source = 'Assets/Map/upgrades/normal.png')]
		public static const MAP_UPGRADES_NORMAL:Class;
		
		[Embed(source = 'Assets/Map/upgrades/hover.png')]
		public static const MAP_UPGRADES_HOVER:Class;
		
		
		// more games
		[Embed(source = 'Assets/Map/moregames/normal.png')]
		public static const MAP_MOREGAMES_NORMAL:Class;
		
		[Embed(source = 'Assets/Map/moregames/hover.png')]
		public static const MAP_MOREGAMES_HOVER:Class;
		
		
		// Sound: TV effect 'hospital_tv_channel_change' by 'gezortenplotz'
		[Embed(source = 'Assets/Map/radio1.mp3')]
		public static const MAP_RADIO1:Class;
		
		[Embed(source = 'Assets/Map/radio2.mp3')]
		public static const MAP_RADIO2:Class;
		
		[Embed(source = 'Assets/Map/radio3.mp3')]
		public static const MAP_RADIO3:Class;
		
		[Embed(source = 'Assets/Map/radio4.mp3')]
		public static const MAP_RADIO4:Class;
		
		
		/***************************************************************************************************
		* Gameplay
		* 
		**/
		
		// Marines' HUD
		[Embed(source = 'Assets/Marines/GUI/HUD.png')]
		public static const MARINES_HUD:Class;
		
		// Marines' Bar (Bottom)
		[Embed(source = 'Assets/Marines/GUI/Bar.png')]
		public static const MARINES_BAR:Class;
		
		// Marine's Arrow (indicate the selected sector)
		[Embed(source = 'Assets/Marines/GUI/Arrow.png')]
		public static const MARINES_ARROW:Class;
		
		
		// Nauks' HUD
		[Embed(source = 'Assets/Nauks/GUI/HUD.png')]
		public static const NAUKS_HUD:Class;
		
		// Nauks' Bar (Bottom)
		[Embed(source = 'Assets/Nauks/GUI/Bar.png')]
		public static const NAUKS_BAR:Class;
		
		// Nauk's Arrow (indicate the selected sector)
		[Embed(source = 'Assets/Nauks/GUI/Arrow.png')]
		public static const NAUKS_ARROW:Class;
		
		
		// Empty Spot (to build towers)
		[Embed(source = 'Assets/Shared/GUI/EmptySpot.png')]
		public static const EMPTY_SPOT:Class;
		
		
		// Options
		
		// Background
		[Embed(source = 'Assets/Marines/GUI/Options/background.png')]
		public static const OPTIONS_BACKGROUND:Class;
		
		// OK button (normal)
		[Embed(source = 'Assets/Marines/GUI/Options/ok/normal.png')]
		public static const OPTIONS_OK_NORMAL:Class;
		
		// OK button (hover)
		[Embed(source = 'Assets/Marines/GUI/Options/ok/hover.png')]
		public static const OPTIONS_OK_HOVER:Class;
		
		
		// Music 'Borderline' by 'Fantastic Vamps'
		[Embed(source = 'Assets/Gameplay/music.mp3')]
		public static const GAMEPLAY_MUSIC:Class;
		
		// Sound 'Siren' by 'IFartInUrGeneralDirection'
		[Embed(source = 'Assets/Gameplay/siren.mp3')]
		public static const GAMEPLAY_SIREN:Class;
		
		// Sound: Gameover (lost) 'Dramatic_metal_clang_1_Reverb10sec' by 'Timbre'
		[Embed(source = 'Assets/Gameplay/lost.mp3')]
		public static const GAMEPLAY_LOST:Class;
		
		// Sound: Level Complete (won) 'success_low.' by 'grunz'
		[Embed(source = 'Assets/Gameplay/won.mp3')]
		public static const GAMEPLAY_WON:Class;
		
		
		// Game Over (victory | defeat)
		
		// Background
		[Embed(source = 'Assets/Gameplay/gameover/background.png')]
		public static const GAMEOVER_BACKGROUND:Class;
		
		// Proceed (button)
		[Embed(source = 'Assets/Gameplay/gameover/proceed/normal.png')]
		public static const GAMEOVER_PROCEED_NORMAL:Class;
		
		[Embed(source = 'Assets/Gameplay/gameover/proceed/hover.png')]
		public static const GAMEOVER_PROCEED_HOVER:Class;
		
		// Sponsor (button)
		[Embed(source = 'Assets/Gameplay/gameover/sponsor/normal.png')]
		public static const GAMEOVER_SPONSOR_NORMAL:Class;
		
		[Embed(source = 'Assets/Gameplay/gameover/sponsor/hover.png')]
		public static const GAMEOVER_SPONSOR_HOVER:Class;
		
		
		/***************************************************************************************************
		 * Marines
		 * 
		 **/
		
		// Builds
		
		// Base (left and right)
		[Embed(source = 'Assets/Marines/Builds/Base/left.png')]
		public static const MARINES_BASE_LEFT:Class;
		
		[Embed(source = 'Assets/Marines/Builds/Base/right_nauk.png')]
		public static const MARINES_BASE_RIGHT:Class;
		
		
		// Sound: Destroyed 'THE CRASH' by 'sandyrb'
		[Embed(source = 'Assets/Marines/Builds/Base/destroyed.mp3')]
		public static const MARINES_BASE_DESTROYED:Class;
		
		
		// Sound: Place 'hydraul2' by 'swelk'
		[Embed(source = 'Assets/Marines/Builds/place.mp3')]
		public static const MARINES_BUILDS_PLACE:Class;
		
		
		// Towers
		
		// Tower Locked
		[Embed(source = 'Assets/Marines/GUI/Tower Locked.png')]
		public static const MARINE_TOWER_LOCKED:Class;
		
		
		// Solar Panel (makes money)
		[Embed(source = 'Assets/Marines/Builds/SolarPanel/sprite.png')]
		public static const SOLAR_PANEL:Class;
		
		[Embed(source = 'Assets/Marines/Builds/SolarPanel/sprite_nauk.png')]
		public static const SOLAR_PANEL_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Builds/SolarPanel/avatar.png')]
		public static const SOLAR_PANEL_AVATAR:Class;
		
		[Embed(source = 'Assets/Marines/Builds/SolarPanel/disabled.png')]
		public static const SOLAR_PANEL_DISABLED:Class;
		
		// Sound: Collect 'btn402' by 'junggle'
		[Embed(source = 'Assets/Marines/Builds/SolarPanel/collect.mp3')]
		public static const SOLAR_PANEL_COLLECT:Class;
		
		
		// Assault Tower (offensive)
		[Embed(source = 'Assets/Marines/Builds/AssaultTower/sprite_base.png')]
		public static const ASSAULT_TOWER_BASE:Class;
		
		[Embed(source = 'Assets/Marines/Builds/AssaultTower/sprite_base_nauk.png')]
		public static const ASSAULT_TOWER_BASE_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Builds/AssaultTower/sprite_barrel.png')]
		public static const ASSAULT_TOWER_BARREL:Class;
		
		[Embed(source = 'Assets/Marines/Builds/AssaultTower/sprite_barrel_nauk.png')]
		public static const ASSAULT_TOWER_BARREL_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Builds/AssaultTower/bullet.png')]
		public static const ASSAULT_TOWER_BULLET:Class;
		
		[Embed(source = 'Assets/Marines/Builds/AssaultTower/avatar.png')]
		public static const ASSAULT_TOWER_AVATAR:Class;
		
		[Embed(source = 'Assets/Marines/Builds/AssaultTower/disabled.png')]
		public static const ASSAULT_TOWER_DISABLED:Class;
		
		// Sound: Collect 'silenced gun' by 'pauliep83'
		[Embed(source = 'Assets/Marines/Builds/AssaultTower/fire.mp3')]
		public static const ASSAULT_TOWER_FIRE:Class;
		
		
		// Missile Launcher (offensive)
		[Embed(source = 'Assets/Marines/Builds/MissileLauncher/sprite_base.png')]
		public static const MISSILE_LAUNCHER_BASE:Class;
		
		[Embed(source = 'Assets/Marines/Builds/MissileLauncher/sprite_base_nauk.png')]
		public static const MISSILE_LAUNCHER_BASE_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Builds/MissileLauncher/sprite_barrel.png')]
		public static const MISSILE_LAUNCHER_BARREL:Class;
		
		[Embed(source = 'Assets/Marines/Builds/MissileLauncher/sprite_barrel_nauk.png')]
		public static const MISSILE_LAUNCHER_BARREL_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Builds/MissileLauncher/bullet.png')]
		public static const MISSILE_LAUNCHER_BULLET:Class;
		
		[Embed(source = 'Assets/Marines/Builds/MissileLauncher/avatar.png')]
		public static const MISSILE_LAUNCHER_AVATAR:Class;
		
		[Embed(source = 'Assets/Marines/Builds/MissileLauncher/disabled.png')]
		public static const MISSILE_LAUNCHER_DISABLED:Class;
		
		// Sound: Collect 'silenced gun' (mod) by 'pauliep83'
		[Embed(source = 'Assets/Marines/Builds/MissileLauncher/fire.mp3')]
		public static const MISSILE_LAUNCHER_FIRE:Class;
		
		
		// Super Blast (offensive)
		[Embed(source = 'Assets/Marines/Builds/UltraBlast/sprite_base.png')]
		public static const ULTRA_BLAST_BASE:Class;
		
		[Embed(source = 'Assets/Marines/Builds/UltraBlast/sprite_base_nauk.png')]
		public static const ULTRA_BLAST_BASE_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Builds/UltraBlast/sprite_barrel.png')]
		public static const ULTRA_BLAST_BARREL:Class;
		
		[Embed(source = 'Assets/Marines/Builds/UltraBlast/sprite_barrel_nauk.png')]
		public static const ULTRA_BLAST_BARREL_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Builds/UltraBlast/bullet.png')]
		public static const ULTRA_BLAST_BULLET:Class;
		
		[Embed(source = 'Assets/Marines/Builds/UltraBlast/avatar.png')]
		public static const ULTRA_BLAST_AVATAR:Class;
		
		[Embed(source = 'Assets/Marines/Builds/UltraBlast/disabled.png')]
		public static const ULTRA_BLAST_DISABLED:Class;
		
		// Sound: Fire 'btn107' by 'junggle'
		[Embed(source = 'Assets/Marines/Builds/UltraBlast/fire.mp3')]
		public static const ULTRA_BLAST_FIRE:Class;
		
		
		
		// Units
		
		// Unit Locked
		[Embed(source = 'Assets/Marines/GUI/Unit Locked.png')]
		public static const MARINE_UNIT_LOCKED:Class;
		
		
		// Pistol (unit)
		[Embed(source = 'Assets/Marines/Units/Pistol/sprite.png')]
		public static const PISTOL:Class;
		
		[Embed(source = 'Assets/Marines/Units/Pistol/sprite_nauk.png')]
		public static const PISTOL_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Units/Pistol/avatar.png')]
		public static const PISTOL_AVATAR:Class;
		
		[Embed(source = 'Assets/Marines/Units/Pistol/disabled.png')]
		public static const PISTOL_DISABLED:Class;
		
		[Embed(source = 'Assets/Marines/Units/Pistol/shot.mp3')]
		public static const PISTOL_SHOT:Class;
		
		
		// SMG (unit)
		[Embed(source = 'Assets/Marines/Units/SMG/sprite.png')]
		public static const SMG:Class;
		
		[Embed(source = 'Assets/Marines/Units/SMG/sprite_nauk.png')]
		public static const SMG_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Units/SMG/avatar.png')]
		public static const SMG_AVATAR:Class;
		
		[Embed(source = 'Assets/Marines/Units/SMG/disabled.png')]
		public static const SMG_DISABLED:Class;
		
		[Embed(source = 'Assets/Marines/Units/SMG/shot.mp3')]
		public static const SMG_SHOT:Class;
		
		
		// Eagle (unit)
		[Embed(source = 'Assets/Marines/Units/Eagle/sprite.png')]
		public static const EAGLE:Class;
		
		[Embed(source = 'Assets/Marines/Units/Eagle/sprite_nauk.png')]
		public static const EAGLE_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Units/Eagle/avatar.png')]
		public static const EAGLE_AVATAR:Class;
		
		[Embed(source = 'Assets/Marines/Units/Eagle/disabled.png')]
		public static const EAGLE_DISABLED:Class;
		
		[Embed(source = 'Assets/Marines/Units/Eagle/shot.mp3')]
		public static const EAGLE_SHOT:Class;
		
		
		// Assault (unit)
		[Embed(source = 'Assets/Marines/Units/Assault/sprite.png')]
		public static const ASSAULT:Class;
		
		[Embed(source = 'Assets/Marines/Units/Assault/sprite_nauk.png')]
		public static const ASSAULT_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Units/Assault/avatar.png')]
		public static const ASSAULT_AVATAR:Class;
		
		[Embed(source = 'Assets/Marines/Units/Assault/disabled.png')]
		public static const ASSAULT_DISABLED:Class;
		
		[Embed(source = 'Assets/Marines/Units/Assault/shot.mp3')]
		public static const ASSAULT_SHOT:Class;
		
		
		// Sniper (unit)
		[Embed(source = 'Assets/Marines/Units/Sniper/sprite.png')]
		public static const SNIPER:Class;
		
		[Embed(source = 'Assets/Marines/Units/Sniper/sprite_nauk.png')]
		public static const SNIPER_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Units/Sniper/avatar.png')]
		public static const SNIPER_AVATAR:Class;
		
		[Embed(source = 'Assets/Marines/Units/Sniper/disabled.png')]
		public static const SNIPER_DISABLED:Class;
		
		[Embed(source = 'Assets/Marines/Units/Sniper/shot.mp3')]
		public static const SNIPER_SHOT:Class;
		
		
		// Machine (unit)
		[Embed(source = 'Assets/Marines/Units/Machine/sprite.png')]
		public static const MACHINE:Class;
		
		[Embed(source = 'Assets/Marines/Units/Machine/sprite_nauk.png')]
		public static const MACHINE_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Units/Machine/avatar.png')]
		public static const MACHINE_AVATAR:Class;
		
		[Embed(source = 'Assets/Marines/Units/Machine/disabled.png')]
		public static const MACHINE_DISABLED:Class;
		
		[Embed(source = 'Assets/Marines/Units/Machine/shot.mp3')]
		public static const MACHINE_SHOT:Class;
		
		
		// Bazooka (unit)
		[Embed(source = 'Assets/Marines/Units/Bazooka/sprite.png')]
		public static const BAZOOKA:Class;
		
		[Embed(source = 'Assets/Marines/Units/Bazooka/sprite_nauk.png')]
		public static const BAZOOKA_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Units/Bazooka/avatar.png')]
		public static const BAZOOKA_AVATAR:Class;
		
		[Embed(source = 'Assets/Marines/Units/Bazooka/disabled.png')]
		public static const BAZOOKA_DISABLED:Class;
		
		[Embed(source = 'Assets/Marines/Units/Bazooka/bullet.png')]
		public static const BAZOOKA_BULLET:Class;
		
		[Embed(source = 'Assets/Marines/Units/Bazooka/shot.mp3')]
		public static const BAZOOKA_SHOT:Class;
		
		[Embed(source = 'Assets/Marines/Units/Bazooka/explosion.mp3')]
		public static const BAZOOKA_EXPLOSION:Class;
		
		
		// Medic (unit)
		[Embed(source = 'Assets/Marines/Units/Medic/sprite.png')]
		public static const MEDIC:Class;
		
		[Embed(source = 'Assets/Marines/Units/Medic/sprite_nauk.png')]
		public static const MEDIC_NAUK:Class;
		
		[Embed(source = 'Assets/Marines/Units/Medic/avatar.png')]
		public static const MEDIC_AVATAR:Class;
		
		[Embed(source = 'Assets/Marines/Units/Medic/disabled.png')]
		public static const MEDIC_DISABLED:Class;
		
		[Embed(source = 'Assets/Marines/Units/Medic/shot.mp3')]
		public static const MEDIC_SHOT:Class;
		
		// Sound: Revive 'electric_sparks' by 'Connum'
		[Embed(source = 'Assets/Marines/Units/Medic/revive.mp3')]
		public static const MEDIC_REVIVE:Class;
		
		
		
		// Sound: Death '01308 man hit 9' by 'Robinhood76'
		[Embed(source = 'Assets/Marines/Units/death.mp3')]
		public static const MARINES_UNIT_DEATH:Class;
		
		// Sound: Nauk's Death '00920 man dying 1' by 'Robinhood76'
		[Embed(source = 'Assets/Marines/Units/nauk_death.mp3')]
		public static const MARINES_UNIT_NAUK_DEATH:Class;
		
		
		/***************************************************************************************************
		 * Nauks
		 * 
		 **/
		
		// Builds
		
		// Base (left and right)
		[Embed(source = 'Assets/Nauks/Builds/Base/left.png')]
		public static const NAUKS_BASE_LEFT:Class;
		
		[Embed(source = 'Assets/Nauks/Builds/Base/right.png')]
		public static const NAUKS_BASE_RIGHT:Class;
		
		
		// Towers
		
		// Tower Locked
		[Embed(source = 'Assets/Nauks/GUI/Tower Locked.png')]
		public static const NAUK_TOWER_LOCKED:Class;
		
		
		// Units
		
		// Unit Locked
		[Embed(source = 'Assets/Nauks/GUI/Unit Locked.png')]
		public static const NAUK_UNIT_LOCKED:Class;
		
		
		/***************************************************************************************************
		 * Terrains
		 * 
		 **/
		 
		 // Grass
		 [Embed(source = 'Assets/Terrains/grass.png')]
		 public static const TERRAIN_GRASS:Class;
		 
		 // Grass with road
		 [Embed(source = 'Assets/Terrains/grass_road.png')]
		 public static const TERRAIN_GRASS_ROAD:Class;
		 
		 // Grass with two roads
		 [Embed(source = 'Assets/Terrains/grass_2roads.png')]
		 public static const TERRAIN_GRASS_2ROADS:Class;
		 
		 
		 
		 // Sand
		 [Embed(source = 'Assets/Terrains/sand.png')]
		 public static const TERRAIN_SAND:Class;
		 
		 // Sand with road
		 [Embed(source = 'Assets/Terrains/sand_road.png')]
		 public static const TERRAIN_SAND_ROAD:Class;
		 
		 // Lightsand Road
		 [Embed(source = 'Assets/Terrains/lightsand_road.png')]
		 public static const TERRAIN_SAND_LIGHTSAND_ROAD:Class;
		 
		 // Lightsand Road Alt
		 [Embed(source = 'Assets/Terrains/lightsand_road_alt.png')]
		 public static const TERRAIN_SAND_LIGHTSAND_ROAD_ALT:Class;
		 
		 
		 
		 // Clay
		 [Embed(source = 'Assets/Terrains/clay.png')]
		 public static const TERRAIN_CLAY:Class;
		 
		 // Clay with road
		 [Embed(source = 'Assets/Terrains/clay_road.png')]
		 public static const TERRAIN_CLAY_ROAD:Class;
		 
		 
		 
		 // Swamp
		 [Embed(source = 'Assets/Terrains/swamp.png')]
		 public static const TERRAIN_SWAMP:Class;
		 
		 // Swamp with road
		 [Embed(source = 'Assets/Terrains/swamp_road.png')]
		 public static const TERRAIN_SWAMP_ROAD:Class;
		 
		 
		 
		 // Snow
		 [Embed(source = 'Assets/Terrains/snow.png')]
		 public static const TERRAIN_SNOW:Class;
		 
		 // Snow with road
		 [Embed(source = 'Assets/Terrains/snow_road.png')]
		 public static const TERRAIN_SNOW_ROAD:Class;
		 
		 // Snow with two road
		 [Embed(source = 'Assets/Terrains/snow_2roads.png')]
		 public static const TERRAIN_SNOW_2ROADS:Class;
		 
		 
		 
		 // Road
		 [Embed(source = 'Assets/Terrains/road.png')]
		 public static const TERRAIN_ROAD:Class;
		 
		 
		 /***************************************************************************************************
		 * Tutorial
		 * 
		 **/
		 
		 // Page 1
		 [Embed(source = 'Assets/Tutorial/1.png')]
		 public static const TUTORIAL_1:Class;
		 
		 // Page 2
		 [Embed(source = 'Assets/Tutorial/2.png')]
		 public static const TUTORIAL_2:Class;
		 
		 // Page 3
		 [Embed(source = 'Assets/Tutorial/3.png')]
		 public static const TUTORIAL_3:Class;
		 
		 // Page 4
		 [Embed(source = 'Assets/Tutorial/4.png')]
		 public static const TUTORIAL_4:Class;
		 
		 // Arrow
		 [Embed(source = 'Assets/Tutorial/arrow.png')]
		 public static const TUTORIAL_ARROW:Class;
	}
}