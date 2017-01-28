package Entities.GUI.Gameplay
{
	import Entities.Bullets.MissileLauncherBullet;
	import Entities.GUI.Button;
	import Entities.Towers.SolarTower;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import Entities.Tower;
	import net.flashpunk.utils.Input;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	// Marines
	import Entities.Towers.Marines.SolarPanel;
	import Entities.Towers.Marines.AssaultTower;
	import Entities.Towers.Marines.MissileLauncher;
	import Entities.Towers.Marines.UltraBlast;
	
	// Nauks
	
	public class TowerButton extends Button
	{
		private var tower:String;
		private var spawn:Tower;
		
		// info
		private var name:String;
		public var energy:int;
		
		private var locked:Boolean;
		
		// icon
		private var image:Image;
		private var image_disabled:Image;
		
		public function TowerButton(tower:String, x:uint, y:uint):void
		{
			this.tower = tower;
			this.x = x;
			this.y = y;
			layer = -277;
			
			callback = click;
			overCall = over;
		}
		
		override public function update():void
		{
			updateIcon();
			checkShortcut();
			
			super.update();
		}
		
		override public function added():void
		{
			/**
			 * Marines
			 * 
			 **/
			
			// Solar Panel
			if (tower == "solar_panel")
			{
				image = new Image(Assets.SOLAR_PANEL_AVATAR);
				
				if (Data.solar_panel)
				{
					name = SolarPanel.name;
					energy = 0;
					
					image_disabled = new Image(Assets.SOLAR_PANEL_DISABLED);
				}
				
				else
				{
					image_disabled = new Image(Assets.MARINE_TOWER_LOCKED);
					locked = true;
				}
			}
			
			// Assault Tower
			else if (tower == "assault_tower")
			{
				image = new Image(Assets.ASSAULT_TOWER_AVATAR);
				
				if (Data.assault_tower)
				{
					name = AssaultTower.name;
					energy = AssaultTower.energy;
					
					image_disabled = new Image(Assets.ASSAULT_TOWER_DISABLED);
				}
				
				else
				{
					image_disabled = new Image(Assets.MARINE_TOWER_LOCKED);
					locked = true;
				}
			}
			
			// Missile Launcher
			else if (tower == "missile_launcher")
			{
				image = new Image(Assets.MISSILE_LAUNCHER_AVATAR);
				
				if (Data.missile_launcher)
				{
					name = MissileLauncher.name;
					energy = MissileLauncher.energy;
					
					image_disabled = new Image(Assets.MISSILE_LAUNCHER_DISABLED);
				}
				
				else
				{
					image_disabled = new Image(Assets.MARINE_TOWER_LOCKED);
					locked = true;
				}
			}
			
			// Ultra Blast
			else if (tower == "ultra_blast")
			{
				image = new Image(Assets.ULTRA_BLAST_AVATAR);
				
				if (Data.ultra_blast)
				{
					name = UltraBlast.name;
					energy = UltraBlast.energy;
					
					image_disabled = new Image(Assets.ULTRA_BLAST_DISABLED);
				}
				
				else
				{
					image_disabled = new Image(Assets.MARINE_TOWER_LOCKED);
					locked = true;
				}
			}
			
			
			/**
			 * Nauks
			 * 
			 **/
			
			
			// hitbox
			width = image.width;
			height = image.height;
			
			// graphics
			normal = image;
			hover = image;
			inactive = image_disabled;
			down = image_disabled;
			
			update();
		}
		
		private function click():void
		{
			// if already bought a tower and want to change (without pressing ESC)
			if ( Core.game.isDragging )
			{
				if (Core.game.draggingTower is SolarTower)
				{
					Core.game.money += SolarPanel.energy * Core.game.solarCounter;
				}
				
				else
				{
					Core.game.money += Core.game.draggingTower.energy;
				}
				
				world.remove(Core.game.draggingTower);
				Core.game.isDragging = false;
			}
			
			switch (tower)
			{
				// Marines
				case "solar_panel":
					spawn = new SolarPanel();
					break;
					
				case "assault_tower":
					spawn = new AssaultTower();
					break;
					
				case "missile_launcher":
					spawn = new MissileLauncher();
					break;
					
				case "ultra_blast":
					spawn = new UltraBlast();
					break;
					
				// Nauks
			}
			
			spawn.team = "left";
			spawn.setup();
			
			if (Core.game.money >= energy && Core.game.sector != "none" && !Core.game.isDragging && !Core.game.winner)
			{
				Core.game.money -= energy;
				Core.hud.updateHud();
				FP.world.add(spawn);
				
				Core.game.draggingTower = spawn;
				Core.game.isDragging = true;
				
				Core.overInfo.visible = false;
				
				// cursor
				Mouse.cursor = MouseCursor.HAND;
			}
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
		
		public function updateIcon():void
		{
			if (Core.game.emptyTowers > 0)
			{
				if (Core.game.money >= energy && !locked)
				{
					shouldCall = true;
				}
				
				else
				{
					shouldCall = false;
				}
			}
			
			else
			{
				shouldCall = false;
			}
		}
		
		private function checkShortcut():void
		{
			if ( Input.pressed(tower) && !locked && Core.game.emptyTowers > 0 )
			{
				click();
			}
		}
		
		private function over():void
		{	
			// first solar tower is free (starter)
			if (tower == "solar_panel" && Core.game.solarCounter == 0)
			{
				Core.overInfo.setup(" " + name + ":  STARTER", 0, 29, -8, false);
			}
			
			else
			{
				Core.overInfo.setup(" " + name + ":  " + energy, 0, 29, -8, false);
			}
		}
	}
}