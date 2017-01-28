package
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import net.flashpunk.Sfx;
	
	
	public final class Utils
	{
		// sounds
		public static var sound_click:Sfx = new Sfx(Assets.MISC_CLICK);
		
		
		public static function openURL(url:String):void
		{
			navigateToURL( new URLRequest(url) );
		}
	}
}