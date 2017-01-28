package
{
	import flash.display.*;
	import flash.events.*;
	
	public class SplashScreen extends MovieClip
	{
		[Embed(source = 'Assets/Sponsor/splashfinal.swf')]  
		private const splashScreen:Class;
		
		private var splashMovie:MovieClip = new splashScreen();
		private var count:Number = 0;
		private const maxCount:Number = 527; // frames
		
		private const backgroundColor:uint = 0x666666;
		
		public function SplashScreen() 
		{
			splashMovie.addEventListener(Event.ENTER_FRAME, CheckSplashEnded);
			addChild(splashMovie);
			
			// render background
			graphics.beginFill(backgroundColor, 1);
			graphics.drawRect(0, 0, 800, 550);
			graphics.endFill();
		}
		
		public function CheckSplashEnded(e:Event):void
		{
			count += 1;
			
			if (count >= maxCount)
			{
				splashMovie.removeEventListener(Event.ENTER_FRAME, CheckSplashEnded);
				removeChild(splashMovie);
				
				var main:Main = new Main();
				addChild(main);
			}
		}
	}
}