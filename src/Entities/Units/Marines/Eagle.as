package Entities.Units.Marines
{
	import Entities.Units.Marine
	
	public class Eagle extends Marine
	{
		public static var name:String = "Desert Eagle";
		public static var cost:uint = 400;
		public static var energy:uint = 140;
		
		public function Eagle():void
		{
			// info
			name = Eagle.name;
			energy = Eagle.energy;
			attackType = "ranged";
			force = 40;
			
			// stats
			maxLife = 160;
			speed = 19;
			power = 50;
			attackRange = 130;
			attackDelay = 0.8;
			
			// sprite
			frameWidth = 18;
			frameHeight = 16;
			
			// hitbox
			width = 10;
			height = 15;
			originY = -1;
			
			// offsets
			shellOffsetY = 5;
			
			super();
		}
		
		override protected function setupAnimations():void
		{
			marinesStandardAnimation(7, 11);
		}
		
		override protected function setupLeft():void
		{
			source = Assets.EAGLE;
			originX = -4;
			bloodOffsetX = 3;
			shellOffsetX = 12;
			
			// Alien revolt levels
			if (Data.level == 3 || Data.level == 10 || Data.level == 18 || Data.level == 25)
			{
				source = Assets.EAGLE_NAUK;
			}
			
			super.setupLeft();
		}
		
		override protected function setupRight():void
		{
			source = Assets.EAGLE_NAUK;
			originX = -5;
			bloodOffsetX = 8;
			shellOffsetX = 5;
			
			super.setupRight();
		}
		
		override protected function soundShoot():void
		{
			Core.sfx_eagle.play( Core.vol - Math.random() );
		}
	}
}