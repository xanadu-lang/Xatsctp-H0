(* ****** ****** *)
(*
Sat Apr  9 13:53:20 EDT 2022
*)
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/CC/basics.dats"
(* ****** ****** *)
#extern
fun
<a:type>
mylen2(xs: a): int
(* ****** ****** *)
//
impltmp
{a:type}
mylen2
<list(a)>
( xs ) = ff_xs(xs) where
{
fun
ff_xs(xs: list(a)): int =
case+ xs of
|
list_nil() => 0
|
list_cons(x1, xs) => 1+ff_xs(xs)
}
//
(* ****** ****** *)

val xs =
list_nil()
val xs =
list_cons(1, xs)
val xs =
list_cons(2, xs)

val res = mylen2<list(int)>( xs )

(* ****** ****** *)

(* end of [list03.dats] *)
