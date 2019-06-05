Utilizzando local...in...end
Gestisce il blocco local...in come contenitore di definizioni

local
	val rec look =
		fn x::m => ( fn y => if x=y then true else look m y )
		| [] => ( fn y => false )

	val rec size =
		fn x::m => 1 + size m 
		| _ => 0;


	val rec noduplen_rec =
		fn y::l => (
			fn m => if (look m y) then noduplen_rec (l) (m) else noduplen_rec (l) (y::m)
		)
		| [] => (fn m => size m);
in

	fun noduplen l = noduplen_rec l [];

end

--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

Utilizzando let...in...end
Gestisce il blocco let...in come contenitore di espressioni

val rec noduplen = fn l => 
let
	val rec look =
		fn x::m => ( fn y => if x=y then true else look m y )
		| [] => ( fn y => false )

	val rec size =
		fn x::m => 1 + size m 
		| _ => 0;


	val rec noduplen_rec =
		fn y::l => (
			fn m => if (look m y) then noduplen_rec (l) (m) else noduplen_rec (l) (y::m)
		)
		| [] => (fn m => size m);
in

	noduplen_rec l [];

end

