*************************************************************************
*																		*
* PALLPRO >>> Print all the procedures									*
*		   entry : RPRT:DATE											*
*		   exit :  None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "PRO" + SUBSTR(RPRT_DATE,1,2)+SUBSTR(RPRT_DATE,4,2)+SUBSTR(RPRT_DATE,8,1)+".DBF" to FILE_NAME

if file(FILE_NAME)
	@ 17,15 say "Currently printing added procedures .......   0 of   0"

	select A
	use &FILE_NAME

	goto bottom
	store RECNO() to TOT_PRO
	@ 17,66 say str(TOT_PRO,3)

	index on R_PRO_NBR to TPRONBR

	set index to TPRONBR

	goto top

	store 1 to PAGE
	store int(TOT_PRO/25) to TOT_PAGE
	if 25 * TOT_PAGE <> TOT_PRO
		store TOT_PAGE + 1 to TOT_PAGE
	endif

	set DEVICE to print

	eject
	@ 5,1 say "<<< EOD procedure report for " + RPRT_DATE + " <<<"
	@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)

	store 8 to PRO_LINE
	store 0 to RECORD

	do while .not. EOF()

		set DEVICE to screen
		store RECORD + 1 to RECORD
		@ 17,59 say str(RECORD,3)
		set DEVICE to print

		store .T. to DESCRIPT
		do READPRO

		@ PRO_LINE,1 say PRO_NBR
		@ PRO_LINE,30 say P_DATE
		@ PRO_LINE,40 say P_CODE
		@ PRO_LINE,50 say LOGON

		@ PRO_LINE+1,3 say P_DESC

		if PRO_LINE > 54
			store PAGE + 1 to PAGE

			if PAGE <= TOT_PAGE
				eject
				@ 5,1 say "<<< EOD procedure report for " + RPRT_DATE + " <<<"
				@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
				store 8 to PRO_LINE

			endif

		else
			store PRO_LINE + 2 to PRO_LINE

		endif

		skip

	enddo

	set DEVICE to screen

	select A
	use

	delete file TPRONBR.NDX

else
	@ 17,15 say FILE_NAME + " is not found (already deleted or not created)."

endif

return

