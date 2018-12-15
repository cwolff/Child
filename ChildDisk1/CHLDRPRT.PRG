*************************************************************************
*																		*
* CHLDRPRT >>> Report allows end of period reports to be generated		*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store .T. to CONTINUE
store .T. to REFRESH

do while CONTINUE

	if REFRESH
		store "Report Child Data Base" to HEAD
		do DATETAIL
		store "Press 0 to STOP" to R_TAIL
		do FRAME

	else
		do CLRSCRN

	endif

	store 4 to MENU_CNT
	store "End of day report" to MENU_1
	store "End of day letters" to MENU_2
	store "End of month report" to MENU_3
	store "End of year report" to MENU_4
	do MENU

	store 4 to CHOICE
	do GETKEY

	do case

		case CHOICE = 0
			store .F. to CONTINUE

		case CHOICE = 1
			do TOTALEOD

			set DEVICE to print
			eject
			set DEVICE to screen

			@ 19,0
			store 19 to PMT_LINE
			store "1) Print added data for " + RPRT_DATE + "  " to PMT_MSG
			store PMT_MSG + "2) Don't print" to PMT_MSG
			do PROMPT

			store 2 to CHOICE
			do GETKEY

			@ 19,0

			if CHOICE = 1
				do CLRSCRN

				store 19 to PMT_LINE
				store "Printing added data for " + RPRT_DATE to PMT_MSG
				do PROMPT

				do PALLPAT
				do PALLDIA
				do PALLOFF
				do PALLHOS
				do PALLEKG
				do PALLXRY
				do PALLECH
				do PALLCAR
				do PALLPRO

				set DEVICE to print
				eject
				set DEVICE to screen

				@ 19,0

				store 19 to STAT_LINE
				store "Printing of new data is complete" to STAT_MSG
				do STATUS

			endif

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 2
			do PALLLTR

			store .F. to REFRESH
			store .T. to CONTINUE

		case CHOICE = 3
			do TOTALEOM

			set DEVICE to print
			eject
			set DEVICE to screen

			@ 19,0
			store 19 to STAT_LINE
			store "Printing of EOM report is complete" to STAT_MSG
			do STATUS

			store .F. to REFRESH
			store .T. to CONTINUE

		case CHOICE = 4
			do TOTALEOY

			set DEVICE to print
			eject
			set DEVICE to screen

			@ 19,0
			store 19 to STAT_LINE
			store "Printing of EOY report is complete" to STAT_MSG
			do STATUS

			store .F. to REFRESH
			store .T. to CONTINUE

	endcase

enddo

return

