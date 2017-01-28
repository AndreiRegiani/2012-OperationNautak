package Entities.GUI.Gameplay.OptionsButtons
{
	import Entities.GUI.Gameplay.OptionsButton;
	
	public class AutoCollectOptionsButton extends OptionsButton
	{
		public function AutoCollectOptionsButton():void
		{
			string = "Auto Collect Solar";
			setup(128, 10);
			size = 6;
			updateButton(Core.autoCollectSolar);
		}
		
		override public function click():void
		{
			Core.autoCollectSolar = !Core.autoCollectSolar;
			updateButton(Core.autoCollectSolar);
			
			super.click();
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
	}
}