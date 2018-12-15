* Last revised : Sun 28-Feb-88 at 9:51 pm
*************************************************************************
*																		*
* SRCHDIA >>> Perform search of data base for values specified			*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store 19 to PMT_LINE
store "Searching for DIAGNOSES matches." to PMT_MSG
do PROMPT

select A
use DIAGNOSE index DIANBR

select B
use FOUNDPAT

store 0 to NBR_FND

@ 8,15 say "Number of diagnoses that matched ... "
@ 8,52 say str(NBR_FND,5)

goto top

set exact on

do while .not. (bof() .or. eof())
	store F_PAT_NBR + S_D_CODE to PAT_NBR
	store F_BIRTH to BIRTH_DATE
	
	select A
	seek PAT_NBR
	
	store .F. to HIT

	if .not. (eof() .or. bof())
		store substr(D_D_DATE,5,2) + substr(D_D_DATE,1,2) + substr(D_D_DATE,3,2) to TEST_DATE
		do AGE
		
		if PASS
            store substr(D_D_DATE,5,2) + substr(D_D_DATE,1,2) to CHK_RNGE
            do DATERNGE 
            if VLD_RNGE
                store NBR_FND + 1 to NBR_FND
			    @ 8,52 say str(NBR_FND,5)
				store .T. to HIT
		
            endif

		endif

	endif
		
    select B

	if .not. HIT
		store recno() to RECORD
		store str(RECORD,5) to DEL_RCD
		delete record &DEL_RCD
		
	endif
	
	skip

enddo

set exact off

select B
pack

select A
use

select B
use

select A
use FOUNDPAT

goto bottom
store recno() to DIA_TOT

select A
use

select A
use SRCHPARM

goto top
replace P_DIA_TOT with DIA_TOT

select A
use

return
