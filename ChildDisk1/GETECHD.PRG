*************************************************************************
*																		*
* GETECHD >>> Get the cardiac cath. test date.							*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

@ 7,5 say "Pat number ..... ";
get PAT_NBR picture "AAAAAAAAAAA"

store USER_LOGON to LOGON
@ 7,70 get LOGON picture "XXXXX"

@ 9,5 say "Pat last name .. ";
get LST_N picture "AAAAAAAAAAAAAAA"

@ 10,5 say "Pat first name . ";
get FST_N picture "AAAAAAAAAA"

@ 11,5 say "Pat M. I. ...... ";
get M_I picture "A"

clear gets

store DTOC(date()) to E_DATE
@ 13,5 say "Enter ECHO date ................. ";
get E_DATE picture "99/99/99"

set confirm on

read
clear gets

set confirm off

@ 5,0

return

                                                                   