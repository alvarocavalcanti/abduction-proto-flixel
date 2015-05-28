package  
{
	/**
	 * ...
	 * @author Alvaro
	 */
	public class Level
	{
		private var hit:Class;
		private var bg:Class;
		private var spr:Class;
		
		public function Level(hit:Class, bg:Class, spr:Class) 
		{
			this.hit = hit;
			this.bg = bg;
			this.spr = spr;
		}
		
		public function getHit():Class
		{
			return hit;
		}
		
		public function getBg():Class
		{
			return bg;
		}
		
		public function getSpr():Class
		{
			return spr;
		}
	}

}