*************************************************************************
*																		*
* PRINTPAT >>> Put the current record to the screen						*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store 1 to NBR_LINE
do CHKFF

@ CURR_LINE,1 say "<<< Patient's profile information -----------------<<<"

store CURR_LINE + 2 to CURR_LINE

store 17 to NBR_LINE
do CHKFF

@ CURR_LINE,0 say "Pat number ..... " + PAT_NBR
@ CURR_LINE,40 say "Pat birth date . " + BIRTH

@ CURR_LINE,70 say LOGON

@ CURR_LINE+2,0 say "Pat last name .. " + LST_N
@ CURR_LINE+2,40 say "Gdn last name .. " + G_LST_N

@ CURR_LINE+3,0 say "Pat first name . " + FST_N
@ CURR_LINE+3,40 say "Gdn first name . " + G_FST_N

@ CURR_LINE+4,0 say "Pat M. I. ...... " + M_I
@ CURR_LINE+4,40 say "Gdn M. I. ...... " + G_M_I

@ CURR_LINE+5,0 say "Pat street ..... " + STREET
@ CURR_LINE+5,40 say "Gdn street ..... " + G_STREET

@ CURR_LINE+6,0 say "Pat city ....... " + CITY
@ CURR_LINE+6,40 say "Gdn city ....... " + G_CITY

@ CURR_LINE+7,0 say "Pat state ...... " + STATE
@ CURR_LINE+7,40 say "Gdn state ...... " + G_STATE

@ CURR_LINE+8,0 say "Pat zip ........ " + ZIP
@ CURR_LINE+8,40 say "Gdn zip ........ " + G_ZIP

@ CURR_LINE+10,0 say "Pat phone nbr .. " + PHONE
@ CURR_LINE+10,40 say "Gdn phone nbr .. " + G_PHONE

@ CURR_LINE+11,0 say "Father .... " + FATHER
@ CURR_LINE+11,40 say "Hospital nbr ... " + HOS_NBR

@ CURR_LINE+12,0 say "Mother .... " + MOTHER
@ CURR_LINE+12,40 say "Ref doc ... " + REF_DOC

store CURR_LINE + 15 to CURR_LINE

return

                                                                                                                                                                                                                                                      