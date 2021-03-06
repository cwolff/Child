*************************************************************************
*																		*
* VIEWOFF >>> View all the office call information for selected patient *
*		   entry : Positioned at first record of patient data			*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store OFF_NBR to S_OFF_NBR

@ 5,1 say "<<< Patient's office call information <<<"
store 7 to OFF_LINE

store .T. to SCROLL
store 7 to STAT_LINE

do while SCROLL
	do READOFF

	@ OFF_LINE,1 say OFF_NBR
	@ OFF_LINE,20 say O_DATE
	@ OFF_LINE,74 say LOGON

	if OFF_LINE > 16
		store 19 to STAT_LINE
		store "Viewing patient's office call information" to STAT_MSG
		do STATUS

		do CLRSCRN

		@ 5,5 say "<<< Patient's office call information <<<"
		store 7 to OFF_LINE

	else
		store OFF_LINE + 1 to OFF_LINE

	endif

	store RECNO() to RECORD
	skip

	if O_OFF_NBR <> S_OFF_NBR .or. RECNO() = RECORD
		if OFF_LINE <> 7
			store 19 to STAT_LINE
			store "Patient's office call information" to STAT_MSG
			do STATUS
		endif
		*!! Logical constant converted.
		store .F. to SCROLL
	endif

enddo

return

                                                                                                                                                                                                                                        