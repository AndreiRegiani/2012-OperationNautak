package Entities
{
	import Entities.Towers.SolarTower;
	import Entities.Towers.Marines.SolarPanel;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class TowerSlot extends Entity
	{
		public var team:String; // left, right
		public var empty:Boolean = true;
		
		// render
		private var emptySpot:Image;
		
		public function TowerSlot(team:String):void
		{
			this.team = team;
			
			// hitbox
			width = 27;
			height = 16;
		}
		
		override public function added():void
		{
			emptySpot = new Image(Assets.EMPTY_SPOT);
		}
		
		override public function update():void
		{
			checkCollisions();
		}
		
		private function checkCollisions():void
		{
			if (Core.game.isDragging && team == "left" && empty)
			{
				graphic = emptySpot;
				
				if ( collidePoint(x, y, FP.world.mouseX, FP.world.mouseY) )
				{
					Core.game.draggingTower.x = x;
					Core.game.draggingTower.y = y + Core.game.draggingTower.offsetY;
					Core.game.draggingTower.placing();
					
					if ( Input.mouseReleased )
					{
						Core.game.draggingTower.layer = -y;
						Core.game.isDragging = false;
						Core.game.draggingTower.isPlaced = true;
						Core.game.draggingTower.team = "left";
						Core.game.emptyTowers--;
						
						empty = false;
						
						// sound
						Core.game.draggingTower.place_sfx.play(Core.vol);
						
						if (Core.game.draggingTower is SolarTower)
						{
							Core.game.solarCounter++;
							Core.hud.solar_tower.energy = SolarPanel.energy * Core.game.solarCounter + (Data.level * SolarPanel.extra_energy);;
						}
						
						Core.overInfo.visible = true;
						
						// cursor
						Mouse.cursor = MouseCursor.ARROW;
					}
				}
		
			}
			
			else if ( collidePoint(x, y, FP.world.mouseX, FP.world.mouseY) && team == "left" && empty)
			{
				graphic = emptySpot;
				
				// if (Data.level == 1)
				// {
				//	  Core.overInfo.setup("Select a tower to build", 0, 29, -8, false);
				// }
			}
			
			else
			{
				graphic = null;
			}
		}
	}
}