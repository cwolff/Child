*************************************************************************
*																		*
* ADDPAT >>> Check to see if patient is in data base or is to be added	*
*		   entry : FST_NAME, LST_NAME									*
*		   exit : PAT_SEL = T											*
*			 SEL_NAME = P_LST_N + P_FST_N								*
*			 SEL_NBR = P_PAT_NBR										*
*			  PAT_SEL = F												*
*			 SEL_NAME = "No patient selected"							*
*			 SEL_NBR = "??????????" 									*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

select A
use NEWPAT index NWPNBR,NWPLNFN

store "No patient selected" to L_TAIL
store "Press RETURN to ENTER" to R_TAIL
do TAIL

do GETNPAT

store "No patient selected" to L_TAIL
store "Press 0 to STOP" to R_TAIL
do TAIL

store .T. to SCROLL
do while SCROLL

	store 19 to PMT_LINE
	store "1) Save Patient  2) Edit Patient" to PMT_MSG
	store PMT_MSG + "  3) Throw away patient" to PMT_MSG
	do PROMPT

	store 3 to CHOICE
	do GETKEY

	@ 19,0

	do case

		case CHOICE = 0 .or. CHOICE = 3
			store .F. to PAT_SEL
			store "No patient selected" to SEL_NAME
			store "??????????" to SEL_NBR
			store .F. to SCROLL

		case CHOICE = 2
			store "No patient selected" to L_TAIL
			store "Press RETURN to ENTER" to R_TAIL
			do TAIL

			do GETPAT

			store "No patient selected" to L_TAIL
			store "Press 0 to STOP" to R_TAIL
			do TAIL

		case CHOICE = 1

			do case

				case SUBSTR(LST_N,1,1) = " "
					store 19 to STAT_LINE
					store "Please enter the patients name" to STAT_MSG
					do STATUS

					store "No patient selected" to L_TAIL
					store "Press RETURN to ENTER" to R_TAIL
					do TAIL

					do GETPAT

					store "No patient selected" to L_TAIL
					store "Press 0 to STOP" to R_TAIL
					do TAIL

				case SUBSTR(BIRTH,1,2) < "01" .or. SUBSTR(BIRTH,1,2) > "12"
					store 19 to STAT_LINE
					store "Invalid MONTH for birth date" to STAT_MSG
					do STATUS

					store "No patient selected" to L_TAIL
					store "Press RETURN to ENTER" to R_TAIL
					do TAIL

					do GETPAT

					store "No patient selected" to L_TAIL
					store "Press 0 to STOP" to R_TAIL
					do TAIL

				case SUBSTR(BIRTH,4,2) < "01" .or. SUBSTR(BIRTH,4,2) > "31"
					store 19 to STAT_LINE
					store "Invalid DAY for birth date" to STAT_MSG
					do STATUS

					store "No patient selected" to L_TAIL
					store "Press RETURN to ENTER" to R_TAIL
					do TAIL

					do GETPAT

					store "No patient selected" to L_TAIL
					store "Press 0 to STOP" to R_TAIL
					do TAIL

				case SUBSTR(BIRTH,7,2) < "00" .or. SUBSTR(BIRTH,7,2) > "99"
					store 19 to STAT_LINE
					store "Invalid YEAR for birth date" to STAT_MSG
					do STATUS

					store "No patient selected" to L_TAIL
					store "Press RETURN to ENTER" to R_TAIL
					do TAIL

					do GETPAT

					store "No patient selected" to L_TAIL
					store "Press 0 to STOP" to R_TAIL
					do TAIL

				otherwise
					store SUBSTR(BIRTH,7,2)+SUBSTR(BIRTH,1,2) to PAT_NBR
					store PAT_NBR + UPPER(SUBSTR(LST_N,1,1)) to PAT_NBR

					select B
					use GLOBAL
					store "G_"+SUBSTR(PAT_NBR,3,2)+"_NBR" to NBRFLD
					store str(&NBRFLD,5) to NBRIDX
					replace &NBRFLD with &NBRFLD + 1
					use
					select A

					store 1 to LOOP
					do while LOOP < 6
						if SUBSTR(NBRIDX,LOOP,1) = " "
						 store PAT_NBR + "0" to PAT_NBR
						else
						 store PAT_NBR + SUBSTR(NBRIDX,LOOP,1) to PAT_NBR
						endif
						store LOOP + 1 to LOOP
					enddo

					store trim(UPPER(FST_N)) + " " + trim(UPPER(LST_N)) to SEL_NAME
					store UPPER(PAT_NBR) to SEL_NBR
					store .T. to PAT_SEL

					append blank
					do WRITEPAT

					store .F. to SCROLL

			endcase

	endcase

enddo

do CLRSCRN

select A
use

return
                                                                                                                                                                   