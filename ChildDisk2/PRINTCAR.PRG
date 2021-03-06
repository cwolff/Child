*************************************************************************
*																		*
* PRINTCAR >>> Print the hospital stay information for selected patient *
*		   entry : Positioned at first record of patient data			*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store CAR_NBR to S_CAR_NBR

store 1 to NBR_LINE
do CHKFF

@ CURR_LINE,1 say "<<< Patient's cardiac cath. information ----------<<<"

store CURR_LINE + 2 to CURR_LINE

store .T. to SCROLL

do while SCROLL
	do READCAR

	store 2 to NBR_LINE
	do CHKFF
	
	@ CURR_LINE,1 say CAR_NBR
	@ CURR_LINE,20 say C_DATE
	@ CURR_LINE,30 say LOGON
	@ CURR_LINE+1,3 say "QP/QS   = " + QP_QS
	@ CURR_LINE+1,28 say "RP/RS   = " + RP_RS
	@ CURR_LINE+1,53 say "RVP/LVP = " + RVP_LVP
	@ CURR_LINE+2,3 say "RVP/AOP = " + RVP_AOP
	@ CURR_LINE+2,28 say "GR      = " + GR
	
	store CURR_LINE + 4 to CURR_LINE

	store RECNO() to RECORD
	skip

	if (bof() .or. eof()) .or. C_CAR_NBR <> S_CAR_NBR .or. RECNO() = RECORD
		store .F. to SCROLL

	endif

enddo

store CURR_LINE + 1 to CURR_LINE

return

         