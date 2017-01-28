package Entities.Units
{
	import Entities.Unit;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Graphiclist;
	
	public class Marine extends Unit
	{
		// misc
		public var hasMedic:Boolean = false;
		
		// offsets
		protected var shellOffsetX:uint = 0;
		protected var shellOffsetY:uint = 0;
		
		public function Marine():void
		{
			// info
			race = "Marines";
			
			// setup (spawn)
			minPosition = 18;
			maxPosition = 45;
			
			// blood ofsset
			bloodAreaX = 10;
			bloodAreaY = 12;
			bloodOffsetY = 1;
			
			super();
		}
		
		protected function marinesStandardAnimation(walkSpeed:uint, attackSpeed:uint):void
		{
			sprite.add("idle", [0, 5], 1, false);
			sprite.add("walk", [0, 1, 2, 0, 3, 4], walkSpeed, true);
			sprite.add("attack", [6, 7, 5], attackSpeed, false);
			sprite.add("die", [10, 11, 12], 6, false);
		}
		
		override protected function doAttack(target:*):void
		{
			//Core.effects.shell(team, x + shellOffsetX, y + shellOffsetY);
			
			super.doAttack(target);
		}
		
		override protected function setupLeft():void
		{
			// human skinned
			super.setupLeft();
		}
		
		override protected function setupRight():void
		{
			// nauk skinned
			super.setupRight();
		}
		
		override protected function soundShoot():void
		{
			
		}
	}
}