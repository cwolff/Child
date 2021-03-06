*************************************************************************
*																		*
* GPNAME >>> Prompts the user to type in the patients name				*
*		   entry : None													*
*		   exit : SRCH:PAT, SRCH:NAME, LST:NAME, FST:NAME				*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

set confirm on

store "               " to LST_NAME
store "          " to FST_NAME
@ 7,15 say "Enter the Patients Name."
@ 9,15 say "Last name ... " get LST_NAME picture "AAAAAAAAAAAAAAA"
@ 10,15 say "First name .. " get FST_NAME picture "AAAAAAAAAA"

read
clear gets

@ 7,15
@ 9,15
@ 10,15

set confirm off

store UPPER(LST_NAME) + UPPER(FST_NAME) to  SRCH_PAT
store trim(UPPER(FST_NAME)) + " " + trim(UPPER(LST_NAME)) to SEL_NAME

return

                                                                                                              