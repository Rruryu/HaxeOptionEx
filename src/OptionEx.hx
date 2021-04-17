package;

import haxe.ds.Option;

using OptionEx;

@:nullSafety(Strict)
class OptionEx {
	static function CheckOption<T>(opt:Option<T>):Option<T> {
		if (opt == null)
			return None;
		switch (opt) {
			case Some((v)):
				if (v != null)
					return Some(v)
				else
					return None;
			case None:
				return None;
		}
	}

	public static function isEmpty<T>(opt:Option<T>) {
		opt = CheckOption(opt);
		return switch (opt) {
			case Some(v): false;
			case None: true;
		}
	}

    //orのdefValueがnullだった場合防げないし、どこでnullだったか分かりづらい
	public static function or<T>(opt:Option<T>, defValue:T) {
		opt = CheckOption(opt);

		NullCheckMacro.NullCheck(defValue);
		return switch (opt) {
			case Some(v): v;
			case None: defValue;
		}
	}
	// public static function Or<T>(opt:Option<T>, defValue:T) {
    //     opt=CheckOption(opt);
    //     trace(Context.currentPos.file);
    //     return switch (opt){
    //         case Some(v): v;
    //         case None:defValue;
    //     }
    // }

	public static function map<A, B>(opt:Option<A>, f:A->B) {
		opt = CheckOption(opt);
		return switch (opt) {
			case Some(v): Some(f(v));
			case None: None;
		}
	}

	public static function fold<A, B>(opt:Option<A>, defValue:B, f:A->B) {
		opt = CheckOption(opt);
		return opt.map(f).or(defValue);
	}

	public static function iter<A>(opt:Option<A>, f:A->Void) {
		opt = CheckOption(opt);
		switch (opt) {
			case Some(v):
				f(v);
			case None:
				None;
		}
	}

	public static function flatten<T>(opt:Option<Option<T>>) {
		opt = CheckOption(opt);
		return switch (opt) {
			case Some(v): v;
			case None: None;
		}
	}

	public static function flatMap<A, B>(opt:Option<A>, f:A->Option<B>) {
		opt = CheckOption(opt);
		return switch (opt) {
			case Some(v):
				switch (f(v)) {
					case Some(w): Some(w);
					case None: None;
				}
			case None: None;
		}
	}
}
