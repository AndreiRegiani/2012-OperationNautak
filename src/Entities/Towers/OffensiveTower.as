package Entities.Towers
{
	import Entities.Tower;
	import Entities.Unit;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Draw;
	
	public class OffensiveTower extends Tower
	{
		// stats
		protected var power:uint;
		protected var attackRange:uint; // distance in pixels
		protected var attackDelay:Number = 0.0; // in seconds
		
		// core
		protected var target:Unit;
		private var attackTimer:Number = 0.0;
		private var hasAttacked:Boolean = false;
		protected var isAttacking:Boolean = false;
		
		// sounds
		protected var fire_sfx:Sfx;
		protected var fire_class:Class;

		public function OffensiveTower():void
		{
			offensive = true;
			
			fire_sfx = new Sfx(fire_class);
			
			super();
		}
		
		override public function render():void
		{
			if (!isPlaced)
			{
				Draw.circlePlus(this.x + halfWidth - offsetX, this.y + halfHeight - offsetY, attackRange, 0xFFFFFF, 0.2);
				Draw.circlePlus(this.x + halfWidth - offsetX, this.y + halfHeight - offsetY, attackRange, 0x0000FF, 0.2, false, 1);
			}
			
			super.render();
		}
		
		override protected function actions():void
		{
			attack();
		}
		
		protected function attack():void
		{
			if (target && target.onCamera)
			{
				performAttack();
				isAttacking = true;
				
				if (distanceFrom(target, true) > this.attackRange || !target.alive || !target.onCamera)
				{
					target = null;
				}
			}
			
			else
			{
				var unitList:Array = [];
				world.getType("unit", unitList);
				
				for each (var target:Unit in unitList)
				{
					if (target.team != this.team)
					{
						if (target.alive)
						{
							if (distanceFrom(target, true) < this.attackRange)
							{
								this.target = target;
								return;
							}
						}
					}
				}
				
				isAttacking = false;
			}
		}
		
		protected function performAttack():void
		{
			if (hasAttacked)
			{
				doAttack(target);
				hasAttacked = false;
			}
			
			if (attackTimer >= attackDelay)
			{
				hasAttacked = true;
				attackTimer = 0;
			}
			
			attackTimer += FP.elapsed;
		}
		
		protected function doAttack(target:Unit):void
		{
			fire_sfx.play(Core.vol);
		}
	}
}