*************************************************************************
*																		*
* VIEWLTR >>> Allow the user to view a letter in pages.  Each page is	*
*	     another record in OFFICELTR data base.							*
*	       entry : LTR:NBR, O:DATE, LOGON								*
*	       exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store 1 to PAGE

store .T. to CONTINUE

do while CONTINUE
	store SUBSTR(LTR_NBR,1,16) + str(PAGE,1) to LTR_NBR

	seek LTR_NBR

	if (EOF() .OR. BOF())
		store 19 to STAT_LINE
		store "End of the letter" to STAT_MSG
		do STATUS

		store PAGE - 1 to PAGE

	else
		do READLTR

	endif

	store 19 to PMT_LINE
	store "Page " + str(PAGE,1) to PMT_MSG
	do PROMPT

	do PUTPAGE

	store 19 to PMT_LINE

	do case

		case PAGE = 1
			store "1) Same page  2) Next page  3) Done" to PMT_MSG
			do PROMPT

			store 3 to CHOICE
			do GETKEY

			@ 19,0

			if CHOICE = 0 .or. CHOICE = 3
				store .F. to CONTINUE
			endif

			if CHOICE = 2
				store PAGE + 1 to PAGE
			endif

		case PAGE = 9
			store "1) Previous Page  2) Same page  3) Done" to PMT_MSG
			do PROMPT

			store 3 to CHOICE
			do GETKEY

			@ 19,0

			if CHOICE = 0 .or. CHOICE = 3
				store .F. to CONTINUE
			endif

			if CHOICE = 1
				store PAGE - 1 to PAGE
			endif

		otherwise
			store "1) Previous Page  2) Same page  " to PMT_MSG
			store PMT_MSG + "3) Next Page  4) Done" to PMT_MSG
			do PROMPT

			store 4 to CHOICE
			do GETKEY

			@ 19,0

			if CHOICE = 0 .or. CHOICE = 4
				store .F. to CONTINUE
			endif

			if CHOICE = 1
				store PAGE - 1 to PAGE
			endif

			if CHOICE = 3
				store PAGE + 1 to PAGE
			endif

	endcase

enddo

return



                                                                                                                                              