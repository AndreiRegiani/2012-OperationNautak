package Entities
{
	import Entities.Tower;
	import Entities.Towers.Marines.SolarPanel;
	import Entities.Towers.SolarTower;
	import Entities.Unit;
	
	import flash.utils.getTimer;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	public class Ai extends Entity
	{
		// stats
		public var baseLife:uint;
		
		// max time to perform actions, to feel natural, as an human playing. values in seconds
		private var sendUnitMaxTime:int = 10;
		protected var buildTowerMaxTime:int = 10;
		private var collectSolarMaxTime:int = 3.0;
		protected var buildSolarMaxTime:int = 0;
		private var sendInactiveSectorMaxTime:int = 6;
		
		// core
		protected var money:int = 200; // initial money
		protected var spawn:Unit = null;
		protected var tower:Tower = null;
		
		protected var sector:String; // A, B, C
		protected var slot:TowerSlot; // 1 to 12
		
		private var emptyTowerSlots:uint = 12;
		protected var solarCounter:int = 0;
		protected var squadSize:uint = 0;
		protected var squadMaxValue:int = 40;
		protected var placedFirstSolar:Boolean = false;
		
		// arrays
		protected var solarList:Array = new Array();
		
		
		// timers
		
		// send unit
		private var sendUnitTimer:Number = 0.0;
		protected var sendUnitInterval:Number = 5.0 + (Math.random() * 3.0);
		
		// build tower
		private var buildTowerTimer:Number = 0.0;
		private var buildTowerInterval:Number = ( 4.0 * Math.random() ) + 1; // initial value: time to place first solar
		
		// collect solar
		private var collectSolarTimer:Number = 0.0;
		private var collectSolarInterval:Number = 0.0;
		
		// build solar
		protected var buildSolarTimer:Number = 0.0;
		protected var buildSolarInterval:Number = 0.0;
		
		// send inactive unit to sector
		private var inactiveSectorTimer:Number = 0.0;
		private var inactiveSectorInterval:Number = 25;
		
		
		
		// towers acquisition
		protected var tower1:Boolean;
		protected var tower2:Boolean;
		protected var tower3:Boolean;
		protected var tower4:Boolean;
		
		// units acquisition
		protected var unit1:Boolean;
		protected var unit2:Boolean;
		protected var unit3:Boolean;
		protected var unit4:Boolean;
		protected var unit5:Boolean;
		protected var unit6:Boolean;
		protected var unit7:Boolean;
		protected var unit8:Boolean;
		
		
		public function Ai():void
		{
			setup();
			levelSpecifics();
		}
		
		private function setup():void
		{
			if (Data.cheatMode == false)
			{
				baseLife = Core.currentLevel.baseLife;
				
				tower1 = Core.currentLevel.tower1;
				tower2 = Core.currentLevel.tower2;
				tower3 = Core.currentLevel.tower3;
				tower4 = Core.currentLevel.tower4;
				
				unit1 = Core.currentLevel.unit1;
				unit2 = Core.currentLevel.unit2;
				unit3 = Core.currentLevel.unit3;
				unit4 = Core.currentLevel.unit4;
				unit5 = Core.currentLevel.unit5;
				unit6 = Core.currentLevel.unit6;
				unit7 = Core.currentLevel.unit7;
				unit8 = Core.currentLevel.unit8;
			}
			
			else
			{
				baseLife = Core.currentLevel.baseLife + 3000;
				
				tower1 = true;
				tower2 = true;
				tower3 = true;
				tower4 = true;
				
				unit1 = true;
				unit2 = true;
				unit3 = true;
				unit4 = true;
				unit5 = true;
				unit6 = true;
				unit7 = true;
				unit8 = true;
			}
		}
		
		private function levelSpecifics():void
		{
			if (Data.level == 1)
			{
				money = -200;
				squadMaxValue = 70;
			}
			
			else if (Data.level == 2)
			{
				money = 0;
				squadMaxValue = 50;
			}
			
			else if (Data.level == 3)
			{
				money = 0;
				squadMaxValue = 50;
			}
		}
		
		override public function update():void
		{
			if (!Core.game.winner && !Core.gameplay.tutorialActive)
			{
				actions();
			}
		}
		
		protected function actions():void
		{
			// trace("Tower: " + buildTowerTimer + " / " + buildTowerInterval + " --- Solar: " + buildSolarTimer + " / " + buildSolarInterval);
			
			// collectSolar
			if (collectSolarTimer >= collectSolarInterval)
			{
				collectSolar();
				collectSolarTimer = 0.0;
				
				collectSolarInterval = (Math.random() * collectSolarMaxTime) + 6.0;
			}
			
			// buildTower
			if (buildTowerTimer >= buildTowerInterval && emptyTowerSlots >= 1)
			{
				buildTower();
			}
			
			// sendUnit
			if (sendUnitTimer >= sendUnitInterval)
			{
				calculateSectorForce();
				squadForce();
				
				var squad:uint = 1 + FP.rand(squadSize);
				
				for (var i:uint = 0; i <= squad; i++)
				{
					sendUnit();
				}
				
				sendUnitTimer = 0.0;
				
				// randomize next interval to send unit
				sendUnitInterval = Math.random() * sendUnitMaxTime;
			}
			
			// inactive sector send unit
			if (inactiveSectorTimer >= inactiveSectorInterval)
			{
				sendInactiveSector();
				
				inactiveSectorTimer = 0.0;
				inactiveSectorInterval = Math.random() * sendInactiveSectorMaxTime;
			}
			
			// strategies
			ajustBehavior();
			
			// tic-tac
			sendUnitTimer += FP.elapsed;
			buildTowerTimer += FP.elapsed;
			collectSolarTimer += FP.elapsed;
			buildSolarTimer += FP.elapsed;
			inactiveSectorTimer += FP.elapsed;
		}
		
		private function calculateSectorForce():void
		{
			// base status
			
			// player
			var playerA:Boolean = Core.game.playerBaseA.destroyed;
			var playerB:Boolean = Core.game.playerBaseB.destroyed;
			var playerC:Boolean = Core.game.playerBaseC.destroyed;
			
			// enemy
			var enemyA:Boolean = Core.game.enemyBaseA.destroyed;
			var enemyB:Boolean = Core.game.enemyBaseB.destroyed;
			var enemyC:Boolean = Core.game.enemyBaseC.destroyed;
			
			
			// % 50 of time will send units randomly (AI choosing a sector to attack by itself)
			
			// to avoid the match to stay only on a single sector
			if (FP.rand(1) == 0 && !Core.game.winner)
			{
				var ok:Boolean = false;
				var tries:uint = 3;
				
				while (!ok && tries >= 1)
				{
					sector = FP.choose("A", "B", "C");
					
					if (sector == "A")
					{
						if (!playerA && !enemyA)
						{
							ok = true;
						}
					}
					
					else if (sector == "B")
					{
						if (!playerB && !enemyB)
						{
							ok = true;
						}
					}
					
					else if (sector == "C")
					{
						if (!playerC && !enemyC)
						{
							ok = true;
						}
					}
					
					tries--;
				}
				
				return;
			}
			
			// % 50 of time will send units to defend
			
			// sector A
			if (!playerA && !enemyA)
			{
				if (Core.game.forceA >= Core.game.forceB && Core.game.forceA >= Core.game.forceC)
				{
					sector = "A";
				}
			}
				
			// sector B
			if (!playerB && !enemyB)
			{
				if (Core.game.forceB >= Core.game.forceA && Core.game.forceB >= Core.game.forceC)
				{
					sector = "B";
				}
			}
				
			// sector C
			if (!playerC && !enemyC)
			{
				if (Core.game.forceC >= Core.game.forceA && Core.game.forceC >= Core.game.forceB)
				{
					sector = "C";
				}
			}
		}
		
		private function selectTowerSlot():void
		{
			// offensive towers are placed in front
			if (tower.offensive)
			{
				if (Core.game.enemySlot1.empty)
				{
					slot = Core.game.enemySlot1;
				}
				
				else if (Core.game.enemySlot7.empty)
				{
					slot = Core.game.enemySlot7;
				}
				
				else if (Core.game.enemySlot2.empty)
				{
					slot = Core.game.enemySlot2;
				}
				
				else if (Core.game.enemySlot8.empty)
				{
					slot = Core.game.enemySlot8;
				}
				
				else if (Core.game.enemySlot3.empty)
				{
					slot = Core.game.enemySlot3;
				}
				
				else if (Core.game.enemySlot9.empty)
				{
					slot = Core.game.enemySlot9;
				}
				
				else if (Core.game.enemySlot4.empty)
				{
					slot = Core.game.enemySlot4;
				}
				
				else if (Core.game.enemySlot10.empty)
				{
					slot = Core.game.enemySlot10;
				}
				
				else if (Core.game.enemySlot5.empty)
				{
					slot = Core.game.enemySlot5;
				}
				
				else if (Core.game.enemySlot11.empty)
				{
					slot = Core.game.enemySlot11;
				}
				
				else if (Core.game.enemySlot6.empty)
				{
					slot = Core.game.enemySlot6;
				}
				
				else if (Core.game.enemySlot12.empty)
				{
					slot = Core.game.enemySlot12;
				}
			}
			
			else // not offensive tower are placed behind
			{
				if (Core.game.enemySlot12.empty)
				{
					slot = Core.game.enemySlot12;
				}
				
				else if (Core.game.enemySlot6.empty)
				{
					slot = Core.game.enemySlot6;
				}
				
				else if (Core.game.enemySlot11.empty)
				{
					slot = Core.game.enemySlot11;
				}
				
				else if (Core.game.enemySlot5.empty)
				{
					slot = Core.game.enemySlot5;
				}
				
				else if (Core.game.enemySlot10.empty)
				{
					slot = Core.game.enemySlot10;
				}
				
				else if (Core.game.enemySlot4.empty)
				{
					slot = Core.game.enemySlot4;
				}
				
				else if (Core.game.enemySlot9.empty)
				{
					slot = Core.game.enemySlot9;
				}
				
				else if (Core.game.enemySlot3.empty)
				{
					slot = Core.game.enemySlot3;
				}
				
				else if (Core.game.enemySlot8.empty)
				{
					slot = Core.game.enemySlot8;
				}
				
				else if (Core.game.enemySlot2.empty)
				{
					slot = Core.game.enemySlot2;
				}
				
				else if (Core.game.enemySlot7.empty)
				{
					slot = Core.game.enemySlot7;
				}
				
				else if (Core.game.enemySlot1.empty)
				{
					slot = Core.game.enemySlot1;
				}
			}
		}
		
		protected function sendUnit():void
		{
			if (spawn != null)
			{
				spawn.setup("right", sector);
				FP.world.add(spawn);
				money -= spawn.energy;
				
				// AI - add force to sector (used to determine the best sector the AI to send units)
				switch (spawn.sector)
				{
					case "A":
						Core.game.forceA -= spawn.force;
						break;
							
					case "B":
						Core.game.forceB -= spawn.force;
						break;
							
					case "C":
						Core.game.forceC -= spawn.force;
						break;
				}
				
				spawn = null;
			}
		}
		
		protected function buildTower():void
		{
			if (tower != null)
			{
				buildTowerTimer = 0.0;
				
				// randomize next interval to build tower
				buildTowerInterval = Math.random() * buildTowerMaxTime;
				
				selectTowerSlot();
				
				if (tower is SolarPanel)
				{
					if (!placedFirstSolar)
					{
						placedFirstSolar = true;
					}
					
					else
					{
						money -= SolarPanel.energy * solarCounter + (Data.level * SolarPanel.extra_energy);;
					}
					
					solarCounter++;
				}
				
				else
				{
					money -= tower.energy;
				}
				
				tower.x = slot.x;
				tower.y = slot.y + tower.offsetY;
				
				tower.layer = -y;
				tower.isPlaced = true;
				tower.team = "right";
				tower.setup();
				tower.sprite.alpha = 1;
				
				slot.empty = false;
				emptyTowerSlots--;
				
				FP.world.add(tower);
				
				// sound
				tower.place_sfx.play(Core.vol);
				
				// clear
				slot = null;
				tower = null;
			}
		}
		
		protected function ajustBehavior():void
		{
			antiInvasion();
		}
		
		private function antiInvasion():void
		{
			if (Core.game.forceA >= 25)
			{
				sector = "A";
				sendAntiInvasion();
			}
			
			else if (Core.game.forceB >= 25)
			{
				sector = "B";
				sendAntiInvasion();
			}
			
			else if (Core.game.forceC >= 25)
			{
				sector = "C";
				sendAntiInvasion();
			}
		}
		
		private function sendAntiInvasion():void
		{
			squadForce();
			
			var squad:uint = 1 + FP.rand(squadSize);
			
			for (var i:uint = 0; i <= squad; i++)
			{
				sendUnit();
			}
		}
		
		private function squadForce():void
		{
			var tempSize:uint = money / squadMaxValue;
			
			if (tempSize > 6)
			{
				tempSize = 6;
			}
			
			if (tempSize < 0)
			{
				tempSize = 0;
			}
			
			// submit
			if (tempSize >= 0)
			{
				squadSize = tempSize;
			}
		}
		
		protected function collectSolar():void
		{
			for each (var solar:SolarTower in solarList)
			{
				if (solar.charged)
				{
					solar.collected();
					money += solar.money;
					
					if (money > 5000)
					{
						money = 5000;
					}
				}
			}
		}
		
		private function sendInactiveSector():void
		{
			// base status
			
			// player
			var playerA:Boolean = Core.game.playerBaseA.destroyed;
			var playerB:Boolean = Core.game.playerBaseB.destroyed;
			var playerC:Boolean = Core.game.playerBaseC.destroyed;
			
			// enemy
			var enemyA:Boolean = Core.game.enemyBaseA.destroyed;
			var enemyB:Boolean = Core.game.enemyBaseB.destroyed;
			var enemyC:Boolean = Core.game.enemyBaseC.destroyed;
			
			if (!Core.game.winner)
			{
				if (!playerA && !enemyA)
				{
					if (Core.game.forceA == 0)
					{
						sector = "A";
						sendUnit();
					}
				}
				
				if (!playerB && !enemyB)
				{
					if (Core.game.forceB == 0)
					{
						sector = "B";
						sendUnit();
					}
				}
				
				if (!playerC && !enemyC)
				{
					if (Core.game.forceC == 0)
					{
						sector = "C";
						sendUnit();
					}
				}
			}
		}
	}
}