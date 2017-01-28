package Entities.GUI.Gameplay.OptionsButtons
{
	import Entities.GUI.Gameplay.OptionsButton;
	
	public class ParticlesOptionsButton extends OptionsButton
	{
		public function ParticlesOptionsButton():void
		{
			string = "Particles";
			setup(77, 10);
			size = 6;
			updateButton(Core.particles);
		}
		
		override public function click():void
		{
			Core.particles = !Core.particles;
			updateButton(Core.particles);
			
			super.click();
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
	}
}