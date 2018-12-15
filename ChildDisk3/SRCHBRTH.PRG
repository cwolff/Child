* Last revised : Sun 28-Feb-88 at 5:32 pm
*************************************************************************
*																		*
* SRCHBRTH >>> Retrieve birth dates of patients 						*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store 19 to PMT_LINE
store "Searching for patient age matches." to PMT_MSG
do PROMPT

select A
use FOUNDPAT

store 0 to NBR_FND

@ 17,15 say "Number of patients with age match .. "
@ 17,52 say str(NBR_FND,5)

goto top

store DTOC(date()) to TODAY
store SUBSTR(TODAY,7,2) + SUBSTR(TODAY,1,2) + SUBSTR(TODAY,4,2) to PAT_AGE

do while .not. EOF()

	store F_BIRTH to BIRTH_DATE
	store PAT_AGE to TEST_DATE
	do AGE

	if PASS
		store NBR_FND + 1 to NBR_FND
		@ 17,52 say str(NBR_FND,5)
	else
		store RECNO() to RECORD
		store str(RECORD,5) to DEL_RCD
		delete record &DEL_RCD

	endif

	skip

enddo

pack

select A
use

select A
use FOUNDPAT

goto bottom
store RECNO() to BRTH_TOT

select A
use

select A
use SRCHPARM

goto top
replace P_BRTH_TOT with BRTH_TOT

select A
use

return
