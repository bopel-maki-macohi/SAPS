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

			FlxTween.tween(sinco, {y: ogSincoY - sinco.height * 4}, .25, {ease: FlxEase.sineOut})
				.then(FlxTween.tween(sinco, {y: ogSincoY}, .25, {
					ease: FlxEase.sineIn,
					onComplete: t ->
					{
						jumping = false;
					}
				}));
		}
	}
}
