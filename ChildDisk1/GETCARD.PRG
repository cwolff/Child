*************************************************************************
*																		*
* GETCARD >>> Get the cardiac cath. test date.							*
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

clear gets

store DTOC(date()) to C_DATE
@ 12,5 say "Enter cardiac cath. test date ... ";
get C_DATE picture "99/99/99"

set confirm on

read
clear gets

set confirm off

@ 5,0

return

                                                                                                                           