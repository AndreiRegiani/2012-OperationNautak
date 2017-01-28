package
{
	public final class Level
	{
		// info
		public var name:String;
		public var terrain:String;
		public var coordinateX:int;
		public var coordinateY:int;
		
		// stats
		public var prize:uint;
		public var baseLife:uint;
		
		// units
		public var unit1:Boolean = true; // starter
		public var unit2:Boolean = false;
		public var unit3:Boolean = false;
		public var unit4:Boolean = false;
		public var unit5:Boolean = false;
		public var unit6:Boolean = false;
		public var unit7:Boolean = false;
		public var unit8:Boolean = false;
		
		// towers
		public var tower1:Boolean = true; // starter
		public var tower2:Boolean = false;
		public var tower3:Boolean = false;
		public var tower4:Boolean = false;
		
		
		public function Level(name:String):void
		{
			this.name = name;
		}
		
		public static function initLevels():void
		{
			/***************************************************************************************************
			 * Level 1
			 * 
			 **/
			Core.level_1 = new Level("Roswell, New Mexico");
			Core.level_1.terrain = "lightsand_road";
			Core.level_1.coordinateX = 91;
			Core.level_1.coordinateY = 119;
			
			Core.level_1.prize = 600;
			Core.level_1.baseLife = 1000;
			
			Core.level_1.tower2 = true;
			
			/***************************************************************************************************
			 * Level 2
			 * 
			 **/
			Core.level_2 = new Level("Helsinki, Finland");
			Core.level_2.terrain = "snow_road";
			Core.level_2.coordinateX = 230;
			Core.level_2.coordinateY = 81;
			
			Core.level_2.prize = 600;
			Core.level_2.baseLife = 3000;
			
			Core.level_2.unit2 = true;
			
			Core.level_2.tower2 = true;
			
			/***************************************************************************************************
			 * Level 3
			 * 
			 **/
			Core.level_3 = new Level("Alien Revolt in Florence, Italy");
			Core.level_3.terrain = "grass";
			Core.level_3.coordinateX = 218;
			Core.level_3.coordinateY = 108;
			
			Core.level_3.prize = 650;
			Core.level_3.baseLife = 4000;
			
			Core.level_3.unit2 = true;
			Core.level_3.unit3 = true;
			
			Core.level_3.tower2 = true;
			
			/***************************************************************************************************
			 * Level 4
			 * 
			 **/
			Core.level_4 = new Level("Cairo, Egypt");
			Core.level_4.terrain = "sand_road";
			Core.level_4.coordinateX = 239;
			Core.level_4.coordinateY = 124;
			
			Core.level_4.prize = 700;
			Core.level_4.baseLife = 5000;
			
			Core.level_4.unit2 = true;
			Core.level_4.unit3 = true;
			
			Core.level_4.tower2 = true;
			
			/***************************************************************************************************
			 * Level 5
			 * 
			 **/
			Core.level_5 = new Level("Jakarta, Indonesia");
			Core.level_5.terrain = "swamp";
			Core.level_5.coordinateX = 323;
			Core.level_5.coordinateY = 164;
			
			Core.level_5.prize = 800;
			Core.level_5.baseLife = 6000;
			
			Core.level_5.unit2 = true;
			Core.level_5.unit3 = true;
			
			Core.level_5.tower2 = true;
			
			/***************************************************************************************************
			 * Level 6
			 * 
			 **/
			Core.level_6 = new Level("Sao Paulo, Brazil");
			Core.level_6.terrain = "road";
			Core.level_6.coordinateX = 149;
			Core.level_6.coordinateY = 189;
			
			Core.level_6.prize = 900;
			Core.level_6.baseLife = 7000;
			
			Core.level_6.unit2 = true;
			Core.level_6.unit3 = true;
			
			Core.level_6.tower2 = true;
			
			/***************************************************************************************************
			 * Level 7
			 * 
			 **/
			Core.level_7 = new Level("Astana, Kazakhstan");
			Core.level_7.terrain = "clay";
			Core.level_7.coordinateX = 283;
			Core.level_7.coordinateY = 99;
			
			Core.level_7.prize = 1000;
			Core.level_7.baseLife = 8000;
			
			Core.level_7.unit2 = true;
			Core.level_7.unit3 = true;
			Core.level_7.unit4 = true;
			
			Core.level_7.tower2 = true;
			
			/***************************************************************************************************
			 * Level 8
			 * 
			 **/
			Core.level_8 = new Level("London, England");
			Core.level_8.terrain = "road";
			Core.level_8.coordinateX = 202;
			Core.level_8.coordinateY = 94;
			
			Core.level_8.prize = 1300;
			Core.level_8.baseLife = 9000;
			
			Core.level_8.unit2 = true;
			Core.level_8.unit3 = true;
			Core.level_8.unit4 = true;
			
			Core.level_8.tower2 = true;
			
			/***************************************************************************************************
			 * Level 9
			 * 
			 **/
			Core.level_9 = new Level("Santa Cruz de la Sierra, Bolivia");
			Core.level_9.terrain = "grass_road";
			Core.level_9.coordinateX = 134;
			Core.level_9.coordinateY = 179;
			
			Core.level_9.prize = 1450;
			Core.level_9.baseLife = 10000;
			
			Core.level_9.unit2 = true;
			Core.level_9.unit3 = true;
			Core.level_9.unit4 = true;
			
			Core.level_9.tower2 = true;
			Core.level_9.tower3 = true;
			
			/***************************************************************************************************
			 * Level 10
			 * 
			 **/
			Core.level_10 = new Level("Alien Revolution in Moscow, Russia");
			Core.level_10.terrain = "snow_2roads";
			Core.level_10.coordinateX = 246;
			Core.level_10.coordinateY = 89;
			
			Core.level_10.prize = 1500;
			Core.level_10.baseLife = 11500;
			
			Core.level_10.unit2 = true;
			Core.level_10.unit3 = true;
			Core.level_10.unit4 = true;
			Core.level_10.unit5 = true;
			
			Core.level_10.tower2 = true;
			Core.level_10.tower3 = true;
			
			/***************************************************************************************************
			 * Level 11
			 * 
			 **/
			Core.level_11 = new Level("Bangkok, Thailand");
			Core.level_11.terrain = "swamp_road";
			Core.level_11.coordinateX = 317;
			Core.level_11.coordinateY = 144;
			
			Core.level_11.prize = 1800;
			Core.level_11.baseLife = 12500;
			
			Core.level_11.unit2 = true;
			Core.level_11.unit3 = true;
			Core.level_11.unit4 = true;
			Core.level_11.unit5 = true;
			
			Core.level_11.tower2 = true;
			Core.level_11.tower3 = true;
			
			/***************************************************************************************************
			 * Level 12
			 * 
			 **/
			Core.level_12 = new Level("Rabat, Morocco");
			Core.level_12.terrain = "lightsand_road_alt";
			Core.level_12.coordinateX = 195;
			Core.level_12.coordinateY = 123;
			
			Core.level_12.prize = 1900;
			Core.level_12.baseLife = 14000;
			
			Core.level_12.unit2 = true;
			Core.level_12.unit3 = true;
			Core.level_12.unit4 = true;
			Core.level_12.unit5 = true;
			
			Core.level_12.tower2 = true;
			Core.level_12.tower3 = true;
			
			/***************************************************************************************************
			 * Level 13
			 * 
			 **/
			Core.level_13 = new Level("Reykjavik, Island");
			Core.level_13.terrain = "snow";
			Core.level_13.coordinateX = 181;
			Core.level_13.coordinateY = 76;
			
			Core.level_13.prize = 1900;
			Core.level_13.baseLife = 15000;
			
			Core.level_13.unit2 = true;
			Core.level_13.unit3 = true;
			Core.level_13.unit4 = true;
			Core.level_13.unit5 = true;
			
			Core.level_13.tower2 = true;
			Core.level_13.tower3 = true;
			
			/***************************************************************************************************
			 * Level 14
			 * 
			 **/
			Core.level_14 = new Level("Tokyo, Japan");
			Core.level_14.terrain = "road";
			Core.level_14.coordinateX = 361;
			Core.level_14.coordinateY = 114;
			
			Core.level_14.prize = 1900;
			Core.level_14.baseLife = 15500;
			
			Core.level_14.unit2 = true;
			Core.level_14.unit3 = true;
			Core.level_14.unit4 = true;
			Core.level_14.unit5 = true;
			
			Core.level_14.tower2 = true;
			Core.level_14.tower3 = true;
			
			/***************************************************************************************************
			 * Level 15
			 * 
			 **/
			Core.level_15 = new Level("Great Victoria Desert, Australia");
			Core.level_15.terrain = "sand";
			Core.level_15.coordinateX = 345;
			Core.level_15.coordinateY = 190;
			
			Core.level_15.prize = 1900;
			Core.level_15.baseLife = 16500;
			
			Core.level_15.unit2 = true;
			Core.level_15.unit3 = true;
			Core.level_15.unit4 = true;
			Core.level_15.unit5 = true;
			Core.level_15.unit6 = true;
			
			Core.level_15.tower2 = true;
			Core.level_15.tower3 = true;
			
			/***************************************************************************************************
			 * Level 16
			 * 
			 **/
			Core.level_16 = new Level("Irvine, California");
			Core.level_16.terrain = "grass_road";
			Core.level_16.coordinateX = 71;
			Core.level_16.coordinateY = 119;
			
			Core.level_16.prize = 1900;
			Core.level_16.baseLife = 17000;
			
			Core.level_16.unit2 = true;
			Core.level_16.unit3 = true;
			Core.level_16.unit4 = true;
			Core.level_16.unit5 = true;
			Core.level_16.unit6 = true;
			
			Core.level_16.tower2 = true;
			Core.level_16.tower3 = true;
			
			/***************************************************************************************************
			 * Level 17
			 * 
			 **/
			Core.level_17 = new Level("Sydney, Australia");
			Core.level_17.terrain = "grass_2roads";
			Core.level_17.coordinateX = 369;
			Core.level_17.coordinateY = 198;
			
			Core.level_17.prize = 1900;
			Core.level_17.baseLife = 17500;
			
			Core.level_17.unit2 = true;
			Core.level_17.unit3 = true;
			Core.level_17.unit4 = true;
			Core.level_17.unit5 = true;
			Core.level_17.unit6 = true;
			
			Core.level_17.tower2 = true;
			Core.level_17.tower3 = true;
			
			/***************************************************************************************************
			 * Level 18
			 * 
			 **/
			Core.level_18 = new Level("Alien Revolt in Khartoum, Sudan");
			Core.level_18.terrain = "clay_road";
			Core.level_18.coordinateX = 238;
			Core.level_18.coordinateY = 137;
			
			Core.level_18.prize = 2500;
			Core.level_18.baseLife = 18000;
			
			Core.level_18.unit2 = true;
			Core.level_18.unit3 = true;
			Core.level_18.unit4 = true;
			Core.level_18.unit5 = true;
			Core.level_18.unit6 = true;
			
			Core.level_18.tower2 = true;
			Core.level_18.tower3 = true;
			Core.level_18.tower4 = true;
			
			/***************************************************************************************************
			 * Level 19
			 * 
			 **/
			Core.level_19 = new Level("Kinsasa, Congo");
			Core.level_19.terrain = "grass";
			Core.level_19.coordinateX = 222;
			Core.level_19.coordinateY = 164;
			
			Core.level_19.prize = 2600;
			Core.level_19.baseLife = 19000;
			
			Core.level_19.unit2 = true;
			Core.level_19.unit3 = true;
			Core.level_19.unit4 = true;
			Core.level_19.unit5 = true;
			Core.level_19.unit6 = true;
			
			Core.level_19.tower2 = true;
			Core.level_19.tower3 = true;
			Core.level_19.tower4 = true;
			
			/***************************************************************************************************
			 * Level 20
			 * 
			 **/
			Core.level_20 = new Level("Vadodara, India");
			Core.level_20.terrain = "swamp_road";
			Core.level_20.coordinateX = 285;
			Core.level_20.coordinateY = 136;
			
			Core.level_20.prize = 3200;
			Core.level_20.baseLife = 20000;
			
			Core.level_20.unit2 = true;
			Core.level_20.unit3 = true;
			Core.level_20.unit4 = true;
			Core.level_20.unit5 = true;
			Core.level_20.unit6 = true;
			Core.level_20.unit7 = true;
			
			Core.level_20.tower2 = true;
			Core.level_20.tower3 = true;
			Core.level_20.tower4 = true;
			
			/***************************************************************************************************
			 * Level 21
			 * 
			 **/
			Core.level_21 = new Level("Montreal, Canada");
			Core.level_21.terrain = "road";
			Core.level_21.coordinateX = 121;
			Core.level_21.coordinateY = 102;
			
			Core.level_21.prize = 4000;
			Core.level_21.baseLife = 22000;
			
			Core.level_21.unit2 = true;
			Core.level_21.unit3 = true;
			Core.level_21.unit4 = true;
			Core.level_21.unit5 = true;
			Core.level_21.unit6 = true;
			Core.level_21.unit7 = true;
			
			Core.level_21.tower2 = true;
			Core.level_21.tower3 = true;
			Core.level_21.tower4 = true;
			
			/***************************************************************************************************
			 * Level 22
			 * 
			 **/
			Core.level_22 = new Level("Zacatecas, Mexico");
			Core.level_22.terrain = "sand_road";
			Core.level_22.coordinateX = 92;
			Core.level_22.coordinateY = 134;
			
			Core.level_22.prize = 4500;
			Core.level_22.baseLife = 24000;
			
			Core.level_22.unit2 = true;
			Core.level_22.unit3 = true;
			Core.level_22.unit4 = true;
			Core.level_22.unit5 = true;
			Core.level_22.unit6 = true;
			Core.level_22.unit7 = true;
			
			Core.level_22.tower2 = true;
			Core.level_22.tower3 = true;
			Core.level_22.tower4 = true;
			
			/***************************************************************************************************
			 * Level 23
			 * 
			 **/
			Core.level_23 = new Level("Somewhere in Russia");
			Core.level_23.terrain = "snow";
			Core.level_23.coordinateX = 320;
			Core.level_23.coordinateY = 73;
			
			Core.level_23.prize = 5000;
			Core.level_23.baseLife = 26000;
			
			Core.level_23.unit2 = true;
			Core.level_23.unit3 = true;
			Core.level_23.unit4 = true;
			Core.level_23.unit5 = true;
			Core.level_23.unit6 = true;
			Core.level_23.unit7 = true;
			Core.level_23.unit8 = true;
			
			Core.level_23.tower2 = true;
			Core.level_23.tower3 = true;
			Core.level_23.tower4 = true;
			
			/***************************************************************************************************
			 * Level 24
			 * 
			 **/
			Core.level_24 = new Level("Caracas, Venezuela");
			Core.level_24.terrain = "grass_2roads";
			Core.level_24.coordinateX = 134;
			Core.level_24.coordinateY = 147;
			
			Core.level_24.prize = 7000;
			Core.level_24.baseLife = 28000;
			
			Core.level_24.unit2 = true;
			Core.level_24.unit3 = true;
			Core.level_24.unit4 = true;
			Core.level_24.unit5 = true;
			Core.level_24.unit6 = true;
			Core.level_24.unit7 = true;
			Core.level_24.unit8 = true;
			
			Core.level_24.tower2 = true;
			Core.level_24.tower3 = true;
			Core.level_24.tower4 = true;
			
			/***************************************************************************************************
			 * Level 25
			 * 
			 **/
			Core.level_25 = new Level("Final Alien Rebellion - Beijing, China");
			Core.level_25.terrain = "road";
			Core.level_25.coordinateX = 334;
			Core.level_25.coordinateY = 111;
			
			Core.level_25.prize = 7000;
			Core.level_25.baseLife = 30000;
			
			Core.level_25.unit2 = true;
			Core.level_25.unit3 = true;
			Core.level_25.unit4 = true;
			Core.level_25.unit5 = true;
			Core.level_25.unit6 = true;
			Core.level_25.unit7 = true;
			Core.level_25.unit8 = true;
			
			Core.level_25.tower2 = true;
			Core.level_25.tower3 = true;
			Core.level_25.tower4 = true;
		}
	}
}