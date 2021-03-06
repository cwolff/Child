*************************************************************************
*																		*
* CHLDVIEW >>> Add allows user to view the data base					*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store .T. to REFRESH
store .T. to CONTINUE

store .F. to PAT_SEL
store "No patient selected" to SEL_NAME

select A
use GLOBAL
goto top
store G_LOGON to USER_LOGON
use

do while CONTINUE

	if REFRESH
		store "View Child Data Base" to HEAD
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do FRAME
	else
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do TAIL
	endif

	store 5 to MENU_CNT
	store "Select patient by name" to MENU_1
	store "Select patient by number" to MENU_2
	store "View diagnosis information" to MENU_3
	store "View office call/ hospital stay information" to MENU_4
	store "View test result information" to MENU_5
	do MENU

	store 5 to CHOICE
	do GETKEY

	do case

		case CHOICE = 0
			store .F. to CONTINUE

		case CHOICE = 1
			store "No patient selected" to L_TAIL
			store "Press RETURN to ENTER" to R_TAIL
			do TAIL

			do CLRSCRN

			do GPNAME

			store "No patient selected" to L_TAIL
			store "Press 0 to STOP" to R_TAIL
			do TAIL

			select A
			use PATIENT index PATLNFN

			do FINDPAT

			if .not. PAT_SEL
				store "No patient selected" to SEL_NAME
				store 19 to STAT_LINE
				store SRCH_PAT + " NOT found" to STAT_MSG
				do STATUS

			endif

			if PAT_SEL
				store 19 to PMT_LINE
				store "1) Print patient data  2) Print ALL patient data" to PMT_MSG
				store PMT_MSG + "  3) Don't print" to PMT_MSG
				do PROMPT

				store 3 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 19 to PMT_LINE
					store "Printing patient's information." to PMT_MSG
					do PROMPT

					set DEVICE to print
					eject

					do PRINTPAT
					eject
					set DEVICE to screen

					@ 19,0

				endif

				if CHOICE = 2
					store 19 to PMT_LINE
					store "Printing ALL patient's information." to PMT_MSG
					do PROMPT

					do PRINTALL

					@ 19,0

				endif

			endif

			do CLRSCRN

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 2
			store "No patient selected" to L_TAIL
			store "Press RETURN to ENTER" to R_TAIL
			do TAIL

			do CLRSCRN

			do GPNBR

			store "No patient selected" to L_TAIL
			store "Press 0 to STOP" to R_TAIL
			do TAIL

			select A
			use PATIENT index PATNBR

			do FINDPAT

			if .not. PAT_SEL
				store "No patient selected" to STAT_MSG
				store 19 to STAT_LINE
				store SRCH_PAT + " NOT found" to STAT_MSG
				do STATUS

			endif

			if PAT_SEL
				store 19 to PMT_LINE
				store "1) Print patient data  2) Print ALL patient data" to PMT_MSG
				store PMT_MSG + "  3) Don't print" to PMT_MSG
				do PROMPT

				store 3 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 19 to PMT_LINE
					store "Printing patient's information." to PMT_MSG
					do PROMPT

					set DEVICE to print
					eject

					do PRINTPAT

					eject
					set DEVICE to screen

					@ 19,0

				endif

				if CHOICE = 2
					store 19 to PMT_LINE
					store "Printing ALL patient's information." to PMT_MSG
					do PROMPT

					do PRINTALL

					@ 19,0

				endif

			endif

			do CLRSCRN

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 3
			if PAT_SEL
				select A
				use DIAGNOSE index DIANBR

				store SEL_NBR to DIA_NBR
				seek DIA_NBR

				if .NOT. (EOF() .OR. BOF())
					do CLRSCRN

					do VIEWDIA

					store 19 to PMT_LINE
					store "1) Print diagnose(s) data" to PMT_MSG
					store PMT_MSG + " 2) Don't print" to PMT_MSG
					do PROMPT

					store 2 to GETKEY
					do GETKEY

					@ 19,0

					if CHOICE = 1
						store 19 to PMT_LINE
						store "Printing patient's diagnostic information." to PMT_MSG
						do PROMPT

						set DEVICE to print
						eject

						store SEL_NBR to DIA_NBR
						seek DIA_NBR

						do PRINTDIA

						eject
						set DEVICE to screen

						@ 19,0
	 
					endif

					do CLRSCRN

				else
					store 19 to STAT_LINE
					store "There are no diagnoses for this patient" to STAT_MSG
					do STATUS

				endif

			else
				store 19 to STAT_LINE
				store "You must first select a patient" to STAT_MSG
				do STATUS

			endif

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 4
			if PAT_SEL
				do OCHSVIEW

				store .T. to CONTINUE
				store .T. to REFRESH

			else
				store 19 to STAT_LINE
				store "You must first select a patient" to STAT_MSG
				do STATUS

				store .T. to CONTINUE
				store .F. to REFRESH

			endif

		case CHOICE = 5
			if PAT_SEL
				do TESTVIEW

				store .T. to CONTINUE
				store .T. to REFRESH

			else
				store 19 to STAT_LINE
				store "You must first select a patient" to STAT_MSG
				do STATUS
				store .T. to CONTINUE
				store .F. to REFRESH

			endif

	endcase

enddo

select A
use
select B
use



return


                                                                                                                                                                                                                    