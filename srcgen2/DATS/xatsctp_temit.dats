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
// Start Time: May 19th, 2022
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
#symload
fprint with $LAB.fprint_label
#symload
fprint with $STM.fprint_stamp
(* ****** ****** *)
//
#staload "./../SATS/xatsctp.sats"
//
(* ****** ****** *)
//
implement
l1tnm_temit
(out, ltnm) =
(
fprintln!
(out, "xtnm_", stmp)) where
{
val stmp = ltnm.stamp((*void*))
}
//
(* ****** ****** *)

local
//
fun
my_main1
( out
: FILEref,
  tnms:
! l1tnmlst_vt): void = ()
//
fun
my_main2
( out
: FILEref,
  tnms:
! l1tnmlst_vt): void = ()
//
fun
my_main3
( out
: FILEref,
  tnms:
! l1tnmlst_vt): void = ()
//
fun
my_main4
( out
: FILEref,
  tnms:
! l1tnmlst_vt): void = ()
//
fun
my_main5
( out
: FILEref,
  tnms:
! l1tnmlst_vt): void = ()
//
in(*in-of-local*)

implement
the_ltnmmap_temit
  (out) = let
//
fun
auxmain
( out
: FILEref
, tnms
: l1tnmlst_vt): void =
{
//
val () = my_main1(out, tnms)
val () = my_main2(out, tnms)
val () = my_main3(out, tnms)
val () = my_main4(out, tnms)
val () = my_main5(out, tnms)
//
val () = list_vt_free( tnms )
}
//
in
auxmain(out, the_ltnmmap_listize())
end(*let*)//end-of-[the_ltnmmap_temit]

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [xats_xatsctp_temit.dats] *)
