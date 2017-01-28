package 
{
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.utils.getDefinitionByName;
	
	[SWF(width = "800", height = "550", backgroundColor = "#000000", frameRate = "60")]
	
	public class Preloader extends MovieClip
	{
		[Embed(source = 'net/flashpunk/graphics/04B_03__.TTF', embedAsCFF="false", fontFamily = 'default')]
		private static const FONT:Class;
		
		private var loader:Sprite = new Sprite();
		private var border:Sprite = new Sprite();
		private var text:TextField = new TextField();
		
		private const loaderWidth:int = 510;
		private const loaderHeight:int = 40;
		
		private const loaderColor:uint = 0x60B6EC;
		private const borderColor:uint = 0x1673AD;
		private const backgroundColor:uint = 0x000000;
		
		private const main:String = "SplashScreen";
		//private const main:String = "Main";
		private var loaded:Number = 0;
		
		public function Preloader() 
		{
			var offset:Number = 200;
			
			// loader information
			stage.addEventListener(Event.ENTER_FRAME, progress);
			
			// show loader
			addChild(loader);
			loader.x = (stage.stageWidth / 2) - (loaderWidth / 2) + 4;
			loader.y = (stage.stageHeight / 2) - (loaderHeight / 2) + 4 + offset;
			
			addChild(border);
			border.x = (stage.stageWidth / 2) - (loaderWidth / 2);
			border.y = (stage.stageHeight / 2) - (loaderHeight / 2) + offset;
			
			// render background
			graphics.beginFill(backgroundColor, 1);
			graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			graphics.endFill();
			
			// render the border
			border.graphics.clear();
			border.graphics.lineStyle(4, borderColor);
			border.graphics.drawRect(0, 0, loaderWidth, loaderHeight);
			
			text = new TextField();
			
			text.textColor = loaderColor;
			text.selectable = false;
			text.mouseEnabled = false;
			text.defaultTextFormat = new TextFormat("default", 16);
			text.embedFonts = true;
			text.autoSize = "left";
			text.text = "0%";
			text.x = loader.x;
			text.y = loader.y + 50;
			
			addChild(text);
			
			
			// CPMstar
			
			var ad:DisplayObject = new AdLoader("9476Q8CEC8504");
			
			ad.x = 244;
			ad.y = 133;
			
			addChild(ad);
			
		}
		
		private function progress(e:Event):void 
		{
			// how much we've loaded thus far
			loaded = loaderInfo.bytesLoaded / loaderInfo.bytesTotal;
			
			// update loader graphic
			loader.graphics.clear();
			loader.graphics.beginFill(loaderColor);
			loader.graphics.drawRect(0, 0, loaded * (loaderWidth - 8), loaderHeight - 8);
			loader.graphics.endFill();
			
			// text
			var p:Number = (loaderInfo.bytesLoaded / loaderInfo.bytesTotal) + 0.01;
			text.text = int(p * 100) + "%";
			
			// done loading?
			if (loaderInfo.bytesLoaded >= loaderInfo.bytesTotal)
			{
				startup();
			}
		}
		
		private function startup():void 
		{
			// remove event listener(s)
			stage.removeEventListener(Event.ENTER_FRAME, progress);
			
			// hide loader
			stop();
			
			// remove all the children
			var i:int = numChildren;
			while (i --)
			{
				removeChildAt(i)
			}
			
			// go to the main class
			var mainClass:Class = getDefinitionByName(main) as Class;
			parent.addChild(new mainClass as DisplayObject);
			
			// remove self
			parent.removeChild(this)
		}
		
	}
	
}