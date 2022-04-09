(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: April, 2022
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share\
/atspre_staload.hats"
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
//
#staload
"{$XATSOPT}/SATS/intrep0.sats"
//
#staload "./../SATS/xatsctp.sats"
//
(* ****** ****** *)
extern
fun
xatsctp_h0pat
( env0:
! ctpenv, h0p0: h0pat): void
extern
fun
xatsctp_h0patlst
( env0:
! ctpenv, h0ps: h0patlst): void
(* ****** ****** *)
extern
fun
xatsctp_hfarg
( env0:
! ctpenv, hfa0: hfarg): void
extern
fun
xatsctp_hfarglst
( env0:
! ctpenv, hfas: hfarglst): void
(* ****** ****** *)
extern
fun
xatsctp_h0exp
( env0:
! ctpenv, h0e0: h0exp): void
extern
fun
xatsctp_h0explst
( env0:
! ctpenv, h0es: h0explst): void
extern
fun
xatsctp_h0expopt
( env0:
! ctpenv, opt0: h0expopt): void
(* ****** ****** *)
extern
fun
xatsctp_h0gpat
( env0:
! ctpenv, hgpt: h0gpat): void
extern
fun
xatsctp_h0gualst
( env0:
! ctpenv, h0gs: h0gualst): void
(* ****** ****** *)
extern
fun
xatsctp_h0clau
( env0:
! ctpenv, hcl0: h0clau): void
extern
fun
xatsctp_h0claulst
( env0:
! ctpenv, hcls: h0claulst): void
(* ****** ****** *)
implement
fprint_val<h0typ> = fprint_h0typ
(* ****** ****** *)
//
implement
fprint_val<h0pat> = fprint_h0pat
implement
fprint_val<hfarg> = fprint_hfarg
//
implement
fprint_val<h0exp> = fprint_h0exp
//
(* ****** ****** *)
implement
fprint_val<htqarg> = fprint_htqarg
implement
fprint_val<htiarg> = fprint_htiarg
(* ****** ****** *)
extern
fun
xatsctp_hvaldecl
( env0:
! ctpenv, hvd0: hvaldecl): void
extern
fun
xatsctp_hvaldeclist
( env0:
! ctpenv, hvds: hvaldeclist): void
(* ****** ****** *)
extern
fun
xatsctp_hvardecl
( env0:
! ctpenv, hvd0: hvardecl): void
extern
fun
xatsctp_hvardeclist
( env0:
! ctpenv, hvds: hvardeclist): void
(* ****** ****** *)
extern
fun
xatsctp_hfundecl
( env0:
! ctpenv, hfd0: hfundecl): void
extern
fun
xatsctp_hfundeclist
( env0:
! ctpenv, hfds: hfundeclist): void
(* ****** ****** *)

implement
xatsctp_program
  (p0kg) =
let
//
val () =
xatsctp_initize()
//
val
env0 =
ctpenv_make_nil()
//
local
val+
H0COMPED(rcd0) = p0kg
val-Some(dcls) = rcd0.comped
in
val () =
xatsctp_h0dclist(env0, dcls)
end // end of [local]
//
val () = ctpenv_free_nil(env0)
//
in
  // nothing
end // end of [xatsctp_program]

(* ****** ****** *)

implement
xatsctp_h0pat
(env0, h0p0) =
let
val loc0 = h0p0.loc()
val h0t0 = h0p0.type()
in
//
case+
h0p0.node() of
//
|
H0Pvar(hdv1) =>
println!
("H0Pvar: ", h0t0)
//
|
H0Pcon(hdc1) =>
println!
("H0Pcon: ", h0t0)
//
|
H0Pdapp
(h0f0, npf1, h0ps) =>
let
val () =
println!("H0Pdapp: ", h0t0)
in
xatsctp_h0pat(env0, h0f0);
xatsctp_h0patlst(env0, h0ps)
end (*let*) // end of [H0Pdapp]
//
|
_(* rest-of-h0pat*) =>
println!
("xatsctp_h0pat: h0p0 = ", h0p0)
//
end // end of [xatsctp_h0pat]

(* ****** ****** *)

implement
xatsctp_h0patlst
(env0, h0ps) =
(
case+ h0ps of
|
list_nil() => ()
|
list_cons(h0p1, h0ps) =>
{
val () =
xatsctp_h0pat(env0, h0p1)
val () =
xatsctp_h0patlst(env0, h0ps)
}
) // end of [xatsctp_h0patlst]

(* ****** ****** *)
//
implement
xatsctp_hfarg
(env0, hfa0) =
(
case+
hfa0.node() of
//
| HFARGnone0() => ()
| HFARGnone1(_) => ()
//
| HFARGnpats
  (npf1, h0ps) =>
(
  xatsctp_h0patlst(env0, h0ps)
)
//
) (*case*) // end of [xatsctp_hfarg]
//
(* ****** ****** *)

implement
xatsctp_hfarglst
(env0, hfas) =
(
case+ hfas of
|
list_nil() => ()
|
list_cons(hfa1, hfas) =>
{
val () =
xatsctp_hfarg(env0, hfa1)
val () =
xatsctp_hfarglst(env0, hfas)
}
) // end of [xatsctp_hfarglst]

(* ****** ****** *)

implement
xatsctp_h0exp
(env0, h0e0) =
let
val loc0 = h0e0.loc()
val h0t0 = h0e0.type()
in
//
case+
h0e0.node() of
//
|
H0Eint _ =>
println!("H0Eint: ", h0t0)
|
H0Ebtf _ =>
println!("H0Ebtf: ", h0t0)
|
H0Echr _ =>
println!("H0Echr: ", h0t0)
|
H0Estr _ =>
println!("H0Estr: ", h0t0)
//
|
H0Evar(hdv1) =>
println!("H0Evar: ", h0t0)
|
H0Ekvar(knd0, hdv1) =>
println!("H0Ekvar: ", h0t0)
|
H0Efcst(hdc1) =>
println!("H0Efcst: ", h0t0)
//
|
H0Etcst
(hdc1, tiarg) =>
println!("H0Etcst: ", h0t0)
//
|
H0Etimp
( stmp
, h0e1, targ
, h0cl, tsub) =>
let
val () =
println!("H0Etimp: ", h0t0)
val () =
println!("H0Etimp: targ = ", targ)
val () =
println!("H0Etimp: tsub = ", tsub)
in
  xatsctp_h0exp(env0, h0e1)
; xatsctp_h0dcl(env0, h0cl)
end (*let*) // end of [H0Etimp]
//
|
H0Edapp
(h0f0, npf1, h0es) =>
let
val () =
println!("H0Edapp: ", h0t0)
in
xatsctp_h0exp(env0, h0f0);
xatsctp_h0explst(env0, h0es)
end (*let*) // end of [H0Edapp]
//
|
H0Elet(dcls, h0e1) =>
let
val () =
println!("H0Elet: ", h0t0)
in
xatsctp_h0exp
( env0, h0e1 ) where
{
val () =
xatsctp_h0dclist(env0, dcls)
}
end
//
|
H0Eift1
(h0e1, h0e2, opt3) =>
let
val () =
println!("H0Eift1: ", h0t0)
in
  xatsctp_h0exp(env0, h0e1)
; xatsctp_h0exp(env0, h0e2)
; xatsctp_h0expopt(env0, opt3)
end
//
|
H0Ecase
(knd0, h0e1, hcls) =>
let
val () =
println!("H0Ecase: ", h0t0)
in
  xatsctp_h0exp(env0, h0e1)
; xatsctp_h0claulst(env0, hcls)
end
//
|
_(* rest-of-h0exp*) =>
println!
("xatsctp_h0exp: h0e0 = ", h0e0)
//
end // end of [xatsctp_h0exp]

(* ****** ****** *)

implement
xatsctp_h0explst
(env0, h0es) =
(
case+ h0es of
|
list_nil() => ()
|
list_cons(h0e1, h0es) =>
{
val () =
xatsctp_h0exp(env0, h0e1)
val () =
xatsctp_h0explst(env0, h0es)
}
) // end of [xatsctp_h0explst]

(* ****** ****** *)

implement
xatsctp_h0expopt
(env0, opt0) =
(
case+ opt0 of
|
None() => ()
|
Some(h0e1) =>
{
val () =
xatsctp_h0exp(env0, h0e1)
}
) // end of [xatsctp_h0expopt]

(* ****** ****** *)

implement
xatsctp_h0gpat
(env0, hgpt) =
(
case+
hgpt.node() of
|
H0GPATpat(h0p1) =>
xatsctp_h0pat(env0, h0p1)
|
H0GPATgua(h0p1, h0gs) =>
{
val () = 
xatsctp_h0pat(env0, h0p1)
val () =
xatsctp_h0gualst(env0, h0gs)
}
) (* end of [xatsctp_h0gpat] *)

(* ****** ****** *)

local

fun
auxgua
( env0:
! ctpenv
, h0g0: h0gua): void =
(
case+
h0g0.node() of
|
H0GUAexp(h0e1) =>
xatsctp_h0exp(env0, h0e1)
|
H0GUAmat(h0e1, h0p2) =>
{
val () =
xatsctp_h0exp(env0, h0e1)
val () =
xatsctp_h0pat(env0, h0p2)
}
) (* end of [auxgua] *)

in(*in-of-local*)

implement
xatsctp_h0gualst
(env0, h0gs) =
(
case+ h0gs of
|
list_nil() => ()
|
list_cons(h0g1, h0gs) =>
{
val () = auxgua(env0, h0g1)
val () =
xatsctp_h0gualst(env0, h0gs)
}
) (* end of [xatsctp_h0gualst] *)

end // end of [local]

(* ****** ****** *)

implement
xatsctp_h0clau
(env0, hcl0) =
(
case+
hcl0.node() of
|
H0CLAUpat
( hgpt ) =>
xatsctp_h0gpat(env0, hgpt)
|
H0CLAUexp
(hgpt, h0e1) =>
(
xatsctp_h0exp( env0, h0e1 )
) where
{
val () =
xatsctp_h0gpat( env0, hgpt )
}
) (* end of [xatsctp_h0clau] *)

(* ****** ****** *)

implement
xatsctp_h0claulst
(env0, hcls) =
(
case+ hcls of
|
list_nil() => ()
|
list_cons(hcl1, hcls) =>
{
val () =
xatsctp_h0clau(env0, hcl1)
val () =
xatsctp_h0claulst(env0, hcls)
}
) // end of [xatsctp_h0claulst]

(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_valdecl
( env0:
! ctpenv
, dcl0: h0dcl): void =
let
val-
H0Cvaldecl
( knd0
, mopt
, hvds) = dcl0.node()
in
xatsctp_hvaldeclist(env0, hvds)
end // end of [aux_valdecl]

(* ****** ****** *)

fun
aux_fundecl
( env0:
! ctpenv
, dcl0: h0dcl): void =
let
//
val-
H0Cfundecl
( knd0
, mopt
, tqas
, hfds) = dcl0.node()
//
val () =
println!
("H0Cfundecl: tqas = ", tqas)
//
in
xatsctp_hfundeclist(env0, hfds)
end // end of [aux_fundecl]

(* ****** ****** *)

fun
aux_impdecl3
( env0:
! ctpenv
, dcl0: h0dcl): void =
let
//
val-
H0Cimpdecl3
( tok0
, stm0
, mopt
, htqa
, hdc0, htia
, hfas, h0e1) = dcl0.node()
//
val ( ) =
println!
("HIMPDECL3.hdc0 = ", hdc0)
//
val ( ) =
println!
("HIMPDECL3.htqa = ", htqa)
val ( ) =
println!
("HIMPDECL3.htia = ", htia)
//
val ( ) =
println!
("HIMPDECL3.hfas = ", hfas)
val ( ) =
xatsctp_hfarglst(env0, hfas)
//
in
xatsctp_h0exp
( env0, h0e1 ) where
{
val ( ) =
println!("HIMPDECL3.body = ", h0e1)
}
end // end of [aux_impdecl3]

(* ****** ****** *)

in(* in-of-local *)

implement
xatsctp_h0dcl
  (env0, dcl0) =
(
case+
dcl0.node() of
//
|
H0Cvaldecl _ =>
aux_valdecl(env0, dcl0)
//
|
H0Cfundecl _ =>
aux_fundecl(env0, dcl0)
//
|
H0Cimpdecl3 _ =>
aux_impdecl3(env0, dcl0)
//
| _ (*rest-of-h0dcl*) =>
{
val () =
println!
("xatsctp_h0dcl: dcl0 = ", dcl0)
}
//
) where
{
(*
val () =
println!
("xatsctp_h0dcl: dcl0 = ", dcl0)
*)
//
} (*where*)//end of [xatsctp_h0dcl]

end // end of [local]

(* ****** ****** *)

implement
xatsctp_h0dclist
  (env0, dcls) =
(
case+ dcls of
|
list_nil() => ()
|
list_cons(dcl1, dcls) =>
{
val () =
xatsctp_h0dcl(env0, dcl1)
val () =
xatsctp_h0dclist(env0, dcls)
}
) (*case*) // end of [xatsctp_h0dclist]

(* ****** ****** *)

implement
xatsctp_hvaldecl
  (env0, x0) =
let
//
val+
HVALDECL
( rcd ) = x0
//
(*
val loc0 = rcd.loc
*)
val pat1 = rcd.pat
val def2 = rcd.def
//
val ( ) =
println!
( "HVALDECL.pat = ", pat1 )
//
val ( ) =
xatsctp_h0pat( env0, pat1 )
//
val ( ) =
println!
( "HVALDECL.def = ", def2 )
//
in
//
case+ def2 of
| None() => ()
| Some(h0e2) =>
  xatsctp_h0exp( env0, h0e2 )
//
end (*let*) // end of [xatsctp_hvaldecl]

implement
xatsctp_hvaldeclist
  (env0, xs) =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(
  xatsctp_hvaldeclist(env0, xs)
) where
{
val () = xatsctp_hvaldecl(env0, x0)
}
) (*case*) // end of [xatsctp_hvaldeclist]

(* ****** ****** *)

implement
xatsctp_hfundecl
(env0, hfd0) =
let
//
val+
HFUNDECL
  (rcd) = hfd0
//
(*
val loc0 = rcd.loc
*)
val hdc0 = rcd.hdc
val hag1 = rcd.hag
val def2 = rcd.def
//
val ( ) =
println!
( "HFUNDECL.hdc = ", hdc0 )
//
val ( ) =
(
case hag1 of
|
None() =>
println!
("HFUNDECL.hag = ", "None(", ")" )
|
Some(hfas) =>
(
  xatsctp_hfarglst(env0, hfas)
) where
{
val ( ) =
println!
("HFUNDECL.hag = ", "Some(", hfas, ")")
}
) (*case*) // end-of-val
//
val ( ) =
println!( "HFUNDECL.def = ", def2 )
//
in
//
case+ def2 of
|
None() => ()
|
Some(h0e2) => xatsctp_h0exp(env0, h0e2)
//
end (*let*) // end of [xatsctp_hfundecl]

implement
xatsctp_hfundeclist
  (env0, xs) =
(
case+ xs of
|
list_nil() => ()
|
list_cons(x0, xs) =>
(
  xatsctp_hfundeclist(env0, xs)
) where
{
val () = xatsctp_hfundecl(env0, x0)
}
) (*case*) // end of [xatsctp_hvaldeclist]

(* ****** ****** *)

(* end of [xats_xatsctp_dynexp.dats] *)
