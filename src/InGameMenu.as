package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Alvaro
	 */
	public class InGameMenu extends UiWindow
	{
		[Embed(source = 'img/ingamemenu_bg.png')] private const IMG_BG:Class;
		
		public static const MESSAGE_PAUSE:String = "GAME PAUSED";
		public static const MESSAGE_WIN:String = "CONGRATULATIONS!";
		public static const MESSAGE_LOSE:String = "TRY AGAIN!";
		
		private var btnHelp:FlxButton;
		private var btnMenu:FlxButton;
		private var btnNext:FlxButton;
		private var btnBack:FlxButton;
		private var btnSound:FlxButton;
		
		private var txtMessage:FlxText;
		
		private var currentLevelID:int;
		
		public function InGameMenu(x:int, y:int, w:int, h:int, levelId:int) 
		{
			super(x, y, w, h);
			
			this.currentLevelID = levelId;
			
			txtMessage = new FlxText(5, 5, w - 10, MESSAGE_PAUSE);
			txtMessage.setFormat(null, 8, 0xffffff, "center");
			addComponent(txtMessage);
			
			btnMenu = new FlxButton((this.width / 2) - 40, 20, "Main Menu", OnClickMenu);
			addComponent(btnMenu);
			
			btnBack = new FlxButton((this.width / 2) - 40, 40, "Back", OnClickBack);
			addComponent(btnBack);

			btnNext = new FlxButton((this.width / 2) - 40, 60, "Next Level", OnClickNext);
			btnNext.kill();
			addComponent(btnNext);

			// Reiniciar
			// Menu
			// Ajuda
			// Som
			// Voltar
			// Próximo
			
			// 60x50px
		}
		
		override public function update():void
		{
			super.update();
		}
		
		private function OnClickMenu():void
		{
			FlxG.switchState(new LevelSelectState());
		}

		private function OnClickBack():void
		{
			FlxG.paused = false;
			this.alive = false;
			this.exists = false;
		}
		
		private function OnClickNext():void
		{
			FlxG.switchState(new PlayState(currentLevelID++));
		}
		
		public function setMessage(msg:String):void
		{
			txtMessage.text = msg;
		}
		
		public function showNext():void
		{
			this.btnNext.revive();
		}
		
	}

}