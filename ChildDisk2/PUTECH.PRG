*************************************************************************
*																		*
* PUTECH >>> Put current ECHO to the screen								*
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

@ 13,5 say "Enter ECHO date ................. ";
get E_DATE picture "99/99/99"

@ 15,5 say "Enter m mode (normal/adnormal) .. ";
get M_MODE picture "XXXXXXXX"

@ 16,5 say "Enter 2D (normal/adnormal) ...... ";
get TWO_D picture "XXXXXXXX"

@ 17,5 say "Enter doppler (normal/adnormal) . ";
get DOPPLER picture "XXXXXXXX"

clear gets

return

                                                                                                                                                                            