package Entities.Towers
{
	import Entities.Tower;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.graphics.Graphiclist;
	
	public class SolarTower extends Tower
	{
		// charge
		public var charged:Boolean = false;
		private var chargeTimer:Number = 0.0;
		
		// stats
		protected var baseAwaitingTime:uint; // seconds
		public var money:uint; // collected money (by charge)
		
		// core
		public var awaitingTime:uint; // random +50% of baseAwaitingTime
		
		// text - when collected shows '+500'
		private var text:Text;
		
		// sound
		protected var collect_sfx:Sfx;
		protected var collect_source:Class;
		
		public function SolarTower():void
		{
			// info
			offensive = false;
			
			// first solar has to make energy faster (to avoid pre-game boring)
			if (!Core.game.placedFirstSolar) // if is first solar
			{
				awaitingTime = 3;
			}
			
			else
			{
				awaitingTime = baseAwaitingTime + ( FP.rand(baseAwaitingTime) );
			}
			
			// sound
			collect_sfx = new Sfx(collect_source);
			
			super();
		}
		
		override public function added():void
		{
			// text
			text = new Text("+" + money, 0, 0);
			text.font = "Wonder";
			text.color = 0xFFFF00; // yellow
			text.size = 6;
			text.visible = false;
			
			graphic = new Graphiclist(sprite, text);
		}
		
		override protected function setupAnimations():void
		{
			super.setupAnimations();
			
			sprite.add("ready", [1], 0.6, false);
		}
		
		override public function update():void
		{
			// text - player only
			if (text.visible && team == "left")
			{
				text.y -= 25 * FP.elapsed;
				text.alpha -= FP.elapsed;
				
				if (text.alpha <= 0)
				{
					text.visible = false;
				}
			}

			super.update();
		}
		
		override protected function actions():void
		{
			checkCollisions();

			if (chargeTimer >= awaitingTime)
			{
				charged = true;
				sprite.play("ready");
				
				// player only
				if (Core.autoCollectSolar && team == "left")
				{
					sprite.callback = collected;
				}
			}
			
			else
			{
				chargeTimer += FP.elapsed;
			}
		}
		
		private function checkCollisions():void
		{
			if ( collidePoint(x, y, Input.mouseX, Input.mouseY) )
			{
				if ( charged && team == "left" && !Core.game.winner )
				{
					collected();
				}
			}
		}
		
		public function collected():void
		{
			// player only
			if (team == "left")
			{
				Core.game.money += money;
				Core.hud.updateHud();
				
				text.visible = true;
				text.alpha = 1;
				text.y = 0;
			}
			
			charged = false;
			
			sprite.callback = null;
			sprite.play("normal");
			
			chargeTimer = 0.0;
			awaitingTime = baseAwaitingTime + ( FP.rand(baseAwaitingTime) );
			
			// sound
			if (team == "left")
			{
				collect_sfx.play(Core.vol);
			}
		}
	}
}