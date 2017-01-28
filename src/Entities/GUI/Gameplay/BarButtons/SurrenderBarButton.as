package Entities.GUI.Gameplay.BarButtons 
{
	import Entities.GUI.Gameplay.BarButton;
	
	import Worlds.Shop;
	
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	
	public class SurrenderBarButton extends BarButton
	{
		public var confirm:Boolean = false;
		
		public function SurrenderBarButton():void
		{
			string = "Surrender";
			super(67, 22, 10);
			
			pausable = false;
		}
		
		override public function update():void
		{
			super.update();
			
			if (confirm)
			{
				Core.overInfo.setup(" Press again to confirm or ESC to cancel.", 0, 253, 0, false, 0xF40000);
			}
		}
		
		override public function click():void
		{
			super.click();
			
			if (Core.paused && !confirm)
			{
				Core.paused = !Core.paused;
				Core.options.toggleVisibility();
			}
			
			if (!confirm)
			{
				confirm = true;
				
				Core.paused = !Core.paused;
				Core.options.toggleVisibility();
			}
			
			else // confirm is true
			{
				var blackTween:VarTween = new VarTween(changeWorld);
				addTween(blackTween);
				blackTween.tween(Core.black, "alpha", 1, 1.4, Ease.cubeIn);
				
				Core.paused = !Core.paused;
				Core.options.toggleVisibility();
				Core.black.visible = true;
				
				Core.bar.layer = -276;
				Core.bar.surrender.layer = -276;
				Core.bar.options.layer = -276;
				Core.bar.moreGames.layer = -276;
			}
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
		
		private function changeWorld():void
		{
			Core.gameplay.sound_siren.stop();
			Core.gameplay.removeAll();
			FP.world = new Shop(true);
		}
	}
}