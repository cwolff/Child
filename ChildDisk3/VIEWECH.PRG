*************************************************************************
*																		*
* VIEWECH >>> View the ECHO information for selected patient			*
*		   entry : Position at first record of patient data 			*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store ECH_NBR to S_ECH_NBR

@ 5,1 say "<<< Patient's ECHO information <<<"
store 7 to ECH_LINE

store .T. to SCROLL
store 7 to STAT_LINE

do while SCROLL
	do READECH

	@ ECH_LINE,1 say ECH_NBR
	@ ECH_LINE,20 say E_DATE
	@ ECH_LINE,30 say LOGON
	@ ECH_LINE+1,3 say "m mode  = " + M_MODE
	@ ECH_LINE+1,28 say "2D      = " + TWO_D
	@ ECH_LINE+1,53 say "doppler = " + DOPPLER

	if ECH_LINE > 13
		store 19 to STAT_LINE
		store "Viewing patient's ECHO information" to STAT_MSG
		do STATUS

		do CLRSCRN

		@ 5,5 say "<<< Patient's ECHO information <<<"
		store 7 to ECH_LINE

	else
		store ECH_LINE + 2 to ECH_LINE

	endif

	store RECNO() to RECORD
	skip

	if E_ECH_NBR <> S_ECH_NBR .or. RECNO() = RECORD
		if ECH_LINE <> 7
			store 19 to STAT_LINE
			store "Patient's ECHO information" to STAT_MSG
			do STATUS
		
		endif
		
		store .F. to SCROLL
	
	endif

enddo

return

                                                                                                                                                                   