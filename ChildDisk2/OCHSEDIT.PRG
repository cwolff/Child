*************************************************************************
*																		*
* OCHSEDIT >>> Edit allows user to edit office call/ hospital stay info *
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
		store "Edit Office Call/ Hospital Stay" to HEAD
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do FRAME
	else
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do TAIL
	endif

	store 4 to MENU_CNT
	store "Edit office call information" to MENU_1
	store "Edit patient letter" to MENU_2
	store "Edit hospital stay information" to MENU_3
	store "Edit consulting information" to MENU_4
	do MENU

	store 4 to CHOICE
	do GETKEY

	do case

		case CHOICE = 0
			store .F. to CONTINUE

		case CHOICE = 1
			do CLRSCRN

			store 5 to PMT_LINE
			store "Enter date of office call to edit." to PMT_MSG
			do PROMPT

			do GETOFF

			@ 5,0

			select A
			use OFFICE index OFFNBR

			store SEL_NBR + SUBSTR(O_DATE,7,2) to OFF_NBR
			store OFF_NBR + SUBSTR(O_DATE,1,2) + SUBSTR(O_DATE,4,2) to OFF_NBR

			set exact on
			seek OFF_NBR
			set exact off

			if .NOT. (EOF() .OR. BOF())
				store 19 to PMT_LINE
				store "1) Edit office call  2) Delete office call" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store 5 to PMT_LINE
					store "Enter new office call date." to PMT_MSG
					do PROMPT

					do GETOFF

					store RECNO() to PLACE

					store SEL_NBR + SUBSTR(O_DATE,7,2) to OFF_NBR
					store OFF_NBR + SUBSTR(O_DATE,1,2) + SUBSTR(O_DATE,4,2) to OFF_NBR
					seek OFF_NBR

					if .NOT. (EOF() .OR. BOF())
						store 19 to STAT_LINE
						store "Office call for date previously entered" to STAT_MSG
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
						 do WRITEOFF
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
				store "Office Call for " + O_DATE to STAT_MSG
				store STAT_MSG + " is not found" to STAT_MSG
				do STATUS

			endif

			do CLRSCRN

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 2
			do CLRSCRN

			store 5 to PMT_LINE
			store "Enter date of letter to edit." to PMT_MSG
			do PROMPT

			do GETLTR

			select A
			use LETTER index LTRNBR

			store SEL_NBR + SUBSTR(L_DATE,7,2) to LTR_NBR
			store LTR_NBR + SUBSTR(L_DATE,1,2) + SUBSTR(L_DATE,4,2) + "1" to LTR_NBR

			set exact on
			seek LTR_NBR
			set exact off

			if .NOT. (EOF() .OR. BOF())
				store 19 to PMT_LINE
				store "1) Edit letter  2) Delete letter" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					do CLRSCRN

					store 19 to PMT_LINE
					store "One moment please, reading letter." to PMT_MSG
					do PROMPT

					select B
					use TMPLTR index TMPLNBR

					select A
					do READLTR

					store LTR_NBR to S_LTR_NBR

					do while L_LTR_NBR = S_LTR_NBR
						select B
						append blank
						do WRITELTR

						select A
						skip
						do READLTR

					enddo

					@ 19,0

					select B
					goto top

					store 5 to PMT_LINE
					store "Editing letter for " + L_DATE to PMT_MSG
					do PROMPT

					do ADDLTR

					store 19 to PMT_LINE
					store "1) Save patient letter  " to PMT_MSG
					store PMT_MSG + "2) Throw away change" to PMT_MSG
					do PROMPT

					store 2 to CHOICE
					do GETKEY

					@ 19,0

					if CHOICE = 0 .or. CHOICE = 2
						store 19 to PMT_LINE
						store "One moment please, removing letter." to PMT_MSG
						do PROMPT

						select B
						use TMPLTR
						zap
						index on LTR_NBR to TMPLNBR
						use

						select A

						@ 19,0

					endif

					if CHOICE = 1
						store 19 to PMT_LINE
						store "One moment please, saving letter." to PMT_MSG
						do PROMPT

						select B
						goto top

						do while .not. EOF()
				 			do READLTR

							select A
							seek LTR_NBR

							if (EOF() .OR. BOF())
								append blank
							endif

							do WRITELTR

							select B
							skip

						enddo

						@ 19,0

						select B
						use TMPLTR
						zap
						index on L_LTR_NBR to TMPLNBR
						use

						select A

						@ 19,0

					endif

					store 0 to CHOICE

				endif

				if CHOICE = 2
					store 19 to PMT_LINE
					store "Please wait while I delete this letter." to PMT_MSG
					do PROMPT

					store .T. to MORE
					store 1 to PAGE

					do while MORE
						store SUBSTR(LTR_NBR,1,16) + str(PAGE,1) to LTR_NBR

						seek LTR_NBR

						if .NOT. (EOF() .OR. BOF())
							store RECNO() to DELRCD
							store str(DELRCD,5) to RCDNBR

							delete record &RCDNBR

							store PAGE + 1 to PAGE

						else
							store .F. to MORE

						endif

					enddo

					@ 19,0

				endif

			else
				store 19 to STAT_LINE
				store "Letter for " + L_DATE to STAT_MSG
				store STAT_MSG + " is not found." to STAT_MSG
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
			store "Enter date of admission of hospital stay to edit." to PMT_MSG
			do PROMPT

			do GETHOSD

			@ 5,0

			select A
			use HOSPITAL index HOSNBR

			store SEL_NBR + SUBSTR(H_DATE_A,7,2) to HOS_NBR
			store HOS_NBR + SUBSTR(H_DATE_A,1,2) + SUBSTR(H_DATE_A,4,2) to HOS_NBR

			set exact on
			seek HOS_NBR
			set exact off

			if .NOT. (EOF() .OR. BOF())
				do READHOS
				do PUTHOS

				store 19 to PMT_LINE
				store "1) Edit hospital stay  2) Delete hospital stay" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store H_DATE_A to S_DATE_A

					store 5 to PMT_LINE
					store "Enter hospital stay information" to PMT_MSG
					do PROMPT

					do GETHOS

					store RECNO() to PLACE

					store SEL_NBR + SUBSTR(H_DATE_A,7,2) to HOS_NBR
					store HOS_NBR + SUBSTR(H_DATE_A,1,2) + SUBSTR(H_DATE_A,4,2) to HOS_NBR
					seek HOS_NBR

					if .NOT. (EOF() .OR. BOF()) .and. S_DATE_A <> H_DATE_A
						store 19 to STAT_LINE
						store "Hospital stay for date already entered" to STAT_MSG
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
						 do WRITEHOS
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
				store "Hospital stay for " + H_DATE_A to STAT_MSG
				store STAT_MSG + " is not found" to STAT_MSG
				do STATUS

			endif

			do CLRSCRN

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

		case CHOICE = 4
			do CLRSCRN

			store 5 to PMT_LINE
			store "Enter date of consultation to edit." to PMT_MSG
			do PROMPT

			do GETADVD

			@ 5,0

			select A
			use ADVICE index ADVNBR

			store SEL_NBR + SUBSTR(A_DATE,7,2) to ADV_NBR
			store ADV_NBR + SUBSTR(A_DATE,1,2) + SUBSTR(A_DATE,4,2) to ADV_NBR

			set exact on
			seek ADV_NBR
			set exact off

			if .NOT. (EOF() .OR. BOF())
				store .T. to DESCRIPT
				do READADV
				do PUTADV

				store 19 to PMT_LINE
				store "1) Edit consulting info  2) Delete consulting info" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store A_DATE to SA_DATE

					store 5 to PMT_LINE
					store "Enter consulting information" to PMT_MSG
					do PROMPT

					do GETADV

					store RECNO() to PLACE

					store SEL_NBR + SUBSTR(A_DATE,7,2) to ADV_NBR
					store ADV_NBR + SUBSTR(A_DATE,1,2) + SUBSTR(A_DATE,4,2) to ADV_NBR
					seek ADV_NBR

					if .NOT. (EOF() .OR. BOF()) .and. SA_DATE <> A_DATE
						store 19 to STAT_LINE
						store "Consulting info for date already entered" to STAT_MSG
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
							do WRITEADV
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
				store "Consulting info for " + A_DATE to STAT_MSG
				store STAT_MSG + " is not found" to STAT_MSG
				do STATUS

			endif

			do CLRSCRN

			select A
			use

			store .T. to CONTINUE
			store .F. to REFRESH

	endcase

enddo

return
