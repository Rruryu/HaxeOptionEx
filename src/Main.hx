import haxe.iterators.RestIterator;
import haxe.ds.Option;
using Lambda;

using OptionEx;

@:nullSafety(Strict)
class Main {
	static var scene:Option<Scene> =None;
	static var nullScene:Option<Scene> = None;
	static function main() {
		scene = Some(new Scene('first'));
		nullScene=NUall.hoi();
		//nullScene = None;
		NullCheckMacro.NullErrorMacro(NUall.hogei);
		trace('Some.Map ${scene.map((scene)->{return scene.Name;})}');
		trace('NullSome.Map ${nullScene.map((scene)->{return scene.Name;})}');
		trace('InNUll!? ${nullScene.or(NUall.puy()))}');
	}
}

class Scene {
	public var Name(default,null):String;
	public function new(name:String) {
		Name=name;
	}
}

class NUall {
	public static var hogei='hogei';
	public function new() {
		
	}
	public static function hoi() {
		var hoi:Option<Scene>=null;
		return hoi;
	}
	public static function puy() {
		var pui:Scene=null;
		return pui;
	}
}