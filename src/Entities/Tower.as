package Entities
{
	import net.flashpunk.Sfx;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	
	public class Tower extends Entity
	{
		// info
		public var team:String; // left, right
		public var energy:uint;
		public var offensive:Boolean;
		
		// sprite
		public var sprite:Spritemap;
		protected var source:Class;
		
		public var frameWidth:uint = 0;
		public var frameHeight:uint = 0;
		
		public var offsetX:int = 0;
		public var offsetY:int = 0;
		
		// core
		public var isPlaced:Boolean = false;
		
		// sound
		public var place_sfx:Sfx;
		protected var place_source:Class;
		
		public function Tower():void
		{
			type = "tower";
			
			// hitbox
			width = 27;
			height = 16;
			originX = offsetX;
			originY = offsetY;
			
			layer = -1010;
		}
		
		public function setup():void
		{
			if (team == "left")
			{
				setupLeft();
			}
			
			else if (team == "right")
			{
				setupRight();
			}
			
			// graphics
			sprite = new Spritemap(source, frameWidth, frameHeight);
			graphic = sprite;
			
			setupAnimations();
			
			// sounds
			place_sfx = new Sfx(place_source);
		}
		
		override public function update():void
		{
			if (!isPlaced)
			{
				drag();
			}
			
			else if (!Core.game.winner || Core.game.winner == team)
			{
				actions();
			}
		}
		
		protected function drag():void
		{
			x = FP.world.mouseX - (frameWidth / 2);
			y = FP.world.mouseY - (frameHeight / 2);
			sprite.alpha = 0.4;
			
			// show help box
			Core.overInfo.setup("Press [ ESC ] to cancel", 0, 29, -17, false);
		}
		
		public function placing():void
		{
			sprite.alpha = 1;
		}
		
		protected function actions():void
		{

		}
		
		protected function setupAnimations():void
		{
			sprite.add("normal", [0], 0, false);
			sprite.play("normal");
		}
		
		protected function setupLeft():void
		{
			
		}
		
		protected function setupRight():void
		{
			
		}
	}
}