package Entities.Towers
{
	import Entities.Unit;
	import net.flashpunk.FP;
	import Entities.Towers.OffensiveTower;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Graphiclist;
	
	public class ShootableTower extends OffensiveTower
	{
		// barrel
		protected var sprite_barrel:Spritemap;
		protected var source_barrel:Class;
		protected var originX_barrel:uint = 0;
		protected var originY_barrel:uint = 0;
		protected var rotationSpeed:uint; // when idle
		
		// core
		protected var targetAngle:Number = 0;
		
		public function ShootableTower():void
		{
			super();
		}
		
		override public function added():void
		{
			graphic = new Graphiclist(sprite, sprite_barrel);
			
			super.added();
		}
		
		override protected function setupAnimations():void
		{
			super.setupAnimations();
			
			// sprite (barrel)
			sprite_barrel = new Spritemap(source_barrel, frameWidth, frameHeight);
			sprite_barrel.originX = originX_barrel;
			sprite_barrel.originY = originY_barrel;
			sprite_barrel.smooth = true;
			
			sprite_barrel.add("normal", [0], 0, false);
			sprite_barrel.add("fire", [1, 0], 5, false);
		}
		
		override protected function drag():void
		{
			sprite_barrel.alpha = 0.4;
			
			super.drag();
		}
		
		override public function placing():void
		{
			sprite_barrel.alpha = 1;
			
			super.placing();
		}
		
		override protected function actions():void
		{
			if (!isAttacking)
			{
				sprite_barrel.angle += rotationSpeed * FP.elapsed;
			}
			
			super.actions();
		}
		
		override protected function performAttack():void
		{
			// this
			var x1:int = this.x + originX_barrel;
			var y1:int = this.y + originY_barrel;
			
			// target
			var x2:int = target.x + target.halfWidth;
			var y2:int = target.y + target.halfHeight;
			
			targetAngle = FP.angle(x1, y1, x2, y2);
			sprite_barrel.angle = targetAngle;

			super.performAttack();
		}
		
		override protected function doAttack(target:Unit):void
		{
			sprite_barrel.play("fire", true);
			
			super.doAttack(target);
		}
	}
}