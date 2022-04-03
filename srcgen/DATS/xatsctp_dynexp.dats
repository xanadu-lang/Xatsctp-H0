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
// Start Time: February, 2022
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
//
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
(* ****** ****** *)
//
implement
fprint_val<h0pat> = fprint_h0pat
implement
fprint_val<h0exp> = fprint_h0exp
//
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
|
H0Pvar(hdv1) =>
println!
("H0Pvar: ", h0t0)
|
_(* rest-of-h0pat*) =>
println!
("xatsctp_h0pat: h0p0 = ", h0p0)
//
end // end of [xatsctp_h0pat]

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
H0Efcst(hdc1) =>
println!("H0Efcst: ", h0t0)
//
|
H0Edapp
(h0f0, npf1, h0es) =>
let
val () =
println!("H0Edapp: ", h0t0)
in
  xatsctp_h0exp(env0, h0f0)
; xatsctp_h0explst(env0, h0es)
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
val-
H0Cfundecl
( knd0
, mopt
, tqas
, hfds) = dcl0.node()
in
xatsctp_hfundeclist(env0, hfds)
end // end of [aux_fundecl]

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
val loc0 = rcd.loc
val pat1 = rcd.pat
val def2 = rcd.def
//
val ( ) =
println!
("(",loc0,").pat = ", pat1)
//
val ( ) =
xatsctp_h0pat( env0, pat1 )
//
val ( ) =
println!
("(",loc0,").def = ", def2)
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
val loc = rcd.loc
val nam = rcd.nam
val hdc = rcd.hdc
val hag = rcd.hag
val def = rcd.def
//
in
//
println!("(", loc, ").nam = ", nam);
println!("(", loc, ").hdc = ", hdc);
(*
println!("(", loc, ").hag = ", hag);
*)
println!("(", loc, ").def = ", def);
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
