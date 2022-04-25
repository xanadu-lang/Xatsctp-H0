(* ****** ****** *)
(*
Sat Feb 19 14:33:31 EST 2022
*)
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/CC/basics.dats"
(* ****** ****** *)

fun
fact(n: int): int =
if n > 0 then n * fact(n-1) else 1

(* ****** ****** *)

val fact10 = fact(10)

(* ****** ****** *)

(* end of [fact01.dats] *)

(* ****** ****** *)
////
H0TNM(1001; H0Tapp(H0Tcst(gint_type(1)); H0Ttyext(xats_sint_t; ), H0Tnone1([t2ype])H0Tnone1(T2Pnone0())))
#define gint_type(atp1) atp1;
typedef gint_type(xats_sint_t) h0tnm_1001;
