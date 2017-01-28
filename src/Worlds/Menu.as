package Worlds
{
	import Entities.GUI.Button;
	
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Menu extends World
	{
		// core
		private var state:String; // Menu, Credits
		private var quickTween:Boolean;
		
		// images
		private var background:Entity;
		private var logo:Entity;
		private var nauk:Entity;
		private var marine:Entity;
		
		// sounds
		public static var music:Sfx = new Sfx(Assets.MENU_MUSIC);
		
		// buttons
		private var newGameButton:Button;
		private var cheatModeButton:Button;
		private var continueButton:Button;
		private var creditsButton:Button;
		private var moreGamesButton:Button;
		
		// 'follow us' buttons
		private var sponsorLogo:Button;
		private var facebookButton:Button;
		private var twitterButton:Button;
		
		// 'mute' button
		private var muteButton:Button;
		
		// credits screen
		private var developer:Button;
		private var author:Entity;
		private var others:Entity;
		
		private var continueInfoText:Text;
	
		// tweens
		
		private var backgroundTween:VarTween;
		private var logoTween:VarTween;
		private var naukTween:VarTween;
		private var marineTween:VarTween;
		
		private var newGameTween:VarTween;
		private var cheatModeTween:VarTween;
		private var continueTween:VarTween;
		private var creditsTween:VarTween;
		private var moreGamesTween:VarTween;
		
		private var sponsorLogoTween:VarTween;
		private var facebookTween:VarTween;
		private var twitterTween:VarTween;
		
		private var muteTween:VarTween;
		
		// animations
		private var logoAnimationTween:VarTween;
		
		
		public function Menu(quickTween:Boolean = false, state:String = "Menu"):void
		{
			this.state = state;
			this.quickTween = quickTween;
		}
		
		override public function update():void
		{
			super.update();
			
			if (state == "Credits")
			{
				developer.y -= 35 * FP.elapsed;
				author.y -= 35 * FP.elapsed;
				others.y -= 35 * FP.elapsed;
				
				if ( Input.pressed(Key.ANY) )
				{
					// tweens
					var developerTween:VarTween = new VarTween();
					developerTween.tween(developer, "y", 315, 2.0, Ease.sineInOut);
					addTween(developerTween, true);
					
					var authorTween:VarTween = new VarTween();
					authorTween.tween(author, "y", 315, 2.0, Ease.sineInOut);
					addTween(authorTween, true);
					
					var othersTween:VarTween = new VarTween();
					othersTween.tween(others, "y", 315, 2.0, Ease.sineInOut);
					addTween(othersTween, true);
					
					state = "Menu";
					showArts();
					showButtons();
					continueInfoText.visible = false;
				}
				
				// has showed all the credits, now back to menu
				if (others.y < -69)
				{
					resetCredits();
					
					state = "Menu";
					showArts();
					showButtons();
					continueInfoText.visible = false;
				}
			}
		}
		
		override public function begin():void
		{
			// Background
			background = addGraphic( new Image(Assets.MENU_BACKGROUND) );
			background.y = FP.screen.height;
			backgroundTween = new VarTween();
			addTween(backgroundTween);
			
			// Logo
			logo = addGraphic( new Image(Assets.MENU_LOGO) );
			logo.x = 68;
			logo.y = -90;
			logoTween = new VarTween(animateDown);
			addTween(logoTween);
			
			// Nauk
			nauk = addGraphic( new Image(Assets.MENU_NAUK) );
			nauk.x = 410;
			nauk.y = 174;
			naukTween = new VarTween();
			addTween(naukTween);
			
			// Marine
			marine = addGraphic( new Image(Assets.MENU_MARINE) );
			marine.x = -100;
			marine.y = 186;
			marineTween = new VarTween();
			addTween(marineTween);
			
			
			// Buttons
			
			// New Game
			newGameButton = new Button(-102, 99, 102, 21, newGameClick);
			newGameButton.normal = newGameButton.down = new Image(Assets.NEWGAME_NORMAL);
			newGameButton.hover = new Image(Assets.NEWGAME_HOVER);
			add(newGameButton);
			
			newGameTween = new VarTween();
			addTween(newGameTween);
			
			
			// Cheat Mode
			/*
			cheatModeButton = new Button(-102, 143, 102, 21, cheatModeClick);
			cheatModeButton.normal = cheatModeButton.down = new Image(Assets.CHEATMODE_NORMAL);
			cheatModeButton.hover = new Image(Assets.CHEATMODE_HOVER);
			//add(cheatModeButton);
			
			cheatModeTween = new VarTween();
			addTween(cheatModeTween);*/
			
			
			// Continue
			continueButton = new Button(-102, 121, 102, 21, continueClick);
			
			// has played before
			if ( Core.progress.hasProgress() )
			{
				continueButton.normal = continueButton.down = new Image(Assets.CONTINUE_NORMAL);
				continueButton.hover = new Image(Assets.CONTINUE_HOVER);
			}
			
			// first time playing
			else
			{
				continueButton.normal = continueButton.down = continueButton.hover = new Image(Assets.CONTINUE_DISABLED);
			}
			
			add(continueButton);
			
			continueTween = new VarTween();
			addTween(continueTween);
			
			
			// Credits
			creditsButton = new Button(-102, 165, 102, 21, creditsClick);
			creditsButton.normal = creditsButton.down = new Image(Assets.CREDITS_NORMAL);
			creditsButton.hover = new Image(Assets.CREDITS_HOVER);
			add(creditsButton);
			
			creditsTween = new VarTween();
			addTween(creditsTween);
			
			
			// More Games
			moreGamesButton = new Button(-102, 77, 102, 21, moreGamesClick);
			moreGamesButton.normal = moreGamesButton.down = new Image(Assets.MOREGAMES_NORMAL);
			moreGamesButton.hover = new Image(Assets.MOREGAMES_HOVER);
			add(moreGamesButton);
			
			moreGamesTween = new VarTween();
			addTween(moreGamesTween);
			
			
			// 'Follow Us' Buttons
			
			// Sponsor Logo
			sponsorLogo = new Button(127, 318, 128, 86, moreGamesClick);
			sponsorLogo.normal = sponsorLogo.down = new Image(Assets.SPONSORLOGO_NORMAL);
			sponsorLogo.hover = new Image(Assets.SPONSORLOGO_HOVER);
			add(sponsorLogo);
			
			sponsorLogoTween = new VarTween();
			addTween(sponsorLogoTween);
			
			
			// Facebook
			facebookButton = new Button(430, 4, 24, 24, facebookClick);
			facebookButton.normal = facebookButton.down = new Image(Assets.FACEBOOK_NORMAL);
			facebookButton.hover = new Image(Assets.FACEBOOK_HOVER);
			add(facebookButton);
			
			facebookTween = new VarTween();
			addTween(facebookTween);
			
			
			// Twitter
			//twitterButton = new Button(430, 31, 24, 24, twitterClick);
			//twitterButton.normal = twitterButton.down = new Image(Assets.TWITTER_NORMAL);
			//twitterButton.hover = new Image(Assets.TWITTER_HOVER);
			//add(twitterButton);
			
			//twitterTween = new VarTween();
			//addTween(twitterTween);
			
			
			// Mute
			muteButton = new Button(430, 35, 16, 16, muteClick);
			updateMuteIcon();
			add(muteButton);
			
			muteTween = new VarTween();
			addTween(muteTween);
			
			
			// Credits screen
			
			// Developer
			developer = new Button(128, 0, 131, 115, developerClick);
			developer.normal = developer.down = new Image(Assets.CREDITS_DEVELOPER);
			developer.hover = new Image(Assets.CREDITS_DEVELOPER_HOVER);
			add(developer);
			
			// Author
			author = addGraphic( new Image(Assets.CREDITS_AUTHOR) );
			author.x = 128;
			author.y = 0;
			
			// Others
			others = addGraphic( new Image(Assets.CREDITS_OTHERS) );
			others.x = 128;
			others.y = 0;
			
			resetCredits();
			
			// Credits' info text to continue
			continueInfoText = new Text("Press ANY key to continue", 3, 3);
			continueInfoText.font = "Wonder";
			continueInfoText.size = 6;
			continueInfoText.color = 0x8A8A8A;
			addGraphic(continueInfoText);
			continueInfoText.visible = false;
			
			// start
			showArts();
			
			if (quickTween)
			{
				showButtons();
			}
			
			// sounds
			if (!Menu.music.playing)
			{
				if (Shop.music.playing)
				{
					Shop.music.stop();
				}
				
				if (Core.music)
				{
					Menu.music.loop();
				}
				
				else
				{
					Menu.music.loop(0, 0);
				}
			}
		}
		
		private function showArts():void
		{
			if (quickTween)
			{
				// Background (planet)
				backgroundTween.tween(background, "y", 84, 4, Ease.circOut);
				backgroundTween.start();
				
				// Logo
				logoTween.tween(logo, "y", 12, 4, Ease.quintInOut);
				logoTween.complete = animateDown;
				logoTween.start();
			}
			
			else
			{
				// Background (planet)
				backgroundTween.tween(background, "y", 84, 6, Ease.circOut);
				backgroundTween.start();
				
				if (state == "Credits")
				{
					showInfoText(true);
					return;
				}
				
				// Logo
				logoTween.tween(logo, "y", 12, 6, Ease.quintInOut);
				logoTween.complete = animateDown;
				logoTween.start();
			}
			
			// Logo Animation
			logoAnimationTween = new VarTween();
			addTween(logoAnimationTween);
			
			// Nauk
			naukTween.tween(nauk, "x", 302, 6, Ease.quintInOut);
			naukTween.start();
			
			// Marine
			marineTween.tween(marine, "x", 0, 6, Ease.quintInOut);
			marineTween.start();
			
			if (!quickTween)
			{
				naukTween.complete = showButtons;
			}
		}
		
		private function showButtons():void
		{
			if (state != "Menu")
			{
				return;
			}
			
			// More Games
			moreGamesTween.tween(moreGamesButton, "x", 145, 2.0, Ease.cubeInOut);
			moreGamesTween.start();
			
			// New Game
			newGameTween.tween(newGameButton, "x", 145, 2.2, Ease.cubeInOut);
			newGameTween.start();
			
			// Continue
			continueTween.tween(continueButton, "x", 145, 2.4, Ease.cubeInOut);
			continueTween.start();
			
			// Cheat Mode
			//cheatModeTween.tween(cheatModeButton, "x", 145, 2.6, Ease.cubeInOut);
			//cheatModeTween.start();
			
			// Credits
			creditsTween.tween(creditsButton, "x", 145, 2.7, Ease.cubeInOut);
			creditsTween.start();
			
			
			
			// 'Follow Us' Buttons
			
			// Sponsor Logo
			
			sponsorLogoTween.tween(sponsorLogo, "y", 190, 4.0, Ease.quartInOut);
			sponsorLogoTween.start();
			
			// Facebook
			facebookTween.tween(facebookButton, "x", 372, 3.8, Ease.bounceInOut);
			facebookTween.start();
			
			// Twitter
			//twitterTween.tween(twitterButton, "x", 372, 4.0, Ease.bounceInOut);
			//twitterTween.start();
			
			// Mute
			muteTween.tween(muteButton, "x", 377, 4.2, Ease.bounceInOut);
			muteTween.start();
		}
		
		private function hideItems():void
		{
			// Logo
			logoTween.tween(logo, "y", -80, 2.5, Ease.sineInOut);
			
			// Actions
			if (state == "New Game")
			{
				creditsTween.complete = newGameAction;
			}
			
			else if (state == "Cheat Mode")
			{
				creditsTween.complete = cheatModeAction;
			}
			
			else if (state == "Continue")
			{
				creditsTween.complete = continueAction;
			}
			
			else if (state == "Credits")
			{
				logoTween.complete = showInfoText;
				// this action is on the update function
			}
			
			logoTween.start();
			
			// Logo Animation
			removeTween(logoAnimationTween);
			
			// Nauk
			naukTween.tween(nauk, "x", 410, 2.5, Ease.quintInOut);
			naukTween.start();
			
			// Marine
			marineTween.tween(marine, "x", -100, 2.5, Ease.quintInOut);
			marineTween.start();
			
			
			// Buttons
			
			// New Game
			newGameTween.tween(newGameButton, "x", -102, 1.1, Ease.sineInOut);
			newGameTween.start();
			
			// Cheat Mode
			//cheatModeTween.tween(cheatModeButton, "x", -102, 1.4, Ease.sineInOut);
			//cheatModeTween.start();
			
			// Continue
			continueTween.tween(continueButton, "x", -102, 1.3, Ease.sineInOut);
			continueTween.start();
			
			// Credits
			creditsTween.tween(creditsButton, "x", -102, 1.5, Ease.sineInOut);
			creditsTween.start();
			
			// More Games
			moreGamesTween.tween(moreGamesButton, "x", -102, 0.9, Ease.sineInOut);
			moreGamesTween.start();
			
			
			// 'Follow Us' Buttons
			
			// Sponsor Logo
			sponsorLogoTween.tween(sponsorLogo, "y", 318, 2.1, Ease.quartInOut);
			sponsorLogoTween.start();
			
			// Facebook
			facebookTween.tween(facebookButton, "x", 430, 2.2, Ease.quartInOut);
			facebookTween.start();
			
			// Twitter
			//twitterTween.tween(twitterButton, "x", 430, 2.4, Ease.quartInOut);
			//twitterTween.start();
			
			// Mute
			muteTween.tween(muteButton, "x", 430, 2.6, Ease.quartInOut);
			muteTween.start();
		}
		
		
		// Logo Animation
		
		private function animateDown():void
		{
			logoAnimationTween.tween(logo, "y", logo.y + 10, 1);
			logoAnimationTween.complete = animateUp;
			logoAnimationTween.start();
		}
		
		private function animateUp():void
		{
			logoAnimationTween.tween(logo, "y", logo.y - 10, 1);
			logoAnimationTween.complete = animateDown;
			logoAnimationTween.start();
		}
		
		
		// Buttons' Action
		
		private function newGameClick():void
		{
			if (state == "New Game")
			{
				return;
			}
			
			state = "New Game";
			hideItems();
			
			// Progress
			Core.progress.newGame();
			
			// Sound
			Utils.sound_click.play(Core.vol);
		}
		
		private function cheatModeClick():void
		{
			if (state == "Cheat Mode")
			{
				return;
			}
			
			state = "Cheat Mode";
			hideItems();
			
			// Progress
			Core.progress.newGame(true);
			
			// Sound
			Utils.sound_click.play(Core.vol);
		}
		
		private function continueClick():void
		{
			if (state == "Continue" || !Core.progress.hasProgress() )
			{
				return;
			}
			
			state = "Continue";
			hideItems();
			
			// Progress
			Core.progress.load();
			
			// Sound
			Utils.sound_click.play(Core.vol);
		}
		
		private function creditsClick():void
		{
			if (state == "Credits")
			{
				return;
			}
			
			state = "Credits";
			hideItems();
			
			resetCredits();
			
			Utils.sound_click.play(Core.vol);
		}
		
		private function moreGamesClick():void
		{
			Utils.openURL(Core.sponsor_url);
			
			Utils.sound_click.play(Core.vol);
		}
		
		
		// 'Follow Us' Buttons' Actions
		
		private function facebookClick():void
		{
			Utils.openURL(Core.facebook_url);
			
			Utils.sound_click.play(Core.vol);
		}
		
		private function twitterClick():void
		{
			Utils.openURL(Core.twitter_url);
			
			Utils.sound_click.play(Core.vol);
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
		
		private function developerClick():void
		{
			Utils.openURL(Core.developer_url);
			
			Utils.sound_click.play(Core.vol);
		}
		
		
		// Core
		
		private function resetCredits():void
		{
			developer.y = 315;
			author.y = 430;
			others.y = 728;
		}
		
		
		// Actions
		
		private function newGameAction():void
		{
			removeAll();
			FP.world = new Map("New Game");
			
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
		
		private function cheatModeAction():void
		{
			removeAll();
			FP.world = new Shop();
		}
		
		private function continueAction():void
		{
			removeAll();
			FP.world = new Shop();
		}
		
		private function showInfoText(gameOver:Boolean = false):void
		{
			if (gameOver)
			{
				continueInfoText = new Text("All evil aliens were expelled. Humans and Aliens live now in peace.", 3, 3);
				continueInfoText.font = "Wonder";
				continueInfoText.size = 7;
				continueInfoText.color = 0xFFFFFF;
				addGraphic(continueInfoText);
				continueInfoText.visible = false;
			}
			
			continueInfoText.visible = true;
		}
		
		
		// Mute button
		
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
	}
}