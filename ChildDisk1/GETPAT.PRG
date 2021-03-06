*************************************************************************
*																		*
* GETPAT >>> Get patient record from the screen which the user edits	*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

@ 5,0 say "Pat number ..... ";
get PAT_NBR picture "AAAAAAAAAAA"

@ 5,70 get LOGON picture "XXXXX"

clear gets

set confirm on

@ 7,0 say "Pat last name .. ";
get LST_N picture "AAAAAAAAAAAAAAA"
store UPPER(LST_N) to LST_N

@ 8,0 say "Pat first name . ";
get FST_N picture "AAAAAAAAAA"
store UPPER(FST_N) to FST_N

@ 9,0 say "Pat M. I. ...... ";
get M_I picture "X"
store UPPER(M_I) to M_I

@ 10,0 say "Pat street ..... ";
get STREET picture "XXXXXXXXXXXXXXXXXXXX"
store UPPER(STREET) to STREET

@ 11,0 say "Pat city ....... ";
get CITY picture "XXXXXXXXXXXXXXX"
store UPPER(CITY) to CITY

@ 12,0 say "Pat state ...... ";
get STATE picture "AA"
store UPPER(STATE) to STATE

@ 13,0 say "Pat zip ........ ";
get ZIP picture "XXXXXXXXX"
store UPPER(ZIP) to ZIP

@ 15,0 say "Pat phone nbr .. ";
get PHONE picture "999-999-9999"

@ 16,0 say "Father .... ";
get FATHER picture "XXXXXXXXXXXXXXXXXXXXXXXXX"
store UPPER(FATHER) to FATHER

@ 17,0 say "Mother .... ";
get MOTHER picture "XXXXXXXXXXXXXXXXXXXXXXXXX"
store UPPER(MOTHER) to MOTHER

@ 5,40 say "Pat birth date . ";
get BIRTH picture "99/99/99"

@ 7,40 say "Gdn last name .. ";
get G_LST_N picture "AAAAAAAAAAAAAAA"
store UPPER(G_LST_N) to G_LST_N

@ 8,40 say "Gdn first name . ";
get G_FST_N picture "AAAAAAAAAA"
store UPPER(G_FST_N) to G_FST_N

@ 9,40 say "Gdn M. I. ...... ";
get G_M_I picture "X"
store UPPER(G_M_I) to G_M_I

@ 10,40 say "Gdn street ..... ";
get G_STREET picture "XXXXXXXXXXXXXXXXXXXX"
store UPPER(G_STREET) to G_STREET

store "               " to G_CITY
@ 11,40 say "Gdn city ....... ";
get G_CITY picture "XXXXXXXXXXXXXXX"
store UPPER(G_CITY) to G_CITY

@ 12,40 say "Gdn state ...... ";
get G_STATE picture "AA"
store UPPER(G_STATE) to G_STATE

@ 13,40 say "Gdn zip ........ ";
get G_ZIP picture "XXXXXXXXX"
store UPPER(G_ZIP) to G_ZIP

@ 15,40 say "Gdn phone nbr .. ";
get G_PHONE picture "999-999-9999"

@ 16,40 say "Hospital nbr ... ";
get HOS_NBR picture "XX-XX-XX"
store UPPER(HOS_NBR) to HOS_NBR

@ 17,40 say "Ref doc ... ";
get REF_DOC picture "XXXXXXXXXXXXXXXXXXXXXXXXX"
store UPPER(REF_DOC) to REF_DOC

read

clear gets

set confirm off

store UPPER(LST_N) to LST_N
store UPPER(FST_N) to FST_N
store UPPER(M_I) to M_I
store UPPER(STREET) to STREET
store UPPER(CITY) to CITY
store UPPER(STATE) to STATE
store UPPER(ZIP) to ZIP
store UPPER(FATHER) to FATHER
store UPPER(MOTHER) to MOTHER
store UPPER(G_LST_N) to G_LST_N
store UPPER(G_FST_N) to G_FST_N
store UPPER(G_M_I) to G_M_I
store UPPER(G_STREET) to G_STREET
store UPPER(G_CITY) to G_CITY
store UPPER(G_STATE) to G_STATE
store UPPER(G_ZIP) to G_ZIP
store UPPER(HOS_NBR) to HOS_NBR
store UPPER(REF_DOC) to REF_DOC

return

                                                                                                            