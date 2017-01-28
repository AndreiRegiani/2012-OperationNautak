package
{
	public final class Data
	{
		// player's current race
		public static var race:String; // Marines, Nauks
		
		// shop money, used to buy upgrades like deslock units
		public static var money:int;
		
		// initial HP for bases
		public static var baseLife:int;
		
		// progress
		public static var level:uint;
		
		public static var cheatMode:Boolean;
		
		
		// Towers acquisition
		
		// Marines
		public static var solar_panel:Boolean;
		public static var assault_tower:Boolean;
		public static var missile_launcher:Boolean;
		public static var ultra_blast:Boolean;
		
		
		// Units acquisition

		// Marines
		public static var pistol:Boolean;
		public static var eagle:Boolean;
		public static var smg:Boolean;
		public static var medic:Boolean;
		public static var assault:Boolean;
		public static var sniper:Boolean;
		public static var machine:Boolean;
		public static var bazooka:Boolean;
	}
}