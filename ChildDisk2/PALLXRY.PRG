*************************************************************************
*																		*
* PALLXRY >>> Print the ECHO information								*
*		   entry : RPRT:DATE											*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "XRY" + SUBSTR(RPRT_DATE,1,2)+SUBSTR(RPRT_DATE,4,2)+SUBSTR(RPRT_DATE,8,1)+".DBF" to FILE_NAME

if file(FILE_NAME)
	@ 14,15 say "Currently printing added XRAY's ...........   0 of   0"

	select A
	use &FILE_NAME

	goto bottom

	store RECNO() to RECORD
	store RECNO() to TOT_XRY
	@ 14,66 say str(TOT_XRY,3)

	index on X_XRY_NBR to TXRYNBR

	set index to TXRYNBR

	goto top

	store 1 to PAGE
	store int(TOT_XRY/50) to TOT_PAGE
	if 50 * TOT_PAGE <> TOT_XRY
		store TOT_PAGE + 1 to TOT_PAGE
	endif

	set DEVICE to print

	eject
	@ 5,1 say "<<< EOD XRAY report for " + RPRT_DATE + " <<<"
	@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)

	store 8 to XRY_LINE
	store 0 to RECORD

	do while .not. EOF()

		set DEVICE to screen
		store RECORD + 1 to RECORD
		@ 14,59 say str(RECORD,3)
		set DEVICE to print

		do READXRY

		@ XRY_LINE,1 say XRY_NBR
		@ XRY_LINE,20 say X_DATE
		@ XRY_LINE,30 say LOGON
		@ XRY_LINE,40 say "xray = " + XRAY

		if XRY_LINE > 56
			store PAGE + 1 to PAGE

			if PAGE <= TOT_PAGE
				eject
				@ 5,1 say "<<< EOD XRAY report for " + RPRT_DATE + " <<<"
				@ 5,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
				store 8 to XRY_LINE

			endif

		else
			store XRY_LINE + 1 to XRY_LINE

		endif

		skip

	enddo

	set DEVICE to screen

	select A
	use

	delete file TXRYNBR.NDX

else
	@ 14,15 say FILE_NAME + " is not found (already deleted or not created)."

endif

return

