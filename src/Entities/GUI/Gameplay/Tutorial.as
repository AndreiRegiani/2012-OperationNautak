package Entities.GUI.Gameplay
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.utils.Input;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class Tutorial extends Entity
	{
		// Pages
		private var page1:Image;
		private var page2:Image;
		private var page3:Image;
		private var page4:Image;
		
		// core
		private var counter:uint = 1;
		
		public function Tutorial():void
		{
			
		}
		
		public override function added():void
		{
			super.added();
			
			page1 = new Image(Assets.TUTORIAL_1);
			page2 = new Image(Assets.TUTORIAL_2);
			page3 = new Image(Assets.TUTORIAL_3);
			page4 = new Image(Assets.TUTORIAL_4);
			
			updatePage();
			
			graphic = new Graphiclist(page1, page2, page3, page4);
			
			Core.paused = true;
		}
		
		public override function update():void
		{
			if (Input.mouseReleased)
			{
				counter++;
				updatePage();
				
				// Sound
				Utils.sound_click.play(Core.vol);
			}
		}
		
		private function updatePage():void
		{
			switch (counter)
			{
				case 1:
					page2.visible = false;
					page3.visible = false;
					page4.visible = false;
					break;
				
				case 2:
					page1.visible = false;
					page2.visible = true;
					break;
					
				case 3:
					page2.visible = false;
					page3.visible = true;
					break;
					
				case 4:
					page3.visible = false;
					page4.visible = true;
					break;
					
				case 5:
					Core.gameplay.tutorialActive = false;
					Core.gameplay.sound_siren.play(Core.vol);
					
					Core.arrow.visible = true;
					Core.paused = false;
					Mouse.cursor = MouseCursor.ARROW;
					Core.gameplay.baseInfo.visible = true;
					
					FP.world.remove(this);
					break;
			}
		}
	}
}