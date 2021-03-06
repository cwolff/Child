*************************************************************************
*																		*
* GETNPAT >>> Get a blank record from the screen which the user added	*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "???????????" to PAT_NBR
@ 5,0 say "Pat number ..... ";
get PAT_NBR picture "AAAAAAAAAAA"

store UPPER(USER_LOGON) to LOGON
@ 5,70 get LOGON picture "XXXXX"

store UPPER(LST_NAME) to LST_N
@ 7,0 say "Pat last name .. ";
get LST_N picture "AAAAAAAAAAAAAAA"

store UPPER(FST_NAME) to FST_N
@ 8,0 say "Pat first name . ";
get FST_N picture "AAAAAAAAAA"

clear gets

set confirm on

store " " to M_I
@ 9,0 say "Pat M. I. ...... ";
get M_I picture "X"
store UPPER(M_I) to M_I

store "                    " to STREET
@ 10,0 say "Pat street ..... ";
get STREET picture "XXXXXXXXXXXXXXXXXXXX"
store UPPER(STREET) to STREET

store "               " to CITY
@ 11,0 say "Pat city ....... ";
get CITY picture "XXXXXXXXXXXXXXX"
store UPPER(CITY) to CITY

store "  " to STATE
@ 12,0 say "Pat state ...... ";
get STATE picture "XX"
store UPPER(STATE) to STATE

store "         " to ZIP
@ 13,0 say "Pat zip ........ ";
get ZIP picture "XXXXXXXXX"
store UPPER(ZIP) to ZIP

store "   -   -    " to PHONE
@ 15,0 say "Pat phone nbr .. ";
get PHONE picture "999-999-9999"

store "                    " to FATHER
@ 16,0 say "Father .... ";
get FATHER picture "XXXXXXXXXXXXXXXXXXXXXXXXX"
store UPPER(FATHER) to FATHER

store "                    " to MOTHER
@ 17,0 say "Mother .... ";
get MOTHER picture "XXXXXXXXXXXXXXXXXXXXXXXXX"
store UPPER(MOTHER) to MOTHER

store "  /  /  " to BIRTH
@ 5,40 say "Pat birth date . ";
get BIRTH picture "99/99/99"

store "               " to G_LST_N
@ 7,40 say "Gdn last name .. ";
get G_LST_N picture "AAAAAAAAAAAAAAA"
store UPPER(G_LST_N) to G_LST_N

store "          " to G_FST_N
@ 8,40 say "Gdn first name . ";
get G_FST_N picture "AAAAAAAAAA"
store UPPER(G_FST_N) to G_FST_N

store " " to G_M_I
@ 9,40 say "Gdn M. I. ...... ";
get G_M_I picture "X"
store UPPER(G_M_I) to G_M_I

store "                    " to G_STREET
@ 10,40 say "Gdn street ..... ";
get G_STREET picture "XXXXXXXXXXXXXXXXXXXX"
store UPPER(G_STREET) to G_STREET

store "               " to G_CITY
@ 11,40 say "Gdn city ....... ";
get G_CITY picture "XXXXXXXXXXXXXXX"
store UPPER(G_CITY) to G_CITY

store "  " to G_STATE
@ 12,40 say "Gdn state ...... ";
get G_STATE picture "AA"
store UPPER(G_STATE) to G_STATE

store "         " to G_ZIP
@ 13,40 say "Gdn zip ........ ";
get G_ZIP picture "XXXXXXXXX"
store UPPER(G_ZIP) to G_ZIP

store "   -   -    " to G_PHONE
@ 15,40 say "Gdn phone nbr .. ";
get G_PHONE picture "999-999-9999"

store "  -  -  " to HOS_NBR
@ 16,40 say "Hospital nbr ... ";
get HOS_NBR picture "XX-XX-XX"
store UPPER(HOS_NBR) to HOS_NBR

store "                         " to REF_DOC
@ 17,40 say "Ref doc ... ";
get REF_DOC picture "XXXXXXXXXXXXXXXXXXXXXXXXX"
store UPPER(REF_DOC) to REF_DOC

read

clear gets

set confirm off

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

                                         