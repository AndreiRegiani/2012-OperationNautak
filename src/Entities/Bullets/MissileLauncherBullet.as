package Entities.Bullets
{
	import Entities.Bullet;
	
	public class MissileLauncherBullet extends Bullet
	{
		private var offset:int = 1;
		
		public function MissileLauncherBullet():void
		{
			speed = 200;
			
			// sprite
			source = Assets.MISSILE_LAUNCHER_BULLET;
			frameWidth = 3;
			frameHeight = 3;
			
			// hitbox
			width = 3;
			height = 3;
			
			super();
		}
		
		override public function update():void
		{
			//Core.effects.emit("Bazooka_Trail", 1, x + offset, y + offset);
			
			super.update();
		}
		
		override public function hit():void
		{
			/*
			Core.effects.emit("Explosion_Yellow", 25, x + offset, y + offset);
			Core.effects.emit("Explosion_Orange", 50, x + offset, y + offset);
			*/
			destroy();
		}
		
		override protected function setupAnimations():void
		{
			sprite.add("travel", [0, 1], 20, true);
		}
	}
}