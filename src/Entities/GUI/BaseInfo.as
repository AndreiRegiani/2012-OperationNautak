package Entities.GUI
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Graphiclist;
	
	public class BaseInfo extends Entity
	{
		private var text:Text;
		private var box:Image;
		
		public function BaseInfo():void
		{
			text = new Text("", 0, 0, 400, 275);
			text.size = 6;
			text.font = "Wonder";
		}
		
		public function setup(string:String, x:int, y:int, length:int = 0, center:Boolean = true, life:int = 0):void
		{
			string += life + " HP";
			
			if (center)
			{
				this.x = x - string.length * 3;
			}
			
			else
			{
				this.x = x;
			}
			
			this.y = y;

			// text
			text.text = string;
			
			// color
			var color:Number;
			var percent:Number = (life / Data.baseLife) * 100;
			
			// green
			if (percent >= 80)
			{
				color = 0xA7F318;
			}
			
			// yellow
			else if (percent >= 60)
			{
				color = 0xF5EB23;
			}
			
			// orange
			else if (percent >= 40)
			{
				color = 0xFA8503;
			}
			
			// red
			else
			{
				color = 0xD51111;
			}
			
			text.color = color;
			
			// box
			box = Image.createRect( (string.length * 6) + length, 10, 0x000000);
			
			graphic = new Graphiclist(box, text);
		}
		
		public function setSector(sector:String):void
		{
			switch(sector)
			{
				case "A":
					setup("Base " + sector + ":   ", 0, 39, -15, false, Core.game.playerBaseA.life);
					break;
					
				case "B":
					setup("Base " + sector + ":   ", 0, 119, -15, false, Core.game.playerBaseB.life);
					break;
					
				case "C":
					setup("Base " + sector + ":   ", 0, 199, -15, false, Core.game.playerBaseC.life);
					break;
			}
		}
		
		public function clear():void
		{
			graphic = null;
		}
	}
}