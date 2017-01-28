package Entities
{
	import net.flashpunk.Entity
	import Entities.Unit
	import net.flashpunk.FP
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	
	public class Bullet extends Entity
	{
		public var team:String; // left, right
		public var power:uint;
		public var target:*;
		public var speed:int;
		
		// core
		private var angle:Number;
		private var angleRadians:Number;
		
		// sprite
		protected var sprite:Spritemap;
		protected var source:Class;
		protected var frameWidth:uint;
		protected var frameHeight:uint;
		
		public function Bullet():void
		{
			type = "bullet";
			
			sprite = new Spritemap(source, frameWidth, frameHeight);
			setupAnimations();
			graphic = sprite;
			
			sprite.play("travel");
		}
		
		override public function update():void
		{
			x += (speed * FP.elapsed) * Math.cos(angleRadians);
			y -= (speed * FP.elapsed) * Math.sin(angleRadians);
			
			// destroy bullet if it goes out of bounds
			if (x > 400 || x < -50)
			{
				destroy();
			}
			
			else if (y > 275 || y < -50)
			{
				destroy();
			}
		}
		
		protected function setupAnimations():void
		{
			
		}
		
		public function setup(team:String, power:uint, x:int, y:int, targetX:int, targetY:int):void
		{
			this.team = team;
			this.power = power;
			this.target = target;
			
			if (team == "left")
			{
				setupLeft();
			}
			
			else
			{
				setupRight();
				sprite.flipped = true;
			}
			
			this.x = x;
			this.y = y;
			
			angle = FP.angle(this.x, this.y, targetX, targetY);
			angleRadians = angle * Math.PI / 180;
		}
		
		protected function setupRight():void
		{
			
		}
		
		protected function setupLeft():void
		{
			
		}
		
		public function hit():void
		{
			
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
		}
	}
}