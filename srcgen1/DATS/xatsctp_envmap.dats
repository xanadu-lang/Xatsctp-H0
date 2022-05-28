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
#include
"share\
/atspre_staload_libats_ML.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#define
XATSOPT_targetloc
"./../..\
/modules/xatsopt/srcgen/xcomp"
//
(* ****** ****** *)
//
#staload
"{$XATSOPT}/SATS/intrep0.sats"
//
#staload "./../SATS/xatsctp.sats"
//
(* ****** ****** *)

local

val
the_flag = ref<int>(0)

in(*in-of-local*)

implement
xatsctp_initize() =
let
val n0 = the_flag[]
val () = the_flag[] := n0+1
in
if
(n0 = 0)
then
{
(*
val () = xatsctp_initize_gint()
*)
} (*then*) // end of [if]
end // end of [xatsctp_initize]

end // end of [local]

(* ****** ****** *)

local
//
datavtype
xctpenv =
|
XCTPENV of
(int(*level*), xctpstk)
//
and
xctpstk =
|
xctpstk_nil of ()
|
xctpstk_let1 of xctpstk
//
absimpl xctpenv_vtbox = xctpenv
//
in(*in-of-local*)

(* ****** ****** *)
implement
xctpenv_make_nil
((*void*)) =
XCTPENV(0, xctpstk_nil())
(* ****** ****** *)
implement
xctpenv_free_nil
  (env0) =
{
val-0(*top*) = l0
val-~xctpstk_nil() = xs
} where
{
val+~XCTPENV(l0, xs) = env0
} (* xctpenv_free_nil *)
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_xatsctp_envmap.dats] *)
