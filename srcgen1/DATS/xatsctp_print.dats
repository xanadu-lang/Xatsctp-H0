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
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/libxatsctp.hats"
//
(* ****** ****** *)
#staload "./../SATS/xatsctp.sats"
(* ****** ****** *)
overload
fprint
with $SYM.fprint_symbol
(* ****** ****** *)
overload
fprint
with $LOC.fprint_location
(* ****** ****** *)
//
overload
fprint with $STM.fprint_stamp
//
overload
fprint with $LAB.fprint_label
//
overload
fprint with $LEX.fprint_token
//
(* ****** ****** *)
overload
fprint with $S2E.fprint_tyrec
(* ****** ****** *)
overload
fprint with $H0E.fprint_htcst
overload
fprint with $H0E.fprint_h0typ
overload
fprint with $H0E.fprint_h0con
(* ****** ****** *)
implement
fprint_val<h0typ> = $H0E.fprint_h0typ
(* ****** ****** *)
//
implement
print_l1tnm(x0) =
fprint_l1tnm(stdout_ref, x0)
implement
prerr_l1tnm(x0) =
fprint_l1tnm(stderr_ref, x0)
//
implement
fprint_l1tnm
( out, x0 ) =
let
val
lctp = x0.lctp()
in(* in-of-let *)
//
case+ lctp of
|
L1CTPnone() =>
let
val h0t0 = x0.type()
val stmp = x0.stamp()
in
fprint!
( out
, "L1TNM(", stmp, "; ", h0t0, ")")
end // end of [L1CTPnone]
|
_(* non-L1CTPnone*) =>
let
val stmp = x0.stamp()
in
fprint!
( out
, "L1TNM(", stmp, "; ", lctp, ")")
end // end of [non-L1CTPnone]
//
end (*let*) // end of [fprint_l1tnm]
//
(* ****** ****** *)
//
implement
print_l1ctp(x0) =
fprint_l1ctp(stdout_ref, x0)
implement
prerr_l1ctp(x0) =
fprint_l1ctp(stderr_ref, x0)
//
(* ****** ****** *)
//
implement
fprint_l1ctp
( out, lctp ) =
(
case+ lctp of
//
|
L1CTPnone() =>
fprint!(out, "L1CTPnone()")
|
L1CTPsome() =>
fprint!(out, "L1CTPsome()")
//
|
L1CTPname(name) =>
fprint!
(out, "L1CTPname(", name, ")")
//
|
L1CTPtype(h0t1) =>
fprint!
(out, "L1CTPtype(", h0t1, ")")
//
|
L1CTPltnm(ltnm) =>
fprint!
(out, "L1CTPltnm(", ltnm, ")")
//
|
L1CTPtydat
( htc1
, h0ts, dtcs ) =>
fprint!
( out
, "L1CTPtydat("
, htc1, "; ", h0ts, "; ", "...", ")"
)
|
L1CTPtyrec
( bxty, l1ts )  =>
fprint!
( out
, "L1CTPtyrec(", bxty, "; ", l1ts, ")"
)
|
L1CTPtyapp
( l1t1, l1ts ) =>
fprint!
( out
, "L1CTPtyapp(", l1t1, "; ", l1ts, ")"
)
) where
{
implement
fprint_val<l1ctp> = fprint_l1ctp
implement
fprint_val<labl1ctp> = fprint_labl1ctp
} (*where*) // end of [fprint_l1ctp]
//
(* ****** ****** *)
//
implement
print_l1dtc(x0) =
fprint_l1dtc(stdout_ref, x0)
implement
prerr_l1dtc(x0) =
fprint_l1dtc(stderr_ref, x0)
//
implement
fprint_l1dtc(out, x0) =
(
case+ x0 of
|
L1DTCdtcon(hdc1, l1ts) =>
fprint!
( out
, "L1DTCdtcon(",hdc1,"; ",l1ts,")")
) where
{
implement
fprint_val<l1ctp> = fprint_l1ctp
} (*where*) // end of [fprint_l1dtc]
//
(* ****** ****** *)
//
local
//
staload
_(*S2E*) =
"{$XATSOPT}/DATS/staexp2_print.dats"
//
in(*in-of-local*)
//
implement
fprint_labl1ctp(out, lx0) =
let
implement
fprint_val<l1ctp> = fprint_l1ctp
in
$S2E.fprint_slabeled<l1ctp>(out, lx0)
end (*let*) // end of [fprint_labl1ctp]
//
end (*local*) // end of [local]
//
(* ****** ****** *)

(* end of [xats_xatsctp_print.dats] *)
