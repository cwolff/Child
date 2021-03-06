*************************************************************************
*																		*
* CHLDEDIT >>> Add allows user to edit the data base					*
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
		store "Edit Child Data Base" to HEAD
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
	store "Edit diagnosis information" to MENU_3
	store "Edit office call/ hospital stay information" to MENU_4
	store "Edit test result information" to MENU_5
	do MENU

	store 5 to CHOICE
	do GETKEY

	do case

		case CHOICE = 0

			store "Checking for deleted data" to L_TAIL
			store "Do not disturb this process" to R_TAIL
			do TAIL

			do DELDATA

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
				store 19 to STAT_LINE
				store SEL_NAME + " NOT found" to STAT_MSG
				do STATUS
				store "No patient selected" to SEL_NAME

			else
				store 19 to PMT_LINE
				store "1) Edit patient  2) Don't edit patient" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					do EDITPAT
				else
					do CLRSCRN
				endif

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
				store 19 to STAT_LINE
				store SRCH_PAT + " NOT found" to STAT_MSG
				do STATUS
				store "No patient selected" to SEL_NAME

			else
				store 19 to PMT_LINE
				store "1) Edit patient  2) Don't edit patient" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					set index to PATLNFN
					do EDITPAT
				else
					do CLRSCRN
				endif

			endif

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 3

			if PAT_SEL
				do CLRSCRN

				store 5 to PMT_LINE
				store "Enter diagnostic code to edit." to PMT_MSG
				do PROMPT

				do GETDIA

				@ 5,0

				select A
				use DIAGNOSE index DIANBR

				set exact on
				seek DIA_NBR
				set exact off

				if .NOT. (EOF() .OR. BOF())

					store 19 to PMT_LINE
					store "1) Edit diagnoses  2) Delete diagnoses" to PMT_MSG
					do PROMPT

					store 2 to CHOICE
					do GETKEY

					@ 19,0

					if CHOICE = 1
						store 5 to PMT_LINE
						store "Enter new diagnostic code." to PMT_MSG
						do PROMPT

						do GETDIA

						@ 5,0

						store RECNO() to PLACE

						set exact on
						seek DIA_NBR
						set exact off

						if .NOT. (EOF() .OR. BOF())
						 store 19 to STAT_LINE
						 store "Diagnosis previously entered" to STAT_MSG
						 do STATUS

						else
						 store 19 to PMT_LINE
						 store "1) Save change  2) Throw away change" to PMT_MSG
						 do PROMPT

						 store 2 to CHOICE
						 do GETKEY

						 @ 19,0

						 if CHOICE = 1
						 goto PLACE
						 do WRITEDIA
						 endif

						endif

					endif

					if CHOICE = 2
						store 19 to PMT_LINE
						store "Please wait while I delete this entry." to PMT_MSG
						do PROMPT

						store RECNO() to DELRCD
						store str(DELRCD,5) to RCDNBR

						delete record &RCDNBR

						@ 19,0

					endif

				else
					store 19 to STAT_LINE
					store "Diagnosis not found" to STAT_MSG
					do STATUS

				endif

				do CLRSCRN

				select A
				use

			else
				store 19 to STAT_LINE
				store "You must first select a patient" to STAT_MSG
				do STATUS

			endif

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 4

			if PAT_SEL
				do OCHSEDIT

				do CLRSCRN

				store .T. to CONTINUE
				store .F. to REFRESH

			else
				store 19 to STAT_LINE
				store "You must first select a patient" to STAT_MSG
				do STATUS

				store .T. to CONTINUE
				store .F. to REFRESH

			endif

		case CHOICE = 5

			if PAT_SEL
				do TESTEDIT

				do CLRSCRN

				store .T. to CONTINUE
				store .F. to REFRESH

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
          