package Entities.GUI
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Graphiclist;
	
	public class MouseOverInfo extends Entity
	{
		private var text:Text;
		private var box:Image;
		
		public function MouseOverInfo():void
		{
			text = new Text("", 0, 0, 400, 275);
			text.size = 6;
			text.font = "Wonder";
		}
		
		public function setup(string:String, x:int, y:int, length:int = 0, center:Boolean = true, color:Number = 0xFFFFFF, life:int = 0, sector:String = ""):void
		{
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
			
			
			if (life != 0)
			{
				string = "Base " + sector + ":   " + life + " HP";
				
				var percent:Number = (life / Core.ai.baseLife) * 100;
				
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
				
			}
			
			text.color = color; // default: white
			
			// box
			box = Image.createRect( (string.length * 6) + length, 10, 0x000000);
			
			graphic = new Graphiclist(box, text);
		}
		
		public function clear():void
		{
			graphic = null;
		}
	}
}