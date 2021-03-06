*************************************************************************
*																		*
* GETPRO >>> Get a blank record from the screen which the user added	*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

set exact on

select B
use DIATABLE index DTDCODE

@ 7,5 say "Pat number ..... ";
get SEL_NBR picture "AAAAAAAAAAA"

store USER_LOGON to LOGON
@ 7,70 get LOGON picture "XXXXX"

@ 9,5 say "Pat last name .. ";
get LST_N picture "AAAAAAAAAAAAAAA"

@ 10,5 say "Pat first name . ";
get FST_N picture "AAAAAAAAAA"

@ 11,5 say "Pat M. I. ...... ";
get M_I picture "A"

clear gets

store DTOC(date()) to P_DATE
@ 13,5 say "Enter procedure date ..... ";
get P_DATE picture "99/99/99"

read
clear gets

store 0 to HIT

do while HIT <> 1
	store "     " to P_CODE
	@ 15,5 say "Enter Procedure Code ... ";
	get P_CODE picture "XXXXX"

	set confirm on

	read
	clear gets

	set confirm off

	select B

	store trim(UPPER(P_CODE)) to P_CODE

	seek P_CODE

	if .NOT. (EOF() .OR. BOF())

		store DT_D_DESC to P_DESC
		@ 17,5 get P_DESC picture;
		"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

		clear gets

		store 19 to PMT_LINE
		store "1) Correct Procedure  2) Incorrect Procedure" to PMT_MSG
		do PROMPT

		store 2 to CHOICE
		do GETKEY

		@ 19,0

		if CHOICE = 1
			store SEL_NBR + SUBSTR(P_DATE,7,2) + SUBSTR(P_DATE,1,2) to PRO_NBR
			store PRO_NBR + SUBSTR(P_DATE,4,2) + P_CODE to PRO_NBR
			store 1 to HIT

		else
			@ 17,5

		endif

	else
		store 19 to STAT_LINE
		store "SORRY : Unable to find that procedure" to STAT_MSG
		do STATUS

	endif

enddo

set exact off

select B
use

select A

return


                                                                                                 