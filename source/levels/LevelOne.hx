package levels;

import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxState;

class LevelOne extends FlxState
{
    public var sinco:FlxSprite;
    
    override function create() {
        super.create();

        sinco = new FlxSprite().makeGraphic(128, 128, FlxColor.LIME);
        add(sinco);

        sinco.screenCenter();
    }
}
