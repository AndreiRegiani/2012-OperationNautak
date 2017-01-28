package Entities.Units.Marines
{
	import Entities.Units.Marine;
	
	public class Machine extends Marine
	{
		public static var name:String = "M249";
		public static var cost:uint = 11000;
		public static var energy:uint = 500;
		
		public function Machine():void
		{
			// info
			name = Machine.name;
			energy = Machine.energy;
			attackType = "ranged";
			force = 180;
			
			// stats
			maxLife = 260;
			speed = 12;
			power = 35;
			attackRange = 165;
			attackDelay = 0.17;
			
			// sprite
			frameWidth = 23;
			frameHeight = 16;
			
			// hitbox
			width = 10;
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
			source = Assets.MACHINE;
			originX = -2;
			bloodOffsetX = 2;
			shellOffsetX = 13;
			
			// Alien revolt levels
			if (Data.level == 3 || Data.level == 10 || Data.level == 18 || Data.level == 25)
			{
				source = Assets.MACHINE_NAUK;
			}
			
			super.setupLeft();
		}
		
		override protected function setupRight():void
		{
			source = Assets.MACHINE_NAUK;
			originX = -11;
			bloodOffsetX = 11;
			shellOffsetX = 9;
			
			super.setupRight();
		}
		
		override protected function soundShoot():void
		{
			Core.sfx_machine.play( Core.vol - Math.random() - 0.2 );
		}
	}
}