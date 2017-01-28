package Worlds
{
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.Entity;
	import Entities.GUI.Button;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	import Entities.GUI.MouseOverInfo;
	
	public class Map extends World
	{
		// core
		private var state:String;
		private var currentCity:Image;
		private var param:String;
		
		// arts
		private var bottomBar:Entity;
		private var topBar:Entity;
		public var planetBackground:Entity; // *visible only when returning to the shop screen
		
		// buttons
		private var go:Button;
		private var moregames:Button;
		private var upgrades:Button;
		private var muteButton:Button;
		
		// texts
		private var city:Text;
		private var level:Text;
		
		// tweens
		private var backgroundTween:VarTween;
		private var effectTween:VarTween;
		private var countriesTween:VarTween;
		private var bottomBarTween:VarTween;
		private var topBarTween:VarTween;
		private var cityTween:VarTween;
		private var levelTween:VarTween;
		private var goTween:VarTween;
		private var moregamesTween:VarTween;
		private var upgradesTween:VarTween;
		private var muteTween:VarTween;
		
		// images
		private var countries:Image;
		private var background:Image;
		private var effectImage:Image;
		private var cityContainer:Array;
		
		// sounds
		private var sound_radio:Sfx;
		
		
		public function Map(param:String = ""):void
		{
			state = "Main";
			this.param = param;
			
			var random_radio:int = FP.choose(2, 3, 4);
			
			if (Data.level == 1)
			{
				random_radio = 1;
			}
			
			else if (Data.level == 2)
			{
				random_radio = 2;
			}
			
			else if (Data.level == 3)
			{
				random_radio = 3;
			}
			
			else if (Data.level == 4)
			{
				random_radio = 4;
			}
			
			else if (Data.level == 25)
			{
				random_radio = 4;
			}
			
			switch (random_radio)
			{
				case 1:
					sound_radio = new Sfx(Assets.MAP_RADIO1);
					sound_radio.play(Core.vol);
					break;
					
				case 2:
					sound_radio = new Sfx(Assets.MAP_RADIO2);
					sound_radio.play(Core.vol);
					break;
					
				case 3:
					sound_radio = new Sfx(Assets.MAP_RADIO3);
					sound_radio.loop(Core.vol);
					break;
					
				case 4:
					sound_radio = new Sfx(Assets.MAP_RADIO4);
					sound_radio.loop(Core.vol);
					break;
			}
			
			if (Data.level > Core.totalLevels)
			{
				Data.level = Core.totalLevels;
			}
			
			selectLevel();
		}
		
		private function selectLevel():void
		{
			Core.currentLevel = Core.getLevel(Data.level);
			Core.terrain = Core.currentLevel.terrain;
		}
		
		private function placeCities():void
		{
			for (var i:uint = Data.level; i <= Core.totalLevels; i++)
			{
				var image:Image;
				
				if (i == Data.level)
				{
					image = new Image(Assets.MAP_CURRENT_CITY);
					currentCity = image;
				}
				
				else
				{
					image = new Image(Assets.MAP_CITY);
				}
				
				image.x = Core.getLevel(i).coordinateX;
				image.y = Core.getLevel(i).coordinateY;
				
				image.originX = 7;
				image.originY = 7;
				
				addGraphic(image, -100 + i);
				cityContainer.push(image);
			}
			
			countries.originX = Core.getLevel(Data.level).coordinateX + 7;
			countries.originY = Core.getLevel(Data.level).coordinateY + 7;
			
			background.originX = countries.originX / 1.5;
			background.originY = countries.originY / 1.5;
		}
		
		override public function begin():void
		{
			cityContainer = new Array();
			
			// planet (background) *visible only when returning to the shop screen
			planetBackground = addGraphic( new Image(Assets.MENU_BACKGROUND) );
			planetBackground.x = 0;
			planetBackground.y = 84;
			
			if (param == "New Game")
			{
				planetBackground.visible = true;
			}
			
			else
			{
				planetBackground.visible = false;
			}
			
			// background
			background = new Image(Assets.MAP_BACKGROUND);
			background.x = 0;
			background.y = -275;
			addGraphic(background);
			
			backgroundTween = new VarTween();
			addTween(backgroundTween);
			
			// effect (background)
			effectImage = new Image(Assets.MAP_EFFECT);
			addGraphic(effectImage);
			effectImage.alpha = 0;
			
			effectTween = new VarTween();
			addTween(effectTween);
			
			// countries
			countries = new Image(Assets.MAP_COUNTRIES);
			countries.x = 0;
			countries.y = 275;
			addGraphic(countries);
			
			countriesTween = new VarTween();
			addTween(countriesTween);
			
			// bottom bar
			bottomBar = addGraphic(new Image(Assets.MAP_BOTTOM_BAR) );
			bottomBar.x = 400;
			bottomBar.y = 249;
			
			bottomBarTween = new VarTween();
			addTween(bottomBarTween);
			
			// top bar
			topBar = addGraphic(new Image(Assets.MAP_TOP_BAR) );
			topBar.x = -400;
			topBar.y = 0;
			
			topBarTween = new VarTween();
			addTween(topBarTween);
			
			// city
			city = new Text(Core.currentLevel.name, 450, 251, 400, 275);
			city.font = "Optimus";
			city.size = 15;
			city.smooth = false;
			addGraphic(city);
			
			cityTween = new VarTween();
			addTween(cityTween);
			
			// level (text)
			level = new Text("Level " + Data.level, -230, 0, 400, 275);
			level.font = "Wonder";
			level.size = 10;
			level.smooth = false;
			addGraphic(level);
			
			levelTween = new VarTween();
			addTween(levelTween);
			
			// go (button)
			go = new Button(400, 249, 71, 26, goClick);
			go.normal = go.down = new Image(Assets.MAP_GO_NORMAL);
			go.hover = new Image(Assets.MAP_GO_HOVER);
			add(go);
			
			goTween = new VarTween();
			addTween(goTween);
			
			// upgrades (button)
			upgrades = new Button(-190, 0, 82, 16, upgradesClick);
			upgrades.normal = upgrades.down = new Image(Assets.MAP_UPGRADES_NORMAL);
			upgrades.hover = new Image(Assets.MAP_UPGRADES_HOVER);
			add(upgrades);
			
			upgradesTween = new VarTween();
			addTween(upgradesTween);
			
			// moregames (button)
			moregames = new Button(-100, 0, 101, 16, moregamesClick);
			moregames.normal = moregames.down = new Image(Assets.MAP_MOREGAMES_NORMAL);
			moregames.hover = new Image(Assets.MAP_MOREGAMES_HOVER);
			add(moregames);
			
			moregamesTween = new VarTween();
			addTween(moregamesTween);
			
			// Mute
			muteButton = new Button(430, 20, 16, 16, muteClick);
			updateMuteIcon();
			add(muteButton);
			
			muteTween = new VarTween();
			addTween(muteTween);
			
			
			showItems();
		}
		
		override public function update():void
		{
			super.update();

			if (state == "Loaded")
			{
				// background effect
				effectImage.y -= 20 * FP.elapsed;
				
				if (effectImage.y <= -273)
				{
					effectImage.y = 0;
				}
				
				currentCity.angle += 500 * FP.elapsed;
			}
		}
		
		private function showItems():void
		{
			// background
			backgroundTween.tween(background, "y", 0, 2.0, Ease.quartInOut);
			backgroundTween.complete = showItems2;
			backgroundTween.start();
			
			// countries
			countriesTween.tween(countries, "y", 0, 2.0, Ease.quartInOut);
			countriesTween.start();
			
			// Mute
			muteTween.tween(muteButton, "x", 377, 4.2, Ease.bounceInOut);
			muteTween.start();
		}
		
		private function showItems2():void
		{
			state = "Loaded";
			
			// effect (background)
			effectTween.tween(effectImage, "alpha", 1, 3.0, Ease.bounceInOut);
			effectTween.complete = effectAnimateIn;
			effectTween.start();
			
			// bottom bar
			bottomBarTween.tween(bottomBar, "x", 0, 1.4, Ease.quartOut);
			bottomBarTween.start();
			
			// top bar
			topBarTween.tween(topBar, "x", 0, 1.4, Ease.quartOut);
			topBarTween.start();
			
			// city name
			cityTween.tween(city, "x", 6, 3.8, Ease.quartOut);
			cityTween.start();
			
			// level text
			levelTween.tween(level, "x", 163, 3.8, Ease.quartOut);
			levelTween.start();
			
			// go button
			goTween.tween(go, "x", 329, 3.8, Ease.quartOut);
			goTween.start();
			
			// upgrades
			upgradesTween.tween(upgrades, "x", 0, 3.8, Ease.quartOut);
			upgradesTween.start();
			
			// moregames
			moregamesTween.tween(moregames, "x", 299, 3.8, Ease.quartOut);
			moregamesTween.start();
			
			
			placeCities();
		}
		
		private function hideItems():void
		{
			// background
			backgroundTween.tween(background, "y", -275, 1.0, Ease.quartIn);
			backgroundTween.complete = null;
			backgroundTween.start();
			
			// countries
			countriesTween.tween(countries, "y", 275, 1.0, Ease.quartIn);
			countriesTween.start();
			
			// effect (background)
			effectTween.tween(effectImage, "alpha", 0, 1.5, Ease.bounceIn);
			effectTween.complete = null;
			effectTween.start();
			
			// bottom bar
			bottomBarTween.tween(bottomBar, "x", 400, 0.7, Ease.quartIn);
			bottomBarTween.start();
			
			// top bar
			topBarTween.tween(topBar, "x", -400, 0.7, Ease.quartIn);
			topBarTween.start();
			
			// city name
			cityTween.tween(city, "x", 450, 1.9, Ease.quartIn);
			cityTween.start();
			
			// level text
			levelTween.tween(level, "x", -230, 1.9, Ease.quartIn);
			levelTween.start();
			
			// go button
			goTween.tween(go, "x", 400, 1.9, Ease.quartIn);
			goTween.start();
			
			// upgrades
			upgradesTween.tween(upgrades, "x", -190, 1.9, Ease.quartIn);
			upgradesTween.start();
			
			// moregames
			moregamesTween.tween(moregames, "x", -100, 1.9, Ease.quartIn);
			moregamesTween.start();
			
			// Mute
			muteTween.tween(muteButton, "x", 430, 2.6, Ease.quartInOut);
			muteTween.start();
			
			// actions
			if (state == "Upgrades")
			{
				moregamesTween.complete = upgradesAction;
			}
			
			hideCities();
		}
		
		private function effectAnimateIn():void
		{
			effectTween.tween(effectImage, "alpha", 0.1, Math.random() * 1 + 0.8, Ease.bounceInOut);
			effectTween.complete = effectAnimateOut;
			effectTween.start();
		}
		
		private function effectAnimateOut():void
		{
			effectTween.tween(effectImage, "alpha", 1, Math.random() * 3 + 1.5, Ease.bounceInOut);
			effectTween.complete = effectAnimateIn;
			effectTween.start();
		}
		
		// clicks
		
		private function goClick():void
		{
			state = "Go";
			hideCities();
			hideItems();
			
			countriesTween.tween(countries, "scale", 20, 6.0, Ease.quintInOut);
			countriesTween.start();
			
			backgroundTween.tween(background, "scale", 15, 6.0, Ease.quintInOut);
			backgroundTween.complete = goAction;
			backgroundTween.start();
			
			effectTween.tween(effectImage, "scale", 8, 6.0, Ease.quintInOut);
			effectTween.start();
			
			var black:Image = Image.createRect(400, 275, 0x000000);
			black.alpha = 0;
			addGraphic(black);
			
			var blackTween:VarTween = new VarTween();
			addTween(blackTween);
			
			blackTween.tween(black, "alpha", 1, 3.7, Ease.cubeIn);
			blackTween.start();
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
		
		private function upgradesClick():void
		{
			state = "Upgrades";
			planetBackground.visible = true;
			hideItems();
			
			// sound
			sound_radio.stop();
			Utils.sound_click.play(Core.vol);
		}
		
		private function upgradesAction():void
		{
			removeAll();
			FP.world = new Shop;
		}
		
		private function goAction():void
		{
			removeAll();
			
			Core.game = new Game();
			
			if (Data.cheatMode)
			{
				Core.game.money = 7000;
			}
			
			Core.gameplay = new Gameplay();
			FP.world = Core.gameplay;
			
			sound_radio.stop();
		}
		
		private function moregamesClick():void
		{
			Utils.openURL(Core.sponsor_url);
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
		
		private function hideCities():void
		{
			for each(var image:Image in cityContainer)
			{
				image.visible = false;
			}
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
				sound_radio.volume = 1;
			}
			
			else
			{
				Gameplay.music.volume = 0;
				Shop.music.volume = 0;
				Menu.music.volume = 0;
				
				Core.vol = 0;
				sound_radio.volume = 0;
			}
			
			// update icon
			updateMuteIcon();
			
			// sound
			Utils.sound_click.play(Core.vol);
		}
	}
}