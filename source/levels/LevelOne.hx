package levels;

import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxState;

class LevelOne extends FlxState
{
    public var sinco:FlxSprite;

    public var obstacles:FlxSpriteGroup;
    
    override function create() {
        super.create();

        sinco = new FlxSprite().makeGraphic(128, 128, FlxColor.LIME);
        add(sinco);

        sinco.screenCenter();

        obstacles = new FlxSpriteGroup();
        add(obstacles);
    }
}
