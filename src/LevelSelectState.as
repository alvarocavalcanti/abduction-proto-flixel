package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	/**
	 * ...
	 * @author Alvaro
	 */
	public class LevelSelectState extends FlxState
	{
		[Embed(source = 'img/btn_level_normal.png')] private const IMG_BTN_LEVEL_NORMAL:Class;
		[Embed(source = 'img/btn_level_highlight.png')] private const IMG_BTN_LEVEL_HIGHLIGHT:Class;
		
		private var levelFactory:LevelFactory;
		
		private var xInit:int = 10;
		private var yInit:int = 10;
		private var deltaX:int = 60;
		private var deltaY:int = 20;
		private var maxColumns:int = 5;
		
		private var button1:FlxButtonPlus;
		private var button2:FlxButtonPlus;
		
		override public function create():void
		{
			trace("LEvelSelectState::create()");
			levelFactory = new LevelFactory();
			
			var levelCount:int = levelFactory.getLevelCount();
			
			var btnNormal:FlxSprite = new FlxSprite(0, 0, IMG_BTN_LEVEL_NORMAL);
			var btnHighlight:FlxSprite = new FlxSprite(0, 0, IMG_BTN_LEVEL_HIGHLIGHT);
			
			//button1 = new FlxButtonPlus(10, 10, OnClickOne, ["Level", 1], "" + 1, 40, 40);
			//button1.loadGraphic(btnNormal, btnHighlight);
			//
			//button2 = new FlxButtonPlus(70, 10, OnClickTwo, ["Level", 2], "" + 2, 40, 40);
			//button2.loadGraphic(btnNormal, btnHighlight);
			
			for (var i:int = 1; i <= levelCount; i++)
			{
				var button:FlxButtonPlus = new FlxButtonPlus(xInit + ((i - 1) * deltaX), yInit, OnClick, ["Level", i], "" + i, 40, 40);
				button.loadGraphic(btnNormal, btnHighlight);
				add(button);
				trace("button " + i + " created");
			}
			
			//add(button1);
			//add(button2);
			
			FlxG.mouse.show();
			FlxG.resetInput();
		}
		
		private function OnClick(key:String, value:int):void
		{
			trace("clicked " + key + " " + value);
			FlxG.switchState(new PlayState(value));
		}
		
		//private function OnClickOne(key:String, value:int):void
		//{
			//trace("clicked " + key + " " + value);
			//FlxG.switchState(new PlayState(value));
		//}
		//
		//private function OnClickTwo(key:String, value:int):void
		//{
			//trace("clicked " + key + " " + value);
			//FlxG.switchState(new PlayState(value));
		//}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.mouse.justPressed()) {
				trace("Click!");
			}
		}
		
	}

}