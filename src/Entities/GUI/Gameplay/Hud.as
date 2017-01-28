package Entities.GUI.Gameplay
{
	import Entities.GUI.Gameplay.TowerButton;
	import Entities.GUI.Gameplay.UnitButton;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	public class Hud extends Entity
	{
		// background
		private var background:Image;
		private var source:Class;
		
		// ui elements
		private var money:Text;
		
		// towers
		public var solar_tower:TowerButton;
		
		
		public function Hud(race:String):void
		{
			switch (race)
			{
				case "Marines":
					marines();
					break;
					
				case "Nauks":
					nauks();
					break;
			}
			
			background = new Image(source);
			
			updateHud();
		}
		
		public function updateHud():void
		{
			if (Core.game.money >= 5000)
			{
				Core.game.money = 5000;
				
				// money
				money = new Text("  " + Core.game.money, 334, 9);
				money.size = 16;
				money.color = 0xFF0000;
				
			}
			
			// normal
			else
			{
				// money
				money = new Text("  " + Core.game.money, 334, 9);
				money.size = 16;
				money.color = 0xFFFFFF;
			}
			
			graphic = new Graphiclist(background, money);
		}
		
		private function marines():void
		{
			source = Assets.MARINES_HUD;
			
			// add towers' button
			
			solar_tower = new TowerButton("solar_panel", 5, 4);
			FP.world.add(solar_tower);
			
			var assault_tower:TowerButton = new TowerButton("assault_tower", 31, 4);
			FP.world.add(assault_tower);
			
			var missile_launcher:TowerButton = new TowerButton("missile_launcher", 57, 4);
			FP.world.add(missile_launcher);
			
			var ultra_blast:TowerButton = new TowerButton("ultra_blast", 83, 4);
			FP.world.add(ultra_blast);
			
			
			// add units' button
			
			var pistol:UnitButton = new UnitButton("pistol", 117, 4);
			FP.world.add(pistol);
			
			var eagle:UnitButton = new UnitButton("eagle", 143, 4);
			FP.world.add(eagle);
			
			var smg:UnitButton = new UnitButton("smg", 169, 4);
			FP.world.add(smg);
			
			var medic:UnitButton = new UnitButton("medic", 195, 4);
			FP.world.add(medic);
			
			var assault:UnitButton = new UnitButton("assault", 221, 4);
			FP.world.add(assault);
			
			var sniper:UnitButton = new UnitButton("sniper", 247, 4);
			FP.world.add(sniper);
			
			var machine:UnitButton = new UnitButton("machine", 273, 4);
			FP.world.add(machine);
			
			var bazooka:UnitButton = new UnitButton("bazooka", 299, 4);
			FP.world.add(bazooka);
		}
		
		private function nauks():void
		{
			source = Assets.NAUKS_HUD;
		}
	}
}