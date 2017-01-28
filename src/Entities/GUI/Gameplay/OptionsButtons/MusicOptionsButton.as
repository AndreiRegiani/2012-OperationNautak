package Entities.GUI.Gameplay.OptionsButtons
{
	import Entities.GUI.Gameplay.OptionsButton;
	import Worlds.Gameplay;
	import Worlds.Menu;
	import Worlds.Shop;
	
	public class MusicOptionsButton extends OptionsButton
	{
		public function MusicOptionsButton():void
		{
			string = "Music";
			setup(109, 16);
			updateButton(Core.music);
		}
		
		override public function click():void
		{
			Core.music = !Core.music;
			updateButton(Core.music);
			
			if (Core.music)
			{
				Gameplay.music.volume = 1;
				Shop.music.volume = 1;
				Menu.music.volume = 1;
			}
			
			else
			{
				Gameplay.music.volume = 0;
				Shop.music.volume = 0;
				Menu.music.volume = 0;
			}
			
			super.click();
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
	}
}