*************************************************************************
*																		*
* PUTPAT >>> Put the current record to the screen						*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

@ 5,0 say "Pat number ..... ";
get PAT_NBR picture "AAAAAAAAAAA"

@ 5,40 say "Pat birth date . ";
get BIRTH picture "99/99/99"

@ 5,70 get LOGON picture "XXXXX"

@ 7,0 say "Pat last name .. ";
get LST_N picture "AAAAAAAAAAAAAAA"
@ 7,40 say "Gdn last name .. ";
get G_LST_N picture "AAAAAAAAAAAAAAA"

@ 8,0 say "Pat first name . ";
get FST_N picture "AAAAAAAAAA"
@ 8,40 say "Gdn first name . ";
get G_FST_N picture "AAAAAAAAAA"

@ 9,0 say "Pat M. I. ...... ";
get M_I picture "A"
@ 9,40 say "Gdn M. I. ...... ";
get G_M_I picture "A"

@ 10,0 say "Pat street ..... ";
get STREET picture "AAAAAAAAAAAAAAAAAAAA"
@ 10,40 say "Gdn street ..... ";
get G_STREET picture "AAAAAAAAAAAAAAAAAAAA"

@ 11,0 say "Pat city ....... ";
get CITY picture "AAAAAAAAAAAAAAA"
@ 11,40 say "Gdn city ....... ";
get G_CITY picture "AAAAAAAAAAAAAAA"

@ 12,0 say "Pat state ...... ";
get STATE picture "AA"
@ 12,40 say "Gdn state ...... ";
get G_STATE picture "AA"

@ 13,0 say "Pat zip ........ ";
get ZIP picture "AAAAAAAAA"
@ 13,40 say "Gdn zip ........ ";
get G_ZIP picture "AAAAAAAAA"

@ 15,0 say "Pat phone nbr .. ";
get PHONE picture "999-999-9999"
@ 15,40 say "Gdn phone nbr .. ";
get G_PHONE picture "999-999-9999"

@ 16,0 say "Father .... ";
get FATHER picture "AAAAAAAAAAAAAAAAAAAAAAAAA"
@ 16,40 say "Hospital nbr ... ";
get HOS_NBR picture "XX-XX-XX"

@ 17,0 say "Mother .... ";
get MOTHER picture "AAAAAAAAAAAAAAAAAAAAAAAAA"
@ 17,40 say "Ref doc ... ";
get REF_DOC picture "XXXXXXXXXXXXXXXXXXXXXXXXX"

clear gets

return

                                                  