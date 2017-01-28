package Entities.Bullets
{
	import Entities.Bullet;
	import net.flashpunk.utils.Draw;
	
	import net.flashpunk.Sfx;
	
	public class BazookaBullet extends Bullet
	{
		// trail offset (particle effect)
		private var offset:uint = 9;
		
		private var explosion:Sfx = new Sfx(Assets.BAZOOKA_EXPLOSION);
		
		private var collided:Boolean = false;
		
		public function BazookaBullet():void
		{
			speed = 130;
			
			// sprite
			source = Assets.BAZOOKA_BULLET;
			frameWidth = 19;
			frameHeight = 19;
			
			// hitbox
			width = 6;
			height = 3;
			originY = -8;
			
			super();
		}
		
		override public function update():void
		{
			//Core.effects.emit("Bazooka_Trail", 2, x + offset, y + offset);
			
			if (collidable)
			{
				layer = -y;
			}
			
			super.update();
		}
		
		override protected function setupAnimations():void
		{
			sprite.add("travel", [0, 1, 2], 10, true);
			sprite.add("explosion", [5, 6, 7, 8, 9, 5], 8, false);
		}
		
		override public function hit():void
		{	
			if (!collided)
			{
				// effects
				/*
				Core.effects.emit("Explosion_Yellow", 70, x + offset, y + offset);
				Core.effects.emit("Explosion_Orange", 70, x + offset, y + offset);
				*/
				
				// hitbox
				originY = 5;
				originX = 5;
				width = 29;
				height = 29;
				
				layer = -275;
				speed = 6;
				sprite.callback = destroy;
				sprite.play("explosion");
				
				// sound
				explosion.play(Core.vol);
				
				collided = true;
			}
		}
		
		override protected function setupLeft():void
		{
			// hitbox
			originX = -7;
		}
		
		override protected function setupRight():void
		{
			// hitbox
			originX = -6;
		}
	}
}