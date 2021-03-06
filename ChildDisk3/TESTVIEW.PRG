*************************************************************************
*																		*
* TESTVIEW >>> Add allows user to view test added						*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store .T. to REFRESH
store .T. to CONTINUE

do while CONTINUE
	if REFRESH
		store "Viewing Test Results" to HEAD
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do FRAME
	else
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do TAIL
	endif

	store 5 to MENU_CNT
	store "View EKG test results" to MENU_1
	store "View XRAY test results" to MENU_2
	store "View ECHO test results" to MENU_3
	store "View cardiac catheterizations" to MENU_4
	store "View procedures performed" to MENU_5
	do MENU

	store 5 to CHOICE
	do GETKEY

	do case
		case CHOICE = 0
			store .F. to CONTINUE

		case CHOICE = 1
			do CLRSCRN

			select A
			use EKG index EKGNBR

			store SEL_NBR to EKG_NBR
			seek EKG_NBR

			if .NOT. (EOF() .OR. BOF())
				do VIEWEKG

				store 19 to PMT_LINE
				store "1) Print EKG data  " to PMT_MSG
				store PMT_MSG + "2) Don't print" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 19 to PMT_LINE
					store "Printing EKG information." to PMT_MSG
					do PROMPT

					set DEVICE to print
					eject

					store SEL_NBR to EKG_NBR
					seek EKG_NBR

					do PRINTEKG

					eject
					set DEVICE to screen

					@ 19,0

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "No EKG information for patient" to STAT_MSG
				do STATUS

			endif

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 2
			do CLRSCRN

			select A
			use XRAY index XRYNBR

			store SEL_NBR to XRY_NBR
			seek XRY_NBR

			if .NOT. (EOF() .OR. BOF())
				do VIEWXRY

				store 19 to PMT_LINE
				store "1) Print XRAY data  " to PMT_MSG
				store PMT_MSG + "2) Don't print" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 19 to PMT_LINE
					store "Printing XRAY information." to PMT_MSG
					do PROMPT

					set DEVICE to print
					eject

					store SEL_NBR to XRY_NBR
					seek XRY_NBR

					do PRINTXRY

					eject
					set DEVICE to screen

					@ 19,0

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "No XRAY information for patient" to STAT_MSG
				do STATUS

			endif

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 3
			do CLRSCRN

			select A
			use ECHO index ECHNBR

			store SEL_NBR to ECH_NBR
			seek ECH_NBR

			if .NOT. (EOF() .OR. BOF())
				do VIEWECH

				store 19 to PMT_LINE
				store "1) Print ECHO data  " to PMT_MSG
				store PMT_MSG + "2) Don't print" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 19 to PMT_LINE
					store "Printing ECHO information." to PMT_MSG
					do PROMPT

					set DEVICE to print
					eject

					store SEL_NBR to ECH_NBR
					seek ECH_NBR

					do PRINTECH

					eject
					set DEVICE to screen

					@ 19,0

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "No ECHO information for patient" to STAT_MSG
				do STATUS

			endif

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 4
			do CLRSCRN

			select A
			use CARDIAC index CARNBR

			store SEL_NBR to CAR_NBR
			seek CAR_NBR

			if .NOT. (EOF() .OR. BOF())
				do VIEWCAR

				store 19 to PMT_LINE
				store "1) Print cardiac cath. data  " to PMT_MSG
				store PMT_MSG + "2) Don't print" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 19 to PMT_LINE
					store "Printing cardiac cath. information." to PMT_MSG
					do PROMPT

					set DEVICE to print
					eject

					store SEL_NBR to CAR_NBR
					seek CAR_NBR

					do PRINTCAR

					eject
					set DEVICE to screen

					@ 19,0

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "No cardiac cath. information for patient" to STAT_MSG
				do STATUS

			endif

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 5
			do CLRSCRN

			select A
			use PROC index PRONBR

			store SEL_NBR to PRO_NBR
			seek PRO_NBR

			if .NOT. (EOF() .OR. BOF())
				do VIEWPRO

				store 19 to PMT_LINE
				store "1) Print procedure(s)  2) Don't print" to PMT_MSG
				do PROMPT

				store 2 to GETKEY
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 19 to PMT_LINE
					store "Printing patient's procedure information." to PMT_MSG
					do PROMPT

					set DEVICE to print
					eject

					store SEL_NBR to PRO_NBR
					seek PRO_NBR

					do PRINTPRO

					eject
					set DEVICE to screen

					@ 19,0

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "There are not procedures for this patient" to STAT_MSG
				do STATUS

			endif

			store .T. to CONTINUE
			store .F. to REFRESH

	endcase

enddo

return


                                                                                                                                                        