package Entities.GUI.Gameplay
{
	import Entities.GUI.Button;
	import Entities.Unit;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	// Marines
	import Entities.Units.Marines.Pistol;
	import Entities.Units.Marines.Eagle;
	import Entities.Units.Marines.Smg;
	import Entities.Units.Marines.Medic;
	import Entities.Units.Marines.Assault;
	import Entities.Units.Marines.Sniper;
	import Entities.Units.Marines.Machine;
	import Entities.Units.Marines.Bazooka;
	
	// Nauks
	
	public class UnitButton extends Button
	{
		private var unit:String;
		private var spawn:Unit;
		
		// info
		private var name:String;
		private var energy:uint;
		
		private var locked:Boolean;
		
		// icon
		private var image:Image;
		private var image_disabled:Image;
		
		public function UnitButton(unit:String, x:uint, y:uint):void
		{
			this.unit = unit;
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
			
			// Pistol
			if (unit == "pistol")
			{
				image = new Image(Assets.PISTOL_AVATAR);
				
				if (Data.pistol)
				{
					name = Pistol.name;
					energy = Pistol.energy;
					
					image_disabled = new Image(Assets.PISTOL_DISABLED);
				}
				
				else
				{
					image_disabled = new Image(Assets.MARINE_UNIT_LOCKED);
					locked = true;
				}
			}
			
			// Eagle
			else if (unit == "eagle")
			{
				image = new Image(Assets.EAGLE_AVATAR);
				
				if (Data.eagle)
				{
					name = Eagle.name;
					energy = Eagle.energy;
					
					image_disabled = new Image(Assets.EAGLE_DISABLED);
				}
				
				else
				{
					image_disabled = new Image(Assets.MARINE_UNIT_LOCKED);
					locked = true;
				}
			}
			
			// Smg
			else if (unit == "smg")
			{
				image = new Image(Assets.SMG_AVATAR);
				
				if (Data.smg)
				{
					name = Smg.name;
					energy = Smg.energy;
					
					image_disabled = new Image(Assets.SMG_DISABLED);
				}
				
				else
				{
					image_disabled = new Image(Assets.MARINE_UNIT_LOCKED);
					locked = true;
				}
			}
			
			// Medic
			else if (unit == "medic")
			{
				image = new Image(Assets.MEDIC_AVATAR);
				
				if (Data.medic)
				{
					name = Medic.name;
					energy = Medic.energy;
					
					image_disabled = new Image(Assets.MEDIC_DISABLED);
				}
				
				else
				{
					image_disabled = new Image(Assets.MARINE_UNIT_LOCKED);
					locked = true;
				}
			}
			
			// Assault
			else if (unit == "assault")
			{
				image = new Image(Assets.ASSAULT_AVATAR);
				
				if (Data.assault)
				{
					name = Assault.name;
					energy = Assault.energy;
					
					image_disabled = new Image(Assets.ASSAULT_DISABLED);
				}
				
				else
				{
					image_disabled = new Image(Assets.MARINE_UNIT_LOCKED);
					locked = true;
				}
			}
			
			// Sniper
			else if (unit == "sniper")
			{
				image = new Image(Assets.SNIPER_AVATAR);
				
				if (Data.sniper)
				{
					name = Sniper.name;
					energy = Sniper.energy;
					
					image_disabled = new Image(Assets.SNIPER_DISABLED);
				}
				
				else
				{
					image_disabled = new Image(Assets.MARINE_UNIT_LOCKED);
					locked = true;
				}
			}
			
			// Machine
			else if (unit == "machine")
			{
				image = new Image(Assets.MACHINE_AVATAR);
				
				if (Data.machine)
				{
					name = Machine.name;
					energy = Machine.energy;
					
					image_disabled = new Image(Assets.MACHINE_DISABLED);
				}
				
				else
				{
					image_disabled = new Image(Assets.MARINE_UNIT_LOCKED);
					locked = true;
				}
			}
			
			// Bazooka
			else if (unit == "bazooka")
			{
				image = new Image(Assets.BAZOOKA_AVATAR);
				
				if (Data.bazooka)
				{
					name = Bazooka.name;
					energy = Bazooka.energy;
					
					image_disabled = new Image(Assets.BAZOOKA_DISABLED);
				}
				
				else
				{
					image_disabled = new Image(Assets.MARINE_UNIT_LOCKED);
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
			switch (unit)
			{
				// Marines
				case "pistol":
					spawn = new Pistol();
					break;
					
				case "eagle":
					spawn = new Eagle();
					break;
					
				case "smg":
					spawn = new Smg();
					break;
					
				case "medic":
					spawn = new Medic();
					break;
					
				case "assault":
					spawn = new Assault();
					break;
					
				case "sniper":
					spawn = new Sniper();
					break;
					
				case "machine":
					spawn = new Machine();
					break;
					
				case "bazooka":
					spawn = new Bazooka();
					break;
					
				// Nauks
			}
			
			if (Core.game.money >= energy && Core.game.sector != "none" && !Core.game.winner)
			{
				Core.game.money -= energy;
				Core.hud.updateHud();
				
				spawn.setup("left", Core.game.sector);
				FP.world.add(spawn);
				
				// AI - add force to sector (used to determine the best sector the AI to send units)
				switch (spawn.sector)
				{
					case "A":
						Core.game.forceA += spawn.force;
						break;
						
					case "B":
						Core.game.forceB += spawn.force;
						break;
						
					case "C":
						Core.game.forceC += spawn.force;
						break;
				}
			}
			
		}
		
		public function updateIcon():void
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
		
		private function checkShortcut():void
		{
			if ( Input.pressed(unit) && !locked )
			{
				click();
			}
		}
		
		private function over():void
		{
			Core.overInfo.setup(" " + name + ":  " + energy, FP.world.mouseX, 29, -8);
		}
	}
}