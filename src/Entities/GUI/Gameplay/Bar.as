package Entities.GUI.Gameplay
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	// buttons
	import Entities.GUI.Gameplay.BarButtons.SurrenderBarButton;
	import Entities.GUI.Gameplay.BarButtons.OptionsBarButton;
	import Entities.GUI.Gameplay.BarButtons.MoreGamesBarButton;
	
	public class Bar extends Entity
	{
		private var background:Image;
		private var source:Class;
		
		// items
		public var surrender:SurrenderBarButton;
		public var options:OptionsBarButton;
		public var moreGames:MoreGamesBarButton;
		
		public function Bar(race:String):void
		{
			switch (race)
			{
				case "Marines":
					source = Assets.MARINES_BAR;
					break;
					
				case "Nauks":
					source = Assets.NAUKS_BAR;
					break;
			}
			
			background = new Image(source);
			graphic = background;
		}
		
		override public function added():void
		{
			// Surrender Button
			surrender = new SurrenderBarButton();
			surrender.x = 10;
			surrender.y = 264;
			surrender.layer = layer;
			FP.world.add(surrender);
			
			// Options Button
			options = new OptionsBarButton();
			options.x = 154;
			options.y = 264;
			options.layer = layer;
			FP.world.add(options);
			
			// More Games Button (sponsor)
			moreGames = new MoreGamesBarButton();
			moreGames.x = 325;
			moreGames.y = 264;
			moreGames.layer = layer;
			FP.world.add(moreGames);
		}
		
		public function updateLayer():void
		{
			layer = -1001;
			
			if (Data.level == 1)
			{
				Core.gameplay.tutorial.layer = -1002;
			}
			
			surrender.layer = layer;
			options.layer = layer;
			moreGames.layer = layer;
		}
	}
}