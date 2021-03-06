*************************************************************************
*																		*
* PUTCAR >>> Put current cardiac cath. record to the screen				*
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

@ 12,5 say "Enter hospital admission date ... ";
get C_DATE picture "99/99/99"

@ 13,5 say "Enter QP/QS range ............... ";
get QP_QS picture "XXXXXXX"

@ 14,5 say "Enter RP/RS range ............... ";
get RP_RS picture "XXXXXXXXXXX"

@ 15,5 say "Enter RVP/LVP range ............. ";
get RVP_LVP picture "XXXXXXXXXXXX"

@ 16,5 say "Enter RVP/AOP range ............. ";
get RVP_AOP picture "XXXXXXXXXXXX"

@ 17,5 say "Enter GR range .................. ";
get GR picture "XXXXXXXXXXXXX"

clear gets

return

                                       