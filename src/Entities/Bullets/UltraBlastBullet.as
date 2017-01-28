package Entities.Bullets
{
	import Entities.Bullet;
	
	public class UltraBlastBullet extends Bullet
	{
		private var offset:int = 1;
		
		public function UltraBlastBullet():void
		{
			speed = 350;
			
			// sprite
			source = Assets.ULTRA_BLAST_BULLET;
			frameWidth = 3;
			frameHeight = 3;
			
			// hitbox
			width = 3;
			height = 3;
			
			super();
		}
		
		override public function update():void
		{
			//Core.effects.emit("UltraBlast_Trail", 4, x + offset, y + offset);
			
			super.update();
		}
		
		override public function hit():void
		{
			//Core.effects.emit("Explosion_Green", 75, x + offset, y + offset);
			
			destroy();
		}
		
		override protected function setupAnimations():void
		{
			sprite.add("travel", [0, 1], 20, true);
		}
	}
}