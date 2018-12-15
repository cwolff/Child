*************************************************************************
*																		*
* OCHSADD >>> Add allows user to add office call/  hospital stay info	*
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
		store "Add to Office Call/ Hospital Stay" to HEAD
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do FRAME
	else
		store SEL_NAME to L_TAIL
		store "Press 0 to STOP" to R_TAIL
		do TAIL
	endif

	store 4 to MENU_CNT
	store "Add office call information" to MENU_1
	store "Add patient letter" to MENU_2
	store "Add hospital stay information" to MENU_3
	store "Add consulting information" to MENU_4
	do MENU

	store 4 to CHOICE
	do GETKEY

	do case

		case CHOICE = 0

			store .F. to CONTINUE

		case CHOICE = 1
			do CLRSCRN

			store 5 to PMT_LINE
			store "Enter date of office call to add." to PMT_MSG
			do PROMPT

			do GETOFF

			select A
			use OFFICE index OFFNBR

			store SEL_NBR + SUBSTR(O_DATE,7,2) to OFF_NBR
			store OFF_NBR + SUBSTR(O_DATE,1,2) + SUBSTR(O_DATE,4,2) to OFF_NBR

			set exact on
			seek OFF_NBR
			set exact off

			if (EOF() .OR. BOF())

				select A
				use NEWOFF index NWONBR

				set exact on
				seek OFF_NBR
				set exact off

				if (EOF() .OR. BOF())

					store 19 to PMT_LINE
					store "1) Save office call " to PMT_MSG
					store PMT_MSG + "2) Throw away office call" to PMT_MSG
					do PROMPT

					store 2 to CHOICE
					do GETKEY

					@ 19,0

					if CHOICE = 1
						append blank
						do WRITEOFF

					endif

				else
					store 19 to STAT_LINE
					store "Office call for " + O_DATE to STAT_MSG
					store STAT_MSG + " is already entered" to STAT_MSG
					do STATUS

				endif

			else
				store 19 to STAT_LINE
				store "Office call for " + O_DATE to STAT_MSG
				store STAT_MSG + " is already entered" to STAT_MSG
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
			store "Enter date of letter to compose." to PMT_MSG
			do PROMPT

			do GETLTR

			select A
			use LETTER index LTRNBR

			store SEL_NBR + SUBSTR(L_DATE,7,2) to LTR_NBR
			store LTR_NBR + SUBSTR(L_DATE,1,2) + SUBSTR(L_DATE,4,2) + "1" to LTR_NBR

			set exact on
			seek LTR_NBR
			set exact off

			if (EOF() .OR. BOF())

				select A
				use NEWLTR index NWLNBR

				set exact on
				seek LTR_NBR
				set exact off
 
				if (EOF() .OR. BOF())
					select B
					use TMPLTR index TMPLNBR

					do CLRSCRN

					store 5 to PMT_LINE
					store "Composing a letter for " + L_DATE to PMT_MSG
					do PROMPT

					do ADDLTR

					select B
					use

					select A

					store 19 to PMT_LINE
					store "1) Save patient letter  " to PMT_MSG
					store PMT_MSG + "2) Throw away patient letter" to PMT_MSG
					do PROMPT

					store 2 to CHOICE
					do GETKEY

					@ 19,0

					if CHOICE = 0 .or. CHOICE = 2
						store 19 to PMT_LINE
						store "One moment please, throwing away letter." to PMT_MSG
						do PROMPT

						select B
						use TMPLTR
						zap
						index on L_LTR_NBR to TMPLNBR
						use

						select A

						@ 19,0

					endif

					if CHOICE = 1
						store 19 to PMT_LINE
						store "One moment please, saving letter." to PMT_MSG
						do PROMPT

						append from TMPLTR

						select B
						use TMPLTR
						zap
						index on L_LTR_NBR to TMPLNBR
						use

						select A

						@ 19,0

					endif

				else
					store 19 to STAT_LINE
					store "Letter for " + L_DATE to STAT_MSG
					store STAT_MSG + " is already entered" to STAT_MSG
					do STATUS

				endif

			else
				store 19 to STAT_LINE
				store "Letter for " + L_DATE to STAT_MSG
				store STAT_MSG + " is already entered" to STAT_MSG
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
			store "Enter date of admission of hospital stay to add." to PMT_MSG
			do PROMPT

			do GETHOSD

			select A
			use HOSPITAL index HOSNBR

			store SEL_NBR + SUBSTR(H_DATE_A,7,2) to HOS_NBR
			store HOS_NBR + SUBSTR(H_DATE_A,1,2) + SUBSTR(H_DATE_A,4,2) to HOS_NBR

			set exact on
			seek HOS_NBR
			set exact off

			if (EOF() .OR. BOF())

				select A
				use NEWHOS index NWHNBR

				set exact on
				seek HOS_NBR
				set exact off

				if (EOF() .OR. BOF())

					store 5 to PMT_LINE
					store "Enter the hospital stay information." to PMT_MSG
					do PROMPT

					do GETNHOS

					store 19 to PMT_LINE
					store "1) Save hospital stay  " to PMT_MSG
					store PMT_MSG + "2) Throw away hospital stay" to PMT_MSG
					do PROMPT

					store 2 to CHOICE
					do GETKEY

					@ 19,0

					if CHOICE = 1
						append blank
						do WRITEHOS

					endif

				else
					store 19 to STAT_LINE
					store "Hospital stay for " + H_DATE_A to STAT_MSG
					store STAT_MSG + " is already entered" to STAT_MSG
					do STATUS

				endif

			else
				store 19 to STAT_LINE
				store "Hospital stay for " + H_DATE_A to STAT_MSG
				store STAT_MSG + " is already entered" to STAT_MSG
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
			store "Enter date of consultation to add." to PMT_MSG
			do PROMPT

			store dtoc(date()) to A_DATE
			store space(8) to A_CHG_NO
			store space(5) to A_DIAG
			store space(3) to A_MD

			do GETADVD

			@ 5,0

			select A
			use ADVICE index ADVNBR

			store SEL_NBR + SUBSTR(A_DATE,7,2) to ADV_NBR
			store ADV_NBR + SUBSTR(A_DATE,1,2) + SUBSTR(A_DATE,4,2) to ADV_NBR

			set exact on
			seek ADV_NBR
			set exact off

			if (EOF() .OR. BOF())
				select A
				use NEWADV index NWANBR

				set exact on
				seek ADV_NBR
				set exact off

				if (EOF() .OR. BOF())
					store 5 to PMT_LINE
					store "Enter the consulting information." to PMT_MSG
					do PROMPT

					do GETADV

					store 19 to PMT_LINE
					store "1) Save consulting info  " to PMT_MSG
					store PMT_MSG + "2) Throw away consulting info" to PMT_MSG
					do PROMPT

					store 2 to CHOICE
					do GETKEY

					@ 19,0

					if CHOICE = 1
						append blank
						do WRITEADV

					endif

				else
					store 19 to STAT_LINE
					store "Consulting info for " + A_DATE to STAT_MSG
					store STAT_MSG + " is already entered" to STAT_MSG
					do STATUS

				endif

			else
				store 19 to STAT_LINE
				store "Consulting info for " + A_DATE to STAT_MSG
				store STAT_MSG + " is already entered" to STAT_MSG
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