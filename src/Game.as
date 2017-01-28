package
{
	import Entities.Base;
	import Entities.Tower;
	import Entities.TowerSlot;
	
	public final class Game
	{
		// points
		public var score:int = 0;
		public var kills:uint = 0;
		public var deaths:uint = 0;
		
		// in-match money
		public var money:uint = 0; // initial money
		
		// selected / current sector
		public var sector:String = "B";
		
		public var startTime:int = 0;
		
		// core
		
		public var winner:String = null;
		
		// tower button - if the player clicked to build and is placing the tower
		
		public var isDragging:Boolean = false;
		
		public var draggingTower:Tower;
		
		public var emptyTowers:uint = 12;
		
		public var solarCounter:uint = 0;
		
		public var placedFirstSolar:Boolean = false;
		
		
		// AI
		
		// force of each sector (used to determine the best sector the AI to send units)
		// left team (player) increses the force, the right team (AI) decreses
		public var forceA:int = 0;
		
		public var forceB:int = 0;
		
		public var forceC:int = 0;
		
		
		// AI's tower slots
		public var enemySlot1:TowerSlot;
		public var enemySlot2:TowerSlot;
		public var enemySlot3:TowerSlot;
		public var enemySlot4:TowerSlot;
		public var enemySlot5:TowerSlot;
		public var enemySlot6:TowerSlot;
		public var enemySlot7:TowerSlot;
		public var enemySlot8:TowerSlot;
		public var enemySlot9:TowerSlot;
		public var enemySlot10:TowerSlot;
		public var enemySlot11:TowerSlot;
		public var enemySlot12:TowerSlot;
		
		
		// bases
		
		// player's base
		public var playerBaseA:Base;
		public var playerBaseB:Base;
		public var playerBaseC:Base;
			
		// enemy's base
		public var enemyBaseA:Base;
		public var enemyBaseB:Base;
		public var enemyBaseC:Base;
	}
}