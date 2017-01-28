package Entities.GUI.Gameplay 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Arrow extends Entity
	{
		// render
		private var image:Image;
		private var source:Class;
		
		// movement
		private var initial:int = 0;
		private var distance:int = 60;
		private var speed:int;
		
		public function Arrow(race:String):void
		{
			if (race == "Marines")
			{
				source = Assets.MARINES_ARROW;
			}
			
			else if (race == "Nauks")
			{
				source = Assets.NAUKS_ARROW;
			}
			
			image = new Image(source);
			
			updatePosition();
			Core.gameplay.baseInfo.setSector("B");
			
			graphic = image;
		}
		
		override public function update():void
		{
			if (x <= distance)
			{
				x += speed * FP.elapsed;
				image.alpha -= FP.elapsed;
			}
			
			else
			{
				reset();
			}
		}
		
		public function updatePosition():void
		{
			if (Core.game.winner)
			{
				y = 275;
				Core.gameplay.baseInfo.clear();
			}
			
			else
			{
				switch (Core.game.sector)
				{
					case "A":
						y = 63;
						break;
						
					case "B":
						y = 143;
						break;
						
					case "C":
						y = 223;
						break;
						
					default:
						y = 275;
				}
				
				Core.gameplay.baseInfo.setSector(Core.game.sector);
			}
			
			reset();
		}
		
		private function reset():void
		{
			speed = 60;
			image.alpha = 0.6;
			x = initial;
		}
	}
}