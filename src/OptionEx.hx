package;

import haxe.ds.Option;

using OptionEx;

@:nullSafety(Strict)
abstract OptionEx<T>(Option<T>) from Option<T> {
	public inline function CheckOption():Option<T> {
		if (this == null)
			//ログを仕込む?
			return None;
		switch (this) {
			case Some((v)):
				if (v != null)
					return Some(v)
				else
					return None;
			case None:
				return None;
		}
	}

	public inline function isEmpty() {
		CheckOption();
		return switch (this) {
			case Some(v): false;
			case None: true;
		}
	}

	//プリミティブ型以外は非推奨
	public inline function or(defValue:T) {
		CheckOption();
		return switch (this) {
			case Some(v): v;
			case None: defValue;
		}
	}

	public inline function map<U>(f:T->U) {
		CheckOption();
		return switch (this) {
			case Some(v): Some(f(v));
			case None: None;
		}
	}

	public inline function iter(f:T->Void) {
		CheckOption();
		switch (this) {
			case Some(v):
				f(v);
			case None:
				None;
		}
	}


	public inline function flatMap<U>( f:T->Option<U>) {
		CheckOption();
		return switch (this) {
			case Some(v):
				switch (f(v)) {
					case Some(w): Some(w);
					case None: None;
				}
			case None: None;
		}
	}
}
