*************************************************************************
*																		*
* PUTADV >>> Display to the screen the consult (advice) record 			*
*	       entry : #													*
*	       exit : Current record variables								*
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

@ 13,5 say "Enter consulting date ... ";
get A_DATE picture "99/99/99"

@ 14,5 say "Enter charge number ..... ";
get A_CHG_NO picture "99-99-99";

@ 15,5 say "Enter doctors intials ... ";
get A_MD picture "XXX"

@ 16,5 say "Enter Diagnose Code ... ";
get A_DIAG picture "XXXXX"

@ 17,5 get A_DESC picture;
"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

clear gets

return

                                                            


