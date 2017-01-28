package
{
	import flash.net.SharedObject;
	
	public final class Progress
	{
		public var sharedObject:SharedObject;
		
		public function Progress():void
		{
			sharedObject = SharedObject.getLocal("OperationNautak1");
		}
		
		public function hasProgress():Boolean
		{
			if (sharedObject.data.race == undefined)
			{
				return false;
			}
			
			else
			{
				return true;
			}
		}
		
		public function newGame(cheatMode:Boolean = false):void
		{
			sharedObject.clear();
			
			// Race
			Data.race = "Marines";
			
			// Money
			Data.money = 0;
			
			// Base HP
			Data.baseLife = 500;
			
			// Current level
			Data.level = 1;
			
			Data.cheatMode = false;
			
			
			// Towers acquisition
			
			// Marines
			Data.solar_panel = true;
			Data.assault_tower = true;
			Data.missile_launcher = false;
			Data.ultra_blast = false;
			
			
			// Units acquisition
			Data.pistol = true;
			Data.eagle = true;
			Data.smg = false;
			Data.medic = false;
			Data.assault = false;
			Data.sniper = false;
			Data.machine = false;
			Data.bazooka = false;
			
			// unlock all progress
			if (cheatMode)
			{
				Data.money = 99999;
				Data.cheatMode = true;
				// cheat();
			}
			
			save();
		}
		
		public function cheat():void
		{
			// Money
			//Data.money = 99999;
			
			// Base HP
			//Data.baseLife = 6000;
			
			// Current level
			//Data.level = 17;
			
			
			// Towers acquisition
			
			// Marines
			//Data.solar_panel = true;
			//Data.assault_tower = true;
			//Data.missile_launcher = true;
			//Data.ultra_blast = false;
			
			
			// Units acquisition
			//Data.pistol = true;
			//Data.eagle = true;
			//Data.smg = true;
			//Data.medic = true;
			//Data.assault = true;
			//Data.sniper = true;
			//Data.machine = false;
			//Data.bazooka = false;
		}
		
		public function load():void
		{
			// Race
			Data.race = sharedObject.data.race;
			
			// Money
			Data.money = sharedObject.data.money;
			
			// Base HP
			Data.baseLife = sharedObject.data.baseLife;
			
			// Current level
			Data.level = sharedObject.data.level;
			
			
			// Towers acquisition
			
			// Marines
			Data.solar_panel = sharedObject.data.solar_panel;
			Data.assault_tower = sharedObject.data.assault_tower;
			Data.missile_launcher = sharedObject.data.missile_launcher;
			Data.ultra_blast = sharedObject.data.ultra_blast;
			
			
			// Units acquisition
			Data.pistol = sharedObject.data.pistol;
			Data.eagle = sharedObject.data.eagle;
			Data.smg = sharedObject.data.smg;
			Data.medic = sharedObject.data.medic;
			Data.assault = sharedObject.data.assault;
			Data.sniper = sharedObject.data.sniper;
			Data.machine = sharedObject.data.machine;
			Data.bazooka = sharedObject.data.bazooka;
		}
		
		public function loadOptions():void
		{
			Core.sound = sharedObject.data.sound;
			Core.music = sharedObject.data.music;
			Core.particles = sharedObject.data.particles;
			Core.autoCollectSolar = sharedObject.data.autoCollectSolor;
		}
		
		public function save():void
		{
			// Race
			sharedObject.data.race = Data.race;
			
			// Money
			sharedObject.data.money = Data.money;
			
			// Base HP
			sharedObject.data.baseLife = Data.baseLife;
			
			// Current level
			sharedObject.data.level = Data.level;
			
			
			// Towers acquisition
			
			// Marines
			sharedObject.data.solar_panel = Data.solar_panel;
			sharedObject.data.assault_tower = Data.assault_tower;
			sharedObject.data.missile_launcher = Data.missile_launcher;
			sharedObject.data.ultra_blast = Data.ultra_blast;
			
			
			// Units acquisition
			sharedObject.data.pistol = Data.pistol;
			sharedObject.data.eagle = Data.eagle;
			sharedObject.data.smg = Data.smg;
			sharedObject.data.medic = Data.medic;
			sharedObject.data.assault = Data.assault;
			sharedObject.data.sniper = Data.sniper;
			sharedObject.data.machine = Data.machine;
			sharedObject.data.bazooka = Data.bazooka;
			
			
			// Options
			sharedObject.data.sound = Core.sound;
			sharedObject.data.music = Core.music;
			sharedObject.data.particles = Core.particles;
			sharedObject.data.autoCollectSolor = Core.autoCollectSolar;
		}
	}
}