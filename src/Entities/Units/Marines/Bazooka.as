package Entities.Units.Marines
{
	import Entities.Unit;
	import Entities.Units.Marine
	import Entities.Bullets.BazookaBullet;
	
	public class Bazooka extends Marine
	{
		public static var name:String = "Bazooka";
		public static var cost:uint = 16000;
		public static var energy:uint = 550;
		
		// bullet
		private var bulletOffsetX:int;
		private var bulletOffsetY:int;
		
		public function Bazooka():void
		{
			// info
			name = Bazooka.name;
			energy = Bazooka.energy;
			attackType = "ranged";
			force = 220;
			
			// stats
			maxLife = 280;
			speed = 12;
			power = 1000;
			attackRange = 180;
			attackDelay = 3.0;
			
			// sprite
			frameWidth = 23;
			frameHeight = 16;
			
			// hitbox
			width = 10;
			height = 15;
			originY = -1;
			
			// offsets
			bulletOffsetY = -3;
			
			super();
		}
		
		override protected function setupAnimations():void
		{
			marinesStandardAnimation(5, 11);
		}
		
		override protected function doAttack(target:*):void
		{
			sprite.play("attack", true);
			soundShoot();
			
			var targetX:int;
			var targetY:int;
			
			if (target.type == "unit")
			{
				targetX = target.x;
				targetY = target.y;
			}
			
			else if (target.type == "base")
			{
				targetX = this.x + bulletOffsetX;
				targetY = this.y + bulletOffsetY;
				
				if (team == "right")
				{
					targetX -= 10;
				}
			}
			
			var bullet:BazookaBullet = new BazookaBullet();
			bullet.setup(team, power, this.x + bulletOffsetX, this.y + bulletOffsetY, targetX, targetY);
			world.add(bullet);
		}
		
		override protected function setupLeft():void
		{
			source = Assets.BAZOOKA;
			originX = -4;
			bulletOffsetX = 11;
			bloodOffsetX = 4;
			
			// Alien revolt levels
			if (Data.level == 3 || Data.level == 10 || Data.level == 18 || Data.level == 25)
			{
				source = Assets.BAZOOKA_NAUK;
			}
			
			super.setupLeft();
		}
		
		override protected function setupRight():void
		{
			source = Assets.BAZOOKA_NAUK;
			originX = -9;
			bulletOffsetX = -6;
			bloodOffsetX = 9;
			
			super.setupRight();
		}
		
		override protected function soundShoot():void
		{
			Core.sfx_bazooka.play(Core.vol);
		}
	}
}