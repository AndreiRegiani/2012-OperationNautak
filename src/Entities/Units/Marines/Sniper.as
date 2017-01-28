package Entities.Units.Marines
{
	import Entities.Units.Marine;
	
	public class Sniper extends Marine
	{
		public static var name:String = "AWP Rifle";
		public static var cost:uint = 6200;
		public static var energy:uint = 450;
		
		public function Sniper():void
		{
			// info
			name = Sniper.name;
			energy = Sniper.energy;
			attackType = "ranged";
			force = 160;
			
			// stats
			maxLife = 180;
			speed = 12;
			power = 350;
			attackRange = 220;
			attackDelay = 2.5;
			
			// sprite
			frameWidth = 23;
			frameHeight = 16;
			
			// hitbox
			width = 14;
			height = 15;
			originY = -1;
			
			// offsets
			shellOffsetY = 6;
			
			super();
		}
		
		override protected function setupAnimations():void
		{
			marinesStandardAnimation(6, 11);
		}
		
		override protected function setupLeft():void
		{
			source = Assets.SNIPER;
			originX = -2;
			bloodOffsetX = 2;
			shellOffsetX = 10;
			
			// Alien revolt levels
			if (Data.level == 3 || Data.level == 10 || Data.level == 18 || Data.level == 25)
			{
				source = Assets.SNIPER_NAUK;
			}
			
			super.setupLeft();
		}
		
		override protected function setupRight():void
		{
			source = Assets.SNIPER_NAUK;
			originX = -7;
			bloodOffsetX = 13;
			shellOffsetX = 12;
			
			super.setupRight();
		}
		
		override protected function soundShoot():void
		{
			Core.sfx_sniper.play( Core.vol - Math.random() );
		}
	}
}