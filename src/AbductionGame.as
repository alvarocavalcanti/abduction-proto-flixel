package

{

	import org.flixel.*;

	[SWF(width="800", height="480", backgroundColor="#000000")]

	[Frame(factoryClass="Preloader")]

	public class AbductionGame extends FlxGame
	{

		public function AbductionGame()

		{

			super(400, 240, MenuState, 2);
			FlxG.debug = true;
			FlxG.mouse.show();

		}

	}

}

