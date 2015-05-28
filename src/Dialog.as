package  
{
	import org.flixel.FlxButton;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Alvaro
	 */
	public class Dialog extends UiWindow
	{
		public static const DIALOG_OK:int = 100;
		
		public static const DIALOG_OK_CANCEL:int = 101;
		
		public static const DIALOG_YES_NO:int = 102;
		
		private const BUTTON_WIDTH:int = 30;
		
		private const BUTTON_HEIGHT:int = 10;
		
		private const BUTTON_LABEL_OK:String = "Ok";
		
		private const BUTTON_LABEL_CANCEL:String = "Cancel";
		
		private const BUTTON_LABEL_YES:String = "Yes";
		
		private const BUTTON_LABEL_NO:String = "No";
		
		private const LABEL_X:int = 5;
		
		private const LABEL_Y:int = 10;
		
		private var _onClickOne:Function;
		
		private var _onClickTwo:Function;
		
		private var type:int;
		
		public function Dialog(x:int, y:int, w:int, h:int, type:int, label:String, one:Function, two:Function = null) 
		{
			super(x, y, w, h);
			this._onClickOne = one;
			if (two != null) {
				this._onClickTwo = two;
			}
			this.type = type;
			
			switch (this.type) {
				case DIALOG_OK:
					var x:int = (w / 2) - (BUTTON_WIDTH / 2);
					var y:int = h - (BUTTON_HEIGHT * 2);
					var btn:FlxButton = new FlxButton(x, y,  BUTTON_LABEL_OK, clickOne);
					addComponent(btn);
					break;
				case DIALOG_OK_CANCEL:
					var x1:int = (w / 4) - (BUTTON_WIDTH / 2);
					var x2:int = ((w / 4) * 3) - (BUTTON_WIDTH / 2);
					var y:int = h - (BUTTON_HEIGHT * 2);
					var btn1:FlxButton = new FlxButton(x1, y,  BUTTON_LABEL_OK, clickOne);
					var btn2:FlxButton = new FlxButton(x2, y,  BUTTON_LABEL_CANCEL, clickTwo);
					addComponent(btn1);
					addComponent(btn2);
					break;
				case DIALOG_YES_NO:
					var x1:int = (w / 4) - (BUTTON_WIDTH / 2);
					var x2:int = ((w / 4) * 3) - (BUTTON_WIDTH / 2);
					var y:int = h - (BUTTON_HEIGHT * 2);
					var btn1:FlxButton = new FlxButton(x1, y,  BUTTON_LABEL_YES, clickOne);
					var btn2:FlxButton = new FlxButton(x2, y,  BUTTON_LABEL_NO, clickTwo);
					addComponent(btn1);
					addComponent(btn2);
					break;
				default:
					break;
			}
			
			var lbl:FlxText = new FlxText(LABEL_X, LABEL_Y, w - (LABEL_X * 2), label);
			addComponent(lbl);
			
			dismiss();
		}
		
		private function clickOne():void
		{
			this._onClickOne.call();
			dismiss();
		}
		
		private function dismiss():void 
		{
			this.alive = false;
			this.exists = false;
		}
		
		
		private function clickTwo():void
		{
			this._onClickTwo.call();
			dismiss();
		}
		
		public function show():void
		{
			this.revive();
		}
		
	}

}