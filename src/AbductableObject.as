package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * This class represents an object that can be abducted.
	 * 
	 * While being abducted the object can be slowly dragged, and after released it will
	 * drop keepping the inertia.
	 * 
	 * @author Alvaro Cavalcanti <alvarovictor@gmail.com>
	 */
	public class AbductableObject extends FlxSprite
	{
		private static const ACC_GRAVITY:int = 60;
		
		private static const ACC_UPWARD:int = -40;
		
		private static const ACC_HORIZONTAL:int = 20;
		
		private static const MAX_VELOCITY_UP:int = 40;
		
		private static const MAX_VELOCITY_DOWN:int = 80;
		
		private static const MAX_VELOCITY_X:int = 25;
		
		private static const VEL_DRAG:int = 10;
		
		public var lifted:Boolean = false;
		
		private var dragDirection:int = 0;
		
		//public var stopping:Boolean = false;
		
		public function AbductableObject(X:Number = 0, Y:Number = 0, SimpleGraphic:Class = null) 
		{
			super(X, Y, SimpleGraphic);
			
			this.maxVelocity.x = MAX_VELOCITY_X;
			this.maxVelocity.y = MAX_VELOCITY_DOWN;
			this.acceleration.y = ACC_GRAVITY;
			this.drag.x = VEL_DRAG;
			solid = true;
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function lift():void
		{
			if (!lifted) {
				this.maxVelocity.y = MAX_VELOCITY_UP;
				this.acceleration.y = ACC_UPWARD;
				this.acceleration.x = 0;
				this.lifted = true;
			}
		}
		
		public function drop():void
		{
			if (lifted) {
				this.maxVelocity.y = MAX_VELOCITY_DOWN;
				this.acceleration.y = ACC_GRAVITY;
				this.acceleration.x = 0;
				this.lifted = false;
			}
		}
		
		public function dragLeft():void
		{
			if (this.lifted) {
				this.acceleration.x = -ACC_HORIZONTAL;
			}
		}
		
		public function dragRight():void
		{
			if (this.lifted) {
				this.acceleration.x = ACC_HORIZONTAL;
			}
		}
		
	}

}