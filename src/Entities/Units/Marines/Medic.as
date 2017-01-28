package Entities.Units.Marines
{
	import Entities.Units.Marine
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	
	public class Medic extends Marine
	{
		public static var name:String = "Medic";
		public static var cost:uint = 2000;
		public static var energy:uint = 250;
		
		// revive
		private var reviveTarget:Marine;
		private var reviveRange:uint;
		private var reviveDelay:Number;
		
		// current state
		private var state:String;
		
		// state list
		private static const NORMAL:String = "normal";
		private static const NONE:String = "none";
		private static const AWAITING:String = "awaiting";
		private static const REVIVE:String = "revive";
		
		// movement
		private var angle:Number;
		private var angleRadians:Number;
		
		// core
		private var awaitingTimer:Number = 0.0;
		
		// sounds
		private var revive_sfx:Sfx;
		
		public function Medic():void
		{
			// info
			name = Medic.name;
			energy = Medic.energy;
			attackType = "ranged";
			force = 80;
			
			// stats
			maxLife = 250;
			speed = 13;
			power = 45;
			attackRange = 130;
			attackDelay = 0.8;
			
			// specific
			reviveRange = 45;
			reviveDelay = 1;
			
			// sprite
			frameWidth = 23;
			frameHeight = 16;
			
			// sounds
			revive_sfx = new Sfx(Assets.MEDIC_REVIVE);
			
			// hitbox
			width = 14;
			height = 15;
			originY = -1;
			
			// offsets
			shellOffsetY = 5;
			
			state = Medic.NORMAL;
			
			super();
		}
		
		override protected function actions():void
		{
			checkCollisions();
			checkReviveTarget();
			
			if (reviveTarget)
			{
				move();
			}
			
			else if ( !attack() )
			{
				move();
			}
		}
		
		private function checkReviveTarget():void
		{
			if (reviveTarget)
			return;
			
			var unitList:Array = [];
			world.getType("unit", unitList);
			
			for each(var target:Marine in unitList)
			{
				if (target.sector == this.sector)
				{
					if (target.team == this.team)
					{
						if (!target.alive && target.disappear > 5 && !target.hasMedic)
						{
							if (distanceFrom(target) < reviveRange)
							{
								reviveTarget = target;
								reviveTarget.hasMedic = true;
								sprite.play("walk");
								state = Medic.REVIVE;
								
								angle = FP.angle(this.x, this.y, target.x, target.y);
								angleRadians = angle * Math.PI / 180;
							}
						}
					}
				}
			}
		}
		
		override protected function checkCollisions():void
		{
			// revive
			if (reviveTarget)
			{
				if ( distanceFrom(reviveTarget) < 2 )
				{
					layer = reviveTarget.layer - 1;
					state = Medic.NONE;
					
					sprite.callback = revive;
					sprite.play("revive");
				}

			}
			
			super.checkCollisions();
		}
		
		private function revive():void
		{
			reviveTarget.life = reviveTarget.maxLife;
			reviveTarget.alive = true;
			reviveTarget.sprite.alpha = 1;
			reviveTarget.disappear = reviveTarget.disappearTime;
			reviveTarget = null;
			
			state = Medic.AWAITING;
			sprite.callback = null;
			sprite.frame = 15;
			layer = -y;
			
			// sound
			revive_sfx.play(Core.vol);
		}
		
		override protected function move():void
		{
			switch (state)
			{
				case Medic.NORMAL:
					normalState();
					break;
					
				case Medic.REVIVE:
					reviveState();
					break;
					
				case Medic.AWAITING:
					awaitingState();
					break;
			}
		}
		
		private function normalState():void
		{
			super.move();
		}
		
		private function reviveState():void
		{
			sprite.play("walk");
			x += (speed * FP.elapsed) * Math.cos(angleRadians);
			y -= (speed * FP.elapsed) * Math.sin(angleRadians);
				
			layer = -y;
		}
		
		private function awaitingState():void
		{
			awaitingTimer += FP.elapsed;
				
			if (awaitingTimer >= reviveDelay)
			{
				reviveTarget = null;
				state = Medic.NORMAL;
				sprite.play("walk");
				awaitingTimer = 0;
			}
		}
		
		override protected function die():void
		{
			if (reviveTarget)
			{
				reviveTarget.hasMedic = false;
			}
			
			sprite.callback = null;
			super.die();
		}
		
		override protected function setupAnimations():void
		{
			marinesStandardAnimation(6, 11);
			sprite.add("revive", [0, 0, 0, 15, 15, 16, 16, 17, 17, 17, 17, 16, 16, 15], 8, true);
		}
		
		override protected function setupLeft():void
		{
			source = Assets.MEDIC;
			originX = -2;
			bloodOffsetX = 2;
			shellOffsetX = 12;
			
			// Alien revolt levels
			if (Data.level == 3 || Data.level == 10 || Data.level == 18 || Data.level == 25)
			{
				source = Assets.MEDIC_NAUK;
			}
			
			super.setupLeft();
		}
		
		override protected function setupRight():void
		{
			source = Assets.MEDIC_NAUK;
			originX = -7;
			bloodOffsetX = 13;
			shellOffsetX = 10;
			
			super.setupRight();
		}
		
		override protected function soundShoot():void
		{
			Core.sfx_medic.play( Core.vol - Math.random() );
		}
	}
}