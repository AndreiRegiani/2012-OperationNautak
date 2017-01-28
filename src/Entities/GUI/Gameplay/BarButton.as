package Entities.GUI.Gameplay 
{
	import Entities.GUI.Button;
	import net.flashpunk.graphics.Text;
	
	public class BarButton extends Button
	{
		protected var string:String;
		
		private const SIZE:uint = 6;
		private const FONT:String = "Wonder";
		
		// Colors
		private const WHITE:uint = 0xDDDDDD;
		private const YEALLOW:uint = 0xFFFF00;
		
		public function BarButton(width:int, height:int, originX:uint = 0, originY:uint = 0):void
		{
			var text:Text = new Text(string);
			text.size = SIZE;
			text.font = FONT;
			text.color = WHITE;
			
			var text_hover:Text = new Text(string);
			text_hover.size = SIZE;
			text_hover.font = FONT;
			text_hover.color = YEALLOW;
			
			normal = text;
			hover = text_hover;
			down = text;
			
			callback = click;
			
			// hitbox
			this.width = width;
			this.height = height;
			this.originX = originX;
			this.originY = originY;
		}
		
		public function click():void
		{
			
		}
	}
}