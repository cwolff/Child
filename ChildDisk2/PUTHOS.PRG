*************************************************************************
*																		*
* PUTHOS >>> Put current hospital stay record to the screen				*
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

@ 13,5 say "Enter hospital admission date ... ";
get H_DATE_A picture "99/99/99"

@ 14,5 say "Enter hospital discharge date ... ";
get H_DATE_D picture "99/99/99"

@ 15,5 say "Enter comments .................. ";
get H_CMNTS picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

@ 16,5 say "Patient died .................... ";
get H_DIED picture "X"

@ 17,5 say "Autopsy performed ............... ";
get H_ATPSY picture "X"

clear gets

return

                                                               