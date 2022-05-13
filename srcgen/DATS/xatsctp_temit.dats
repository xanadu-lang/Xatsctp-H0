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
#staload "./../SATS/xatsctp.sats"
//
(* ****** ****** *)

implement
l1tnm_temit(ltnm) =
fprintln!
(out, ltnm) where
{
  val out = stdout_ref
}

(* ****** ****** *)

implement
the_ltnmmap_temit() =
let
//
val out = stdout_ref
//
fun
auxmain
( tnms
: l1tnmlst_vt): void =
//
case+ tnms of
| ~
list_vt_nil() => ()
| ~
list_vt_cons
(tnm1, tnms) =>
(
  auxmain(tnms)) where
{
//
  val () =
  print!
  ("the_ltnmmap_temit: ")
//
  val () = l1tnm_temit(tnm1)
//
}
//
in(*in-of-let*)
//
auxmain(the_ltnmmap_listize())
//
end (* end of [the_ltnmmap_temit] *)

(* ****** ****** *)

(* end of [xats_xatsctp_temit.dats] *)
