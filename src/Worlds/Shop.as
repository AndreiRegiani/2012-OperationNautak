package Worlds
{
	import Entities.GUI.Button;
	import Entities.GUI.MouseOverInfo;
	import Entities.Terrain;
	import Entities.Towers.Marines.*;
	import Entities.Units.Marines.*;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	
	public class Shop extends World
	{
		// core
		private var state:String; // Main, Menu, Ready
		private var loaded:Boolean;
		
		// arts
		private var background:Entity;
		private var title:Entity;
		private var units:Entity;
		private var towers:Entity;
		private var base:Entity;
		
		// sounds
		public static var music:Sfx = new Sfx(Assets.SHOP_MUSIC);
		
		// buttons
		private var ready:Button;
		private var menu:Button;
		private var muteButton:Button;
		private var facebookButton:Button;
		private var sponsorLogo:Button;
		
		// texts
		private var money:Text;
		
		// Tweens
		private var backgroundTween:VarTween;
		private var titleTween:VarTween;
		private var unitsTween:VarTween;
		private var towersTween:VarTween;
		private var baseTween:VarTween;
		private var readyTween:VarTween;
		private var menuTween:VarTween;
		private var moneyTween:VarTween;
		private var muteTween:VarTween;
		private var facebookTween:VarTween;
		private var sponsorLogoTween:VarTween;
		
		
		// Units
		
		// units (skins)
		private var unit1:Spritemap;
		private var unit2:Spritemap;
		private var unit3:Spritemap;
		private var unit4:Spritemap;
		private var unit5:Spritemap;
		private var unit6:Spritemap;
		private var unit7:Spritemap;
		private var unit8:Spritemap;
		
		// units (butttons)
		private var unit1Button:Button;
		private var unit2Button:Button;
		private var unit3Button:Button;
		private var unit4Button:Button;
		private var unit5Button:Button;
		private var unit6Button:Button;
		private var unit7Button:Button;
		private var unit8Button:Button;
		
		// units (name field)
		private var unit1Name:Text;
		private var unit2Name:Text;
		private var unit3Name:Text;
		private var unit4Name:Text;
		private var unit5Name:Text;
		private var unit6Name:Text;
		private var unit7Name:Text;
		private var unit8Name:Text;
		
		// units (price text)
		private var unit1Text:Text;
		private var unit2Text:Text;
		private var unit3Text:Text;
		private var unit4Text:Text;
		private var unit5Text:Text;
		private var unit6Text:Text;
		private var unit7Text:Text;
		private var unit8Text:Text;
		
		
		// Towers
		
		// towers (skins)
		private var tower1:Spritemap;
		
		private var tower2:Image;
		private var tower2_barrel:Spritemap;
		
		private var tower3:Image;
		private var tower3_barrel:Spritemap;
		
		private var tower4:Image;
		private var tower4_barrel:Spritemap;
		
		// towers (buttons)
		private var tower1Button:Button;
		private var tower2Button:Button;
		private var tower3Button:Button;
		private var tower4Button:Button;
		
		// towers (name field)
		private var tower1Name:Text;
		private var tower2Name:Text;
		private var tower3Name:Text;
		private var tower4Name:Text;
		
		// towers (price text)
		private var tower1Text:Text;
		private var tower2Text:Text;
		private var tower3Text:Text;
		private var tower4Text:Text;
		
		
		// Base
		private var baseSkin:Button;
		private var baseHP:Text;
		private var baseText:Text;
		private var basePrice:Text;
		
		// stats
		private var baseUpgradeValue:int = 250;
		private var baseUpgradeCost:int = 150;
		
		// sounds
		private var sound_unlock:Sfx = new Sfx(Assets.SHOP_UNLOCK);
		
		
		public function Shop(fade:Boolean = false):void
		{
			state = "Main";
			loaded = false;
			
			// mouse over info
			Core.overInfo = new MouseOverInfo();
			Core.overInfo.layer = -277;
			add ( Core.overInfo );
			
			// effects
			/*
			Core.effects = new Effects();
			Core.effects.layer = -275;
			add( Core.effects );
			*/
			
			if (!fade)
			{
				return;
			}
			
			// fade transition (black)
			addGraphic(Core.black, -1001);
			
			var blackTween:VarTween = new VarTween();
			blackTween.tween(Core.black, "alpha", 0, 1.6, Ease.quadIn);
			addTween(blackTween, true);
		}
		
		override public function begin():void
		{
			// arts
			
			// background (Planet)
			background = addGraphic( new Image(Assets.MENU_BACKGROUND) );
			background.y = 84;
			
			backgroundTween = new VarTween();
			addTween(backgroundTween);
			
			// title (Upgrades)
			title = addGraphic( new Image(Assets.SHOP_TITLE) );
			title.x = -130;
			title.y = 11;
			
			titleTween = new VarTween();
			addTween(titleTween);
			
			// units
			units = addGraphic( new Image(Assets.SHOP_UNITS) );
			units.x = 10;
			units.y = 280;
			
			unitsTween = new VarTween();
			addTween(unitsTween);
			
			// towers
			towers = addGraphic( new Image(Assets.SHOP_TOWERS) );
			towers.x = 153;
			towers.y = 280;
			
			towersTween = new VarTween();
			addTween(towersTween);
			
			// base
			base = addGraphic( new Image(Assets.SHOP_BASE) );
			base.x = 307;
			base.y = 280;
			
			baseTween = new VarTween();
			addTween(baseTween);
			
			// buttons
			
			// ready
			ready = new Button();
			ready.callback = readyClick;
			ready.normal = ready.down = new Image(Assets.SHOP_READY_NORMAL);
			ready.hover = new Image(Assets.SHOP_READY_HOVER);
			ready.x = 410;
			ready.y = 247;
			ready.setHitbox(69, 18);
			add(ready);
			
			readyTween = new VarTween();
			addTween(readyTween);
			
			// menu button
			menu = new Button();
			menu.callback = menuClick;
			menu.normal = menu.down = new Image(Assets.SHOP_MENU_NORMAL);
			menu.hover = new Image(Assets.SHOP_MENU_HOVER);
			menu.x = -60;
			menu.y = 0;
			menu.setHitbox(54, 15);
			add(menu);
			
			menuTween = new VarTween();
			addTween(menuTween);
			
			// money text
			money = new Text("$" + Data.money, 400, 6, 100, 100);
			money.font = "OCR";
			money.size = 19;
			money.color = 0x4DB13E; // green
			addGraphic(money);

			moneyTween = new VarTween();
			addTween(moneyTween);
			
			// Mute
			muteButton = new Button(430, 40, 16, 16, muteClick);
			updateMuteIcon();
			add(muteButton);
			
			muteTween = new VarTween();
			addTween(muteTween);
			
			// Facebook
			/*
			facebookButton = new Button(162, 280, 24, 24, facebookClick);
			facebookButton.normal = facebookButton.down = new Image(Assets.FACEBOOK_NORMAL);
			facebookButton.hover = new Image(Assets.FACEBOOK_HOVER);
			add(facebookButton);
			
			facebookTween = new VarTween();
			addTween(facebookTween);
			*/
			
			
			// Sponsor Logo
			sponsorLogo = new Button(168, 328, 128, 86, moreGamesClick);
			sponsorLogo.normal = sponsorLogo.down = new Image(Assets.SPONSORLOGO_NORMAL_SMALL);
			sponsorLogo.hover = new Image(Assets.SPONSORLOGO_HOVER_SMALL);
			add(sponsorLogo);
			
			sponsorLogoTween = new VarTween();
			addTween(sponsorLogoTween);
			
			
			showItems();
			
			
			// sounds
			if (!Shop.music.playing)
			{
				if (Menu.music.playing)
				{
					Menu.music.stop();
				}
				
				if (Gameplay.music.playing)
				{
					Gameplay.music.stop();
				}
				
				if (Core.music)
				{
					Shop.music.loop();
				}
				
				else
				{
					Shop.music.loop(0, 0);
				}
			}
		}
		
		override public function update():void
		{
			super.update();
			Core.overInfo.clear();
			
			if (!loaded)
			{
				return;
			}
			
			// unit1
			if ( unit1Button.collidePoint(unit1Button.x, unit1Button.y, mouseX, mouseY) && state == "Main" )
			{
				unit1.play("walk");
				
				if (!Data.pistol)
				{
					if (Data.money >= Pistol.cost)
					{
						Core.overInfo.setup("Click to buy", unit1Button.x, unit1Button.y - 9, 0, false, 0x46D049);
					}
					
					else
					{
						Core.overInfo.setup("Not enough money", unit1Button.x, unit1Button.y - 9, 0, false);
					}
				}
			}
			
			else
			{
				unit1.frame = 0;
			}
			
			// unit2
			if ( unit2Button.collidePoint(unit2Button.x, unit2Button.y, mouseX, mouseY) && state == "Main" )
			{
				unit2.play("walk");
				
				if (!Data.eagle)
				{
					if (Data.money >= Eagle.cost)
					{
						Core.overInfo.setup("Click to buy", unit2Button.x, unit2Button.y - 9, 0, false, 0x46D049);
					}
					
					else
					{
						Core.overInfo.setup("Not enough money", unit2Button.x, unit2Button.y - 9, 0, false);
					}
				}
			}
			
			else
			{
				unit2.frame = 0;
			}
			
			// unit3
			if ( unit3Button.collidePoint(unit3Button.x, unit3Button.y, mouseX, mouseY) && state == "Main" )
			{
				unit3.play("walk");
				
				if (!Data.smg)
				{
					if (Data.money >= Smg.cost)
					{
						Core.overInfo.setup("Click to buy", unit3Button.x, unit3Button.y - 9, 0, false, 0x46D049);
					}
					
					else
					{
						Core.overInfo.setup("Not enough money", unit3Button.x, unit3Button.y - 9, 0, false);
					}
				}
			}
			
			else
			{
				unit3.frame = 0;
			}
			
			// unit4
			if ( unit4Button.collidePoint(unit4Button.x, unit4Button.y, mouseX, mouseY) && state == "Main" )
			{
				unit4.play("walk");
				
				if (!Data.medic)
				{
					if (Data.money >= Medic.cost)
					{
						Core.overInfo.setup("Click to buy", unit4Button.x, unit4Button.y - 9, 0, false, 0x46D049);
					}
					
					else
					{
						Core.overInfo.setup("Not enough money", unit4Button.x, unit4Button.y - 9, 0, false);
					}
				}
			}
			
			else
			{
				unit4.frame = 0;
			}
			
			// unit5
			if ( unit5Button.collidePoint(unit5Button.x, unit5Button.y, mouseX, mouseY) && state == "Main" )
			{
				unit5.play("walk");
				
				if (!Data.assault)
				{
					if (Data.money >=Assault.cost)
					{
						Core.overInfo.setup("Click to buy", unit5Button.x, unit5Button.y - 9, 0, false, 0x46D049);
					}
					
					else
					{
						Core.overInfo.setup("Not enough money", unit5Button.x, unit5Button.y - 9, 0, false);
					}
				}
			}
			
			else
			{
				unit5.frame = 0;
			}
			
			// unit6
			if ( unit6Button.collidePoint(unit6Button.x, unit6Button.y, mouseX, mouseY) && state == "Main" )
			{
				unit6.play("walk");
				
				if (!Data.sniper)
				{
					if (Data.money >= Sniper.cost)
					{
						Core.overInfo.setup("Click to buy", unit6Button.x, unit6Button.y - 9, 0, false, 0x46D049);
					}
					
					else
					{
						Core.overInfo.setup("Not enough money", unit6Button.x, unit6Button.y - 9, 0, false);
					}
				}
			}
			
			else
			{
				unit6.frame = 0;
			}
			
			// unit7
			if ( unit7Button.collidePoint(unit7Button.x, unit7Button.y, mouseX, mouseY) && state == "Main" )
			{
				unit7.play("walk");
				
				if (!Data.machine)
				{
					if (Data.money >= Machine.cost)
					{
						Core.overInfo.setup("Click to buy", unit7Button.x, unit7Button.y - 9, 0, false, 0x46D049);
					}
					
					else
					{
						Core.overInfo.setup("Not enough money", unit7Button.x, unit7Button.y - 9, 0, false);
					}
				}
			}
			
			else
			{
				unit7.frame = 0;
			}
			
			// unit8
			if ( unit8Button.collidePoint(unit8Button.x, unit8Button.y, mouseX, mouseY) && state == "Main" )
			{
				unit8.play("walk");
				
				if (!Data.bazooka)
				{
					if (Data.money >= Bazooka.cost)
					{
						Core.overInfo.setup("Click to buy", unit8Button.x, unit8Button.y - 9, 0, false, 0x46D049);
					}
					
					else
					{
						Core.overInfo.setup("Not enough money", unit8Button.x, unit8Button.y - 9, 0, false);
					}
				}
			}
			
			else
			{
				unit8.frame = 0;
			}
			
			// tower1
			if ( tower1Button.collidePoint(tower1Button.x, tower1Button.y, mouseX, mouseY) && state == "Main" )
			{
				tower1.frame = 1;
				
				if (!Data.solar_panel)
				{
					if (Data.money >= SolarPanel.cost)
					{
						Core.overInfo.setup("Click to buy", tower1Button.x, tower1Button.y - 9, 0, false, 0x46D049);
					}
					
					else
					{
						Core.overInfo.setup("Not enough money", tower1Button.x, tower1Button.y - 9, 0, false);
					}
				}
			}
			
			else
			{
				tower1.frame = 0;
			}
			
			// tower2
			if ( tower2Button.collidePoint(tower2Button.x, tower2Button.y, mouseX, mouseY) && state == "Main" )
			{
				tower2_barrel.angle += 135 * FP.elapsed;
				
				if (!Data.assault_tower)
				{
					if (Data.money >= AssaultTower.cost)
					{
						Core.overInfo.setup("Click to buy", tower2Button.x, tower2Button.y - 9, 0, false, 0x46D049);
					}
					
					else
					{
						Core.overInfo.setup("Not enough money", tower2Button.x, tower2Button.y - 9, 0, false);
					}
				}
			}
			
			// tower3
			if ( tower3Button.collidePoint(tower3Button.x, tower3Button.y, mouseX, mouseY) && state == "Main" )
			{
				tower3_barrel.angle += 100 * FP.elapsed;
				
				if (!Data.missile_launcher)
				{
					if (Data.money >= MissileLauncher.cost)
					{
						Core.overInfo.setup("Click to buy", tower3Button.x, tower3Button.y - 9, 0, false, 0x46D049);
					}
					
					else
					{
						Core.overInfo.setup("Not enough money", tower3Button.x, tower3Button.y - 9, 0, false);
					}
				}
			}
			
			// tower4
			if ( tower4Button.collidePoint(tower4Button.x, tower4Button.y, mouseX, mouseY) && state == "Main" )
			{
				tower4_barrel.angle += 150 * FP.elapsed;
				
				if (!Data.ultra_blast)
				{
					if (Data.money >= UltraBlast.cost)
					{
						Core.overInfo.setup("Click to buy", tower4Button.x, tower4Button.y - 9, 0, false, 0x46D049);
					}
					
					else
					{
						Core.overInfo.setup("Not enough money", tower4Button.x, tower4Button.y - 9, 0, false);
					}
				}
			}
			
			// base
			if ( baseSkin.collidePoint(baseSkin.x, baseSkin.y, mouseX, mouseY) && state == "Main" )
			{
				if (Data.money >= baseUpgradeCost)
				{
					Core.overInfo.setup("Click to upgrade", 307, 196, 0, false, 0x46D049);
				}
					
				else
				{
					Core.overInfo.setup("Not enough money", 307, 196, 0, false);
				}
			}
		}
		
		private function showItems():void
		{
			// title (Upgrades)
			titleTween.tween(title, "x", 138, 2.8, Ease.quintInOut);
			titleTween.complete = showItems2;
			titleTween.start();
			
			// units
			unitsTween.tween(units, "y", 28, 3.0, Ease.quintInOut);
			unitsTween.start();
			
			// towers
			towersTween.tween(towers, "y", 89, 3.5, Ease.quintInOut);
			towersTween.start();
			
			// base
			baseTween.tween(base, "y", 78, 4.0, Ease.quintInOut);
			baseTween.start();
			
			// money
			moneyTween.tween(money, "x", 330, 3.0, Ease.backInOut);
			moneyTween.start();
			
			// Mute
			muteTween.tween(muteButton, "x", 374, 4.2, Ease.bounceInOut);
			muteTween.start();
			
			// Facebook
			//facebookTween.tween(facebookButton, "y", 243, 4.8, Ease.quintInOut);
			//facebookTween.start();
			
			// Sponsor Logo
			sponsorLogoTween.tween(sponsorLogo, "y", 215, 4.0, Ease.quartInOut);
			sponsorLogoTween.start();
		}
		
		private function showItems2():void
		{
			// ready button
			readyTween.tween(ready, "x", 315, 1.2, Ease.backInOut);
			readyTween.start();
			
			// menu button
			menuTween.tween(menu, "x", 0, 1.2, Ease.backInOut);
			menuTween.start();
			
			if (Data.race == "Marines")
			{
				// skins
				marine_UnitsSkin();
				marine_TowersSkin();
				marine_BaseSkin();
				
				// buttons
				marine_UnitsButton();
				marine_TowersButton();
				marine_BaseButton();
			}
			
			else if (Data.race == "Nauks")
			{
				
			}
			
			loaded = true;
		}
		
		private function hideItems():void
		{
			// title (Upgrades)
			titleTween.tween(title, "x", -130, 1.3, Ease.quintInOut);
			titleTween.start();
			
			// units
			unitsTween.tween(units, "y", 280, 1.2, Ease.quintInOut);
			unitsTween.start();
			
			// towers
			towersTween.tween(towers, "y", 280, 1.8, Ease.quintInOut);
			towersTween.start();
			
			// base
			baseTween.tween(base, "y", 280, 2.1, Ease.quintInOut);
			baseTween.start();
			
			// showItems2
			
			// ready button
			readyTween.tween(ready, "x", 430, 1.3, Ease.quintInOut);
			readyTween.start();
			
			// menu button
			menuTween.tween(menu, "x", -60, 1.3, Ease.backInOut);
			menuTween.start();
			
			// money
			moneyTween.tween(money, "x", 400, 1.5, Ease.backInOut);
			moneyTween.start();
			
			// background (Planet)
			backgroundTween.tween(background, "y", FP.screen.height, 1.5, Ease.circIn);
			backgroundTween.start();
			
			// Mute
			muteTween.tween(muteButton, "x", 430, 2.2, Ease.quartInOut);
			muteTween.start();
			
			// Facebook
			//facebookTween.tween(facebookButton, "y", 280, 1.0, Ease.quartInOut);
			//facebookTween.start();
			
			// Sponsor Logo
			sponsorLogoTween.tween(sponsorLogo, "y", 318, 1.7, Ease.quartInOut);
			sponsorLogoTween.start();
			
			
			// Units
			
			// skins
			unit1.visible = false;
			unit2.visible = false;
			unit3.visible = false;
			unit4.visible = false;
			unit5.visible = false;
			unit6.visible = false;
			unit7.visible = false;
			unit8.visible = false;
			
			// buttons' visibility
			unit1Button.visible = false;
			unit2Button.visible = false;
			unit3Button.visible = false;
			unit4Button.visible = false;
			unit5Button.visible = false;
			unit6Button.visible = false;
			unit7Button.visible = false;
			unit8Button.visible = false;
			
			// don't let the buttons work even when its invisible
			unit1Button.callback = null;
			unit2Button.callback = null;
			unit3Button.callback = null;
			unit4Button.callback = null;
			unit5Button.callback = null;
			unit6Button.callback = null;
			unit7Button.callback = null;
			unit8Button.callback = null;
			
			// name field
			unit1Name.visible = false;
			unit2Name.visible = false;
			unit3Name.visible = false;
			unit4Name.visible = false;
			unit5Name.visible = false;
			unit6Name.visible = false;
			unit7Name.visible = false;
			unit8Name.visible = false;
			
			// text
			unit1Text.visible = false;
			unit2Text.visible = false;
			unit3Text.visible = false;
			unit4Text.visible = false;
			unit5Text.visible = false;
			unit6Text.visible = false;
			unit7Text.visible = false;
			unit8Text.visible = false;
			
			
			// Towers
			
			// skins
			tower1.visible = false;
			
			tower2.visible = false;
			tower2_barrel.visible = false;
			
			tower3.visible = false;
			tower3_barrel.visible = false;
			
			tower4.visible = false;
			tower4_barrel.visible = false;
			
			// buttons' visibility
			tower1Button.visible = false;
			tower2Button.visible = false;
			tower3Button.visible = false;
			tower4Button.visible = false;
			
			// don't let the buttons work even when its invisible
			tower1Button.callback = null;
			tower2Button.callback = null;
			tower3Button.callback = null;
			tower4Button.callback = null;
			
			// name field
			tower1Name.visible = false;
			tower2Name.visible = false;
			tower3Name.visible = false;
			tower4Name.visible = false;
			
			// text
			tower1Text.visible = false;
			tower2Text.visible = false;
			tower3Text.visible = false;
			tower4Text.visible = false;
			
			
			// Base
			baseSkin.visible = false;
			baseSkin.callback = null;
			baseHP.visible = false;
			baseText.visible = false;
			basePrice.visible = false;
			
			
			titleTween.complete = null;
			
			// Actions
			if (state == "Menu")
			{
				towersTween.complete = menuAction;
			}
			
			else if (state == "Ready")
			{
				towersTween.complete = readyAction;
			}
		}
		
		
		// Marine
		
		private function marine_UnitsSkin():void
		{
			// Pistol
			unit1 = new Spritemap(Assets.PISTOL, 16, 16);
			unit1.add("walk", [0, 1, 2, 0, 3, 4], 6, true);
			unit1.x = 46;
			unit1.y = 48;
			addGraphic(unit1);
			
			// Eagle
			unit2 = new Spritemap(Assets.EAGLE, 18, 16);
			unit2.add("walk", [0, 1, 2, 0, 3, 4], 7, true);
			unit2.x = 46;
			unit2.y = 76;
			addGraphic(unit2);
			
			// SMG
			unit3 = new Spritemap(Assets.SMG, 16, 16);
			unit3.add("walk", [0, 1, 2, 0, 3, 4], 7, true);
			unit3.x = 46;
			unit3.y = 104;
			addGraphic(unit3);
			
			// Medic
			unit4 = new Spritemap(Assets.MEDIC, 23, 16);
			unit4.add("walk", [0, 0, 0, 15, 15, 16, 16, 17, 17, 17, 17, 16, 16, 15], 8, true);
			unit4.x = 46;
			unit4.y = 132;
			addGraphic(unit4);
			
			// Assault
			unit5 = new Spritemap(Assets.ASSAULT, 21, 16);
			unit5.add("walk", [0, 1, 2, 0, 3, 4], 7, true);
			unit5.x = 45;
			unit5.y = 160;
			addGraphic(unit5);
			
			// Sniper
			unit6 = new Spritemap(Assets.SNIPER, 23, 16);
			unit6.add("walk", [0, 1, 2, 0, 3, 4], 6, true);
			unit6.x = 44;
			unit6.y = 188;
			addGraphic(unit6);
			
			// Machine
			unit7 = new Spritemap(Assets.MACHINE, 23, 16);
			unit7.add("walk", [0, 1, 2, 0, 3, 4], 6, true);
			unit7.x = 44;
			unit7.y = 216;
			addGraphic(unit7);
			
			// Bazooka
			unit8 = new Spritemap(Assets.BAZOOKA, 23, 16);
			unit8.add("walk", [0, 1, 2, 0, 3, 4], 5, true);
			unit8.x = 44;
			unit8.y = 244;
			addGraphic(unit8);
		}
		
		private function marine_TowersSkin():void
		{
			// Solar Panel
			tower1 = new Spritemap(Assets.SOLAR_PANEL, 27, 20);
			tower1.x = 184;
			tower1.y = 104;
			addGraphic(tower1);
			
			
			// Assault Tower
			tower2 = new Image(Assets.ASSAULT_TOWER_BASE);
			tower2.x = 184;
			tower2.y = 131;
			addGraphic(tower2);
			
			tower2_barrel = new Spritemap(Assets.ASSAULT_TOWER_BARREL, tower2.width, tower2.height);
			tower2_barrel.x = tower2.x;
			tower2_barrel.y = tower2.y;
			tower2_barrel.originX = 13;
			tower2_barrel.originY = 13;
			addGraphic(tower2_barrel);
			
			
			// Missile Tower
			tower3 = new Image(Assets.MISSILE_LAUNCHER_BASE);
			tower3.x = 184;
			tower3.y = 159;
			addGraphic(tower3);
			
			tower3_barrel = new Spritemap(Assets.MISSILE_LAUNCHER_BARREL, tower3.width, tower3.height);
			tower3_barrel.x = tower3.x;
			tower3_barrel.y = tower3.y;
			tower3_barrel.originX = 13;
			tower3_barrel.originY = 13;
			addGraphic(tower3_barrel);
			
			
			// Ultra Blast
			tower4 = new Image(Assets.ULTRA_BLAST_BASE);
			tower4.x = 184;
			tower4.y = 187;
			addGraphic(tower4);
			
			tower4_barrel = new Spritemap(Assets.ULTRA_BLAST_BARREL, tower4.width, tower4.height);
			tower4_barrel.x = tower4.x;
			tower4_barrel.y = tower4.y;
			tower4_barrel.originX = 13;
			tower4_barrel.originY = 13;
			addGraphic(tower4_barrel);
		}
		
		private function marine_BaseSkin():void
		{
			baseHP = new Text("HP: " + Data.baseLife, 312, 93, 100, 100);
			baseHP.font = "Wonder";
			baseHP.size = 6;
			baseHP.color = 0xFFFFFF;
			addGraphic(baseHP);
			
			baseText = new Text("Upgrade HP", 312, 174, 100, 100);
			baseText.font = "Wonder";
			baseText.size = 6;
			baseText.color = 0xFFFFFF;
			addGraphic(baseText);
			
			basePrice = new Text("Cost: " + baseUpgradeCost, 312, 184, 100, 100);
			basePrice.font = "Wonder";
			basePrice.size = 6;
			basePrice.color = 0xFFFFFF;
			addGraphic(basePrice);
		}
		
		private function marine_UnitsButton():void
		{
			// ************************************************************************************************
			// Pistol
			
			unit1Button = new Button(14, 43, 118, 26, unit1Click);
			add(unit1Button);
			
			// name
			unit1Name = new Text(Pistol.name, 69, 45);
			unit1Name.font = "Wonder";
			unit1Name.size = 6;
			unit1Name.color = 0xF05659;
			addGraphic(unit1Name);
			
			// price
			unit1Text = new Text("Cost: " + Pistol.cost, 69, 56, 100, 100);
			unit1Text.font = "Wonder";
			unit1Text.size = 6;
			unit1Text.color = 0xFFFFFF;
			addGraphic(unit1Text);
			
			if (Data.pistol)
			{
				unit1Text.text = "Starter";
				unit1Name.color = 0x648FF7;
				unit1Button.normal = unit1Button.hover = unit1Button.down = new Image(Assets.PISTOL_AVATAR);
				unlockEffect(unit1Button.x, unit1Button.y);
			}
			
			else
			{
				unit1Button.hover = unit1Button.down = new Image(Assets.PISTOL_DISABLED);
			}
			
			// ************************************************************************************************
			// Eagle
			
			unit2Button = new Button(14, 71, 118, 26, unit2Click);
			add(unit2Button);
			
			// name
			unit2Name = new Text("D.  Eagle", 69, 73);
			unit2Name.font = "Wonder";
			unit2Name.size = 6;
			unit2Name.color = 0xF05659;
			addGraphic(unit2Name);
			
			// price
			unit2Text = new Text("Cost: " + Eagle.cost, 69, 84, 100, 100);
			unit2Text.font = "Wonder";
			unit2Text.size = 6;
			unit2Text.color = 0xFFFFFF;
			addGraphic(unit2Text);
			
			if (Data.eagle)
			{
				unit2Text.text = "Starter";
				unit2Name.color = 0x648FF7;
				unit2Button.normal = unit2Button.hover = unit2Button.down = new Image(Assets.EAGLE_AVATAR);
				unlockEffect(unit2Button.x, unit2Button.y);
			}
			
			else
			{
				unit2Button.hover = unit2Button.down = new Image(Assets.EAGLE_DISABLED);
			}
			
			// ************************************************************************************************
			// SMG
			
			unit3Button = new Button(14, 99, 118, 26, unit3Click);
			add(unit3Button);
			
			// name
			unit3Name = new Text(Smg.name, 69, 102);
			unit3Name.font = "Wonder";
			unit3Name.size = 6;
			unit3Name.color = 0xF05659;
			addGraphic(unit3Name);
			
			// price
			unit3Text = new Text("Cost: " + Smg.cost, 69, 113, 100, 100);
			unit3Text.font = "Wonder";
			unit3Text.size = 6;
			unit3Text.color = 0xFFFFFF;
			addGraphic(unit3Text);
			
			if (Data.smg)
			{
				unit3Text.text = "Bought";
				unit3Name.color = 0x648FF7;
				unit3Button.normal = unit3Button.hover = unit3Button.down = new Image(Assets.SMG_AVATAR);
				unlockEffect(unit3Button.x, unit3Button.y);
			}
			
			else
			{
				unit3Button.hover = unit3Button.down = new Image(Assets.SMG_DISABLED);
			}
			
			// ************************************************************************************************
			// Medic
			
			unit4Button = new Button(14, 127, 118, 26, unit4Click);
			add(unit4Button);
			
			// name
			unit4Name = new Text(Medic.name, 69, 130);
			unit4Name.font = "Wonder";
			unit4Name.size = 6;
			unit4Name.color = 0xF05659;
			addGraphic(unit4Name);
			
			// price
			unit4Text = new Text("Cost: " + Medic.cost, 69, 141, 100, 100);
			unit4Text.font = "Wonder";
			unit4Text.size = 6;
			unit4Text.color = 0xFFFFFF;
			addGraphic(unit4Text);
			
			if (Data.medic)
			{
				unit4Text.text = "Bought";
				unit4Name.color = 0x648FF7;
				unit4Button.normal = unit4Button.hover = unit4Button.down = new Image(Assets.MEDIC_AVATAR);
				unlockEffect(unit4Button.x, unit4Button.y);
			}
			
			else
			{
				unit4Button.hover = unit4Button.down = new Image(Assets.MEDIC_DISABLED);
			}
			
			// ************************************************************************************************
			// Assault
			
			unit5Button = new Button(14, 155, 118, 26, unit5Click);
			add(unit5Button);
			
			// name
			unit5Name = new Text(Assault.name, 69, 158);
			unit5Name.font = "Wonder";
			unit5Name.size = 6;
			unit5Name.color = 0xF05659;
			addGraphic(unit5Name);
			
			// price
			unit5Text = new Text("Cost: " + Assault.cost, 69, 169, 100, 100);
			unit5Text.font = "Wonder";
			unit5Text.size = 6;
			unit5Text.color = 0xFFFFFF;
			addGraphic(unit5Text);
			
			if (Data.assault)
			{
				unit5Text.text = "Bought";
				unit5Name.color = 0x648FF7;
				unit5Button.normal = unit5Button.hover = unit5Button.down = new Image(Assets.ASSAULT_AVATAR);
				unlockEffect(unit5Button.x, unit5Button.y);
			}
			
			else
			{
				unit5Button.hover = unit5Button.down = new Image(Assets.ASSAULT_DISABLED);
			}
			
			// ************************************************************************************************
			// Sniper
			
			unit6Button = new Button(14, 183, 118, 26, unit6Click);
			add(unit6Button);
			
			// name
			unit6Name = new Text(Sniper.name, 69, 186);
			unit6Name.font = "Wonder";
			unit6Name.size = 6;
			unit6Name.color = 0xF05659;
			addGraphic(unit6Name);
			
			// price
			unit6Text = new Text("Cost: " + Sniper.cost, 69, 197, 100, 100);
			unit6Text.font = "Wonder";
			unit6Text.size = 6;
			unit6Text.color = 0xFFFFFF;
			addGraphic(unit6Text);
			
			if (Data.sniper)
			{
				unit6Text.text = "Bought";
				unit6Name.color = 0x648FF7;
				unit6Button.normal = unit6Button.hover = unit6Button.down = new Image(Assets.SNIPER_AVATAR);
				unlockEffect(unit6Button.x, unit6Button.y);
			}
			
			else
			{
				unit6Button.hover = unit6Button.down = new Image(Assets.SNIPER_DISABLED);
			}
			
			// ************************************************************************************************
			// Machine
			
			unit7Button = new Button(14, 211, 118, 26, unit7Click);
			add(unit7Button);
			
			// name
			unit7Name = new Text(Machine.name, 69, 213);
			unit7Name.font = "Wonder";
			unit7Name.size = 6;
			unit7Name.color = 0xF05659;
			addGraphic(unit7Name);
			
			// price
			unit7Text = new Text("Cost: " + Machine.cost, 69, 224, 100, 100);
			unit7Text.font = "Wonder";
			unit7Text.size = 6;
			unit7Text.color = 0xFFFFFF;
			addGraphic(unit7Text);
			
			if (Data.machine)
			{
				unit7Text.text = "Bought";
				unit7Name.color = 0x648FF7;
				unit7Button.normal = unit7Button.hover = unit7Button.down = new Image(Assets.MACHINE_AVATAR);
				unlockEffect(unit7Button.x, unit7Button.y);
			}
			
			else
			{
				unit7Button.hover = unit7Button.down = new Image(Assets.MACHINE_DISABLED);
			}
			
			// ************************************************************************************************
			// Bazooka
			
			unit8Button = new Button(14, 239, 118, 26, unit8Click);
			add(unit8Button);
			
			// name
			unit8Name = new Text(Bazooka.name, 69, 241);
			unit8Name.font = "Wonder";
			unit8Name.size = 6;
			unit8Name.color = 0xF05659;
			addGraphic(unit8Name);
			
			// price
			unit8Text = new Text("Cost: " + Bazooka.cost, 69, 252, 100, 100);
			unit8Text.font = "Wonder";
			unit8Text.size = 6;
			unit8Text.color = 0xFFFFFF;
			addGraphic(unit8Text);
			
			if (Data.bazooka)
			{
				unit8Text.text = "Bought";
				unit8Name.color = 0x648FF7;
				unit8Button.normal = unit8Button.hover = unit8Button.down = new Image(Assets.BAZOOKA_AVATAR);
				unlockEffect(unit8Button.x, unit8Button.y);
			}
			
			else
			{
				unit8Button.hover = unit8Button.down = new Image(Assets.BAZOOKA_DISABLED);
			}
		}
		
		private function marine_TowersButton():void
		{
			// ************************************************************************************************
			// Solar Panel
			
			tower1Button = new Button(157, 104, 128, 26, tower1Click);
			add(tower1Button);
			
			// name
			tower1Name = new Text(SolarPanel.name, 214, 106);
			tower1Name.font = "Wonder";
			tower1Name.size = 6;
			tower1Name.color = 0xF05659;
			addGraphic(tower1Name);
			
			// price
			tower1Text = new Text("Cost: " + SolarPanel.cost, 214, 117, 100, 100);
			tower1Text.font = "Wonder";
			tower1Text.size = 6;
			tower1Text.color = 0xFFFFFF;
			addGraphic(tower1Text);
			
			if (Data.solar_panel)
			{
				tower1Text.text = "Starter";
				tower1Name.color = 0x648FF7;
				tower1Button.normal = tower1Button.hover = tower1Button.down = new Image(Assets.SOLAR_PANEL_AVATAR);
				unlockEffect(tower1Button.x, tower1Button.y);
			}
			
			else
			{
				tower1Button.hover = tower1Button.down = new Image(Assets.SOLAR_PANEL_DISABLED);
			}
			
			// ************************************************************************************************
			// Assault Tower
			
			tower2Button = new Button(157, 132, 128, 26, tower2Click);
			add(tower2Button);
			
			// name
			tower2Name = new Text("Assault Twr.", 214, 134);
			tower2Name.font = "Wonder";
			tower2Name.size = 6;
			tower2Name.color = 0xF05659;
			addGraphic(tower2Name);
			
			// price
			tower2Text = new Text("Cost: " + AssaultTower.cost, 214, 145, 200, 200);
			tower2Text.font = "Wonder";
			tower2Text.size = 6;
			tower2Text.color = 0xFFFFFF;
			addGraphic(tower2Text);
			
			if (Data.assault_tower)
			{
				tower2Text.text = "Starter";
				tower2Name.color = 0x648FF7;
				tower2Button.normal = tower2Button.hover = tower2Button.down = new Image(Assets.ASSAULT_TOWER_AVATAR);
				unlockEffect(tower2Button.x, tower2Button.y);
			}
			
			else
			{
				tower2Button.hover = tower2Button.down = new Image(Assets.ASSAULT_TOWER_DISABLED);
			}
			
			// ************************************************************************************************
			// Missile Launcher
			
			tower3Button = new Button(157, 160, 128, 26, tower3Click);
			add(tower3Button);
			
			// name
			tower3Name = new Text("Missile L.", 214, 163);
			tower3Name.font = "Wonder";
			tower3Name.size = 6;
			tower3Name.color = 0xF05659;
			addGraphic(tower3Name);
			
			// price
			tower3Text = new Text("Cost: " + MissileLauncher.cost, 214, 174, 300, 300);
			tower3Text.font = "Wonder";
			tower3Text.size = 6;
			tower3Text.color = 0xFFFFFF;
			addGraphic(tower3Text);
			
			if (Data.missile_launcher)
			{
				tower3Text.text = "Bought";
				tower3Name.color = 0x648FF7;
				tower3Button.normal = tower3Button.hover = tower3Button.down = new Image(Assets.MISSILE_LAUNCHER_AVATAR);
				unlockEffect(tower3Button.x, tower3Button.y);
			}
			
			else
			{
				tower3Button.hover = tower3Button.down = new Image(Assets.MISSILE_LAUNCHER_DISABLED);
			}
			
			// ************************************************************************************************
			// Ultra Blast
			
			tower4Button = new Button(157, 188, 128, 26, tower4Click);
			add(tower4Button);
			
			// name
			tower4Name = new Text(UltraBlast.name, 214, 191);
			tower4Name.font = "Wonder";
			tower4Name.size = 6;
			tower4Name.color = 0xF05659;
			addGraphic(tower4Name);
			
			// price
			tower4Text = new Text("Cost: " + UltraBlast.cost, 214, 202, 400, 400);
			tower4Text.font = "Wonder";
			tower4Text.size = 6;
			tower4Text.color = 0xFFFFFF;
			addGraphic(tower4Text);
			
			if (Data.ultra_blast)
			{
				tower4Text.text = "Bought";
				tower4Name.color = 0x648FF7;
				tower4Button.normal = tower4Button.hover = tower4Button.down = new Image(Assets.ULTRA_BLAST_AVATAR);
				unlockEffect(tower4Button.x, tower4Button.y);
			}
			
			else
			{
				tower4Button.hover = tower4Button.down = new Image(Assets.ULTRA_BLAST_DISABLED);
			}
		}
		
		private function marine_BaseButton():void
		{
			baseSkin = new Button(316, 108, 64, 88, baseClick);
			baseSkin.normal = baseSkin.hover = baseSkin.down = new Image(Assets.SHOP_BASE_IMAGE);
			add(baseSkin);
		}
		
		private function updateMoney():void
		{
			money.text = "$" + Data.money;
		}
		
		// click
		
		private function menuClick():void
		{
			state = "Menu";
			hideItems();
			
			// Progress
			Core.progress.save();
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
		
		private function readyClick():void
		{
			state = "Ready";
			hideItems();
			
			// Progress
			Core.progress.save();
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
		
		// actions
		
		private function menuAction():void
		{
			removeAll();
			FP.world = new Menu(true);
		}
		
		private function readyAction():void
		{
			removeAll();
			FP.world = new Map;
		}
		
		// unit click
		
		private function unit1Click():void
		{
			if (Data.race == "Marines")
			{
				if (!Data.pistol && Data.money >= Pistol.cost)
				{
					Data.money -= Pistol.cost;
					updateMoney();
					
					Data.pistol = true;
					
					unit1Text.text = "Bought";
					unit1Name.color = 0x648FF7;
					unit1Button.normal = unit1Button.hover = unit1Button.down = new Image(Assets.PISTOL_AVATAR);
					
					// effect
					unlockEffect(unit1Button.x, unit1Button.y);
				}
			}
		}
		
		private function unit2Click():void
		{
			if (Data.race == "Marines")
			{
				if (!Data.eagle && Data.money >= Eagle.cost)
				{
					Data.money -= Eagle.cost;
					updateMoney();
					
					Data.eagle = true;
					
					unit2Text.text = "Bought";
					unit2Name.color = 0x648FF7;
					unit2Button.normal = unit2Button.hover = unit2Button.down = new Image(Assets.EAGLE_AVATAR);
					
					// effect
					unlockEffect(unit2Button.x, unit2Button.y);
				}
			}
		}
		
		private function unit3Click():void
		{
			if (Data.race == "Marines")
			{
				if (!Data.smg && Data.money >= Smg.cost)
				{
					Data.money -= Smg.cost;
					updateMoney();
					
					Data.smg = true;
					
					unit3Text.text = "Bought";
					unit3Name.color = 0x648FF7;
					unit3Button.normal = unit3Button.hover = unit3Button.down = new Image(Assets.SMG_AVATAR);
					
					// effect
					unlockEffect(unit3Button.x, unit3Button.y);
				}
			}
		}
		
		private function unit4Click():void
		{
			if (Data.race == "Marines")
			{
				if (!Data.medic && Data.money >= Medic.cost)
				{
					Data.money -= Medic.cost;
					updateMoney();
					
					Data.medic = true;
					
					unit4Text.text = "Bought";
					unit4Name.color = 0x648FF7;
					unit4Button.normal = unit4Button.hover = unit4Button.down = new Image(Assets.MEDIC_AVATAR);
					
					// effect
					unlockEffect(unit4Button.x, unit4Button.y);
				}
			}
		}
		
		private function unit5Click():void
		{
			if (Data.race == "Marines")
			{
				if (!Data.assault && Data.money >= Assault.cost)
				{
					Data.money -= Assault.cost;
					updateMoney();
					
					Data.assault = true;
					
					unit5Text.text = "Bought";
					unit5Name.color = 0x648FF7;
					unit5Button.normal = unit5Button.hover = unit5Button.down = new Image(Assets.ASSAULT_AVATAR);
					
					// effect
					unlockEffect(unit5Button.x, unit5Button.y);
				}
			}
		}
		
		private function unit6Click():void
		{
			if (Data.race == "Marines")
			{
				if (!Data.sniper && Data.money >= Sniper.cost)
				{
					Data.money -= Sniper.cost;
					updateMoney();
					
					Data.sniper = true;
					
					unit6Text.text = "Bought";
					unit6Name.color = 0x648FF7;
					unit6Button.normal = unit6Button.hover = unit6Button.down = new Image(Assets.SNIPER_AVATAR);
					
					// effect
					unlockEffect(unit6Button.x, unit6Button.y);
					unlockEffect(unit6Button.x, unit6Button.y);
				}
			}
		}
		
		private function unit7Click():void
		{
			if (Data.race == "Marines")
			{
				if (!Data.machine && Data.money >= Machine.cost)
				{
					Data.money -= Machine.cost;
					updateMoney();
					
					Data.machine = true;
					
					unit7Text.text = "Bought";
					unit7Name.color = 0x648FF7;
					unit7Button.normal = unit7Button.hover = unit7Button.down = new Image(Assets.MACHINE_AVATAR);
					
					// effect
					unlockEffect(unit7Button.x, unit7Button.y);
				}
			}
		}
		
		private function unit8Click():void
		{
			if (Data.race == "Marines")
			{
				if (!Data.bazooka && Data.money >= Bazooka.cost)
				{
					Data.money -= Bazooka.cost;
					updateMoney();
					
					Data.bazooka = true;
					
					unit8Text.text = "Bought";
					unit8Name.color = 0x648FF7;
					unit8Button.normal = unit8Button.hover = unit8Button.down = new Image(Assets.BAZOOKA_AVATAR);
					
					// effect
					unlockEffect(unit8Button.x, unit8Button.y);
				}
			}
		}
		
		// tower click
		
		private function tower1Click():void
		{
			if (Data.race == "Marines")
			{
				if (!Data.solar_panel && Data.money >= SolarPanel.cost)
				{
					Data.money -= SolarPanel.cost;
					updateMoney();
					
					Data.solar_panel = true;
					
					tower1Text.text = "Bought";
					tower1Name.color = 0x648FF7;
					tower1Button.normal = tower1Button.hover = tower1Button.down = new Image(Assets.SOLAR_PANEL_AVATAR);
					
					// effect
					unlockEffect(tower1Button.x, tower1Button.y);
				}
			}
		}
		
		private function tower2Click():void
		{
			if (Data.race == "Marines")
			{
				if (!Data.assault_tower && Data.money >= AssaultTower.cost)
				{
					Data.money -= AssaultTower.cost;
					updateMoney();
					
					Data.assault_tower = true;
					
					tower2Text.text = "Bought";
					tower2Name.color = 0x648FF7;
					tower2Button.normal = tower2Button.hover = tower2Button.down = new Image(Assets.ASSAULT_TOWER_AVATAR);
					
					// effect
					unlockEffect(tower2Button.x, tower2Button.y);
				}
			}
		}
		
		private function tower3Click():void
		{
			if (Data.race == "Marines")
			{
				if (!Data.missile_launcher && Data.money >= MissileLauncher.cost)
				{
					Data.money -= MissileLauncher.cost;
					updateMoney();
					
					Data.missile_launcher = true;
					
					tower3Text.text = "Bought";
					tower3Name.color = 0x648FF7;
					tower3Button.normal = tower3Button.hover = tower3Button.down = new Image(Assets.MISSILE_LAUNCHER_AVATAR);
					
					// effect
					unlockEffect(tower3Button.x, tower3Button.y);
				}
			}
		}
		
		private function tower4Click():void
		{
			if (Data.race == "Marines")
			{
				if (!Data.ultra_blast && Data.money >= UltraBlast.cost)
				{
					Data.money -= UltraBlast.cost;
					updateMoney();
					
					Data.ultra_blast = true;
					
					tower4Text.text = "Bought";
					tower4Name.color = 0x648FF7;
					tower4Button.normal = tower4Button.hover = tower4Button.down = new Image(Assets.ULTRA_BLAST_AVATAR);
					
					// effect
					unlockEffect(tower4Button.x, tower4Button.y);
				}
			}
		}
		
		// base click
		
		private function baseClick():void
		{
			if (Data.money >= baseUpgradeCost)
			{
				Data.money -= baseUpgradeCost;
				updateMoney();
				
				Data.baseLife += baseUpgradeValue;
				baseHP.text = "HP: " + Data.baseLife;
				
				unlockEffect(312, 96, 46, 5);
			}
		}
		
		private function unlockEffect(x:int, y:int, areaX:int = 27, areaY:int = 27):void
		{
			/*
			for (var i:uint = 0; i <= 9; i++)
			{
				Core.effects.emit("Unlock_Yellow", 8, x + FP.rand(areaX), y + FP.rand(areaY) );
				Core.effects.emit("Unlock_Black", 4, x + FP.rand(areaX), y + FP.rand(areaY) );
			}
			*/
			
			// sound
			sound_unlock.play(Core.vol);
		}
		
		private function updateMuteIcon():void
		{
			if (Core.music && Core.sound)
			{
				muteButton.normal = new Image(Assets.MENU_MUTE_ON);
				muteButton.hover = muteButton.down = new Image(Assets.MENU_MUTE_OFF);
			}
			
			else
			{
				muteButton.normal = new Image(Assets.MENU_MUTE_OFF);
				muteButton.hover = muteButton.down =  new Image(Assets.MENU_MUTE_ON);
			}
		}
		
		private function muteClick():void
		{
			Core.music = !Core.music;
			Core.sound = Core.music;
			
			if (Core.music)
			{
				Gameplay.music.volume = 1;
				Shop.music.volume = 1;
				Menu.music.volume = 1;
				
				Core.vol = 1;
			}
			
			else
			{
				Gameplay.music.volume = 0;
				Shop.music.volume = 0;
				Menu.music.volume = 0;
				
				Core.vol = 0;
			}
			
			// update icon
			updateMuteIcon();
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
		
		private function facebookClick():void
		{
			Utils.openURL(Core.facebook_url);
			
			Utils.sound_click.play(Core.vol);
		}
		
		private function moreGamesClick():void
		{
			Utils.openURL(Core.sponsor_url);
			
			Utils.sound_click.play(Core.vol);
		}
	}
}