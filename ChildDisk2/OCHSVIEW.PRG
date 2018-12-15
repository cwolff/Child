*************************************************************************
*																		*
* OCHSVIEW >>> View allows user to view office call/ hospital stay info *
*		   entry : Selected patient information							*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store .T. to REFRESH
store .T. to CONTINUE

do while CONTINUE
	if REFRESH
		store "View to Office Call/ Hospital Stay" to HEAD
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do FRAME
	else
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do TAIL
	endif

	store 5 to MENU_CNT
	store "View office call information" to MENU_1
	store "View patient letter directory" to MENU_2
	store "View selected patient letter" to MENU_3
	store "View hospital stay information" to MENU_4
	store "View consulting information" to MENU_5
	do MENU

	store 5 to CHOICE
	do GETKEY

	do case
		case CHOICE = 0
			store .F. to CONTINUE

		case CHOICE = 1
			select A
			use OFFICE index OFFNBR

			store SEL_NBR to OFF_NBR
			seek OFF_NBR

			if .NOT. (EOF() .OR. BOF())
				do CLRSCRN

				do VIEWOFF

				store 19 to PMT_LINE
				store "1) Print office call data  " to PMT_MSG
				store PMT_MSG + "2) Don't print" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 19 to PMT_LINE
					store "Printing office call information." to PMT_MSG
					do PROMPT

					set DEVICE to print
					eject

					store SEL_NBR to OFF_NBR
					seek OFF_NBR

					do PRINTOFF

					eject
					set DEVICE to screen

					@ 19,0

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "No office call information for patient" to STAT_MSG
				do STATUS

			endif

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 2
			select A
			use LETTER index LTRNBR

			store SEL_NBR to LTR_NBR
			seek LTR_NBR

			if .NOT. (EOF() .OR. BOF())
				do VIEWLDIR

			else
				store 19 to STAT_LINE
				store "No letters for this patient" to STAT_MSG
				do STATUS

			endif

			do CLRSCRN

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 3
			do CLRSCRN

			store 5 to PMT_LINE
			store "Enter date of letter to view." to PMT_MSG
			do PROMPT

			do GETLTR

			select A
			use LETTER index LTRNBR

			store SEL_NBR + SUBSTR(L_DATE,7,2) to LTR_NBR
			store LTR_NBR + SUBSTR(L_DATE,1,2) + SUBSTR(L_DATE,4,2) to LTR_NBR
			seek LTR_NBR

			if .NOT. (EOF() .OR. BOF())
				do CLRSCRN

				store 5 to PMT_LINE
				store "Viewing a letter for " + L_DATE to PMT_MSG
				do PROMPT

				do VIEWLTR

				store 19 to PMT_LINE
				store "1) Send letter to printer  " to PMT_MSG
				store PMT_MSG + " 2) Don't print" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 19 to PMT_LINE
					store "Printing letter." to PMT_MSG
					do PROMPT

					set DEVICE to print
					eject

					do PRINTLTR

					eject
					set DEVICE to screen

					@ 19,0

				endif

			else
				store 19 to STAT_LINE
				store "No letter for selected date for patient" to STAT_MSG
				do STATUS

			endif

			do CLRSCRN
			
			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 4
			select A
			use HOSPITAL index HOSNBR

			store SEL_NBR to HOS_NBR
			seek HOS_NBR

			if .NOT. (EOF() .OR. BOF())
				do CLRSCRN

				do VIEWHOS

				store 19 to PMT_LINE
				store "1) Print hospital stay data  " to PMT_MSG
				store PMT_MSG + "2) Don't print" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 19 to PMT_LINE
					store "Printing hospital stay information." to PMT_MSG
					do PROMPT

					set DEVICE to print
					eject

					store SEL_NBR to HOS_NBR
					seek HOS_NBR

					do PRINTHOS

					eject
					set DEVICE to screen

					@ 19,0

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "No hospital stay information for patient" to STAT_MSG
				do STATUS

			endif

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 5
			select A
			use ADVICE index ADVNBR

			store SEL_NBR to ADV_NBR
			seek ADV_NBR

			if .NOT. (EOF() .OR. BOF())
				do CLRSCRN

				do VIEWADV

				store 19 to PMT_LINE
				store "1) Print consulting data  " to PMT_MSG
				store PMT_MSG + "2) Don't print" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 19 to PMT_LINE
					store "Printing consulting information." to PMT_MSG
					do PROMPT

					set DEVICE to print
					eject

					store SEL_NBR to ADV_NBR
					seek ADV_NBR

					do PRINTADV

					eject
					set DEVICE to screen

					@ 19,0

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "No consulting information for patient" to STAT_MSG
				do STATUS

			endif

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

	endcase

enddo

return

