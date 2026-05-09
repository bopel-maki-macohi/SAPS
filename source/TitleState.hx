package;

import levels.LevelOne;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.FlxState;

class TitleState extends FlxState
{
	override public function create()
	{
		super.create();

		add(new FlxText(0,0,0,'Press ENTER', 16));
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.ENTER)
		{
			FlxG.switchState(() -> new LevelOne());
		}
	}
}
