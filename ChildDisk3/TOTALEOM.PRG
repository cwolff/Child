*************************************************************************
*																		*
* TOTALEOM >>> Print end of month totals for data base. 				*
*		   entry : None													*
*		   exit : RPRT:DATE 											*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************

do CLRSCRN

store 1 to CONTINUE

do while CONTINUE <> 0
	set confirm on
	store "  /  " to RPRT_DATE
	@ 09,15 say "Entering date for EOM (End Of Month) report."
	@ 11,15 say "Enter month and year ... " get RPRT_DATE picture "99/99"
	read
	clear gets
	@ 09,0
	@ 11,0
	set confirm off

	store SUBSTR(RPRT_DATE,1,2) to MONTH
	store SUBSTR(RPRT_DATE,4,2) to YEAR

	if val(MONTH) > 0 .and. val(MONTH) < 13

		if val(YEAR) > 83 .and. val(YEAR) < 100

			store 0 to CONTINUE

		endif

	endif

	if CONTINUE <> 0
		store 19 to STAT_LINE
		store "Invalid date" to STAT_MSG
		do STATUS
	endif

enddo

store 19 to PMT_LINE
store "Printing EOM (End Of Month) report for " + RPRT_DATE to PMT_MSG
do PROMPT

store SUBSTR(RPRT_DATE,4,2) + SUBSTR(RPRT_DATE,1,2) + "00" to MTH_NBR

store 0 to PAT_TOT
store 0 to DIA_TOT
store 0 to OFF_TOT
store 0 to HOS_TOT
store 0 to LTR_TOT
store 0 to EKG_TOT
store 0 to XRY_TOT
store 0 to ECH_TOT
store 0 to CAR_TOT
store 0 to PRO_TOT

*
* Get Patient total for month
*

select A
use TOTAL index TOTNBR

store MTH_NBR to TOT_NBR
seek TOT_NBR

if .NOT. (EOF() .OR. BOF())
	store T_PAT_TOT to PAT_TOT
	store T_DIA_TOT to DIA_TOT
	store T_OFF_TOT to OFF_TOT
	store T_LTR_TOT to LTR_TOT
	store T_HOS_TOT to HOS_TOT
	store T_EKG_TOT to EKG_TOT
	store T_XRY_TOT to XRY_TOT
	store T_ECH_TOT to ECH_TOT
	store T_CAR_TOT to CAR_TOT
	store T_PRO_TOT to PRO_TOT

endif

set DEVICE to print
eject

@ 5,7 say "CCC  H H  I  L    DD     DD   AAA  TTT  AAA     BB   AAA  SSS  EEE"
@ 6,7 say "C    H H  I  L    D D    D D  A A   T   A A     B B  A A  S    E"
@ 7,7 say "C    HHH  I  L    D D    D D  AAA   T   AAA     BB   AAA  SSS  EE"
@ 8,7 say "C    H H  I  L    D D    D D  A A   T   A A     B B  A A    S  E"
@ 9,7 say "CCC  H H  I  LLL  DD     DD   A A   T   A A     BB   A A  SSS  EEE"

@ 13,17 say "Designed by Dr. Jo Craenen and Cameron L. Wolff"
@ 15,9 say "(C)opyright 1987 Personal Touch Software,  All Rights Reserved."

@ 26,12 say "_____ EOM (End Of Month) total report for " + RPRT_DATE + " _____"

@ 30,12 say "Total number of patients added ................. "+str(PAT_TOT,7)
@ 32,12 say "Total number of diagnoses added ................ "+str(DIA_TOT,7)
@ 34,12 say "Total number of office call added .............. "+str(OFF_TOT,7)
@ 35,12 say "Total number of letter pages added ............. "+str(LTR_TOT,7)
@ 36,12 say "Total number of hospital stays added ........... "+str(HOS_TOT,7)
@ 38,12 say "Total number of EKGs added ..................... "+str(EKG_TOT,7)
@ 39,12 say "Total number of XRAYS added .................... "+str(XRY_TOT,7)
@ 40,12 say "Total number of ECHOs added .................... "+str(ECH_TOT,7)
@ 41,12 say "Total number of Cardiac Catherizations added ... "+str(CAR_TOT,7)
@ 42,12 say "Total number of Procedure/ Operations added .... "+str(PRO_TOT,7)

set DEVICE to screen

select A
use

return

