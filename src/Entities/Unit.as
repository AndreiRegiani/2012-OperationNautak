package Entities
{
	import Entities.Base;
	import Entities.Bullet;
	import Entities.Bullets.BazookaBullet;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	
	public class Unit extends Entity
	{
		// info
		public var name:String;
		public var race:String;
		public var energy:uint;
		public var attackType:String; // ranged, meele
		public var force:int; // used for AI (to know how influent is this unit)
		
		// stats
		public var maxLife:uint;
		protected var speed:uint;
		protected var power:int;
		protected var attackRange:uint; // distance in pixels
		protected var attackDelay:Number = 0.0; // in seconds
		
		// auto
		public var alive:Boolean;
		public var life:Number = 0.0;
		
		// set by runtime
		public var team:String; // left, right
		public var sector:String; // A, B, C (top to bottom)
		
		// core
		private var target:*;
		private var attackTimer:Number = 0.0;
		private var hasAttacked:Boolean = false;
		private var allowAttack:Boolean = false;
		private var receiveExplosion:Boolean = false
		
		// moveDelay - when unit start to re-move add a little delay to make realistic squad movement
		private var moveDelay:Boolean = false; // if delay is active
		private var moveDelayTimer:Number; // time remaining to move
		
		// if your base is not destroyed, go ahead and fight
		// else, turn back and try to escape
		public var goAhead:Boolean = true; 
		
		// misc
		private var appearTimer:Number = 0.0;
		public var disappearTime:Number = 15.0;
		public var disappear:Number;
		private var firstAttackToggle:Boolean = false;
		
		protected var alphaDamaged:Boolean = false;
		protected var damagedTimer:Number = 0.0;
		
		// sprite
		public var sprite:Spritemap;
		protected var source:Class;
		public var frameWidth:uint = 0;
		public var frameHeight:uint = 0;
		
		// setup
		protected var minPosition:uint = 0;
		protected var maxPosition:uint = 0;
		
		// offsets
		// blood
		protected var bloodOffsetX:uint = 0;
		protected var bloodOffsetY:uint = 0;
		protected var bloodAreaX:uint = 0;
		protected var bloodAreaY:uint = 0;
		
		public function Unit():void
		{
			type = "unit";
			
			// unit randomness, to make each unit unique

			speed += Math.random() * speed; // + 100%
			power += Math.random() * power / 4; // + 25%
			attackRange += Math.random() * attackRange / 3 // + 33%
			attackDelay += Math.random() * attackDelay / 3 // + 33%
			
			alive = true;
			life = maxLife;
			disappear = disappearTime;
			moveDelayTimer = Math.random() * 1.2;
		}
		
		override public function added():void
		{
			/*
			// emit particle (effects) when the unit spawns
			if (race == "Marines")
			{
				Core.effects.emit("Marine_Spawn", 10, x + frameWidth / 2, y + frameHeight / 2);
			}
			
			else if (race == "Nauks")
			{
				Core.effects.emit("Nauk_Spawn", 30, x + frameWidth / 2, y + frameHeight / 2);
			}
			*/
		}
		
		override public function update():void
		{
			checkLife();
			
			if (alive)
			{
				actions();
			}
			
			if (alphaDamaged)
			{
				if (race == "Marines")
				sprite.color = 0xFF3232;
				
				else
					sprite.color = 0xFF6464;
				
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
			
			// spawn
			if (appearTimer <= 0.5)
			{
				appearTimer += FP.elapsed;
				sprite.alpha = appearTimer * 2;
			}
		}
		
		protected function checkLife():void
		{
			if (life <= 0)
			{
				disappear -= FP.elapsed;
				sprite.alpha = disappear / disappearTime;

				if (disappear < 0)
				{
					world.remove(this);
				}
				
				if (alive)
				{
					die();
					alive = false;
				}
			}
		}
		
		protected function actions():void
		{
			checkCollisions();
			
			if ( !attack() )
			{
				if (moveDelayTimer <= 0.0)
				{
					move();
				}
				
				else
				{
					moveDelayTimer -= FP.elapsed;
				}
			}
		}
		
		protected function die():void
		{
			sprite.play("die");
			removeForce();
			
			// counter
			if (team == "right")
			{
				Core.game.kills++;
				Core.game.score += force;
			}
			
			else if (team == "left")
			{
				Core.game.deaths++;
				Core.game.score += force / 4;
			}
			
			// sound
			soundDeath();
		}
		
		protected function removeForce():void
		{
			// AI - remove force of sector
			
			if (team == "left")
			{
				force *= -1;
			}
			
			switch (sector)
			{
				case "A":
					Core.game.forceA += force;
					break;
							
				case "B":
					Core.game.forceB += force;
					break;
							
				case "C":
					Core.game.forceC += force;
					break;
			}
		}
		
		protected function checkCollisions():void
		{
			// mouse over info
			// if ( collidePoint(x, y, Input.mouseX, Input.mouseY) )
			// {
			//	 Core.overInfo.setup(" " + life + " HP", x, y - 10);
			// }
			
			// bullets
			var bullet:Bullet = collide("bullet", x, y) as Bullet;
			
			if (bullet)
			{
				if (bullet.team != team)
				{
					if (bullet is BazookaBullet && receiveExplosion)
					{
						return;
					}
					
					if (bullet is BazookaBullet)
					{
						receiveExplosion = true;
						
						// do not emit so much blood (performance issue)
						/*
						for (var i2:uint = 0; i2 < 6; i2++)
						{
							blood(1);
						}
						*/
						
						damage(bullet.power);
						bullet.hit();
						
						return;
					}
					
					damage(bullet.power);
					
					// emit blood (to cover all unit's body)
					/*
					for (var i:uint = 0; i < 5; i++)
					{
						blood(bullet.power / 2);
					}
					*/
					
					bullet.hit();
				}
			}
		}
		
		protected function attack():Boolean
		{
			if (!goAhead)
			{
				walkBack();
				return true;
			}
			
			else if ( attackBase() )
			{
				moveDelay = true;
				return true;
			}
			
			else if ( attackUnit() )
			{
				moveDelay = true;
				return true;
			}
			
			if (moveDelay)
			{
				moveDelayTimer = Math.random() * 1.2;
				moveDelay = false;
			}
			
			return false;
		}
		
		protected function walkBack():void
		{
			sprite.play("walk");
				
			if (team == "left")
			{
				sprite.flipped = true;
				moveLeft();
			}
				
			else if (team == "right")
			{
				sprite.flipped = false;
				moveRight();
			}
		}
		
		private function attackBase():Boolean
		{
			if (target is Base)
			{
				if (target.destroyed)
				{
					target = null;
				}
				
				performAttack();
				
				return true;
			}
			
			else
			{
				var baseList:Array = [];
				world.getType("base", baseList);
				
				for each (var target:Base in baseList)
				{
					if (target.sector == this.sector)
					{
						if (target.team != this.team)
						{
							if (!target.destroyed)
							{
								if ( distanceFrom(target, true) < (this.attackRange / 3 ) )
								{
									this.target = target;
									return true;
								}
							}
						}
					}
				}
			}
			
			return false;
		}
		
		private function attackUnit():Boolean
		{
			if (target is Unit && target.goAhead)
			{
				performAttack();
				
				if (distanceFrom(target, true) > this.attackRange || !target.alive)
				{
					target = null;
				}
				
				return true;
			}
			
			else
			{
				var unitList:Array = [];
				world.getType("unit", unitList);
				
				for each (var target:Unit in unitList)
				{
					if (target.sector == this.sector)
					{
						if (target.team != this.team)
						{
							if (target.alive)
							{
								if (distanceFrom(target, true) < this.attackRange)
								{
									this.target = target;
									return true;
								}
							}
						}
					}
				}
			}
			
			return false;
		}
		
		protected function performAttack():void
		{
			if (!firstAttackToggle)
			{
				sprite.play("idle");
				firstAttackToggle = true;
			}
			
			if (hasAttacked)
			{
				doAttack(target);
				hasAttacked = false;
			}
			
			if (attackTimer >= attackDelay)
			{
				hasAttacked  = true;
				attackTimer = 0;
			}
			
			attackTimer += FP.elapsed;
		}
		
		protected function doAttack(target:*):void
		{
			// by default: instant damage
			sprite.play("attack", true);
			
			soundShoot();
			
			
			if (target)
			{
				target.damage(this.power);
			}
		}
		
		protected function damage(power:int):void
		{
			life -= power;
			
			alphaDamaged = true;
			//blood(power);
		}
		
		protected function blood(power:int):void
		{
			/*
			var x:int = this.x + bloodOffsetX + FP.rand(bloodAreaX);
			var y:int = this.y + bloodOffsetY + FP.rand(bloodAreaY);
			
			Core.effects.blood(race, team, power, x, y);
			*/
		}
		
		protected function move():void
		{
			sprite.play("walk");
			firstAttackToggle = false;
			attackTimer = 0.0;
			
			if (team == "left")
			{
				moveRight();
			}
			
			else
			{
				moveLeft();
			}
		}
		
		protected function moveRight():void
		{
			x += speed * FP.elapsed;
			
			if (x > 400)
			{
				FP.world.remove(this);
			}
		}
		
		protected function moveLeft():void
		{
			x -= speed * FP.elapsed;
			
			if ( x < -frameWidth )
			{
				FP.world.remove(this);
			}
		}
		
		protected function setupAnimations():void
		{
			
		}
		
		public function setup(team:String, sector:String):void
		{
			this.team = team;
			this.sector = sector;
			
			// team
			if (team == "left")
			{
				setupLeft();
				
				// position
				x = 0;
			}
			
			else
			{
				setupRight();
				
				// position
				x = 400 - frameWidth;
			}
			
			// sector
			switch (sector)
			{
				case "A":
					y = 23;
					break;
					
				case "B":
					y = 103;
					break;
					
				case "C":
					y = 183;
					break;
			}
			
			y += minPosition + FP.rand(maxPosition);
			
			layer = -y;
			
			// graphics
			sprite = new Spritemap(source, frameWidth, frameHeight);
			graphic = sprite;
			sprite.alpha = 0;
			
			if (team == "right")
			{
				sprite.flipped = true;
			}
			
			setupAnimations();
		}
		
		protected function soundShoot():void
		{
			
		}
		
		protected function soundDeath():void
		{
			if (team == "left")
			{
				Core.sfx_death_marines.play(Core.vol - Math.random());
			}
			
			else
			{
				Core.sfx_death_nauk.play(Core.vol - Math.random());
			}
		}
		
		protected function setupLeft():void
		{
			
		}
		
		protected function setupRight():void
		{
			
		}
	}
}