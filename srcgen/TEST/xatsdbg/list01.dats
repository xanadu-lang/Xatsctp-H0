(* ****** ****** *)
(*
Sun Apr  3 18:38:18 EDT 2022
*)
(* ****** ****** *)
#staload
"prelude/DATS/gnum.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gord.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gint.dats"
(* ****** ****** *)
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/string.dats"
(* ****** ****** *)
#staload
"prelude/DATS/CATS/CC/basics.dats"
(* ****** ****** *)

fun
mysum
(xs: list(int)): int =
(
case+ xs of
| list_nil() => 0
| list_cons(x1, xs) => x1+mysum(xs)
)

(* ****** ****** *)

(* end of [list01.dats] *)
