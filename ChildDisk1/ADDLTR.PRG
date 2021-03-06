*************************************************************************
*																		*
* ADDLTR >>> Allow the user to write a letter in pages.  Each page is	*
*		 another record in OFFICELTR data base.							*
*		   entry : PAT:NBR, O:DATE, LOGON								*
*		   exit : None													*
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
		append blank

		if PAGE = 1
			store "                         CHILDREN'S" to L1
			store L1 + " HOSPITAL                          " to L1
			store "                       DIVISION OF " to L2
			store L2 + "CARDIOLOGY                         " to L2
			store "                         700 CHILDR" to L3
			store L3 + "EN'S DR.                           " to L3
			store "                          COLUMBUS," to L4
			store L4 + " OHIO                              " to L4
			store "                          (614) 461" to L5
			store L5 + "-2302                              " to L5

		else
			store "                                   " to L1
			store "                                   " + L1 to L1
			store "                                   " to L2
			store "                                   " + L2 to L2
			store "                                   " to L3
			store "                                   " + L3 to L3
			store "                                   " to L4
			store "                                   " + L4 to L4
			store "                                   " to L5
			store "                                   " + L5 to L5

		endif

		store "                                   " to L6
		store "                                   " + L6 to L6
		store "                                   " to L7
		store "                                   " + L7 to L7
		store "                                   " to L8
		store "                                   " + L8 to L8
		store "                                   " to L9
		store "                                   " + L9 to L9
		store "                                   " to L10
		store "                                   " + L10 to L10

	else
		do READLTR

	endif

	store 19 to PMT_LINE
	store "Page " + str(PAGE,1) to PMT_MSG
	do PROMPT

	do GETPAGE
	do WRITELTR

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
                                      