package Entities.AI
{
	import Entities.Ai;
	import Entities.Bullets.MissileLauncherBullet;
	
	import Entities.Towers.Marines.AssaultTower;
	import Entities.Towers.Marines.MissileLauncher;
	import Entities.Towers.Marines.SolarPanel;
	import Entities.Towers.Marines.UltraBlast;
	
	import Entities.Units.Marine;
	import Entities.Units.Marines.Assault;
	import Entities.Units.Marines.Bazooka;
	import Entities.Units.Marines.Eagle;
	import Entities.Units.Marines.Machine;
	import Entities.Units.Marines.Medic;
	import Entities.Units.Marines.Pistol;
	import Entities.Units.Marines.Smg;
	import Entities.Units.Marines.Sniper;
	
	import flash.utils.getTimer;
	
	import net.flashpunk.FP;
	
	
	public class MarinesAI extends Ai
	{	
		public function MarinesAI():void
		{
			
		}
		
		override protected function sendUnit():void
		{
			var maxLevel:uint = 0; // best unit AI could send, but we send a random unit limited to what AI can buy 
			
			
			// pistol
			if (unit1 && money >= Pistol.energy)
			{
				maxLevel++;
			}
			
			// eagle
			if (unit2 && money >= Eagle.energy)
			{
				maxLevel++;
			}
			
			// smg
			if (unit3 && money >= Smg.energy)
			{
				maxLevel++;
			}
			
			// medic
			if (unit4 && money >= Medic.energy)
			{
				maxLevel++;
			}
			
			// assault
			if (unit5 && money >= Assault.energy)
			{
				maxLevel++;
			}
			
			// sniper
			if (unit6 && money >= Sniper.energy)
			{
				maxLevel++;
			}
			
			// machine
			if (unit7 && money >= Machine.energy)
			{
				maxLevel++;
			}
			
			// bazooka
			if (unit8 && money >= Bazooka.energy)
			{
				maxLevel++;
			}
			
			
			// cannot buy any unit
			if (maxLevel == 0)
			{
				return;
			}
			
			var random:uint = FP.rand(maxLevel + 1);

			switch(random)
			{
				// pistol
				case 0:
				case 1: 
					spawn = new Pistol();
					break;
					
				// eagle
				case 2:
					spawn = new Eagle();
					break;
					
				// smg
				case 3:
					spawn = new Smg();
					break;
					
				// medic
				case 4:
					spawn = new Medic();
					break;
					
				// assault
				case 5:
					spawn = new Assault();
					break;
					
				// sniper
				case 6:
					spawn = new Sniper();
					break;
					
				// machine
				case 7:
					spawn = new Machine();
					break;
					
				// bazooka
				case 8:
					spawn = new Bazooka();
					break;
			}
			
			super.sendUnit();
		}
		
		override protected function buildTower():void
		{
			if (!placedFirstSolar)
			{
				tower = new SolarPanel();
				
				// add to solar list array
				solarList.push(tower);
			}
			
			else
			{
				if (buildSolarTimer >= buildSolarInterval)
				{
					if (tower1 && money >= (SolarPanel.energy * solarCounter) )
					{
						tower = new SolarPanel();
						solarList.push(tower);
						
						buildTowerMaxTime = 25;
						buildSolarMaxTime = 50;
						
						buildSolarTimer = 0.0;
						buildSolarInterval = Math.random() * buildSolarMaxTime;
					}
				}
				
				else
				{
					if (tower4 && money >= UltraBlast.energy)
					{
						tower = new UltraBlast();
						
						if (Data.level == 1)
						{
							buildTowerMaxTime = 55;
							buildSolarMaxTime = 28;
						}
						
						else
						{
							buildTowerMaxTime = 33;
							buildSolarMaxTime = 12;
						}
					}
					
					else if (tower3 && money >= MissileLauncher.energy)
					{
						tower = new MissileLauncher();
						
						if (Data.level == 1)
						{
							buildTowerMaxTime = 55;
							buildSolarMaxTime = 28;
						}
						
						else
						{
							buildTowerMaxTime = 33;
							buildSolarMaxTime = 12;
						}
					}
					
					else if (tower2 && money >= AssaultTower.energy)
					{
						tower = new AssaultTower();
						
						if (Data.level == 1)
						{
							buildTowerMaxTime = 55;
							buildSolarMaxTime = 28;
						}
						
						else
						{
							buildTowerMaxTime = 33;
							buildSolarMaxTime = 12;
						}
					}
				}
			}
			
			super.buildTower();
		}
	}
}