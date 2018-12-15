*************************************************************************
*																		*
* PALLECH >>> Print the cardiac cath. information						*
*		   entry : RPRT:DATE											*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "ECH" + SUBSTR(RPRT_DATE,1,2)+SUBSTR(RPRT_DATE,4,2)+SUBSTR(RPRT_DATE,8,1)+".DBF" to FILE_NAME

if file(FILE_NAME)
	@ 15,15 say "Currently printing added ECHO's ...........   0 of   0"

	select A
	use &FILE_NAME

	goto bottom

	store RECNO() to RECORD
	store RECNO() to TOT_ECH
	@ 15,66 say str(TOT_ECH,3)

	index on E_ECH_NBR to TECHNBR

	set index to TECHNBR

	goto top

	store 1 to PAGE
	store int(TOT_ECH/25) to TOT_PAGE
	if 25 * TOT_PAGE <> TOT_ECH
		store TOT_PAGE + 1 to TOT_PAGE
	endif

	set DEVICE to print

	eject
	@ 5,1 say "<<< EOD ECHO report for " + RPRT_DATE + " <<<"
	@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)

	store 8 to ECH_LINE
	store 0 to RECORD

	do while .not. EOF()
		set DEVICE to screen
		store RECORD + 1 to RECORD
		@ 15,59 say str(RECORD,3)
		set DEVICE to print

		do READECH

		@ ECH_LINE,1 say ECH_NBR
		@ ECH_LINE,20 say E_DATE
		@ ECH_LINE,30 say LOGON
		@ ECH_LINE+1,3 say "m mode  = " + M_MODE
		@ ECH_LINE+1,28 say "2D      = " + TWO_D
		@ ECH_LINE+1,53 say "doppler = " + DOPPLER

		if ECH_LINE > 54
			store PAGE + 1 to PAGE

			if PAGE <= TOT_PAGE
				eject
				@ 5,1 say "<<< EOD ECHO report for " + RPRT_DATE + " <<<"
				@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
				store 8 to ECH_LINE

			endif

		else
			store ECH_LINE + 2 to ECH_LINE

		endif

		skip

	enddo

	set DEVICE to screen

	select A
	use

	delete file TECHNBR.NDX

else
	@ 15,15 say FILE_NAME + " is not found (already deleted or not created)."

endif

return

