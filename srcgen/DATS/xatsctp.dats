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
#dynload
"./../DATS/xatsctp_main0.dats"
#dynload
"./../DATS/xatsctp_l1tnm.dats"
#dynload
"./../DATS/xatsctp_print.dats"
#dynload
"./../DATS/xatsctp_util0.dats"
#dynload
"./../DATS/xatsctp_envmap.dats"
#dynload
"./../DATS/xatsctp_dynexp.dats"
(* ****** ****** *)
//
#staload "./../SATS/xatsctp.sats"
//
(* ****** ****** *)

local
//
val
stamper =
$STM.stamper_new()
//
val () =
$STM.stamper_set
( stamper, 1001U(*init*) )
//
in (* in-of-local *)

implement
l1tnm_stamp_new() =
$STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)
//
implement
main0(argc, argv) =
(
//
if
(argc >= 2)
then
(
xatsctp_main0(argc, argv)
)
else
{
val () =
prerrln!
("Hello from ATS3(xatsctp)!")
//
val
XATSHOME = the_XATSHOME_get()
val
((*void*)) =
prerrln!
("xatsctp: XATSHOME=",XATSHOME)
//
} (* else *) // end of [if]
) where
{
// (*
// (*
val out = stderr_ref
val ( ) =
$XATSOPT.echo_argc_argv(out, argc, argv)
// *)
} (* end of [main0] *)
//
(* ****** ****** *)

(* end of [xats_xatsctp.dats] *)
