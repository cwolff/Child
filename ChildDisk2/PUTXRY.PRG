*************************************************************************
*																		*
* PUTXRY >>> Put current XRYO to the screen								*
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

@ 13,5 say "Enter XRY date .................. ";
get X_DATE picture "99/99/99"

@ 15,5 say "Enter m mode (normal/adnormal) .. ";
get XRAY picture "XXXXXXXX"

clear gets

return

                                                                                    