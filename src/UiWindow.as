package  
{
	import org.flixel.FlxBasic;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Alvaro
	 */
	public class UiWindow extends FlxGroup
	{
		
		protected var x:int;
		
		protected var y:int;
		
		protected var width:int;
		
		protected var height:int;
		
		private var IMG_BG:Class;
		
		public function UiWindow(X:int=0, Y:int=0, Width:int=0, Height:int=0, Background:Class = null) 
		{
			super();
			
			this.x = X;
			this.y = Y;
			this.width = Width;
			this.height = Height;
			this.IMG_BG = Background;
			
			loadBackground(this.IMG_BG);
		}
		
		public function loadBackground(BG:Class):void 
		{
			if (BG != null) {
				var bg:FlxSprite = new FlxSprite(this.x, this.y);
				bg.loadGraphic(BG, false, false, this.width, this.height);
				this.width = bg.width;
				this.height = bg.height;
				addComponent(bg);
			} else {
				var spriteBg:FlxSprite = new FlxSprite(0, 0);
				spriteBg.makeGraphic(this.width, this.height, 0xDD000000);
				addComponent(spriteBg);
			}
		}
		
		
		public function addComponent(component:FlxObject):void
		{
			component.x += this.x;
			component.y += this.y;
			this.add(component);
		}
		
		public function moveTo(newX:int, newY:int):void
		{
			var deltaX:int = newX - this.x;
			var deltaY:int = newY - this.y;
			
			for each (var cp:FlxObject in this.members) {
				cp.x += deltaX;
				cp.y += deltaY;
			}
			
			this.x = newX;
			this.y = newY;
		}
		
		public function center():void
		{
			var newX:int;
			var newY:int;
			
			newX = (FlxG.width / 2) - (this.width / 2);
			newY = (FlxG.height / 2) - (this.height / 2);
			
			moveTo(newX, newY);
		}
	}

}