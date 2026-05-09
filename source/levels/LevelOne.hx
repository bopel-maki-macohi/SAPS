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

		sinco = new FlxSprite().makeGraphic(128, 128, FlxColor.LIME);
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

			FlxTween.tween(sinco, {y: sinco.y - sinco.height * 4}, .25, {ease: FlxEase.backOut})
				.then(FlxTween.tween(sinco, {y: sinco.y + sinco.height * 4}, .25, {
					ease: FlxEase.backIn,
					onComplete: t ->
					{
						jumping = false;
					}
				}));
		}
	}
}
