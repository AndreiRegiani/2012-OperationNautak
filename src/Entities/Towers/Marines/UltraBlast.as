package Entities.Towers.Marines
{
	import Entities.Towers.ShootableTower;
	import Entities.Bullets.UltraBlastBullet;
	import Entities.Unit;
	
	public class UltraBlast extends ShootableTower
	{
		public static var name:String = "Ultra Blast";
		public static var cost:uint = 5000;
		public static var energy:uint = 2500;
		
		public function UltraBlast():void
		{
			// info
			energy = UltraBlast.energy;
			
			// stats
			power = 300;
			attackRange = 200;
			attackDelay = 2.6;
			rotationSpeed = 150;
			
			// sprite (base)
			frameWidth = 27;
			frameHeight = 27;
			offsetX = -1;
			offsetY = -5;
			
			// sprite (barrel)
			originX_barrel = 13;
			originY_barrel = 13;
			
			// sound
			fire_class = Assets.ULTRA_BLAST_FIRE;
			place_source = Assets.MARINES_BUILDS_PLACE;

			super();
		}
		
		override protected function doAttack(target:Unit):void
		{
			var bullet:UltraBlastBullet = new UltraBlastBullet();
			bullet.setup(team, power, this.x + originX_barrel, this.y + originY_barrel, target.x + target.halfWidth, target.y + target.halfHeight);
			bullet.layer = this.layer + 1;
			world.add(bullet);
			
			super.doAttack(target);
		}
		
		override protected function setupLeft():void
		{
			source = Assets.ULTRA_BLAST_BASE;
			source_barrel = Assets.ULTRA_BLAST_BARREL;
			
			// Alien revolt levels
			if (Data.level == 3 || Data.level == 10 || Data.level == 18 || Data.level == 25)
			{
				source = Assets.ULTRA_BLAST_BASE_NAUK;
				source_barrel = Assets.ULTRA_BLAST_BARREL_NAUK;
			}
			
			Core.game.score += 1000;
		}
		
		override protected function setupRight():void
		{
			source = Assets.ULTRA_BLAST_BASE_NAUK;
			source_barrel = Assets.ULTRA_BLAST_BARREL_NAUK;
		}
	}
}