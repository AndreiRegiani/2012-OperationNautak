package Entities.GUI.Gameplay.BarButtons 
{
	import Entities.GUI.Gameplay.BarButton;
	
	public class MoreGamesBarButton extends BarButton
	{
		public function MoreGamesBarButton():void
		{
			string = "More Games";
			super(75, 22);
			
			pausable = false;
		}
		
		override public function click():void
		{
			Utils.openURL(Core.sponsor_url);
			Utils.sound_click.play(Core.vol);
			
			super.click();
		}
	}
}