*************************************************************************
*																		*
* VIEWLDIR >>> Allow the user to view the letter directory.				*
*		   entry : LTR:NBR, O:DATE, LOGON								*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

do CLRSCRN

store 5 to PMT_LINE
store "Viewing the letter directory." to PMT_MSG
do PROMPT

store 7 to LTR_LINE
store 1 to LTR_CNT
  
store .T. to CONTINUE

store LTR_NBR to S_LTR_NBR

do while CONTINUE
	store SUBSTR(L_LTR_NBR,17,1) to PAGE
 
	@ LTR_LINE,15 say "The date of letter number " + str(LTR_CNT,2)
	@ LTR_LINE,43 say " is .......... " + SUBSTR(L_LTR_NBR,13,2) + "/"
	@ LTR_LINE,61 say SUBSTR(L_LTR_NBR,15,2) + "/" + SUBSTR(L_LTR_NBR,11,2)

	store .T. to SAME

	do while SAME
		store SUBSTR(L_LTR_NBR,17,1) to PAGE
		store RECNO() to RECORD
		skip

		if SUBSTR(L_LTR_NBR,1,10) = S_LTR_NBR .and. RECNO() <> RECORD
			if SUBSTR(L_LTR_NBR,17,1) <= PAGE
				store LTR_LINE + 1 to LTR_LINE
				store LTR_CNT + 1 to LTR_CNT

				if LTR_LINE > 17
					store 19 to STAT_LINE
					store "Viewing the letter directory" to STAT_MSG
					do STATUS

					do CLRSCRN

					store 5 to PMT_LINE
					store "Viewing the letter directory." to PMT_MSG
					do PROMPT
					store 7 to LTR_LINE

				endif

				store .F. to SAME

			endif

		else
			store 19 to STAT_LINE
			store "Viewing the letter directory" to STAT_MSG
			do STATUS

			store .F. to SAME
			store .F. to CONTINUE

		endif

	enddo

enddo

return

                                                                                   