import haxe.macro.PositionTools;
import haxe.macro.Expr;
import haxe.macro.Context;

class NullCheckMacro {
    public static function NullCheck<T>(v:T) {
        //コンパイルエラー
        //外部ライブラリ・サーバーからのエラーは防げない
        if(v==null) Context.fatalError("Null Error",Context  .makePosition({min:0,max:2,file:"NullCheckMacro.hx"}));
    }
    public static macro function NullErrorMacro(expr:Expr) {
        trace(expr.pos);
        return macro {

        }
    }
}