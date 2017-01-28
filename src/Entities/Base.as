  package Entities
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Spritemap;
	
	public class Base extends Entity
	{
		private var race:String; // Marines, Nauks
		public var team:String; // left, right
		public var sector:String; // A, B, C
		
		private var maxLife:Number;
		public var life:Number;
		public var destroyed:Boolean;
		
		// render
		private var sprite:Spritemap;
		private var source:Class;
		
		// core
		private var damageTimer:Number = 100.0;
		private var overInfoOffset:int;
		private var bulletCollisionOffset:int;
		
		private var alphaDamaged:Boolean = false;
		private var damagedTimer:Number = 0.0;
		
		// effects
		private var explosionEmitterA:String;
		private var explosionEmitterB:String;
		
		// sounds
		private var sound_marines_destroyed:Sfx = new Sfx(Assets.MARINES_BASE_DESTROYED);
		
		
		public function Base(race:String, team:String, sector:String, maxLife:uint):void
		{
			type = "base";
			
			this.race = race;
			this.team = team;
			this.sector = sector;
			this.maxLife = maxLife;
			this.life = maxLife;
			this.destroyed = false;
			
			switch (race)
			{
				case "Marines":
					explosionEmitterA = "Explosion_Yellow";
					explosionEmitterB = "Explosion_Orange";
					break;
					
				case "Nauks":
					explosionEmitterA = "Explosion_Yellow";
					explosionEmitterB = "Explosion_Orange";
					break;
			}
		}
		
		override public function added():void
		{
			// team (side)
			
			// left
			if (team == "left")
			{
				x = 0;
				
				// offsets
				overInfoOffset = 0;
				bulletCollisionOffset = -30;
				
				// race
				if (race == "Marines")
				{
					source = Assets.MARINES_BASE_LEFT;
				}
			
				else if (race == "Nauks")
				{
					source = Assets.NAUKS_BASE_LEFT;
				}
			}
			
			// right
			else if (team == "right")
			{
				x = 331;
				
				// offsets
				overInfoOffset = -26;
				bulletCollisionOffset = 30;
				
				// race
				if (race == "Marines")
				{
					source = Assets.MARINES_BASE_RIGHT;
				}
			
				else if (race == "Nauks")
				{
					source = Assets.NAUKS_BASE_RIGHT;
				}
			}

			sprite = new Spritemap(source, 69, 63);
			
			// hitbox
			width = 55;
			height = 63;
			
			if (team == "right")
			{
				originX = -14;
			}
			
			// animations
			sprite.add("normal", [0], 0, false);
			sprite.add("damage", [1, 0], 2, true);
			sprite.add("destroyed", [2], 0, false);
			
			graphic = sprite;
			
			// sector
			switch (sector)
			{
				case "A":
					y = 39;
					break;
					
				case "B":
					y = 119;
					break;
					
				case "C":
					y = 199;
					break;
			}
		}
		
		override public function update():void
		{
			checkCollisions();
			
			if (!destroyed)
			{
				animate();
				
				if (alphaDamaged)
				{
					sprite.color = 0xFFAAAA;
					
					damagedTimer += FP.elapsed;
					
					if (damagedTimer >= 0.35)
					{
						alphaDamaged = false;
						damagedTimer = 0;
					}
				}
					
				else
				{
					sprite.color = 0xFFFFFF;
				}
			}
			
			// base destroyed
			else
			{
				sprite.color = 0xFFFFFF;
			}
		}
		
		private function checkLife():void
		{
			if (life <= 0 && !destroyed)
			{
				destroyed = true;
				die();
			}
		}
		
		private function animate():void
		{
			if (damageTimer <= 0.7)
			{
				sprite.play("damage");
				damageTimer += FP.elapsed;
			}
			
			else
			{
				sprite.play("normal");
			}
		}
		
		private function checkCollisions():void
		{
			// bullet
			var bullet:Bullet = collide("bullet", x + bulletCollisionOffset, y) as Bullet;
			
			if (bullet)
			{
				if (bullet.team != team)
				{
					damage(bullet.power);
					bullet.hit();
					bullet.collidable = false;
				}
			}
			
			// mouse (show overInfo)
			if ( collidePoint(x, y, FP.world.mouseX, FP.world.mouseY) && team == "right")
			{
				if (!destroyed)
				{
					Core.overInfo.setup("Base " + sector + ":   " + life + " HP", x + overInfoOffset, y, -15, false, 0, life, sector);
				}
				
				else
				{
					Core.overInfo.setup("Base " + sector + ": DESTROYED", x + overInfoOffset, y, -5, false, 0xD51111);
				}
			}
		}
		
		public function damage(power:int):void
		{
			life -= power;
			damageTimer = 0.0;
			alphaDamaged = true;
			
			//Core.effects.emit(explosionEmitterA, 1, x + FP.rand(sprite.width), y + FP.rand(sprite.height) );
			
			checkLife();
			Core.gameplay.baseInfo.setSector(Core.game.sector);
		}
		
		private function die():void
		{
			backOffUnits();
			
			sprite.play("destroyed");
			
			
			// sound
			if (race == "Marines")
			{
				sound_marines_destroyed.play(Core.vol);
			}
			
			else if (race == "Nauks")
			{
				// sound_nauks_destroyed.play(Core.vol);
			}
			
			// emit explosion
			/*
			for (var i:int = 0; i <= 14; i++)
			{
				Core.effects.emit(explosionEmitterA, 10, x + FP.rand(sprite.width), y + FP.rand(sprite.height) );
				Core.effects.emit(explosionEmitterB, 20, x + FP.rand(sprite.width), y + FP.rand(sprite.height) );
			}
			*/
			
			// score
			if (team == "left")
			{
				Core.game.score -= 500;
			}
			
			else if (team == "right")
			{
				Core.game.score += 1000;
			}
			
			// change 'arrow' (that send units) position if it's in this sector
			if (Core.game.sector == sector)
			{
				// Sector A
				if (sector == "A")
				{
					if (!Core.game.playerBaseB.destroyed && !Core.game.enemyBaseB.destroyed)
					{
						Core.game.sector = "B";
					}
					
					else if (!Core.game.playerBaseC.destroyed && !Core.game.enemyBaseC.destroyed)
					{
						Core.game.sector = "C";
					}
					
					else
					{
						Core.game.sector = "none";
					}
				}
				
				// Sector B
				else if (sector == "B")
				{
					if (!Core.game.playerBaseC.destroyed && !Core.game.enemyBaseC.destroyed)
					{
						Core.game.sector = "C";
					}
					
					else if (!Core.game.playerBaseA.destroyed && !Core.game.enemyBaseA.destroyed)
					{
						Core.game.sector = "A";
					}
					
					else
					{
						Core.game.sector = "none";
					}
				}
				
				// Sector C
				else if (sector == "C")
				{
					if (!Core.game.playerBaseB.destroyed && !Core.game.enemyBaseB.destroyed)
					{
						Core.game.sector = "B";
					}
					
					else if (!Core.game.playerBaseA.destroyed && !Core.game.enemyBaseA.destroyed)
					{
						Core.game.sector = "A";
					}
					
					else
					{
						Core.game.sector = "none";
					}
				}
				
				Core.arrow.updatePosition();
			}
			
			// to avoid the AI to send units as the base's sector is inactive (AI->ajustBehavior->antiInvasion)
			switch (sector)
			{
				case "A":
					Core.game.forceA = -10000;
					break;
					
				case "B":
					Core.game.forceB = -10000;
					break;
					
				case "C":
					Core.game.forceC = -10000;
					break;
			}
			
			Core.gameplay.checkVictory();
			
			if (Core.game.winner)
			{
				Core.game.sector = "none";
				Core.arrow.updatePosition();
			}
		}
		
		private function backOffUnits():void
		{
			var unitList:Array = [];
			world.getType("unit", unitList);
			
			for each (var target:Unit in unitList)
			{
				if (target.sector == sector)
				{
					if (target.team == team)
					{
						target.goAhead = false;
					}
				}
			}
		}
	}
}