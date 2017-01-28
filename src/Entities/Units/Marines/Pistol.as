package Entities.Units.Marines
{
	import Entities.Units.Marine;
	
	public class Pistol extends Marine
	{
		public static var name:String = "Glock";
		public static var cost:uint = 0; // starter
		public static var energy:uint = 80;
		
		public function Pistol():void
		{
			// info
			name = Pistol.name;
			energy = Pistol.energy;
			attackType = "ranged";
			force = 25;
			
			// stats
			maxLife = 120;
			speed = 15;
			power = 30;
			attackRange = 120;
			attackDelay = 0.8;
			
			// sprite
			frameWidth = 16;
			frameHeight = 16;
			
			// hitbox
			width = 9;
			height = 15;
			originY = -1;

			// offsets
			shellOffsetY = 5;
			
			super();
		}
		
		override protected function setupAnimations():void
		{
			marinesStandardAnimation(6, 11);
		}
		
		override protected function setupLeft():void
		{
			source = Assets.PISTOL;
			originX = -2;
			bloodOffsetX = 2;
			shellOffsetX = 12;
			
			// Alien revolt levels
			if (Data.level == 3 || Data.level == 10 || Data.level == 18 || Data.level == 25)
			{
				source = Assets.PISTOL_NAUK;
			}
			
			super.setupLeft();
		}
		
		override protected function setupRight():void
		{
			source = Assets.PISTOL_NAUK;
			originX = -5;
			bloodOffsetX = 6;
			shellOffsetX = 3;
			
			super.setupRight();
		}
		
		override protected function soundShoot():void
		{
			Core.sfx_pistol.play( Core.vol - Math.random() );
		}
	}
}