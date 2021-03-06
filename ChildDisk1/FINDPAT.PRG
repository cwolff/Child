*************************************************************************
*																		*
* FINDPAT >>> Check to see if patient is in data base					*
*		   entry : current data base (PATIENT.DBF or NEWPAT.DBF)		*
*			   SRCH:PAT = P:LST:N + P:FST:N or P:PAT:NBR				*
*			   the current data base PATIENT,NEWPAT,ARCPAT				*
*			   with the proper index set								*
*		   exit : PAT:SEL = T											*
*			 SEL:NAME = trim(P:FST:N) + " " + trim(P:LST:N) 			*
*			 SEL:NBR = P:PAT:NBR										*
*			  PAT:SEL = F												*
*			 SEL:NAME = patient as entered from prompt					*
*			 SEL:NBR = "??????????" 									*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store trim(SRCH_PAT) to SRCH_PAT

seek SRCH_PAT

store .F. to PAT_SEL
  
if .NOT. (EOF() .OR. BOF())

	do READPAT
	do PUTPAT

	store .T. to SCROLL
	do while SCROLL

		store 19 to PMT_LINE
		store "1) Previous Patient  2) This Patient" to PMT_MSG
		store PMT_MSG + "  3) Next Patient" to PMT_MSG
		store PMT_MSG + "  4) Can't find patient" to PMT_MSG
		do PROMPT

		store 4 to CHOICE
		do GETKEY

		@ 19,0

		do CASE

			case CHOICE = 0 .or. CHOICE = 4
				store .F. to SCROLL
				store .F. to PAT_SEL
				store "??????????" to SEL_NBR
				do CLRSCRN

			case CHOICE = 1
				store RECNO() to OLDRCD
				skip -1
				store RECNO() to NEWRCD
				if OLDRCD = NEWRCD
					store 19 to STAT_LINE
					store "This is the first patient" to STAT_MSG
					do STATUS
				else
					do READPAT
					do PUTPAT
				endif

			case CHOICE = 2
				store .F. to SCROLL
				store .T. to PAT_SEL
				store trim(FST_N) + " " + trim(LST_N) to SEL_NAME
				store P_PAT_NBR to SEL_NBR

			case CHOICE = 3
				store RECNO() to OLDRCD
				skip 1
				store RECNO() to NEWRCD
				if OLDRCD = NEWRCD
					store 19 to STAT_LINE
					store "This is the last patient" to STAT_MSG
					do STATUS
				else
					do READPAT
					do PUTPAT
				endif

		endcase

	enddo

endif

return


                                                                                                                                                        