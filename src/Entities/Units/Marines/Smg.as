package Entities.Units.Marines
{
	import Entities.Units.Marine;
	
	public class Smg extends Marine
	{
		public static var name:String = "P90";
		public static var cost:uint = 700;
		public static var energy:uint = 200;
		
		public function Smg():void
		{
			// info
			name = Smg.name;
			energy = Smg.energy;
			attackType = "ranged";
			force = 70;
			
			// stats
			maxLife = 190;
			speed = 15;
			power = 12;
			attackRange = 140;
			attackDelay = 0.13;
			
			// sprite
			frameWidth = 16;
			frameHeight = 16;
			
			// hitbox
			width = 9;
			height = 15;
			originY = -1;
			
			// offsets
			shellOffsetY = 6;

			super();
		}
		
		override protected function setupAnimations():void
		{
			marinesStandardAnimation(7, 25);
		}
		
		override protected function setupLeft():void
		{
			source = Assets.SMG;
			originX = -2;
			bloodOffsetX = 2;
			shellOffsetX = 11;
			
			// Alien revolt levels
			if (Data.level == 3 || Data.level == 10 || Data.level == 18 || Data.level == 25)
			{
				source = Assets.SMG_NAUK;
			}
			
			super.setupLeft();
		}
		
		override protected function setupRight():void
		{
			source = Assets.SMG_NAUK;
			originX = -5;
			bloodOffsetX = 6;
			shellOffsetX = 4;
			
			super.setupRight();
		}
		
		override protected function soundShoot():void
		{
			Core.sfx_smg.play( Core.vol - Math.random() - 0.2 );
		}
	}
}