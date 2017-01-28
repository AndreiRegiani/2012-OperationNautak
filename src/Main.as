package
{
	import Worlds.Menu;
	
	import flash.events.ContextMenuEvent;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	public final class Main extends Engine
	{
		private var customMenu:ContextMenu;
		
		public function Main():void
		{
			super(800, 550, 60, false);
			
			//FP.console.enable();
			FP.screen.scale = 2;
			FP.screen.color = 0x000000;
			
			customContextMenu();
			
			Level.initLevels();
			
			Core.progress = new Progress();
			
			if ( Core.progress.hasProgress() )
			{
				Core.progress.loadOptions();
			}
			
			if (Core.sound)
			{
				Core.vol = 1;
			}
			
			else
			{
				Core.vol = 0;
			}
		}
		
		override public function init():void
		{
			FP.world = new Menu();
		}
		
		private function customContextMenu():void
		{
			customMenu = new ContextMenu();
			customMenu.hideBuiltInItems();
			
			var developer:ContextMenuItem = new ContextMenuItem("Developed by " + Core.developer_name, true);
			developer.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, developerClick);
			
			var author:ContextMenuItem = new ContextMenuItem("© Andrei Regiani", false, false);
			
			customMenu.customItems.push(developer);
			customMenu.customItems.push(author);
			
			this.contextMenu = customMenu;
		}
		
		private function developerClick(event:ContextMenuEvent):void
		{
			Utils.openURL(Core.developer_url);
		}
	}
}