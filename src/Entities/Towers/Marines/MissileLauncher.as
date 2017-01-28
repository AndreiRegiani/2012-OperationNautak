package Entities.Towers.Marines
{
	import Entities.Towers.ShootableTower;
	import Entities.Bullets.MissileLauncherBullet;
	import Entities.Unit;
	
	public class MissileLauncher extends ShootableTower
	{
		public static var name:String = "Missile Launcher";
		public static var cost:uint = 3200;
		public static var energy:uint = 900;
		
		public function MissileLauncher():void
		{
			// info
			energy = MissileLauncher.energy;
			
			// stats
			power = 60;
			attackRange = 80;
			attackDelay = 1.0;
			rotationSpeed = 100;
			
			// sprite (base)
			frameWidth = 27;
			frameHeight = 27;
			offsetX = -1;
			offsetY = -5;
			
			// sprite (barrel)
			originX_barrel = 13;
			originY_barrel = 13;
			
			// sound
			fire_class = Assets.MISSILE_LAUNCHER_FIRE;
			place_source = Assets.MARINES_BUILDS_PLACE;

			super();
		}
		
		override protected function doAttack(target:Unit):void
		{
			var bullet:MissileLauncherBullet = new MissileLauncherBullet();
			bullet.setup(team, power, this.x + originX_barrel, this.y + originY_barrel, target.x + target.halfWidth, target.y + target.halfHeight);
			bullet.layer = this.layer + 1;
			world.add(bullet);
			
			super.doAttack(target);
		}
		
		override protected function setupLeft():void
		{
			source = Assets.MISSILE_LAUNCHER_BASE;
			source_barrel = Assets.MISSILE_LAUNCHER_BARREL;
			
			// Alien revolt levels
			if (Data.level == 3 || Data.level == 10 || Data.level == 18 || Data.level == 25)
			{
				source = Assets.MISSILE_LAUNCHER_BASE_NAUK;
				source_barrel = Assets.MISSILE_LAUNCHER_BARREL_NAUK;
			}
			
			Core.game.score += 700;
		}
		
		override protected function setupRight():void
		{
			source = Assets.MISSILE_LAUNCHER_BASE_NAUK;
			source_barrel = Assets.MISSILE_LAUNCHER_BARREL_NAUK;
		}
	}
}