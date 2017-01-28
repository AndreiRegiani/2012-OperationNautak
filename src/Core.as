package
{
	import Entities.Ai;
	import Entities.GUI.Gameplay.Arrow;
	import Entities.GUI.Gameplay.Bar;
	import Entities.GUI.Gameplay.Hud;
	import Entities.GUI.Gameplay.Options;
	import Entities.GUI.MouseOverInfo;
	
	import Worlds.Gameplay;
	import Worlds.Map;
	import Worlds.Menu;
	import Worlds.Shop;
	
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	
	public final class Core
	{
		// info
		
		public static var version:String = "1.0";
		
		public static var plataform:String = "Web";
		
		public static var sponsor_name:String = "Tower Defense Games";
		
		public static var developer_name:String = "Igniter Games";
		
		// urls
		
		public static const sponsor_url:String = "http://www.playtowerdefensegames.com";
		
		public static const developer_url:String = "http://www.ignitergames.com";
		
		public static const facebook_url:String = "https://www.facebook.com/pages/Play-Tower-Defense-Games/233204833416129?ref=hl";
		
		public static const twitter_url:String = "http://www.twitter.com/IgniterGames";
		
		
		// game
		
		public static var game:Game;
		
		public static var paused:Boolean;
		
		
		// worlds
		
		public static var gameplay:Gameplay;
		
		
		// game vars
		
		public static var progress:Progress;
		
		public static var hud:Hud;
		
		public static var bar:Bar;
		
		//public static var effects:Effects = new Effects();
		
		public static var overInfo:MouseOverInfo = new MouseOverInfo();
		
		public static var arrow:Arrow;
		
		public static var ai:Ai;
		
		public static var options:Options;
		
		public static var black:Image; // gameplay screen transition (and dark background on pause screen)
		
		
		// performance optmization
		public static var sfx_pistol:Sfx = new Sfx(Assets.PISTOL_SHOT);
		public static var sfx_eagle:Sfx = new Sfx(Assets.EAGLE_SHOT);
		public static var sfx_medic:Sfx = new Sfx(Assets.MEDIC_SHOT);
		public static var sfx_assault:Sfx = new Sfx(Assets.ASSAULT_SHOT);
		public static var sfx_machine:Sfx = new Sfx(Assets.MACHINE_SHOT);
		public static var sfx_smg:Sfx = new Sfx(Assets.SMG_SHOT);
		public static var sfx_sniper:Sfx = new Sfx(Assets.SNIPER_SHOT);
		public static var sfx_bazooka:Sfx = new Sfx(Assets.BAZOOKA_SHOT);
		
		public static var sfx_death_marines:Sfx = new Sfx(Assets.MARINES_UNIT_DEATH);
		public static var sfx_death_nauk:Sfx = new Sfx(Assets.MARINES_UNIT_NAUK_DEATH);
		
		
		
		// map configuration

		public static var terrain:String; // grass, clay, sand, swamp, snow, road
		
		public static var enemyRace:String = "Marines"; // Marines, Nauks
		
		
		// levels
		public static var currentLevel:Level;
		public static const totalLevels:uint = 25;
		
		public static var level_1:Level;
		public static var level_2:Level;
		public static var level_3:Level;
		public static var level_4:Level;
		public static var level_5:Level;
		public static var level_6:Level;
		public static var level_7:Level;
		public static var level_8:Level;
		public static var level_9:Level;
		public static var level_10:Level;
		public static var level_11:Level;
		public static var level_12:Level;
		public static var level_13:Level;
		public static var level_14:Level;
		public static var level_15:Level;
		public static var level_16:Level;
		public static var level_17:Level;
		public static var level_18:Level;
		public static var level_19:Level;
		public static var level_20:Level;
		public static var level_21:Level;
		public static var level_22:Level;
		public static var level_23:Level;
		public static var level_24:Level;
		public static var level_25:Level;
		
		
		public static function getLevel(value:uint):Level
		{
			switch (value)
			{
				case 1:
					return level_1;
					break;
					
				case 2:
					return level_2;
					break;
					
				case 3:
					return level_3;
					break;
					
				case 4:
					return level_4;
					break;
					
				case 5:
					return level_5;
					break;
					
				case 6:
					return level_6;
					break;
					
				case 7:
					return level_7;
					break;
					
				case 8:
					return level_8;
					break;
					
				case 9:
					return level_9;
					break;
					
				case 10:
					return level_10;
					break;
					
				case 11:
					return level_11;
					break;
					
				case 12:
					return level_12;
					break;
					
				case 13:
					return level_13;
					break;
					
				case 14:
					return level_14;
					break;
					
				case 15:
					return level_15;
					break;
					
				case 16:
					return level_16;
					break;
					
				case 17:
					return level_17;
					break;
				
				case 18:
					return level_18;
					break;
					
				case 19:
					return level_19;
					break;
					
				case 20:
					return level_20;
					break;
					
				case 21:
					return level_21;
					break;
					
				case 22:
					return level_22;
					break;
					
				case 23:
					return level_23;
					break;
					
				case 24:
					return level_24;
					break;
					
				case 25:
					return level_25;
					break;
			}
			
			return null;
		}
		
		
		// game options
		
		public static var sound:Boolean = true;
		
		public static var vol:uint = 1;
		
		public static var music:Boolean = true;
		
		public static var particles:Boolean = false;
		
		public static var autoCollectSolar:Boolean = true;
	}
}