*************************************************************************
*																		*
* VIEWPRO >>> View all the diagnoses for the selected patient			*
*		   entry : None													*
*		   exit : DIA:SEL = T, diagnoses found							*
*				F, diagnoses not found									*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store PRO_NBR to S_PRO_NBR

@ 5,1 say "<<< Patient's procedure information <<<"
store 7 to PRO_LINE

store .T. to SCROLL
store 7 to STAT_LINE

do while SCROLL
	store .T. to DESCRIPT
	do READPRO

	@ PRO_LINE,1 say PRO_NBR
	@ PRO_LINE,30 say P_DATE
	@ PRO_LINE,40 say P_CODE
	@ PRO_LINE,50 say LOGON

	@ PRO_LINE+1,3 say P_DESC

	if PRO_LINE > 13
		store 19 to STAT_LINE
		store "Viewing patient's procedure information" to STAT_MSG
		do STATUS

		do CLRSCRN

		@ 5,5 say "<<< Patient's procedure information <<<"
		store 7 to PRO_LINE

	else
		store PRO_LINE + 2 to PRO_LINE

	endif

	store RECNO() to RECORD
	skip

	if R_PRO_NBR <> S_PRO_NBR .or. RECNO() = RECORD
		if PRO_LINE <> 7
			store 19 to STAT_LINE
			store "Patient's procedure information" to STAT_MSG
			do STATUS
		endif
		*!! Logical constant converted.
		store .F. to SCROLL
	endif

enddo

return

                                                                                                                                          