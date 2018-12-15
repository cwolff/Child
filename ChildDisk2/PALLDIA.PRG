*************************************************************************
*																		*
* PALLDIA >>> Print all the diagnoses									*
*		   entry : RPRT:DATE											*
*		   exit :  None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "DIA" + SUBSTR(RPRT_DATE,1,2)+SUBSTR(RPRT_DATE,4,2)+SUBSTR(RPRT_DATE,8,1)+".DBF" to FILE_NAME

if file(FILE_NAME)
	@ 7,15 say "Currently printing added diagnoses ........   0 of   0"

	select A
	use &FILE_NAME

	goto bottom
	store RECNO() to TOT_DIA
	@ 7,66 say str(TOT_DIA,3)

	index on D_DIA_NBR to TDIANBR

	set index to TDIANBR

	goto top

	store 1 to PAGE
	store int(TOT_DIA/25) to TOT_PAGE
	if 25 * TOT_PAGE <> TOT_DIA
		store TOT_PAGE + 1 to TOT_PAGE
	endif

	set DEVICE to print

	eject
	@ 5,1 say "<<< EOD diagnostic report for " + RPRT_DATE + " <<<"
	@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)

	store 8 to DIA_LINE
	store 0 to RECORD

	do while .not. EOF()

		set DEVICE to screen
		store RECORD + 1 to RECORD
		@ 7,59 say str(RECORD,3)
		set DEVICE to print

		store .T. to DESCRIPT
		do READDIA

		@ DIA_LINE,1 say DIA_NBR
		@ DIA_LINE,20 say D_CODE
		@ DIA_LINE,30 say LOGON

		@ DIA_LINE+1,3 say D_DESC

		if DIA_LINE > 54
			store PAGE + 1 to PAGE

			if PAGE <= TOT_PAGE
				eject
				@ 5,1 say "<<< EOD diagnostic report for " + RPRT_DATE + " <<<"
				@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
				store 8 to DIA_LINE

			endif

		else
			store DIA_LINE + 2 to DIA_LINE

		endif

		skip

	enddo

	set DEVICE to screen

	select A
	use

	delete file TDIANBR.NDX

else
	@ 7,15 say FILE_NAME + " is not found (already deleted or not created)."

endif

return

