*************************************************************************
*																		*
* PUTDIA >>> Put the current record to the screen						*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

@ 5,5 say "Pat number ..... ";
get PAT_NBR picture "AAAAAAAAAAA"

@ 7,5 say "Pat last name .. ";
get LST_N picture "AAAAAAAAAAAAAAA"

@ 7,70 get LOGON picture "XXXXX"

@ 8,5 say "Pat first name . ";
get FST_N picture "AAAAAAAAAA"

@ 9,5 say "Pat M. I. ...... ";
get M_I picture "A"

@ 11,5 say "Diagnose code . ";
get D_D_CODE "AAAAA"

@ 13,5 get D_DESC picture;
"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

return
