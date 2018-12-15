* Last revised : Sun 28-Feb-88 at 10:25 pm
*************************************************************************
*																		*
* PRINTIT >>> Print results of data base search 						*
*		   entry :  CHOICE = 2 printer header info						*
*					CHOICE = 3 print header info, and searced data		*
*					CHOICE = 4 printer header inof and all data			*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "Printing Search" to HEAD
store "Printing in progress" to L_TAIL
store "Do not distrub this process" to R_TAIL
do FRAME

store 19 to PMT_LINE
store "One moment please, reading search parameters." to PMT_MSG
do PROMPT

select A
use PATIENT

goto bottom
store RECNO() to PAT_TOT

select A
use

select A
use DIAGNOSE

goto bottom
store RECNO() to DIA_TOT

select A
use

select A
use ECHO

goto bottom
store RECNO() to ECH_TOT

select A
use

select A
use EKG

goto bottom
store RECNO() to EKG_TOT

select A
use

select A
use PROC

goto bottom
store RECNO() to PRO_TOT

select A
use

select A
use CARDIAC

goto bottom
store RECNO() to CAR_TOT

select A
use

select A
use XRAY

goto bottom
store RECNO() to XRY_TOT

select A
use

select A
use SRCHPARM

goto top

store P_DATE to S_DATE

store P_D_CODE to S_D_CODE
store P_DIA_TOT to S_DIA_TOT

store P_AGE to S_AGE
store P_AGE_TOT to S_AGE_TOT

store P_DIED to S_DIED
store P_DIED_TOT to S_DIED_TOT

store P_STRT_M to S_STRT_M
store P_STRT_Y to S_STRT_Y
store P_END_M to S_END_M
store P_END_Y to S_END_Y

store P_QP_QS to S_QP_QS
store P_RP_RS to S_RP_RS
store P_RVP_LVP to S_RVP_LVP
store P_RVP_AOP to S_RVP_AOP
store P_GR to S_GR
store P_CAR_TOT to S_CAR_TOT

store P_RHYTHM to S_RHYTHM
store P_AXIS to S_AXIS
store P_HYP to S_HYP
store P_COND to S_COND
store P_META to S_META
store P_EKG_TOT to S_EKG_TOT

store P_XRAY to S_XRAY
store P_XRY_TOT to S_XRY_TOT

store P_M_MODE to S_M_MODE
store P_TWO_D to S_TWO_D
store P_DOPPLER to S_DOPPLER
store P_ECH_TOT to S_ECH_TOT

store P_PRO to S_PRO
store P_PRO_TOT to S_PRO_TOT

store P_BRTH_TOT to S_BRTH_TOT

select A
use

select A
use FOUNDPAT

goto bottom
store RECNO() to S_TOTAL

if CHOICE <> 2
	store 19 to PMT_LINE
	store "One moment please, ordering searched data." to PMT_MSG
	do PROMPT

	goto top
	index on F_LST_N + F_FST_N to FNDNBR

endif

select A
use

if S_D_CODE = "d/c"
	store "don't use" to S_D_CODE

endif

if S_DIED = "d/c"
	store "don't use" to S_DIED
endif

do case
	case S_AGE = "1"
		store "0m >= [age] < 1m" to S_AGE

	case S_AGE = "2"
		store "1m >= [age] < 3m" to S_AGE

	case S_AGE = "3"
		store "3m >= [age] < 6m" to S_AGE

	case S_AGE = "4"
		store "6m >= [age] < 1y" to S_AGE

	case S_AGE = "5"
		store "1y >= [age] < 2y" to S_AGE

	case S_AGE = "6"
		store "2y >= [age] < 5y" to S_AGE

	case S_AGE = "7"
		store "5y >= [age] < 10y" to S_AGE

	case S_AGE = "8"
		store "10y > [age]" to S_AGE

	case S_AGE = "d/c"
		store "don't use" to S_AGE

endcase

do case
	case S_QP_QS = "1"
		store "=1" to S_QP_QS

	case S_QP_QS = "2"
		store "<1" to S_QP_QS

	case S_QP_QS = "3"
		store ">1 & <2" to S_QP_QS

	case S_QP_QS = "4"
		store ">2 & <3" to S_QP_QS

	case S_QP_QS = "5"
		store ">3" to S_QP_QS

	case S_QP_QS = "d/c"
		store "don't use" to S_QP_QS

endcase

do case
	case S_RP_RS = "1"
		store "<20%" to S_RP_RS

	case S_RP_RS = "2"
		store ">20% & <40%" to S_RP_RS

	case S_RP_RS = "3"
		store ">40% & <50%" to S_RP_RS

	case S_RP_RS = "4"
		store ">50% & <70%" to S_RP_RS

	case S_RP_RS = "5"
		store ">70%" to S_RP_RS

	case S_RP_RS = "d/c"
		store "don't use" to S_RP_RS

endcase

do case
	case S_RVP_LVP = "1"
		store "<50%" to S_RVP_LVP

	case S_RVP_LVP = "2"
		store ">50% & <70%" to S_RVP_LVP

	case S_RVP_LVP = "3"
		store ">70% & <100%" to S_RVP_LVP

	case S_RVP_LVP = "4"
		store ">100%" to S_RVP_LVP

	case S_RVP_LVP = "d/c"
		store "don't use" to S_RVP_LVP

endcase

do case
	case S_RVP_AOP = "1"
		store "<50%" to S_RVP_AOP

	case S_RVP_AOP = "2"
		store ">50 & < 70%" to S_RVP_AOP

	case S_RVP_AOP = "3"
		store ">70% & <100%" to S_RVP_AOP

	case S_RVP_AOP = "4"
		store ">100%" to S_RVP_AOP

	case S_RVP_AOP = "d/c"
		store "don't use" to S_RVP_AOP

endcase

do case
	case S_GR = "1"
		store "<40mm" to S_GR

	case S_GR = "2"
		store ">40mm & <60mm" to S_GR

	case S_GR = "3"
		store ">60mm" to S_GR

	case S_GR = "d/c"
		store "don't use" to S_GR

endcase

select A
use EKGTABLE index KTKPTR

if S_RHYTHM <> "d/c"
	if S_RHYTHM = "00"
		store "normal" to S_RHYTHM

	else
		store "RH" + SUBSTR(S_RHYTHM,1,2) to S_RHYTHM

		seek S_RHYTHM

		if .NOT. (EOF() .OR. BOF())
		    store KT_K_CODE to S_RHYTHM
		
		endif

	endif

else
	store "don't use" to S_RHYTHM

endif

if S_AXIS <> "d/c"
	if S_AXIS = "00"
		store "normal" to S_AXIS

	else
		store "AX" + SUBSTR(S_AXIS,1,2) to S_AXIS

		seek S_AXIS

		if .NOT. (EOF() .OR. BOF())
		    store KT_K_CODE to S_AXIS
		
		endif

	endif

else
	store "don't use" to S_AXIS

endif

if S_HYP <> "d/c"
	if S_HYP = "00"
		store "normal" to S_HYP

	else
		store "HY" + SUBSTR(S_HYP,1,2) to S_HYP

		seek S_HYP

		if .NOT. (EOF() .OR. BOF())
		    store KT_K_CODE to S_HYP
		
		endif

	endif

else
	store "don't use" to S_HYP

endif

if S_COND <> "d/c"
	if S_COND = "00"
		store "normal" to S_COND

	else
		store "RH" + SUBSTR(S_COND,1,2) to S_COND

		seek S_COND

		if .NOT. (EOF() .OR. BOF())
		    store KT_K_CODE to S_COND
		
		endif

	endif

else
	store "don't use" to S_COND

endif

if S_META <> "d/c"
	if S_META = "00"
		store "normal" to S_META

	else
		store "RH" + SUBSTR(S_META,1,2) to S_META

		seek S_META

		if .NOT. (EOF() .OR. BOF())
		    store KT_K_CODE to S_META
		
		endif

	endif

else
	store "don't use" to S_META

endif

select A
use

do case
	case S_XRAY = "N"
		store "normal" to S_XRAY

	case S_XRAY = "A"
		store "abnormal" to S_XRAY

	case S_XRAY = "d/c"
		store "don't use" to S_XRAY

endcase

do case
	case S_M_MODE = "N"
		store "normal" to S_M_MODE

	case S_M_MODE = "A"
		store "abnormal" to S_M_MODE

	case S_M_MODE = "d/c"
		store "don't use" to S_M_MODE

endcase

do case
	case S_TWO_D = "N"
		store "normal" to S_TWO_D

	case S_TWO_D = "A"
		store "abnormal" to S_TWO_D

	case S_TWO_D = "d/c"
		store "don't use" to S_TWO_D

endcase

do case
	case S_DOPPLER = "N"
		store "normal" to S_DOPPLER

	case S_DOPPLER = "A"
		store "abnormal" to S_DOPPLER

	case S_DOPPLER = "d/c"
		store "don't use" to S_DOPPLER

endcase

if S_PRO = "d/c"
	store "don't use" to S_PRO

endif

@ 19,0

store 19 to PMT_LINE
store "Printing search and totals information." to PMT_MSG
do PROMPT

set DEVICE to print

eject

@ 5,5 say "SSS   EEE   AAA   RRR   CCC   H H     RRR   EEE  SSS  U U  L   TTT SSS"
@ 6,5 say "S     E     A A   R R   C     H H     R R   E    S    U U  L    T  S  "
@ 7,5 say "SSS   EE    AAA   RRR   C     HHH     RRR   EEE  SSS  U U  L    T  SSS"
@ 8,5 say "  S   E     A A   R R   C     H H     R R   E      S  U U  L    T    S"
@ 9,5 say "SSS   EEE   A A   R  R  CCC   H H     R  R  EEE  SSS  UUU  LLL  T  SSS"

@ 13,17 say "Designed by Dr. Jo Craenen and Cameron L. Wolff"
@ 14,9 say "(C)opyright 1985 Personal Touch Software,  All Rights Reserved."

do case
	case CHOICE = 2
			@ 19,12 say "---------- Search Header Only Report " + S_DATE + " ---------"
	
	case CHOICE = 3
			@ 19,12 say "--- Search Header, Names and Searched Data " + S_DATE + " ---"
	
	case CHOICE = 4
			@ 19,12 say "------ Search Header, Names and All Data " + S_DATE + " -----"

endcase


@ 21,12 say "Age group search value ...................... " + S_AGE
@ 22,12 say "Deceased search value ....................... " + S_DIED
@ 23,12 say "Start Month -> " + S_STRT_M + " Start Year -> " + S_STRT_Y
@ 24,12 say "End Month   -> " + S_END_M + " End Year   -> " + S_END_Y

@ 26,12 say "Diagnostic search value ..................... " + S_D_CODE
@ 27,12 say "Cardiac cath. QP_QS search value ............ " + S_QP_QS
@ 28,12 say "Cardiac cath. RP_RS search value ............ " + S_RP_RS
@ 29,12 say "Cardiac cath. RVP_LVP search value .......... " + S_RVP_LVP
@ 30,12 say "Cardiac cath. RVP_AOP search value .......... " + S_RVP_AOP
@ 31,12 say "Cardiac cath. GR search value ............... " + S_GR

@ 33,12 say "EKG rhythm search value ..................... " + S_RHYTHM
@ 34,12 say "EKG axis search value ....................... " + S_AXIS
@ 35,12 say "EKG hypertrophy search value ................ " + S_HYP
@ 36,12 say "EKG conduction defect search value .......... " + S_COND
@ 37,12 say "EKG metabolic search value .................. " + S_META

@ 39,12 say "Xray search value ........................... " + S_XRAY

@ 41,12 say "Echo m_mode search value .................... " + S_M_MODE
@ 42,12 say "Echo 2D search value ........................ " + S_TWO_D
@ 43,12 say "Echo doppler search value ................... " + S_DOPPLER

@ 45,12 say "Procedure search value ...................... " + S_PRO

@ 48,12 say "------ Search Summary of Matched Totals, " + S_DATE + "------"

@ 50,7 say "Number of patients searched ................ " + str(S_AGE_TOT,5)
@ 51,7 say "Number of diagnostic matches ............... " + str(S_DIA_TOT,5) + " of " + str(DIA_TOT,5)
@ 52,7 say "Number of deceased matches ................. " + str(S_DIED_TOT,5)
@ 53,7 say "Number of cardiac cath. matches ............ " + str(S_CAR_TOT,5) + " of " + str(CAR_TOT,5)
@ 54,7 say "Number of EKG matches ...................... " + str(S_EKG_TOT,5) + " of " + str(EKG_TOT,5)
@ 55,7 say "Number of xray matches ..................... " + str(S_XRY_TOT,5) + " of " + str(XRY_TOT,5)
@ 56,7 say "Number of echo matches ..................... " + str(S_ECH_TOT,5) + " of " + str(ECH_TOT,5)
@ 57,7 say "Number of procedure matches ................ " + str(S_PRO_TOT,5) + " of " + str(PRO_TOT,5)
@ 58,7 say "Number of age matches (if all test = d/c) .. " + str(S_BRTH_TOT,5)

@ 60,7 say "Total number of patients that matched ...... " + str(S_TOTAL,5) + " of " + str(PAT_TOT,5)

set DEVICE to screen

select A
use

if CHOICE <> 2
	select C
	use FOUNDPAT index FNDNBR

	store RECCOUNT() to LAST

	store 0 to REC_PLACE

	if .not. (bof() .or. eof())
		@ 19,0
		@ 19,10 say "Printing selective search results record ... 00000 of 00000"
		@ 19,64 say str(LAST,5)

		do while .not. (bof() .or. eof())
			store REC_PLACE + 1 to REC_PLACE
			@ 19,55 say str(REC_PLACE,5)
			store F_PAT_NBR to SEL_NBR

			do case
				case CHOICE = 3
					do PRINTSEL
				
				case CHOICE = 4
					do PRINTALL
				
			endcase

			select C

			skip

		enddo
		
		select C
		use

		set DEVICE to print
		eject
		set DEVICE to screen

		store 19 to STAT_LINE
		store "Finished printing selective search results" to STAT_MSG
		do STATUS

	else
		set DEVICE to print
		eject
		set DEVICE to screen

		store 19 to STAT_LINE
		store "Selective search data base empty" to STAT_MSG
		do STATUS

	endif
	
endif

return
