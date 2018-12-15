*************************************************************************
*																		*
* PALLADV >>> Print consulting (advice) information						*
*		   entry : RPRT:DATE											*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "ADV" + SUBSTR(RPRT_DATE,1,2)+SUBSTR(RPRT_DATE,4,2)+SUBSTR(RPRT_DATE,8,1)+".DBF" to FILE_NAME

if file(FILE_NAME)
	@ 9,15 say "Currently printing added consulting info ..   0 of   0"

	select A
	use &FILE_NAME

	goto bottom

	store RECNO() to TOT_ADV
	@ 9,66 say str(TOT_ADV,3)

	index on A_ADV_NBR to TADVNBR

	set index to TADVNBR

	goto top

	store 1 to PAGE
	store int(TOT_ADV/50) to TOT_PAGE
	if 50 * TOT_PAGE <> TOT_ADV
		store TOT_PAGE + 1 to TOT_PAGE
	endif

	set DEVICE to print

	eject
	@ 5,1 say "<<< EOD consulting report for " + RPRT_DATE + " <<<"
	@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)

	store 8 to ADV_LINE
	store 0 to RECORD

	do while .not. EOF()

		set DEVICE to screen
		store RECORD + 1 to RECORD
		@ 9,59 say str(RECORD,3)
		set DEVICE to print

		store .T. to DESCRIPT
		do READADV

		@ ADV_LINE,1 say ADV_NBR
		@ ADV_LINE,20 say A_DATE
		@ ADV_LINE,30 say A_CHG_NO
		@ ADV_LINE,40 say A_MD
		@ ADV_LINE,45 say LOGON

		@ ADV_LINE+1,1 say A_DESC

		if ADV_LINE > 56
			store PAGE + 1 to PAGE

			if PAGE <= TOT_PAGE
				eject
				@ 5,1 say "<<< EOD consulting report for " + RPRT_DATE + " <<<"
				@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
				store 8 to ADV_LINE

			endif

		else
			store ADV_LINE + 2 to ADV_LINE

		endif

		skip

	enddo

	set DEVICE to screen

	select A
	use

	delete file TADVNBR.NDX

else
	@ 9,15 say FILE_NAME + " is not found (already deleted or not created)."

endif

return

