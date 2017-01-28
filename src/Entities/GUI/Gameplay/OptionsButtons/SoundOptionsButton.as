package Entities.GUI.Gameplay.OptionsButtons
{
	import Entities.GUI.Gameplay.OptionsButton;
	
	public class SoundOptionsButton extends OptionsButton
	{
		public function SoundOptionsButton():void
		{
			string = "Sound";
			setup(109, 16);
			updateButton(Core.sound);
		}
		
		override public function click():void
		{
			Core.sound = !Core.sound;
			updateButton(Core.sound);
			
			if (Core.sound)
			{
				Core.vol = 1;
				Core.gameplay.sound_siren.volume = 1;
			}
			
			else
			{
				Core.vol = 0;
				Core.gameplay.sound_siren.volume = 0;
			}
			
			super.click();
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
	}
}