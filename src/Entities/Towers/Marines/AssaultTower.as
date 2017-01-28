package Entities.Towers.Marines
{
	import Entities.Towers.ShootableTower;
	import Entities.Bullets.AssaultTowerBullet;
	import Entities.Unit;
	
	public class AssaultTower extends ShootableTower
	{
		public static var name:String = "Assault Tower";
		public static var cost:uint = 400;
		public static var energy:uint = 500;
		
		public function AssaultTower():void
		{
			// info
			energy = AssaultTower.energy;
			
			// stats
			power = 16;
			attackRange = 70;
			attackDelay = 0.5;
			rotationSpeed = 135;
			
			// sprite (base)
			frameWidth = 27;
			frameHeight = 27;
			offsetX = -1;
			offsetY = -5;
			
			// sprite (barrel)
			originX_barrel = 13;
			originY_barrel = 13;
			
			// sound
			fire_class = Assets.ASSAULT_TOWER_FIRE;
			place_source = Assets.MARINES_BUILDS_PLACE;

			super();
		}
		
		override protected function doAttack(target:Unit):void
		{
			var bullet:AssaultTowerBullet = new AssaultTowerBullet();
			bullet.setup(team, power, this.x + originX_barrel, this.y + originY_barrel, target.x + target.halfWidth, target.y + target.halfHeight);
			bullet.layer = this.layer + 1;
			world.add(bullet);
			
			super.doAttack(target);
		}
		
		override protected function setupLeft():void
		{
			source = Assets.ASSAULT_TOWER_BASE;
			source_barrel = Assets.ASSAULT_TOWER_BARREL;
			
			// Alien revolt levels
			if (Data.level == 3 || Data.level == 10 || Data.level == 18 || Data.level == 25)
			{
				source = Assets.ASSAULT_TOWER_BASE_NAUK;
				source_barrel = Assets.ASSAULT_TOWER_BARREL_NAUK;
			}
			
			Core.game.score += 500;
		}
		
		override protected function setupRight():void
		{
			source = Assets.ASSAULT_TOWER_BASE_NAUK;
			source_barrel = Assets.ASSAULT_TOWER_BARREL_NAUK;
		}
	}
}