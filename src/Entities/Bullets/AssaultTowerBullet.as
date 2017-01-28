package Entities.Bullets
{
	import Entities.Bullet;
	
	public class AssaultTowerBullet extends Bullet
	{
		public function AssaultTowerBullet():void
		{
			speed = 200;
			
			// sprite
			source = Assets.ASSAULT_TOWER_BULLET;
			frameWidth = 3;
			frameHeight = 3;
			
			// hitbox
			width = 3;
			height = 3;
			
			super();
		}
		
		override protected function setupAnimations():void
		{
			sprite.add("travel", [0, 1], 20, true);
		}
		
		override public function hit():void
		{
			destroy();
		}
	}
}