*************************************************************************
*																		*
* CHLDADD >>> Add allows user to add new patient information			*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
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
		store "Add to Child Data Base" to HEAD
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
	store "Add diagnosis information" to MENU_3
	store "Add office call/ hospital stay information" to MENU_4
	store "Add test result information" to MENU_5
	do MENU

	store 5 to CHOICE
	do GETKEY

	do case

		case CHOICE = 0
			do CLRSCRN

			store 19 to PMT_LINE
			store "1) Normal exit (add new data) " to PMT_MSG
			store PMT_MSG + "2) Quick exit (don't add new data)" to PMT_MSG
			do PROMPT

			store 2 to CHOICE
			do GETKEY

			@ 19,0

			if CHOICE = 1
				store "Saving patient data" to L_TAIL
				store "Do not disturb this process" to R_TAIL
				do TAIL

				do SAVEDATA

			endif

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

				select A
				use NEWPAT index NWPLNFN

				do FINDPAT

				if .not. PAT_SEL

					store 19 to PMT_LINE
					store "1) Add "+SEL_NAME+"  2) Don't add "+SEL_NAME to PMT_MSG
					do PROMPT

					store 2 to CHOICE
					do GETKEY

					@ 19,0

					if CHOICE = 1
						do ADDPAT
					else
						store .F. to SEL_PAT
						store "No patient selected" to SEL_NAME
					endif

				else
					do CLRSCRN

				endif

			else
				do CLRSCRN

			endif

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

				select A
				use NEWPAT index NWPNBR

				do FINDPAT

				if .not. PAT_SEL
					store 19 to STAT_LINE
					store SRCH_PAT + " NOT found" to STAT_MSG
					do STATUS
					store "No patient selected" to SEL_NAME
				else
					do CLRSCRN
				endif

			else
				do CLRSCRN
			endif

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 3

			if PAT_SEL

				do CLRSCRN

				store 5 to PMT_LINE
				store "Enter diagnostic code to add." to PMT_MSG
				do PROMPT

				do GETDIA

				@ 5,0

				select A
				use DIAGNOSE index DIANBR

				seek DIA_NBR

				if (EOF() .OR. BOF())

					select A
					use NEWDIA index NWDNBR

					seek DIA_NBR

					if (EOF() .OR. BOF())

						set confirm on
						store dtoc(date()) to D_DATE
						@ 17,5 say "Enter Diagnoses date .. ";
						get D_DATE picture "99/99/99"
						read
						set confirm off
						clear gets
						
						store 19 to PMT_LINE
						store "1) Save diagnose  2) Throw away diagnose" to PMT_MSG
						do PROMPT

						store 2 to CHOICE
						do GETKEY

						@ 19,0

						if CHOICE = 1
						 append blank
						 do WRITEDIA

						endif

					else
						store 19 to STAT_LINE
						store "Diagnoses previously entered" to STAT_MSG
						do STATUS

					endif

				else
					store 19 to STAT_LINE
					store "Diagnoses previously entered" to STAT_MSG
					do STATUS

				endif

				do CLRSCRN

				select A
				use

				store .T. to CONTINUE
				store .F. to REFRESH

			else
				store 19 to STAT_LINE
				store "You must first select a patient" to STAT_MSG
				do STATUS

				store .T. to CONTINUE
				store .F. to REFRESH

			endif

		case CHOICE = 4

			if PAT_SEL
				do OCHSADD

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
				do TESTADD

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