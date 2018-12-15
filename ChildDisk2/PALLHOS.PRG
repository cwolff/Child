*************************************************************************
*																		*
* PALLHOS >>> Print the hospital stay information						*
*		   entry : RPRT:DATE											*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "HOS" + SUBSTR(RPRT_DATE,1,2)+SUBSTR(RPRT_DATE,4,2)+SUBSTR(RPRT_DATE,8,1)+".DBF" to FILE_NAME

if file(FILE_NAME)
	@ 11,15 say "Currently printing added hospital stays ...   0 of   0"

	select A
	use &FILE_NAME

	goto bottom

	store RECNO() to RECORD
	store RECNO() to TOT_HOS
	@ 11,66 say str(TOT_HOS,3)

	index on H_HOS_NBR to THOSNBR

	set index to THOSNBR

	goto top

	store 1 to PAGE
	store int(TOT_HOS/50) to TOT_PAGE
	if 50 * TOT_PAGE <> TOT_HOS
		store TOT_PAGE + 1 to TOT_PAGE
	endif

	set DEVICE to print

	eject
	@ 5,1 say "<<< EOD hospital stay report for " + RPRT_DATE + " <<<"
	@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)

	store 8 to HOS_LINE
	store 0 to RECORD

	do while .not. EOF()

		set DEVICE to screen
		store RECORD + 1 to RECORD
		@ 11,59 say str(RECORD,3)
		set DEVICE to print

		do READHOS

		@ HOS_LINE,1 say HOS_NBR
		@ HOS_LINE,19 say H_DATE_A
		@ HOS_LINE,29 say H_DATE_D
		@ HOS_LINE,39 say H_CMNTS
		@ HOS_LINE,70 say H_DIED
		@ HOS_LINE,72 say H_ATPSY
		@ HOS_LINE,74 say LOGON

		if HOS_LINE > 56
			store PAGE + 1 to PAGE

			if PAGE <= TOT_PAGE
				eject
				@ 5,1 say "<<< EOD hospital stay report for " + RPRT_DATE + " <<<"
				@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
				store 8 to HOS_LINE

			endif

		else
			store HOS_LINE + 1 to HOS_LINE

		endif

		skip

	enddo

	set DEVICE to screen

	select A
	use

	delete file THOSNBR.NDX

else
	@ 11,15 say FILE_NAME + " is not found (already deleted or not created)."

endif

return

