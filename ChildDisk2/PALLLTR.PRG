*************************************************************************
*																		*
* PALLLTR >>> Allow the user to print all patient letters.				*
*		  entry : None													*
*		  exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

do CLRSCRN

store 1 to CONTINUE

do while CONTINUE <> 0
	set confirm on
	store DTOC(date()) to RPRT_DATE
	@ 9,15 say "Enter date of EOD letters to print."
	@ 11,15 say "Enter letter date ... " get RPRT_DATE picture "99/99/99"
	read
	clear gets
	@ 9,15
	@ 11,0
	set confirm off

	store SUBSTR(RPRT_DATE,1,2) to MONTH
	store SUBSTR(RPRT_DATE,4,2) to DAY
	store SUBSTR(RPRT_DATE,7,2) to YEAR

	if val(MONTH) > 0 .and. val(MONTH) < 13

		if val(DAY) > 0 .and. val(DAY) < 32

			if val(YEAR) > 83 .and. val(YEAR) < 100

				store 0 to CONTINUE

			endif

		endif

	endif

	if CONTINUE <> 0
		store 19 to STAT_LINE
		store "Invalid date" to STAT_MSG
		do STATUS
	endif

enddo

store "LTR"+SUBSTR(RPRT_DATE,1,2)+SUBSTR(RPRT_DATE,4,2)+SUBSTR(RPRT_DATE,8,1)+".DBF" to FILE_NAME

store 1 to PAGE
store 7 to LTR_LINE

if file(FILE_NAME)
	store 19 to PMT_LINE
	store "Printing EOD (End Of Day) letters for " + RPRT_DATE to PMT_MSG
	do PROMPT

	select A
	use &FILE_NAME

	goto bottom

	store RECNO() to LTR_TOT

	@ 10,15 say "Printing added letter pages ...   0 of   0"
	@ 10,54 say str(LTR_TOT,3)

	index on L_LTR_NBR to TLTRNBR

	set index to TLTRNBR

	goto top

	store SUBSTR(L_LTR_NBR,1,16) to S_LTR_NBR
	store 8 to LTR_LINE

	set DEVICE to print

	store 0 to RECORD

	do while .not. EOF()
		set DEVICE to screen
		store RECORD + 1 to RECORD
		@ 10,47 say str(RECORD,3)
		set DEVICE to print

		do READLTR

		@ LTR_LINE,5 say L1
		@ LTR_LINE+1,5 say L2
		@ LTR_LINE+2,5 say L3
		@ LTR_LINE+3,5 say L4
		@ LTR_LINE+4,5 say L5
		@ LTR_LINE+5,5 say L6
		@ LTR_LINE+6,5 say L7
		@ LTR_LINE+7,5 say L8
		@ LTR_LINE+8,5 say L9
		@ LTR_LINE+9,5 say L10

		skip

		if L_LTR_NBR = S_LTR_NBR
			store LTR_LINE + 10 to LTR_LINE

			if LTR_LINE > 48
				eject
				store 8 to LTR_LINE
			endif

		else
			store SUBSTR(L_LTR_NBR,1,16) to S_LTR_NBR

			eject
			store 8 to LTR_LINE

		endif

	enddo

	eject
	set DEVICE to screen

	select A
	use

	delete file TLTRNBR.NDX

	store 19 to STAT_LINE
	store "Finished EOD (End of Day) letters for " + RPRT_DATE to STAT_MSG
	do STATUS

else
	store 19 to STAT_LINE
	store "No EOD (End Of Day) letters for " + RPRT_DATE to STAT_MSG
	do STATUS

endif

return

