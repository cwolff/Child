*************************************************************************
*																		*
* VIEWHOS >>> View the hospital stay information for selected patient	*
*		   entry : Position at first record of patient data 			*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store HOS_NBR to S_HOS_NBR

@ 5,1 say "<<< Patient's hospital stay information <<<"
store 7 to HOS_LINE

store .T. to SCROLL
store 7 to STAT_LINE

do while SCROLL
	do READHOS

	@ HOS_LINE,1 say HOS_NBR
	@ HOS_LINE,19 say H_DATE_A
	@ HOS_LINE,29 say H_DATE_D
	@ HOS_LINE,39 say H_CMNTS
	@ HOS_LINE,70 say H_DIED
	@ HOS_LINE,72 say H_ATPSY
	@ HOS_LINE,74 say LOGON

	if HOS_LINE > 16
		store 19 to STAT_LINE
		store "Viewing patient's hospital stay information" to STAT_MSG
		do STATUS

		do CLRSCRN

		@ 5,5 say "<<< Patient's hospital stay information <<<"
		store 7 to HOS_LINE

	else
		store HOS_LINE + 1 to HOS_LINE

	endif

	store RECNO() to RECORD
	skip

	if H_HOS_NBR <> S_HOS_NBR .or. RECNO() = RECORD
		if HOS_LINE <> 7
			store 19 to STAT_LINE
			store "Patient's hospital stay information" to STAT_MSG
			do STATUS
		endif
		*!! Logical constant converted.
		store .F. to SCROLL
	endif

enddo

return

                                                                                                                 