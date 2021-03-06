*************************************************************************
*																		*
* TESTADD >>> Add allows user to add new test							*
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
		store "Add to Test Results" to HEAD
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do FRAME
	else
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do TAIL
	endif

	store 5 to MENU_CNT
	store "Add EKG test results" to MENU_1
	store "Add XRAY test results" to MENU_2
	store "Add ECHO test results" to MENU_3
	store "Add cardiac catheterizations" to MENU_4
	store "Add procedures performed" to MENU_5
	do MENU

	store 5 to CHOICE
	do GETKEY

	do case
		case CHOICE = 0

			store .F. to CONTINUE

		case CHOICE = 1
			if file("EKG.DBF") .and. file("NEWEKG.DBF")
				do CLRSCRN

				store 5 to PMT_LINE
				store "Enter date of EKG to add." to PMT_MSG
				do PROMPT

				do GETNEKGD

				@ 5,0

				select A
				use EKG index EKGNBR

				store SEL_NBR + SUBSTR(K_DATE,7,2) to EKG_NBR
				store EKG_NBR + SUBSTR(K_DATE,1,2) + SUBSTR(K_DATE,4,2) to EKG_NBR

				set exact on
				seek EKG_NBR
				set exact off

				if (EOF() .OR. BOF())
					select A
					use NEWEKG index NWKNBR

					set exact on
					seek EKG_NBR
					set exact off

					if (EOF() .OR. BOF())
						store 5 to PMT_LINE
						store "Enter EKG information." to PMT_MSG
						do PROMPT

						do GETNEKG

						store 19 to PMT_LINE
						store "1) Save EKG  " to PMT_MSG
						store PMT_MSG + "2) Throw it away" to PMT_MSG
						do PROMPT

						store 2 to CHOICE
						do GETKEY

						@ 19,0

						if CHOICE = 1
						 append blank
						 do WRITEEKG
						endif

					else
						store 19 to STAT_LINE
						store "EKG previously entered" to STAT_MSG
						do STATUS

					endif

				else
					store 19 to STAT_LINE
					store "EKG previously entered" to STAT_MSG
					do STATUS

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "EKG file not found" to STAT_MSG
				do STATUS

			endif

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 2
			if file("XRAY.DBF") .and. file("NEWXRY.DBF")
				do CLRSCRN

				store 5 to PMT_LINE
				store "Enter date of XRAY to add." to PMT_MSG
				do PROMPT

				do GETXRYD

				@ 5,0

				select A
				use XRAY index XRYNBR

				store SEL_NBR + SUBSTR(X_DATE,7,2) to XRY_NBR
				store XRY_NBR + SUBSTR(X_DATE,1,2) + SUBSTR(X_DATE,4,2) to XRY_NBR

				set exact on
				seek XRY_NBR
				set exact off

				if (EOF() .OR. BOF())
					select A
					use NEWXRY index NWXNBR

					set exact on
					seek XRY_NBR
					set exact off

					if (EOF() .OR. BOF())
						store 5 to PMT_LINE
						store "Enter XRAY information." to PMT_MSG
						do PROMPT

						do GETNXRY

						store 19 to PMT_LINE
						store "1) Save XRAY  " to PMT_MSG
						store PMT_MSG + "2) Throw it away" to PMT_MSG
						do PROMPT

						store 2 to CHOICE
						do GETKEY

						@ 19,0

						if CHOICE = 1
							append blank
							do WRITEXRY
						endif

					else
						store 19 to STAT_LINE
						store "XRAY previously entered" to STAT_MSG
						do STATUS

					endif

				else
					store 19 to STAT_LINE
					store "XRAY previously entered" to STAT_MSG
					do STATUS

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "XRAY file not found" to STAT_MSG
				do STATUS

			endif

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 3
			if file("ECHO.DBF") .and. file("NEWECH.DBF")
				do CLRSCRN

				store 5 to PMT_LINE
				store "Enter date of ECHO to add." to PMT_MSG
				do PROMPT

				do GETECHD

				@ 5,0

				select A
				use ECHO index ECHNBR

				store SEL_NBR + SUBSTR(E_DATE,7,2) to ECH_NBR
				store ECH_NBR + SUBSTR(E_DATE,1,2) + SUBSTR(E_DATE,4,2) to ECH_NBR

				set exact on
				seek ECH_NBR
				set exact off

				if (EOF() .OR. BOF())
					select A
					use NEWECH index NWENBR

					set exact on
					seek ECH_NBR
					set exact off

					if (EOF() .OR. BOF())
						store 5 to PMT_LINE
						store "Enter ECHO information." to PMT_MSG
						do PROMPT

						do GETNECH

						store 19 to PMT_LINE
						store "1) Save ECHO  " to PMT_MSG
						store PMT_MSG + "2) Throw it away" to PMT_MSG
						do PROMPT

						store 2 to CHOICE
						do GETKEY

						@ 19,0

						if CHOICE = 1
							append blank
							do WRITEECH
						endif

					else
						store 19 to STAT_LINE
						store "ECHO previously entered" to STAT_MSG
						do STATUS

					endif

				else
					store 19 to STAT_LINE
					store "ECHO previously entered" to STAT_MSG
					do STATUS

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "ECHO file not found" to STAT_MSG
				do STATUS

			endif

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 4
			if file("CARDIAC.DBF") .and. file("NEWCAR.DBF")
				do CLRSCRN

				store 5 to PMT_LINE
				store "Enter date of cardiac cath to add." to PMT_MSG
				do PROMPT

				do GETCARD

				@ 5,0

				select A
				use CARDIAC index CARNBR

				store SEL_NBR + SUBSTR(C_DATE,7,2) to CAR_NBR
				store CAR_NBR + SUBSTR(C_DATE,1,2) + SUBSTR(C_DATE,4,2) to CAR_NBR

				set exact on
				seek CAR_NBR
				set exact off

				if (EOF() .OR. BOF())
					select A
					use NEWCAR index NWCNBR

					set exact on
					seek CAR_NBR
					set exact off

					if (EOF() .OR. BOF())
						store 5 to PMT_LINE
						store "Enter cardiac cath. information." to PMT_MSG
						do PROMPT

						do GETNCAR

						store 19 to PMT_LINE
						store "1) Save cardiac cath.  " to PMT_MSG
						store PMT_MSG + "2) Throw it away" to PMT_MSG
						do PROMPT

						store 2 to CHOICE
						do GETKEY

						@ 19,0

						if CHOICE = 1
						 append blank
						 do WRITECAR
						endif

					else
						store 19 to STAT_LINE
						store "Cardiac cath. previously entered" to STAT_MSG
						do STATUS

					endif

				else
					store 19 to STAT_LINE
					store "Cardiac cath. previously entered" to STAT_MSG
					do STATUS

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "CARDIAC file not found" to STAT_MSG
				do STATUS

			endif

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 5
			if file("PROC.DBF") .and. file("NEWPRO.DBF")
				do CLRSCRN

				store 5 to PMT_LINE
				store "Enter procedure date and code to add." to PMT_MSG
				do PROMPT

				do GETPRO

				@ 5,0

				select A
				use PROC index PRONBR

				set exact on
				seek PRO_NBR
				set exact off

				if (EOF() .OR. BOF())
					select A
					use NEWPRO index NWRNBR

					set exact on
					seek PRO_NBR
					set exact off

					if (EOF() .OR. BOF())

						store 19 to PMT_LINE
						store "1) Save procedure  2) Throw it away" to PMT_MSG
						do PROMPT

						store 2 to CHOICE
						do GETKEY

						@ 19,0

						if CHOICE = 1
							append blank
							do WRITEPRO
						endif

					else
						store 19 to STAT_LINE
						store "Procedure previously entered" to STAT_MSG
						do STATUS

					endif

				else
					store 19 to STAT_LINE
					store "Procedure previously entered" to STAT_MSG
					do STATUS

				endif

				do CLRSCRN

			else
				store 19 to STAT_LINE
				store "PROC file not found" to STAT_MSG
				do STATUS

			endif

			store .T. to CONTINUE
			store .F. to REFRESH

	endcase

enddo

return


                                                                                                                                                                                                                                                