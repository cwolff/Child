*************************************************************************
*																		*
* GPNBR >>> Prompts the user to type in the patients number				*
*		   entry : None													*
*		   exit : SRCH:PAT												*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

set confirm on

store "          " to PAT_NUMBER
@ 7,15 say "Enter the Patient's Number as 'YYMMIXXXX'."
@ 9,15 say "Patient number .. " get PAT_NUMBER picture "XXXXXXXXXX"

read
clear gets

@ 7,15
@ 9,15

set confirm off

store UPPER(PAT_NUMBER) to SRCH_PAT

return

                                                     