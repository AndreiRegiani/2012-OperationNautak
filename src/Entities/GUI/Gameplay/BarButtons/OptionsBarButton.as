package Entities.GUI.Gameplay.BarButtons 
{
	import Entities.GUI.Gameplay.BarButton;
	
	public class OptionsBarButton extends BarButton
	{
		public function OptionsBarButton():void
		{
			string = "Pause  /  Options";
			super(84, 22);
			
			pausable = false; 
		}
		
		override public function click():void
		{
			super.click();
			
			Core.options.toggleVisibility();
			Core.paused = !Core.paused;
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
	}
}