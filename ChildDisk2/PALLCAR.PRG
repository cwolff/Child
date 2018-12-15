*************************************************************************
*																		*
* PALLCAR >>> Print the cardiac cath. information						*
*		   entry : RPRT:DATE											*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "CAR" + SUBSTR(RPRT_DATE,1,2)+SUBSTR(RPRT_DATE,4,2)+SUBSTR(RPRT_DATE,8,1)+".DBF" to FILE_NAME

if file(FILE_NAME)
	@ 16,15 say "Currently printing added cardiac cath .....   0 of   0"

	select A
	use &FILE_NAME

	goto bottom

	store RECNO() to RECORD
	store RECNO() to TOT_CAR
	@ 16,66 say str(TOT_CAR,3)

	index on C_CAR_NBR to TCARNBR

	set index to TCARNBR

	goto top

	store 1 to PAGE
	store int(TOT_CAR/15) to TOT_PAGE
	if 15 * TOT_PAGE <> TOT_CAR
		store TOT_PAGE + 1 to TOT_PAGE
	endif

	set DEVICE to print

	eject
	@ 5,1 say "<<< EOD cardiac cath. report for " + RPRT_DATE + " <<<"
	@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)

	store 8 to CAR_LINE
	store 0 to RECORD

	do while .not. EOF()
		set DEVICE to screen
		store RECORD + 1 to RECORD
		@ 16,59 say str(RECORD,3)
		set DEVICE to print

		do READCAR

		@ CAR_LINE,1 say CAR_NBR
		@ CAR_LINE,20 say C_DATE
		@ CAR_LINE,30 say LOGON
		@ CAR_LINE+1,3 say "QP/QS   = " + QP_QS
		@ CAR_LINE+1,28 say "RP/RS   = " + RP_RS
		@ CAR_LINE+1,53 say "RVP/LVP = " + RVP_LVP
		@ CAR_LINE+2,3 say "RVP/AOP = " + RVP_AOP
		@ CAR_LINE+2,28 say "GR      = " + GR

		if CAR_LINE > 47
			store PAGE + 1 to PAGE

			if PAGE <= TOT_PAGE
				eject
				@ 5,1 say "<<< EOD cardiac cath. report for " + RPRT_DATE + " <<<"
				@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
				store 8 to CAR_LINE

			endif

		else
			store CAR_LINE + 3 to CAR_LINE

		endif

		skip

	enddo

	set DEVICE to screen

	select A
	use

	delete file TCARNBR.NDX

else
	@ 16,15 say FILE_NAME + " is not found (already deleted or not created)."

endif

return

                                                                                                                                              
