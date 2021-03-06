*************************************************************************
*																		*
* EDITPAT >>> Edit patient in data base 								*
*		   entry : FST:NAME, LST:NAME									*
*		   exit : PAT:SEL = T											*
*			 SEL:NAME = P:LST:N + P:FST:N								*
*			 SEL:NBR = P:PAT:NBR										*
*			  PAT:SEL = F												*
*			 SEL:NAME = "No patient selected"							*
*			 SEL:NBR = "??????????" 									*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "No patient selected" to L_TAIL
store "Press RETURN to ENTER" to R_TAIL
do TAIL

do GETPAT

store "No patient selected" to L_TAIL
store "Press 0 to STOP" to R_TAIL
do TAIL

store .T. to SCROLL
do while SCROLL

	store 19 to PMT_LINE
	store "1) Save changes  2) Make more changes" to PMT_MSG
	store PMT_MSG + "  3) Throw changes away" to PMT_MSG
	do PROMPT

	store 3 to CHOICE
	do GETKEY

	@ 19,0

	do case

		case CHOICE = 0 .or. CHOICE = 3
			store .F. to SCROLL

		case CHOICE = 2

			store SEL_NAME to L_TAIL
			store "Press RETURN to ENTER" to R_TAIL
			do TAIL

			do GETPAT

			store SEL_NAME to L_TAIL
			store "Press 0 to STOP" to R_TAIL
			do TAIL
 
		case CHOICE = 1
			do case
				case SUBSTR(LST_N,1,1) = " "
					store 19 to STAT_LINE
					store "Please enter the patients name" to STAT_MSG
					do STATUS

					store SEL_NAME to L_TAIL
					store "Press RETURN to ENTER" to R_TAIL
					do TAIL

					do GETPAT

					store SEL_NAME to L_TAIL
					store "Press 0 to STOP" to R_TAIL
					do TAIL

				case SUBSTR(BIRTH,1,2) < "01" .or. SUBSTR(BIRTH,1,2) > "12"
					store 19 to STAT_LINE
					store "Invalid MONTH for birth date" to STAT_MSG
					do STATUS

					store SEL_NAME to L_TAIL
					store "Press RETURN to ENTER" to R_TAIL
					do TAIL

					do GETPAT

					store SEL_NAME to L_TAIL
					store "Press 0 to STOP" to R_TAIL
					do TAIL

				case SUBSTR(BIRTH,4,2) < "01" .or. SUBSTR(BIRTH,4,2) > "31"
					store 19 to STAT_LINE
					store "Invalid DAY for birth date" to STAT_MSG
					do STATUS

					store SEL_NAME to L_TAIL
					store "Press RETURN to ENTER" to R_TAIL
					do TAIL

					do GETPAT

					store SEL_NAME to L_TAIL
					store "Press 0 to STOP" to R_TAIL
					do TAIL

				case SUBSTR(BIRTH,7,2) < "00" .or. SUBSTR(BIRTH,7,2) > "99"
					store 19 to STAT_LINE
					store "Invalid YEAR for birth date" to STAT_MSG
					do STATUS

					store SEL_NAME to L_TAIL
					store "Press RETURN to ENTER" to R_TAIL
					do TAIL

					do GETPAT

					store SEL_NAME to L_TAIL
					store "Press 0 to STOP" to R_TAIL
					do TAIL

				otherwise
					store trim(UPPER(FST_N)) + " " + trim(UPPER(LST_N)) to SEL_NAME
					do WRITEPAT

					store .F. to SCROLL

			endcase

	endcase

enddo

do CLRSCRN

return

                                                                                               