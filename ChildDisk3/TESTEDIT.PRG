*************************************************************************
*																		*
* TESTEDIT >>> Add allows user to edit test								*
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
		store "Editing Test Results" to HEAD
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do FRAME
	else
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do TAIL
	endif

	store 5 to MENU_CNT
	store "Edit EKG test results" to MENU_1
	store "Edit XRAY test results" to MENU_2
	store "Edit ECHO test results" to MENU_3
	store "Edit cardiac catheterizations" to MENU_4
	store "Edit procedures performed" to MENU_5
	do MENU

	store 5 to CHOICE
	do GETKEY

	do case
		case CHOICE = 0
			store .F. to CONTINUE

		case CHOICE = 1
			do CLRSCRN

			store 5 to PMT_LINE
			store "Enter date of EKG to edit." to PMT_MSG
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

			if .NOT. (EOF() .OR. BOF())
				do READEKG

				store 19 to PMT_LINE
				store "1) Edit EKG  2) Delete EKG" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store K_DATE to S_DATE

					store 5 to PMT_LINE
					store "Enter EKG information" to PMT_MSG
					do PROMPT

					do GETEKGD

					store RECNO() to PLACE

					store SEL_NBR + SUBSTR(K_DATE,7,2) to EKG_NBR
					store EKG_NBR + SUBSTR(K_DATE,1,2) + SUBSTR(K_DATE,4,2) to EKG_NBR

					seek EKG_NBR

					if .NOT. (EOF() .OR. BOF()) .and. S_DATE <> K_DATE
						store 19 to STAT_LINE
						store "EKG for date already entered" to STAT_MSG
						do STATUS

					else
						do GETEKG

						store 19 to PMT_LINE
						store "1) Save changes  2) Throw away changes" to PMT_MSG
						do PROMPT

						store 2 to CHOICE
						do GETKEY

						@ 19,0

						if CHOICE = 1
							goto PLACE
							do WRITEEKG
						endif

					endif


					store 0 to CHOICE

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
				store "EKG for " + K_DATE to STAT_MSG
				store STAT_MSG + " is not found" to STAT_MSG
				do STATUS

			endif

			select A
			use

			do CLRSCRN

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 2
			do CLRSCRN

			store 5 to PMT_LINE
			store "Enter date of XRAY to edit." to PMT_MSG
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

			if .NOT. (EOF() .OR. BOF())
				do READXRY
				do PUTXRY

				store 19 to PMT_LINE
				store "1) Edit XRAY  2) Delete XRAY" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store X_DATE to S_DATE

					store 5 to PMT_LINE
					store "Enter XRAY information" to PMT_MSG
					do PROMPT

					do GETXRY

					store RECNO() to PLACE

					store SEL_NBR + SUBSTR(X_DATE,7,2) to XRY_NBR
					store XRY_NBR + SUBSTR(X_DATE,1,2) + SUBSTR(X_DATE,4,2) to XRY_NBR

					seek XRY_NBR

					if .NOT. (EOF() .OR. BOF()) .and. S_DATE <> X_DATE
						store 19 to STAT_LINE
						store "XRAY for date already entered" to STAT_MSG
						do STATUS

					else
						store 19 to PMT_LINE
						store "1) Save changes  2) Throw away changes" to PMT_MSG
						do PROMPT

						store 2 to CHOICE
						do GETKEY

						@ 19,0

						if CHOICE = 1
							goto PLACE
							do WRITEXRY
						endif

					endif

					store 0 to CHOICE

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
				store "XRAY for " + X_DATE to STAT_MSG
				store STAT_MSG + " is not found" to STAT_MSG
				do STATUS

			endif

			select A
			use

			do CLRSCRN

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 3
			do CLRSCRN

			store 5 to PMT_LINE
			store "Enter date of ECHO to edit." to PMT_MSG
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

			if .NOT. (EOF() .OR. BOF())
				do READECH
				do PUTECH

				store 19 to PMT_LINE
				store "1) Edit ECHO  2) Delete ECHO" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store E_DATE to S_DATE

					store 5 to PMT_LINE
					store "Enter ECHO information" to PMT_MSG
					do PROMPT

					do GETECH

					store RECNO() to PLACE

					store SEL_NBR + SUBSTR(E_DATE,7,2) to ECH_NBR
					store ECH_NBR + SUBSTR(E_DATE,1,2) + SUBSTR(E_DATE,4,2) to ECH_NBR

					seek ECH_NBR

					if .NOT. (EOF() .OR. BOF()) .and. S_DATE <> E_DATE
						store 19 to STAT_LINE
						store "ECHO for date already entered" to STAT_MSG
						do STATUS

					else
						store 19 to PMT_LINE
						store "1) Save changes  2) Throw away changes" to PMT_MSG
						do PROMPT

						store 2 to CHOICE
						do GETKEY

						@ 19,0

						if CHOICE = 1
							goto PLACE
							do WRITEECH
						endif

					endif

					store 0 to CHOICE

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
				store "ECHO for " + E_DATE to STAT_MSG
				store STAT_MSG + " is not found" to STAT_MSG
				do STATUS

			endif

			select A
			use

			do CLRSCRN

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 4
			do CLRSCRN

			store 5 to PMT_LINE
			store "Enter date of cardiac cath. to edit." to PMT_MSG
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

			if .NOT. (EOF() .OR. BOF())
				do READCAR
				do PUTCAR

				store 19 to PMT_LINE
				store "1) Edit cardiac cath.  2) Delete cardiac cath." to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store C_DATE to S_DATE

					store 5 to PMT_LINE
					store "Enter cardiac cath. information" to PMT_MSG
					do PROMPT

					do GETCAR

					store RECNO() to PLACE

					store SEL_NBR + SUBSTR(C_DATE,7,2) to CAR_NBR
					store CAR_NBR + SUBSTR(C_DATE,1,2) + SUBSTR(C_DATE,4,2) to CAR_NBR

					seek CAR_NBR

					if .NOT. (EOF() .OR. BOF()) .and. S_DATE <> C_DATE
						store 19 to STAT_LINE
						store "Cardiac cath. for date already entered" to STAT_MSG
						do STATUS

					else
						store 19 to PMT_LINE
						store "1) Save changes  2) Throw away changes" to PMT_MSG
						do PROMPT

						store 2 to CHOICE
						do GETKEY

						@ 19,0

						if CHOICE = 1
							goto PLACE
							do WRITECAR
						endif

					endif

					store 0 to CHOICE

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
				store "Cardiac cath. for " + C_DATE to STAT_MSG
				store STAT_MSG + " is not found" to STAT_MSG
				do STATUS

			endif

			select A
			use

			do CLRSCRN

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 5
			do CLRSCRN

			store 5 to PMT_LINE
			store "Enter procedure date and code to edit." to PMT_MSG
			do PROMPT

			do GETPRO

			@ 5,0

			select A
			use PROC index PRONBR

			set exact on
			seek PRO_NBR
			set exact off

			if .NOT. (EOF() .OR. BOF())
				store 19 to PMT_LINE
				store "1) Edit procedure  2) Delete procedure" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 5 to PMT_LINE
					store "Enter new procedure code." to PMT_MSG
					do PROMPT

					do GETPRO

					@ 5,0

					store RECNO() to PLACE

					set exact on
					seek PRO_NBR
					set exact off

					if .NOT. (EOF() .OR. BOF())
						store 19 to STAT_LINE
						store "Procedure previously entered" to STAT_MSG
						do STATUS

					else
						store 19 to PMT_LINE
						store "1) Save changes  2) Throw away changes" to PMT_MSG
						do PROMPT

						store 2 to CHOICE
						do GETKEY

						@ 19,0

						if CHOICE = 1
							goto PLACE
							do WRITEPRO

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
				store "Procedure not found" to STAT_MSG
				do STATUS

			endif

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

			do CLRSCRN

	endcase

enddo

return


                                                                                                                                                         