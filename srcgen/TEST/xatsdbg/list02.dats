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
<a:type>
mylen
(xs: list(a)): int =
(
case+ xs of
| list_nil() => 0
| list_cons(x1, xs) => 1+mylen(xs)
)

(* ****** ****** *)

val xs =
list_nil()
val xs =
list_cons(1, xs)
val xs =
list_cons(2, xs)

val l0 = mylen<int>(xs)

(* ****** ****** *)

(* end of [list02.dats] *)
