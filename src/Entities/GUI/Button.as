package Entities.GUI
{
	import flash.events.MouseEvent;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.utils.Input;
	
	public class Button extends Entity
	{
		// core
		public var pausable:Boolean =  true;
		
		// this function will be called when the button is pressed. 
		public var callback:Function = null;
		
		// this function will be called when the mouse overs the button. 	
		public var overCall:Function = null;
		public var overCalled:Boolean = false;
			
		private var initialized:Boolean = false;
		
		// graphics (of states)
		private var _normal:Graphic = new Graphic;
		private var _hover:Graphic = new Graphic;
		private var _down:Graphic = new Graphic;
		private var _inactive:Graphic = new Graphic;
		
		private var _normalChanged:Boolean = false;
		public var _hoverChanged:Boolean = false;
		private var _downChanged:Boolean = false;
		private var _inactiveChanged:Boolean = false;
		
		/**
		 * This var manages if the button is inactive or not. 
		 */		
		public var shouldCall:Boolean = true;
		
		
		// to avoid 'persistent-invisible' buttons
		private var myWorld:World;
		
		
		/**
		 * Constructor.
		 *  
		 * @param x			X coordinate of the button.
		 * @param y			Y coordinate of the button.
		 * @param width		With of the button's hitbox.
		 * @param height	Height of the button's hitbox.
		 * @param callback	The function that will be called when the button is pressed.
		 * 
		 */		
		public function Button(x:Number=0, y:Number=0, width:int=0, height:int=0, callback:Function=null)
		{
			super(x, y);
			
			setHitbox(width, height);
			
			this.callback = callback;
			graphic = normal;
			
			myWorld = FP.world;
		}
		
		/**
		 * @private 
		 */		
		override public function update():void
		{
			if(!initialized)
			{
				if(FP.stage != null)
				{
					FP.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
					initialized = true;
				}
			}
			
			super.update();
			
			if(!shouldCall)
			{
				if(graphic != _inactive || _inactiveChanged)
				{
					graphic = _inactive;
					_inactiveChanged = false;
				}
			}
			
			else if(collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				if(Input.mouseDown)
				{
					if(graphic != _down || _downChanged)
					{
						graphic = _down;
						_downChanged = false;
					}
				}
				
				else
				{
					graphic = _hover;
					
					if(overCall != null) overCall();
				}
			}
			
			else if(graphic != _normal || _normalChanged)
			{
				graphic = _normal;
				_normalChanged = false;
				overCalled = false;
			}
		}
		
		private function onMouseUp(e:MouseEvent):void
		{
			if (FP.world != myWorld)
			{
				return;
			}
			
			if (!visible)
			{
				return;
			}
			
			if ( !shouldCall || !Input.mouseReleased || (callback == null) ) 
			{
				return;
			}
			
			if (Core.paused && pausable)
			{
				return;
			}
			
			if ( collidePoint(x, y, Input.mouseX, Input.mouseY) ) 
			{
				callback();
			}
		}
		
		/** 
		 * @private
		 */		
		override public function removed():void
		{
			if (FP.stage != null)
			{
				FP.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			}
			
			super.removed();
		}
		
		public function set normal(normal:Graphic):void
		{
			_normal = normal;
			_normalChanged = true;
		}
		
		public function set hover(hover:Graphic):void
		{
			_hover = hover;
			_hoverChanged = true;
		}
		
		public function set down(down:Graphic):void
		{
			_down = down;
			_downChanged = true;
		}
		
		public function set inactive(inactive:Graphic):void
		{
			_inactive = inactive;
			_inactiveChanged = true;
		}
		
		/**
		 * Graphic of the button when active and not pressed nor overed.
		 */		
		public function get normal():Graphic{ return _normal; }
		/**
		 * Graphic of the button when the mouse overs it and it's active.
		 */		
		public function get hover():Graphic{ return _hover; }
		/**
		 * Graphic of the button when the mouse is pressing it and it's active.
		 */		
		public function get down():Graphic{ return _down; }
		/**
		 * Graphic of the button when inactive.
		 * 
		 * @see #shouldCall
		 */		
		public function get inactive():Graphic{ return _inactive; }
	}
}