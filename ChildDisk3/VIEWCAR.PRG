*************************************************************************
*																		*
* VIEWCAR >>> View the cardiac cath. information for selected patient	*
*		   entry : Position at first record of patient data 			*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store CAR_NBR to S_CAR_NBR

@ 5,1 say "<<< Patient's cardiac cath. information <<<"
store 7 to CAR_LINE

store .T. to SCROLL
store 7 to STAT_LINE

do while SCROLL
	do READCAR

	@ CAR_LINE,1 say CAR_NBR
	@ CAR_LINE,20 say C_DATE
	@ CAR_LINE,30 say LOGON
	@ CAR_LINE+1,3 say "QP/QS   = " + QP_QS
	@ CAR_LINE+1,28 say "RP/RS   = " + RP_RS
	@ CAR_LINE+1,53 say "RVP/LVP = " + RVP_LVP
	@ CAR_LINE+2,3 say "RVP/AOP = " + RVP_AOP
	@ CAR_LINE+2,28 say "GR      = " + GR

	if CAR_LINE > 10
		store 19 to STAT_LINE
		store "Viewing patient's cardiac cath. information" to STAT_MSG
		do STATUS

		do CLRSCRN

		@ 5,5 say "<<< Patient's cardiac cath. information <<<"
		store 7 to CAR_LINE

	else
		store CAR_LINE + 3 to CAR_LINE

	endif

	store RECNO() to RECORD
	skip

	if C_CAR_NBR <> S_CAR_NBR .or. RECNO() = RECORD
		if CAR_LINE <> 7
			store 19 to STAT_LINE
			store "Patient's cardiac cath. information" to STAT_MSG
			do STATUS

		endif
		
		store .F. to SCROLL
	
	endif

enddo

return

                                       