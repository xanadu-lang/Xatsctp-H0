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
//
#dynload
"./../DATS/xatsctp_main0.dats"
#dynload
"./../DATS/xatsctp_l1tnm.dats"
#dynload
"./../DATS/xatsctp_print.dats"
#dynload
"./../DATS/xatsctp_util0.dats"
#dynload
"./../DATS/xatsctp_temit.dats"
#dynload
"./../DATS/xatsctp_envmap.dats"
#dynload
"./../DATS/xatsctp_dynexp.dats"
//
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
extern
fun
echo_argc_argv
  {n:nat}
( out: FILEref
, argc: int(n), argv: !argv(n)): void
//
implement
echo_argc_argv
{n}
(out, argc, argv) =
(
loop(argv, 0(*i0*))
) where
{
fun
loop
{ i:nat
| i <= n} .<n-i>.
( argv
: !argv(n)
, i0: int(i)): void =
(
if
(i0 >= argc)
then
fprintln!(out)
else
let
val () =
if
(i0 > 0)
then
fprint(out, ' ')
in
fprint(out, argv[i0]); loop(argv, i0+1)
end (*let*) // end of [else]
)
} (* end of [ech0_argc_argv] *)
//
(* ****** ****** *)
//
// HX-2022-05-20:
//
#ifdef
__LIBXATSCTP__
#then
(* ****** ****** *)
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "libxatsctp_dynloadall"
(* ****** ****** *)
#else
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
echo_argc_argv(out, argc, argv)
// *)
} (* end of [main0] *)
//
(* ****** ****** *)
#endif // #ifdef(__LIBXATSCTP__)
(* ****** ****** *)

(* end of [xats_xatsctp.dats] *)
