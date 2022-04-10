(* ****** ****** *)
(*
Sun Apr 10 10:34:32 EDT 2022
*)
(* ****** ****** *)
//
fun<>
foo1(): void = ()
fun<>
foo2(): void = foo1()
//
val ((*void*)) = foo2<>()
//
(* ****** ****** *)
//
(*
HX-2022-04-10:
Should this one work?
It is not clear what this really means!!!
*)
//
#extern
fun<>
foo2(): void
implement
foo2<>() = foo1<>()
implement
foo2<>() = foo2<>() // It fails on recq-test
//
val ((*void*)) = foo2<>()
//
(* ****** ****** *)

(* end of [temp01.dats] *)
