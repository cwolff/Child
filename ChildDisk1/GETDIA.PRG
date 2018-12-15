*************************************************************************
*																		*
* GETDIA >>> Get a blank record from the screen which the user added	*
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

store 0 to HIT

do while HIT <> 1
	store "     " to D_CODE
	@ 13,5 say "Enter Diagnose Code ... ";
	get D_CODE picture "XXXXX"

	set confirm on

	read
	clear gets

	set confirm off

	select B

	store trim(UPPER(D_CODE)) to D_CODE

	seek D_CODE

	if .NOT. (EOF() .OR. BOF())

		store DT_D_DESC to D_DESC
		@ 15,5 get D_DESC picture;
		"XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

		clear gets

		store 19 to PMT_LINE
		store "1) Correct Diagnoses  2) Incorrect Diagnoses" to PMT_MSG
		do PROMPT

		store 2 to CHOICE
		do GETKEY

		@ 19,0

		if CHOICE = 1
			store SEL_NBR + D_CODE to DIA_NBR
			store 1 to HIT

		else
			@ 15,5

		endif

	else
		store 19 to STAT_LINE
		store "SORRY : Unable to find that diagnoses" to STAT_MSG
		do STATUS

	endif

enddo

set exact off

select B
use

select A

return
                                                            
