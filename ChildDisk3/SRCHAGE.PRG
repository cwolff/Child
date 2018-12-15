* Last revised : Sun 28-Feb-88 at 5:25 pm
*************************************************************************
*																		*
* SRCHAGE >>> Retrieve birth dates of patients							*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

*
* Get patients birth date from PATIENT.DBF
*

store 19 to PMT_LINE
store "Retrieving patients data." to PMT_MSG
do PROMPT

*
* Clean up FOUNDPAT
*

select A
use PATIENT

goto bottom
store recno() to TOTAL

select B
use FOUNDPAT

zap

store 0 to NBR_FND

@ 7,15 say "Number of patients retrieved. .......... "
@ 7,56 say str(NBR_FND,5) + " of " + str(TOTAL,5)

select A
goto top

do while .not. (bof() .or. eof())
	store P_PAT_NBR to PAT_NBR
	store P_LST_N to LST_N
	store P_FST_N to FST_N
	store SUBSTR(P_BIRTH,5,2) + SUBSTR(P_BIRTH,1,2) + SUBSTR(P_BIRTH,3,2) to BIRTH

	select B

	store NBR_FND + 1 to NBR_FND
	@ 7,56 say str(NBR_FND,5)

	append blank
	replace F_PAT_NBR with PAT_NBR
	replace F_LST_N with LST_N
	replace F_FST_N with FST_N
	replace F_BIRTH with BIRTH
	
	select A

	skip

enddo

select A
use
select B
use

select A
use FOUNDPAT

goto bottom
store RECNO() to AGE_TOT

select A
use

select A
use SRCHPARM

goto top
replace P_AGE_TOT with AGE_TOT

select A
use

return
