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
xatsctp_h0dclist
  (env0, dcls) =
(
case+ dcls of
|
list_nil() => ()
|
list_cons(dcl1, dcls) =>
{
(*
val () =
xatsctp_h0dcl(env0, dcl1)
*)
val () =
xatsctp_h0dclist(env0, dcls)
}
) (*case*) // end of [xatsctp_h0dclist]

(* ****** ****** *)

(* end of [xint_xatsctp_dynexp.dats] *)
