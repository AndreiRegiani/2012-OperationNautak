package Worlds
{
	import Entities.AI.MarinesAI;
	import Entities.AI.NauksAI;
	import Entities.Base;
	import Entities.GUI.BaseInfo;
	import Entities.GUI.Button;
	import Entities.GUI.Gameplay.Arrow;
	import Entities.GUI.Gameplay.Bar;
	import Entities.GUI.Gameplay.GameOver;
	import Entities.GUI.Gameplay.Hud;
	import Entities.GUI.Gameplay.Options;
	import Entities.GUI.Gameplay.Tutorial;
	import Entities.GUI.MouseOverInfo;
	import Entities.Terrain;
	import Entities.Towers.Marines.SolarPanel;
	import Entities.Towers.SolarTower;
	import Entities.TowerSlot;
	import Entities.Unit;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	import flash.utils.getTimer;
	
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Gameplay extends World
	{
		// music
		public static var music:Sfx = new Sfx(Assets.GAMEPLAY_MUSIC);
		
		// sounds
		public var sound_siren:Sfx = new Sfx(Assets.GAMEPLAY_SIREN);
		private var sound_won:Sfx = new Sfx(Assets.GAMEPLAY_WON);
		private var sound_lost:Sfx = new Sfx(Assets.GAMEPLAY_LOST);
		
		// gameover screen
		private var gameover:GameOver;
		
		// core
		private var blackTween:VarTween;
		public var baseInfo:BaseInfo;
		
		// tutorial
		public var tutorial:Tutorial;
		public var tutorialActive:Boolean;
		
		
		public function Gameplay():void
		{
			Core.paused = false;
			
			// shortcuts
			defineKeys();
			Core.game.startTime = getTimer();
		}
		
		private function defineKeys():void
		{
			// change sector
			Input.define("Up", Key.UP);
			Input.define("Down", Key.DOWN);
			
			// General
			Input.define("Cancel", Key.ESCAPE);
			
			
			// shortcuts
			
			/**
			 * Marines
			 * 
			 **/
			
			// buy towers
			Input.define("solar_panel", Key.DIGIT_1);
			Input.define("assault_tower", Key.DIGIT_2);
			Input.define("missile_launcher", Key.DIGIT_3);
			Input.define("ultra_blast", Key.DIGIT_4);
			
			// buy units
			Input.define("pistol", Key.Q);
			Input.define("eagle", Key.W);
			Input.define("smg", Key.E);
			Input.define("medic", Key.R);
			Input.define("assault", Key.A);
			Input.define("sniper", Key.S);
			Input.define("machine", Key.D);
			Input.define("bazooka", Key.F);
		}
		
		override public function begin():void
		{
			// HUD
			Core.hud = new Hud(Data.race);
			Core.hud.x = 0;
			Core.hud.y = 0;
			Core.hud.layer = -276;
			add(Core.hud);

			// bar (bottom)
			Core.bar = new Bar(Data.race);
			Core.bar.x = 0;
			Core.bar.y = 262;
			Core.bar.layer = -276;
			add(Core.bar);
			
			// options
			Core.options = new Options();
			Core.options.x = 133;
			Core.options.y = 61;
			Core.options.layer = -1001;
			add(Core.options);
			
			// terrain
			var terrain:Terrain = new Terrain(Core.terrain);
			terrain.x = 0;
			terrain.y = 0;
			terrain.layer = 1;
			add(terrain);
			
			// effects
			/*
			Core.effects = new Effects();
			Core.effects.layer = -275;
			add( Core.effects );
			*/
			
			// mouse over info
			Core.overInfo = new MouseOverInfo;
			Core.overInfo.layer = -1002;
			add ( Core.overInfo );
			
			// base info
			baseInfo = new BaseInfo();
			baseInfo.layer = -999;
			baseInfo.visible = false;
			add(baseInfo);
			
			// AI
			switch (Core.enemyRace)
			{
				case "Marines":
					Core.ai = new MarinesAI();
					break;
					
				case "Nauks":
					Core.ai = new NauksAI();
					break;
			}
			
			add(Core.ai);
			
			
			setupBases();
			setupTowerSlots();
			
			
			// arrow (indicate the selected sector)
			Core.arrow = new Arrow(Data.race);
			Core.arrow.layer = -1;
			add(Core.arrow);
			
			
			// screen transition (and dark background on pause screen)
			Core.black = Image.createRect(400, 275, 0x000000);
			Core.black.alpha = 1;
			addGraphic(Core.black, -1000);
			
			blackTween = new VarTween(upBarsLayer);
			addTween(blackTween);
			
			blackTween.tween(Core.black, "alpha", 0, 1.4, Ease.quadIn);
			blackTween.start();
			
			// sounds
			if (Shop.music.playing)
			{
				Shop.music.stop();
			}
			
			if (Core.music)
			{
				Gameplay.music.loop();
			}
			
			else
			{
				Gameplay.music.loop(0, 0);
			}
			
			// gameover
			gameover = new GameOver();
			gameover.layer = -998;
			add(gameover);
			
			// Tutorial
			if (Data.level == 1)
			{
				tutorial = new Tutorial();
				tutorial.layer = -999;
				add(tutorial);
				
				tutorialActive = true;
				Core.arrow.visible = false;
			}
			
			else
			{
				tutorialActive = false;
				sound_siren.play(Core.vol);
				baseInfo.visible = true;
			}
		}
		
		override public function update():void
		{
			if (Core.paused)
			{
				if (!Core.gameplay.tutorialActive)
				{
					// bottom bar buttons
					Core.bar.surrender.update();
					Core.bar.options.update();
					Core.bar.moreGames.update();
					
					// options
					Core.options.ok.update();
					Core.options.sound.update();
					Core.options.music.update();
					//Core.options.particles.update();
					Core.options.autoCollect.update();
					
					keyCancel();
				}
				
				// Tutorial
				else
				{
					Core.gameplay.tutorial.update();
				}
			}
			
			else
			{
				Core.overInfo.clear();
				
				checkKeyboardInput();
				checkMouseInput();
				
				super.update();
			}
		}
		
		private function setupBases():void
		{
			// player's bases
			Core.game.playerBaseA = new Base(Data.race, "left", "A", Data.baseLife);
			Core.game.playerBaseB = new Base(Data.race, "left", "B", Data.baseLife);
			Core.game.playerBaseC = new Base(Data.race, "left", "C", Data.baseLife);
			
			// enemy's bases
			Core.game.enemyBaseA = new Base(Core.enemyRace, "right", "A", Core.ai.baseLife);
			Core.game.enemyBaseB = new Base(Core.enemyRace, "right", "B", Core.ai.baseLife);
			Core.game.enemyBaseC = new Base(Core.enemyRace, "right", "C", Core.ai.baseLife);
			
			// add to world
			add(Core.game.playerBaseA);
			add(Core.game.playerBaseB);
			add(Core.game.playerBaseC);
			
			add(Core.game.enemyBaseA);
			add(Core.game.enemyBaseB);
			add(Core.game.enemyBaseC);
		}
		
		private function setupTowerSlots():void
		{
			// player's slots
			
			// player's slot 1
			var playerSlot1:TowerSlot = new TowerSlot("left");
			playerSlot1.x = 1;
			playerSlot1.y = 103;
			
			// player's slot 2
			var playerSlot2:TowerSlot = new TowerSlot("left");
			playerSlot2.x = 29;
			playerSlot2.y = 103;
			
			// player's slot 3
			var playerSlot3:TowerSlot = new TowerSlot("left");
			playerSlot3.x = 57;
			playerSlot3.y = 103;
			
			// player's slot 4
			var playerSlot4:TowerSlot = new TowerSlot("left");
			playerSlot4.x = 85;
			playerSlot4.y = 103;
			
			// player's slot 5
			var playerSlot5:TowerSlot = new TowerSlot("left");
			playerSlot5.x = 113;
			playerSlot5.y = 103;
			
			// player's slot 6
			var playerSlot6:TowerSlot = new TowerSlot("left");
			playerSlot6.x = 141;
			playerSlot6.y = 103;
			
			// player's slot 7
			var playerSlot7:TowerSlot = new TowerSlot("left");
			playerSlot7.x = 1;
			playerSlot7.y = 183;
			
			// player's slot 8
			var playerSlot8:TowerSlot = new TowerSlot("left");
			playerSlot8.x = 29;
			playerSlot8.y = 183;
			
			// player's slot 9
			var playerSlot9:TowerSlot = new TowerSlot("left");
			playerSlot9.x = 57;
			playerSlot9.y = 183;
			
			// player's slot 10
			var playerSlot10:TowerSlot = new TowerSlot("left");
			playerSlot10.x = 85;
			playerSlot10.y = 183;
			
			// player's slot 11
			var playerSlot11:TowerSlot = new TowerSlot("left");
			playerSlot11.x = 113;
			playerSlot11.y = 183;
			
			// player's slot 12
			var playerSlot12:TowerSlot = new TowerSlot("left");
			playerSlot12.x = 141;
			playerSlot12.y = 183;
			
			
			
			// enemy's slots
			
			// enemy's slot 1
			Core.game.enemySlot1 = new TowerSlot("right");
			Core.game.enemySlot1.x = 235;
			Core.game.enemySlot1.y = 103;
			
			// enemy's slot 2
			Core.game.enemySlot2 = new TowerSlot("right");
			Core.game.enemySlot2.x = 263;
			Core.game.enemySlot2.y = 103;
			
			// enemy's slot 3
			Core.game.enemySlot3 = new TowerSlot("right");
			Core.game.enemySlot3.x = 291;
			Core.game.enemySlot3.y = 103;
			
			// enemy's slot 4
			Core.game.enemySlot4 = new TowerSlot("right");
			Core.game.enemySlot4.x = 319;
			Core.game.enemySlot4.y = 103;
			
			// enemy's slot 5
			Core.game.enemySlot5 = new TowerSlot("right");
			Core.game.enemySlot5.x = 347;
			Core.game.enemySlot5.y = 103;
			
			// enemy's slot 6
			Core.game.enemySlot6 = new TowerSlot("right");
			Core.game.enemySlot6.x = 375;
			Core.game.enemySlot6.y = 103;
			
			// enemy's slot 7
			Core.game.enemySlot7 = new TowerSlot("right");
			Core.game.enemySlot7.x = 235;
			Core.game.enemySlot7.y = 183;
			
			// enemy's slot 8
			Core.game.enemySlot8 = new TowerSlot("right");
			Core.game.enemySlot8.x = 263;
			Core.game.enemySlot8.y = 183;
			
			// enemy's slot 9
			Core.game.enemySlot9 = new TowerSlot("right");
			Core.game.enemySlot9.x = 291;
			Core.game.enemySlot9.y = 183;
			
			// enemy's slot 10
			Core.game.enemySlot10 = new TowerSlot("right");
			Core.game.enemySlot10.x = 319;
			Core.game.enemySlot10.y = 183;
			
			// enemy's slot 11
			Core.game.enemySlot11 = new TowerSlot("right");
			Core.game.enemySlot11.x = 347;
			Core.game.enemySlot11.y = 183;
			
			// enemy's slot 12
			Core.game.enemySlot12 = new TowerSlot("right");
			Core.game.enemySlot12.x = 375;
			Core.game.enemySlot12.y = 183;
			
			
			// add to world
			
			// player's slots
			add(playerSlot1);
			add(playerSlot2);
			add(playerSlot3);
			add(playerSlot4);
			add(playerSlot5);
			add(playerSlot6);
			add(playerSlot7);
			add(playerSlot8);
			add(playerSlot9);
			add(playerSlot10);
			add(playerSlot11);
			add(playerSlot12);
			
			// enemy's slots
			add(Core.game.enemySlot1);
			add(Core.game.enemySlot2);
			add(Core.game.enemySlot3);
			add(Core.game.enemySlot4);
			add(Core.game.enemySlot5);
			add(Core.game.enemySlot6);
			add(Core.game.enemySlot7);
			add(Core.game.enemySlot8);
			add(Core.game.enemySlot9);
			add(Core.game.enemySlot10);
			add(Core.game.enemySlot11);
			add(Core.game.enemySlot12);
		}
		
		private function checkKeyboardInput():void
		{
			// key UP
			if ( Input.pressed("Up") )
			{
				// on Sector B
				if (Core.game.sector == "B")
				{
					if (!Core.game.playerBaseA.destroyed && !Core.game.enemyBaseA.destroyed)
					{
						Core.game.sector = "A";
						Core.arrow.updatePosition();
					}
				}
				
				// on Sector C
				if (Core.game.sector == "C")
				{
					if (!Core.game.playerBaseB.destroyed && !Core.game.enemyBaseB.destroyed)
					{
						Core.game.sector = "B";
						Core.arrow.updatePosition();
					}
					
					else if (!Core.game.playerBaseA.destroyed && !Core.game.enemyBaseA.destroyed)
					{
						Core.game.sector = "A";
						Core.arrow.updatePosition();
					}
				}
			}
			
			// key DOWN
			if ( Input.pressed("Down") )
			{
				// on Sector B
				if (Core.game.sector == "B")
				{
					if (!Core.game.playerBaseC.destroyed && !Core.game.enemyBaseC.destroyed)
					{
						Core.game.sector = "C";
						Core.arrow.updatePosition();
					}
				}
				
				// on Sector C
				if (Core.game.sector == "A")
				{
					if (!Core.game.playerBaseB.destroyed && !Core.game.enemyBaseB.destroyed)
					{
						Core.game.sector = "B";
						Core.arrow.updatePosition();
					}
					
					else if (!Core.game.playerBaseC.destroyed && !Core.game.enemyBaseC.destroyed)
					{
						Core.game.sector = "C";
						Core.arrow.updatePosition();
					}
				}
			}
			
			keyCancel();
		}
		
		private function keyCancel():void
		{
			// key CANCEL
			if ( Input.pressed("Cancel") )
			{
				// to cancel building a tower
				if (Core.game.isDragging)
				{
					if (!Core.game.draggingTower is SolarTower)
					{
						Core.game.money += Core.game.draggingTower.energy;
					}
					
					// Solar Tower - cost of solar towers depends on how many solars were build, give back equivalent money
					else
					{
						Core.game.money += SolarPanel.energy * Core.game.solarCounter;
					}
					
					Core.hud.updateHud();

					// remove dragged tower
					Core.game.isDragging = false;
					FP.world.remove(Core.game.draggingTower);
					
					Core.overInfo.visible = true;
					
					// cursor
					Mouse.cursor = MouseCursor.ARROW;
				}
				
				// to open pause/options menu
				else
				{
					Core.options.toggleVisibility();
					Core.paused = !Core.paused;
					
					// sound
					Utils.sound_click.play(Core.vol);
				}
			}
		}
		
		private function checkMouseInput():void
		{
			if ( Input.mouseReleased )
			{
				var mouseY:int = FP.world.mouseY;
				
				// Sector A
				if (mouseY >= 38 && mouseY <= 101 && Core.game.sector != "A" && !Core.game.playerBaseA.destroyed && !Core.game.enemyBaseA.destroyed)
				{
					Core.game.sector = "A";
					Core.arrow.updatePosition();
				}
				
				// Sector B
				else if (mouseY >= 126 && mouseY <= 181 && Core.game.sector != "B" && !Core.game.playerBaseB.destroyed && !Core.game.enemyBaseB.destroyed)
				{
					Core.game.sector = "B";
					Core.arrow.updatePosition();
				}
				
				// Sector C
				else if (mouseY >= 206 && mouseY <= 261 && Core.game.sector != "C" && !Core.game.playerBaseC.destroyed && !Core.game.enemyBaseC.destroyed)
				{
					Core.game.sector = "C";
					Core.arrow.updatePosition();
				}
			}
		}
		
		public function checkVictory():void
		{
			var playerPoints:uint = 0;
			var enemyPoints:uint = 0;
			
			
			// calculate points
			
			// player's points
			if (Core.game.enemyBaseA.destroyed)
			{
				playerPoints++;
			}
			
			if (Core.game.enemyBaseB.destroyed)
			{
				playerPoints++;
			}
			
			if (Core.game.enemyBaseC.destroyed)
			{
				playerPoints++;
			}
			
			// enemy's points
			if (Core.game.playerBaseA.destroyed)
			{
				enemyPoints++;
			}
			
			if (Core.game.playerBaseB.destroyed)
			{
				enemyPoints++;
			}
			
			if (Core.game.playerBaseC.destroyed)
			{
				enemyPoints++;
			}
			
			
			// check possibilities
			
			// check if the player wins
			if (playerPoints == 2 && enemyPoints == 0)
			{
				gameOver("left");
			}
			
			else if (playerPoints == 2 && enemyPoints == 1)
			{
				gameOver("left");
			}
			
			
			// check if the enemy wins
			if (enemyPoints == 2 && playerPoints == 0)
			{
				gameOver("right");
			}
			
			else if (enemyPoints == 2 && playerPoints == 1)
			{
				gameOver("right");
			}
		}
		
		// "left" (player) - "right" (cpu)
		private function gameOver(winner:String):void
		{
			Core.game.winner = winner;
			
			// fallback loosers
			var unitList:Array = [];
			FP.world.getType("unit", unitList);
			
			for each (var target:Unit in unitList)
			{
				if (target.team != winner)
				{
					target.goAhead = false;
				}
			}
			
			Gameplay.music.stop();
			
			// player won
			if (winner == "left")
			{
				sound_won.play(Core.vol);
			}
			
			// player lost
			else
			{
				// sound
				sound_lost.play(Core.vol);
			}
			
			// hide overInfo (mouse)
			Core.overInfo.layer = 1000;
			baseInfo.visible = false;
			
			// show 'Game Over' screen
			blackTween.tween(Core.black, "alpha", 1, 4, Ease.cubeIn);
			blackTween.complete = tiltBack;
			blackTween.start();
			
			// place 'Bottom Bar' behind the black screen
			Core.bar.layer = -276;
			Core.bar.surrender.layer = -276;
			Core.bar.options.layer = -276;
			Core.bar.moreGames.layer = -276;
			
			if (Core.game.winner == "left")
			{
				Core.black.visible = false;
			}
			
			else
			{
				Core.black.visible = true;
			}
		}
		
		private function upBarsLayer():void
		{
			baseInfo.layer = -1002;
			Core.bar.updateLayer();
			
			if (Data.level == 1)
			{
				Mouse.cursor = MouseCursor.BUTTON;
			}
		}
		
		// Game Over :: Tilt screen (callback)
		private function tiltBack():void
		{
			gameover.show(Core.game.winner);
			
			blackTween.tween(Core.black, "alpha", 0, 2, Ease.cubeOut);
			blackTween.complete = null;
			blackTween.start();
		}
	}
}