package Entities
{
	import net.flashpunk.Entity
	import net.flashpunk.graphics.Image;
	
	public class Terrain extends Entity
	{
		private var image:Image;
		
		public function Terrain(type:String):void
		{
			switch(type)
			{
				case "grass":
					image = new Image(Assets.TERRAIN_GRASS);
					break;
					
				case "grass_road":
					image = new Image(Assets.TERRAIN_GRASS_ROAD);
					break;
				
				case "grass_2roads":
					image = new Image(Assets.TERRAIN_GRASS_2ROADS);
					break;
					
					
					
				case "sand":
					image = new Image(Assets.TERRAIN_SAND);
					break;
					
				case "sand_road":
					image = new Image(Assets.TERRAIN_SAND_ROAD);
					break;
					
				case "lightsand_road":
					image = new Image(Assets.TERRAIN_SAND_LIGHTSAND_ROAD);
					break;
					
				case "lightsand_road_alt":
					image = new Image(Assets.TERRAIN_SAND_LIGHTSAND_ROAD_ALT);
					break;
					
					
					
				case "clay":
					image = new Image(Assets.TERRAIN_CLAY);
					break;
					
				case "clay_road":
					image = new Image(Assets.TERRAIN_CLAY_ROAD);
					break;
					
					
					
				case "swamp":
					image = new Image(Assets.TERRAIN_SWAMP);
					break;
					
				case "swamp_road":
					image = new Image(Assets.TERRAIN_CLAY_ROAD);
					break;
					
					
					
				case "snow":
					image = new Image(Assets.TERRAIN_SNOW);
					break;
					
				case "snow_road":
					image = new Image(Assets.TERRAIN_SNOW_ROAD);
					break;
					
				case "snow_2roads":
					image = new Image(Assets.TERRAIN_SNOW_2ROADS);
					break;
					
					
					
				case "road":
					image = new Image(Assets.TERRAIN_ROAD);
					break;
			}
			
			graphic = image;
		}
	}
}