(* ****** ****** *)
(*
Sun Apr  3 18:38:18 EDT 2022
*)
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/CC/basics.dats"
(* ****** ****** *)

(*
fun
<a:type>
mylen
(xs: list(a)): int =
(
case+ xs of
| list_nil() => 0
| list_cons(x1, xs) => 1+mylen(xs)
)
*)

(* ****** ****** *)

#extern
fun
<a:type>
mylen(xs: a): int

impltmp
{a:type}
mylen
<list(a)>
( xs ) = auxf(xs) where
{
fun
auxf(xs: list(a)): int =
case+ xs of
| list_nil() => 0
| list_cons(x1, xs) => 1+auxf(xs)
}

(* ****** ****** *)
//
fun
<a:type>
mylen2
(xs: list(a)): int =
case+ xs of
|
list_nil() => 0
|
list_cons(x1, xs) => 1+mylen2(xs)
//
(* ****** ****** *)

val xs =
list_nil()
val xs =
list_cons(1, xs)
val xs =
list_cons(2, xs)

(*
val l0 = mylen<list(int)>(xs)
*)
val l0 = mylen2<int>(xs)

(* ****** ****** *)

(* end of [list02.dats] *)
