package levels;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.math.FlxMath;
import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxState;

class LevelOne extends FlxState
{
	public var sinco:FlxSprite;

	public var obstacles:FlxSpriteGroup;

	override function create()
	{
		super.create();

		sinco = new FlxSprite().makeGraphic(32, 32, FlxColor.LIME);
		add(sinco);

		sinco.screenCenter();

		obstacles = new FlxSpriteGroup();
		add(obstacles);
	}

	public var jumping:Bool = false;

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.SPACE && !jumping)
		{
			jumping = true;

			var ogSincoY:Float = sinco.y;

			FlxTween.tween(sinco, {y: ogSincoY - sinco.height * 4}, .25, {ease: FlxEase.sineOut}).then(FlxTween.tween(sinco, {y: ogSincoY}, .25, {
				ease: FlxEase.sineIn,
				onComplete: t ->
				{
					jumping = false;
				}
			}));
		}

		for (obstacle in obstacles)
		{
			obstacle.x -= (obstacle.width * 4) * elapsed;
		}

		if (FlxG.random.float() < .1)
		{
			var newobs = new FlxSprite().makeGraphic(64, 64, FlxColor.GRAY);

			newobs.screenCenter();

			newobs.x = FlxG.width + newobs.width;
			if (obstacles.length > 0)
				newobs.x += obstacles.members[obstacles.length - 1].x * 0.2;

			obstacles.add(newobs);

			if (FlxG.random.float() < .15)
				newobs.x += newobs.width * 2;
		}
	}
}
