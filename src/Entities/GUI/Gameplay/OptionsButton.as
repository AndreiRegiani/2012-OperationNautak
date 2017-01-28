package Entities.GUI.Gameplay 
{
	import Entities.GUI.Button;
	import net.flashpunk.graphics.Text;
	
	public class OptionsButton extends Button
	{
		protected var string:String;
		private var stateString:String;
		
		protected var size:uint = 12;
		private const FONT:String = "Wonder";
		
		// Colors
		private const WHITE:uint = 0xDDDDDD;
		private const YEALLOW:uint = 0xFFFF00;
		
		public function OptionsButton():void
		{
			callback = click;
		}
		
		public function setup(width:int, height:int, originX:uint = 0, originY:uint = 0):void
		{
			// hitbox
			this.width = width;
			this.height = height;
			this.originX = originX;
			this.originY = originY;
		}
		
		protected function updateButton(state:Boolean):void
		{
			if (state)
			{
				stateString = "ON";
			}
			
			else
			{
				stateString = "OFF";
			}
			
			var text:Text = new Text(string + ": " + stateString, 0, 0, 400, 275);
			text.size = size;
			text.font = FONT;
			text.color = WHITE;
			
			var text_hover:Text = new Text(string + ": " + stateString, 0, 0, 400, 275);
			text_hover.size = size;
			text_hover.font = FONT;
			text_hover.color = YEALLOW;
			
			normal = text;
			hover = text_hover;
			down = text;
		}
		
		public function click():void
		{
			
		}
	}
}