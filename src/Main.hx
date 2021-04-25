import haxe.ds.Option;
import OptionEx;
using Lambda;


@:nullSafety(Strict)
class Main {
	static var hoge:OptionEx<Box> =None;
	static var hogu:OptionEx<Box> = None;
	static function main() {
		hoge = Some(new Box('first'));
		hoge.iter((b)->{trace('Some.iter ${b.Name}');});
		hogu.iter((b)->{trace('None.iter ${b.Name}');});//Noneなら出力されない

		trace('Some.Map ${hoge.map((b)->{return b.Name;})}');
		trace('Null.Map ${hogu.map((b)->{return b.Name;})}');
	}
}

class Box {
	public var Name(default,null):String;
	public function new(name:String) {
		Name=name;
	}
}