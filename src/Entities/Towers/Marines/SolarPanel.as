package Entities.Towers.Marines
{
	import Entities.Towers.SolarTower;
	
	public class SolarPanel extends SolarTower
	{
		public static var name:String = "Solar Panel";
		public static var cost:uint = 0; // starter
		public static var energy:uint = 250; // cost to build
		
		public static var extra_energy:uint = 10; // * level / solar
		
		public function SolarPanel():void
		{
			// info
			energy = SolarPanel.energy;
			
			// stats
			money = 250 + (Data.level * SolarPanel.extra_energy); // produced energy by charge
			baseAwaitingTime = 6;
			
			// sprite
			frameWidth = 27;
			frameHeight = 20;
			
			// hitbox
			offsetY = -4;
			
			// sound
			collect_source = Assets.SOLAR_PANEL_COLLECT;
			place_source = Assets.MARINES_BUILDS_PLACE;
			
			super();
		}
		
		override protected function setupLeft():void
		{
			source = Assets.SOLAR_PANEL;
			Core.game.score += 300;
			
			// Alien revolt levels
			if (Data.level == 3 || Data.level == 10 || Data.level == 18 || Data.level == 25)
			{
				source = Assets.SOLAR_PANEL_NAUK;
			}
		}
		
		override protected function setupRight():void
		{
			source = Assets.SOLAR_PANEL_NAUK;
		}
	}
}