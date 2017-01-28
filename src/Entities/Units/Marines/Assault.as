package Entities.Units.Marines
{
	import Entities.Units.Marine;
	
	public class Assault extends Marine
	{
		public static var name:String = "FAMAS";
		public static var cost:uint = 4000;
		public static var energy:uint = 400;
		
		public function Assault():void
		{
			// info
			name = Assault.name;
			energy = Assault.energy;
			attackType = "ranged";
			force = 120;
			
			// stats
			maxLife = 220;
			speed = 20;
			power = 15;
			attackRange = 150;
			attackDelay = 0.13;
			
			// sprite
			frameWidth = 21;
			frameHeight = 16;
			
			// hitbox
			width = 15;
			height = 15;
			originY = -1;
			
			// offsets
			shellOffsetY = 6;
			
			super();
		}
		
		override protected function setupAnimations():void
		{
			marinesStandardAnimation(8, 20);
		}
		
		override protected function setupLeft():void
		{
			source = Assets.ASSAULT;
			originX = -2;
			bloodOffsetX = 2;
			shellOffsetX = 11;
			
			// Alien revolt levels
			if (Data.level == 3 || Data.level == 10 || Data.level == 18 || Data.level == 25)
			{
				source = Assets.ASSAULT_NAUK;
			}
			
			super.setupLeft();
		}
		
		override protected function setupRight():void
		{
			source = Assets.ASSAULT_NAUK;
			originX = -4;
			bloodOffsetX = 9;
			shellOffsetX = 9;
			
			super.setupRight();
		}
		
		override protected function soundShoot():void
		{
			Core.sfx_assault.play( Core.vol - Math.random() - 0.2 );
		}
	}
}