package bobbydx.sophie;

import flixel.util.FlxColor;

/**
 * This file contains a bunch of pre-made color palettes for use in your game.
 * You can use these colors in your game by importing this file and using the colors directly.
 * There is also a function for dynamic grayscale color retrieval.
 * 
 * You can call the colors from palettes like this:
 * 
 * ```haxe
 * var blue = SFColors.DEFAULT.get("BLUE");
 * var candyPink = SFColors.PASTEL.get("PINK");
 * var white = SFColors.grayscale(255);
 * ```
 * 
 * @author BobbyDX
 * @version 1.1.0
 * @license MIT
 */
class SFColors {
    public static final TRANSPARENT:Int = 0x00000000;

    // Default Colors
    public static final DEFAULT:Map<String, Int> = [
        "RED" => 0xFFFF0000,
        "ORANGE" => 0xFFFF8000,
        "ORANGE2" => 0xFFFFA500,
        "YELLOW" => 0xFFFFFF00,
        "CHARTREUSE" => 0xFF7FFF00,
        "GREEN" => 0xFF00FF00,
        "MINT" => 0xFF00FF80,
        "CYAN" => 0xFF00FFFF,
        "AZURE" => 0xFF0080FF,
        "BLUE" => 0xFF0000FF,
        "PURPLE" => 0xFF8000FF,
        "MAGENTA" => 0xFFFF00FF,
        "CRIMSON" => 0xFFFF0080,
        "PINK" => 0xFFFF89CE,
    ];

    // Pastel Palette
    public static final PASTEL:Map<String, Int> = [
        "LAVENDER" => 0xFFE6E6FA,
        "MINT" => 0xFFAAF0D1,
        "BABY_BLUE" => 0xFFBFEFFF,
        "BLUSH" => 0xFFFFD1DC,
        "LEMON" => 0xFFFFF9B0,
        "PEACH" => 0xFFFFDAB9,
        "PINK" => 0xFFFFC0CB,
    ];

    // Neon Palette
    public static final NEON:Map<String, Int> = [
        "NEON_GREEN" => 0xFF39FF14,
        "NEON_PINK" => 0xFFFF6EC7,
        "NEON_BLUE" => 0xFF1B03A3,
        "NEON_PURPLE" => 0xFFBC13FE,
        "NEON_YELLOW" => 0xFFFFFF33,
        "NEON_ORANGE" => 0xFFFF5F1F,
    ];

    // Earth Tones Palette
    public static final EARTH:Map<String, Int> = [
        "BROWN2" => 0xFF5E3611,
        "SAND" => 0xFFEDC9AF,
        "OLIVE" => 0xFF808000,
        "FOREST" => 0xFF228B22,
        "CLAY" => 0xFFB66A50,
        "SKY" => 0xFF87CEEB,
        "MOSS" => 0xFF8A9A5B,
    ];

    // Miscellaneous Palette
    public static final MISC:Map<String, Int> = [
        "GOLD" => 0xFFFFD700,
        "SILVER" => 0xFFC0C0C0,
        "BRONZE" => 0xFFCD7F32,
        "LIME" => 0xFFBFFF00,
        "INDIGO" => 0xFF4B0082,
        "TEAL" => 0xFF008080,
        "CORAL" => 0xFFFF7F50,
    ];

    // Alternate Palette – same categories, different vibes
    public static final ALTERNATE:Map<String, Int> = [
        "RED" => 0xFFFF5555,
        "ORANGE" => 0xFFFFA347,
        "YELLOW" => 0xFFFFF14F,
        "GREEN" => 0xFF66FF33,
        "MINT" => 0xFFAAF0D1,
        "CYAN" => 0xFF00FFDD,
        "BLUE" => 0xFF3F88FF,
        "PURPLE" => 0xFFC084FC,
        "MAGENTA" => 0xFFFF4FF8,
        "CRIMSON" => 0xFFDC143C,
        "PINK" => 0xFFFF6EC7,
        "PEACH" => 0xFFFFCBA4,
        "BROWN" => 0xFF8B4513,
    ];

    /**
     * Returns a grayscale color based on the input value.
     * The value should be between 0 and 255.
     * 
     * @param value The grayscale value (0-255).
     * @return The grayscale color in ARGB format.
     */
    public static function grayscale(value:Int):Int {
        value = Math.max(0, Math.min(255, value));
        return FlxColor.rgb(value, value, value);
    }

    /**
     * Returns a color from a specified palette.
     * 
     * @param palette The palette name (e.g. "DEFAULT").
     * @param name The color name.
     * @return The color, or 0 if not found.
     */
    public static function getColor(palette:String, name:String):Int {
        var group = Reflect.field(SFColors, palette);
        return Std.isOfType(group, Map) && group.exists(name) ? group.get(name) : 0;
    }
}
