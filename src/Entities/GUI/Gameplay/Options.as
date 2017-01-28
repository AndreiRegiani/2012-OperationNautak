package Entities.GUI.Gameplay
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import Entities.GUI.Button;
	import net.flashpunk.FP;
	import Entities.GUI.Gameplay.OptionsButtons.*;
	import Worlds.Gameplay;
	
	public class Options extends Entity
	{
		private var background:Image;
		public var ok:Button;
		
		public var sound:SoundOptionsButton;
		public var music:MusicOptionsButton;
		public var particles:ParticlesOptionsButton;
		public var autoCollect:AutoCollectOptionsButton;
		
		public function Options():void
		{
			visible = false;
		}
		
		override public function added():void
		{
			// Background
			background = new Image(Assets.OPTIONS_BACKGROUND);
			graphic = background;
			
			// OK (button)
			ok = new Button(234, 156, 33, 21, okClick);
			ok.normal = ok.down = new Image(Assets.OPTIONS_OK_NORMAL);
			ok.hover = new Image(Assets.OPTIONS_OK_HOVER);
			ok.layer = layer;
			FP.world.add(ok);
			ok.visible = false;
			ok.pausable = false;
			
			// Sound
			sound = new SoundOptionsButton();
			sound.x = 148;
			sound.y = 89;
			sound.layer = layer;
			FP.world.add(sound);
			sound.visible = false;
			sound.pausable = false;
			
			// Music
			music = new MusicOptionsButton();
			music.x = 148;
			music.y = 110;
			music.layer = layer;
			FP.world.add(music);
			music.visible = false;
			music.pausable = false;
			
			// Particles
			/*
			particles = new ParticlesOptionsButton();
			particles.x = 137;
			particles.y = 127;
			particles.layer = layer;
			FP.world.add(particles);
			particles.visible = false;
			particles.pausable = false;
			*/
			
			// Auto Collect Solar
			autoCollect = new AutoCollectOptionsButton();
			autoCollect.x = 137;
			autoCollect.y = 139;
			autoCollect.layer = layer;
			FP.world.add(autoCollect);
			autoCollect.visible = false;
			autoCollect.pausable = false;
		}
		
		public function toggleVisibility():void
		{
			visible = !visible;
			
			ok.visible = visible;
			sound.visible = visible;
			music.visible = visible;
			//particles.visible = visible;
			autoCollect.visible = visible;
			
			// darken the background
			Core.black.visible = visible;
			
			if (visible)
			{
				Core.black.alpha = 0.6;
			}
			
			else
			{
				Core.black.alpha = 0;
				Core.bar.surrender.confirm = false;
			}
		}
		
		private function okClick():void
		{
			toggleVisibility();
			Core.paused = !Core.paused;
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
	}
}