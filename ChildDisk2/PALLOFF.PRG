*************************************************************************
*																		*
* PALLOFF >>> Print office call information								*
*		   entry : RPRT:DATE											*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "OFF" + SUBSTR(RPRT_DATE,1,2)+SUBSTR(RPRT_DATE,4,2)+SUBSTR(RPRT_DATE,8,1)+".DBF" to FILE_NAME

if file(FILE_NAME)
	@ 9,15 say "Currently printing added office calls .....   0 of   0"

	select A
	use &FILE_NAME

	goto bottom

	store RECNO() to TOT_OFF
	@ 9,66 say str(TOT_OFF,3)

	index on O_OFF_NBR to TOFFNBR

	set index to TOFFNBR

	goto top

	store 1 to PAGE
	store int(TOT_OFF/50) to TOT_PAGE
	if 50 * TOT_PAGE <> TOT_OFF
		store TOT_PAGE + 1 to TOT_PAGE
	endif

	set DEVICE to print

	eject
	@ 5,1 say "<<< EOD office call report for " + RPRT_DATE + " <<<"
	@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)

	store 8 to OFF_LINE
	store 0 to RECORD

	do while .not. EOF()

		set DEVICE to screen
		store RECORD + 1 to RECORD
		@ 9,59 say str(RECORD,3)
		set DEVICE to print

		do READOFF

		@ OFF_LINE,1 say OFF_NBR
		@ OFF_LINE,20 say O_DATE
		@ OFF_LINE,74 say LOGON

		if OFF_LINE > 56
			store PAGE + 1 to PAGE

			if PAGE <= TOT_PAGE
				eject
				@ 5,1 say "<<< EOD office call report for " + RPRT_DATE + " <<<"
				@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
				store 8 to OFF_LINE

			endif

		else
			store OFF_LINE + 1 to OFF_LINE

		endif

		skip

	enddo

	set DEVICE to screen

	select A
	use

	delete file TOFFNBR.NDX

else
	@ 9,15 say FILE_NAME + " is not found (already deleted or not created)."

endif

return

