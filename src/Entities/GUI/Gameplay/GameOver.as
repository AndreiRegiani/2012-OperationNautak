package Entities.GUI.Gameplay
{
	import flash.text.TextColorType;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import Entities.GUI.Button;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	import Worlds.Shop;
	import Worlds.Menu;
	
	public class GameOver extends Entity
	{
		// background
		private var background:Image;
		
		// title
		private var title:Text;
		
		// score
		private var score:Text;
		
		// kills
		private var kills:Text;
		
		// deaths
		private var deaths:Text;
		
		// prize
		private var prize:Text;
		
		// proceed
		private var proceed:Button;
		
		// sponsor
		private var sponsor:Button;
		
		
		public function GameOver():void
		{
			
		}
		
		override public function added():void
		{
			// background
			background = new Image(Assets.GAMEOVER_BACKGROUND);
			background.x = 91;
			background.y = 50;
			
			// title
			title = new Text("Defeat", 154, 49, 100, 100);
			title.font = "Optimus";
			title.size = 24;
			title.color = 0xFFFFFF;
			
			// score
			score = new Text("Score: 0", 109, 91, 500, 100);
			score.font = "Wonder";
			score.size = 10;
			score.color = 0xFFFFFF;
			
			// kills
			kills = new Text("Kills: 0", 154, 130, 500, 100);
			kills.font = "Wonder";
			kills.size = 10;
			kills.color = 0xFFFFFF;
			
			// deaths
			deaths = new Text("Deaths: 0", 154, 145, 500, 100);
			deaths.font = "Wonder";
			deaths.size = 10;
			deaths.color = 0xFFFFFF;
			
			// prize
			prize = new Text("Cash: 0", 217, 197, 500, 100);
			prize.font = "Wonder";
			prize.size = 10;
			prize.color = 0xFFFFFF;
			
			// proceed (button)
			proceed = new Button();
			proceed.callback = proceedClick;
			proceed.normal = proceed.down = new Image(Assets.GAMEOVER_PROCEED_NORMAL);
			proceed.hover = new Image(Assets.GAMEOVER_PROCEED_HOVER);
			proceed.x = 263;
			proceed.y = 236;
			proceed.setHitbox(50, 14);
			proceed.layer = -999;
			proceed.visible = false;
			FP.world.add(proceed);
			
			// sponsor (button)
			sponsor = new Button();
			sponsor.callback = sponsorClick;
			sponsor.normal = sponsor.down = new Image(Assets.GAMEOVER_SPONSOR_NORMAL);
			sponsor.hover = new Image(Assets.GAMEOVER_SPONSOR_HOVER);
			sponsor.x = 102;
			sponsor.y = 184;
			sponsor.setHitbox(89, 57);
			sponsor.layer = -999;
			sponsor.visible = false;
			FP.world.add(sponsor);
			
			
			// Add graphics
			graphic = new Graphiclist(background, title, score, kills, deaths, prize);
			
			visible = false;
		}
		
		public function hide():void
		{
			visible = false;
			sponsor.visible = false;
			proceed.visible = false;
		}
		
		public function show(winner:String):void
		{
			// make visible
			visible = true;
			sponsor.visible = true;
			proceed.visible = true;
			
			// vars
			var total_prize:uint;
			
			// avoid negative score
			if (Core.game.score < 0)
			{
				Core.game.score = 0;
			}
			
			// generate money by score
			total_prize += Core.game.score / 50;
			
			if (winner == "left")
			{
				title.text = "Victory";
				
				// Level up
				Data.level++;
				
				total_prize += Core.currentLevel.prize;
			}
			
			else
			{
				title.text = "Defeat";
				title.x += 6;
				title.y += 1;
			}
			
			score.text = "Score: " + Core.game.score;
			kills.text = "Kills: " + Core.game.kills;
			deaths.text = "Deaths: " + Core.game.deaths;
			prize.text = "Cash: " + total_prize;
			
			// deposit cash
			Data.money += total_prize;
			
			// Progress
			Core.progress.save();
		}
		
		private function proceedClick():void
		{
			proceed.normal = proceed.down = proceed.hover = new Image(Assets.GAMEOVER_PROCEED_HOVER);
			Utils.sound_click.play(Core.vol);
			
			Core.black.visible = true;
			var blackTween:VarTween = new VarTween(changeWorld);
			blackTween.tween(Core.black, "alpha", 1, 1.6, Ease.cubeOut);
			addTween(blackTween);
		}
		
		private function changeWorld():void
		{
			Core.gameplay.removeAll();
			
			if (Data.level <= Core.totalLevels)
			{
				FP.world = new Shop(true);
			}
			
			else
			{
				FP.world = new Menu(false, "Credits");
			}
		}
		
		private function sponsorClick():void
		{
			Utils.openURL(Core.sponsor_url);
			Utils.sound_click.play(Core.vol);
		}
	}
}