*************************************************************************
*																		*
* PALLPAT >>> Print all the patinet data								*
*		   entry : RPRT:DATE											*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "PAT" + SUBSTR(RPRT_DATE,1,2)+SUBSTR(RPRT_DATE,4,2)+SUBSTR(RPRT_DATE,8,1)+".DBF" to FILE_NAME

if file(FILE_NAME)
	@ 5,15 say "Currently printing added patients .........   0 of   0"

	select A
	use &FILE_NAME

	goto bottom
	store RECNO() to TOT_PAT
	@ 5,66 say str(TOT_PAT,3)

	index on P_PAT_NBR to TPATNBR

	set index to TPATNBR

	goto top

	store 1 to PAGE
	store int(TOT_PAT/4) to TOT_PAGE
	if 4 * TOT_PAGE <> TOT_PAT
		store TOT_PAGE + 1 to TOT_PAGE
	endif

	set DEVICE to print

	eject
	@ 3,0 say "<<< EOD patient report for " + RPRT_DATE + " <<<"
	@ 3,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)

	store 5 to PAT_LINE
	store 0 to RECORD

	do while .not. EOF()

		set DEVICE to screen
		store RECORD + 1 to RECORD
		@ 5,59 say str(RECORD,3)
		set DEVICE to print

		do READPAT

		@ PAT_LINE,0 say "Pat number ..... " + PAT_NBR
		@ PAT_LINE,40 say "Pat birth date . " + BIRTH

		@ PAT_LINE,70 say LOGON

		@ PAT_LINE+2,0 say "Pat last name .. " + LST_N
		@ PAT_LINE+2,40 say "Gdn last name .. " + G_LST_N

		@ PAT_LINE+3,0 say "Pat first name . " + FST_N
		@ PAT_LINE+3,40 say "Gdn first name . " + G_FST_N

		@ PAT_LINE+4,0 say "Pat M. I. ...... " + M_I
		@ PAT_LINE+4,40 say "Gdn M. I. ...... " + G_M_I

		@ PAT_LINE+5,0 say "Pat street ..... " + STREET
		@ PAT_LINE+5,40 say "Gdn street ..... " + G_STREET

		@ PAT_LINE+6,0 say "Pat city ....... " + CITY
		@ PAT_LINE+6,40 say "Gdn city ....... " + G_CITY

		@ PAT_LINE+7,0 say "Pat state ...... " + STATE
		@ PAT_LINE+7,40 say "Gdn state ...... " + G_STATE

		@ PAT_LINE+8,0 say "Pat zip ........ " + ZIP
		@ PAT_LINE+8,40 say "Gdn zip ........ " + G_ZIP

		@ PAT_LINE+10,0 say "Pat phone nbr .. " + PHONE
		@ PAT_LINE+10,40 say "Gdn phone nbr .. " + G_PHONE

		@ PAT_LINE+11,0 say "Father .... " + FATHER
		@ PAT_LINE+11,40 say "Hospital nbr ... " + HOS_NBR

		@ PAT_LINE+12,0 say "Mother .... " + MOTHER
		@ PAT_LINE+12,40 say "Ref doc ... " + REF_DOC

		if PAT_LINE > 49
			store PAGE + 1 to PAGE

			if PAGE <= TOT_PAGE
				eject
				@ 3,0 say "<<< EOD patient report for " + RPRT_DATE + " <<<"
				@ 3,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
				store 5 to PAT_LINE

			endif

		else
			store PAT_LINE + 15 to PAT_LINE

		endif

		skip

	enddo

	set DEVICE to screen

	select A
	use

	delete file TPATNBR.NDX

else
	@ 5,15 say FILE_NAME + " is not found (already deleted or not created)."

endif

return

