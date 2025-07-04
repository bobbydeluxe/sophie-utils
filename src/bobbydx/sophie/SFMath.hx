package bobbydx.sophie;

/**
 * This file contains a bunch of mathematical functions I rewrote.
 * Why? Because Haxe's built-in math is inconsistent with the stuff I was taught.
 *
 * Example:
 * ```haxe
 * var angleDeg = 30;
 * var angleRad = SFMath.degToRad(angleDeg);
 * trace("sin(" + angleDeg + "°) = " + SFMath.sin(angleRad)); // ~0.5
 * ```
 *
 * @author BobbyDX
 * @version 1.2.0
 * @license MIT
 */
class SFMath {
    // --- CONSTANTS ---

    public static var PI = Math.PI;
    public static var E = Math.exp(1);
    public static var PHI = (1 + Math.sqrt(5)) / 2;
    public static var GAMMA = 0.57721566490153286060;
    public static var EPSILON = 1e-10;
    public static var NaN = Math.NaN;
    public static var POSITIVE_INFINITY = Math.POSITIVE_INFINITY;
    public static var NEGATIVE_INFINITY = Math.NEGATIVE_INFINITY;

    // --- DEG <-> RAD ---

    public static function degToRad(degrees:Float):Float {
        return degrees * (PI / 180);
    }

    public static function radToDeg(radians:Float):Float {
        return radians * (180 / PI);
    }

    // --- TRIGONOMETRY ---

    public static function sin(angle:Float):Float return Math.sin(angle);
    public static function cos(angle:Float):Float return Math.cos(angle);
    public static function tan(angle:Float):Float return Math.tan(angle);

    public static function trig(type:String, angle:Float):Float {
        switch (type.toLowerCase()) {
            case "sin": return Math.sin(angle);
            case "cos": return Math.cos(angle);
            case "tan": return Math.tan(angle);
            case "csc":
                var s = Math.sin(angle);
                if (approxEQ(s, 0)) throw "csc undefined at sin(angle) = 0";
                return 1 / s;
            case "sec":
                var c = Math.cos(angle);
                if (approxEQ(c, 0)) throw "sec undefined at cos(angle) = 0";
                return 1 / c;
            case "cot":
                var t = Math.tan(angle);
                if (approxEQ(t, 0)) throw "cot undefined at tan(angle) = 0";
                return 1 / t;
            case "asin": return Math.asin(angle);
            case "acos": return Math.acos(angle);
            case "atan": return Math.atan(angle);
            case "acsc": return Math.asin(1 / angle);
            case "asec": return Math.acos(1 / angle);
            case "acot": return Math.atan(1 / angle);
            default: throw "Invalid trig function type: " + type;
        }
    }

    // --- EXPONENTS & LOGS ---

    public static function pow(base:Float, exp:Float):Float return Math.pow(base, exp);
    public static function sqrt(value:Float):Float return pow(value, 0.5);
    public static function cbrt(value:Float):Float return pow(value, 1/3);
    public static function log(value:Float, base:Float):Float return Math.log(value) / Math.log(base);
    public static function ln(value:Float):Float return log(value, E);

    // --- BASIC FUNCTIONS ---

    public static function abs(value:Float):Float return Math.abs(value);
    public static function max(a:Float, b:Float):Float return Math.max(a, b);
    public static function min(a:Float, b:Float):Float return Math.min(a, b);
    public static function floor(value:Float):Float return Math.floor(value);
    public static function ceil(value:Float):Float return Math.ceil(value);
    public static function round(value:Float):Int return Math.round(value);
    public static function approxEQ(a:Float, b:Float, tolerance:Float = 1e-10):Bool {
        return Math.abs(a - b) <= tolerance;
    }
    public static function sign(value:Float):Int {
        return value > 0 ? 1 : value < 0 ? -1 : 0;
    }

    // --- RANGE & INTERPOLATION ---

    public static function clamp(value:Float, min:Float, max:Float):Float {
        return Math.max(min, Math.min(max, value));
    }

    public static function clamp01(value:Float):Float return clamp(value, 0, 1);

    public static function map(value:Float, fromMin:Float, fromMax:Float, toMin:Float, toMax:Float):Float {
        return toMin + (value - fromMin) * (toMax - toMin) / (fromMax - fromMin);
    }

    public static function lerp(start:Float, end:Float, t:Float):Float {
        return start + (end - start) * t;
    }

    public static function wrap(value:Float, min:Float, max:Float):Float {
        var range = max - min;
        return ((value - min) % range + range) % range + min;
    }

    // --- FACTORIALS & RANDOM ---

    public static function factorial(n:Int):Int {
        var result = 1;
        for (i in 2...n + 1) result *= i;
        return result;
    }

    public static function random(min:Float = 0, max:Float = 1):Float {
        return min + Math.random() * (max - min);
    }

    public static function mod(a:Float, b:Float):Float {
        return a - Math.floor(a / b) * b;
    }

    // --- GCD / LCM ---

    public static function gcd(a:Int, b:Int):Float {
        while (b != 0) {
            var temp = b;
            b = a % b;
            a = temp;
        }
        return Math.abs(a);
    }

    public static function lcm(a:Int, b:Int):Float {
        if (a == 0 || b == 0) return 0;
        return Math.abs(a * b) / gcd(a, b);
    }
}
