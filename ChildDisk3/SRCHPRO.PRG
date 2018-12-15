* Last revised : Sun 28-Feb-88 at 9:16 pm
*************************************************************************
*																		*
* SRCHPRO >>> Perform search of data base for values specified			*
*		   entry : S:PRO												*
*		   exit : deletes patients who fail the test					*
*																		*
* (C)opyright 1884 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store 19 to PMT_LINE
store "Searching for procedure matches." to PMT_MSG
do PROMPT

set exact off

select A
use PROC index PRONBR

select B
use FOUNDPAT

store 0 to NBR_FND

@ 15,15 say "Number of procedures that matched . "
@ 15,52 say str(NBR_FND,5)

goto top

do while .not. EOF()
	store F_PAT_NBR to PAT_NBR
	store F_BIRTH to BIRTH_DATE

	select A
	seek PAT_NBR

	store .F. to HIT

	if .NOT. (EOF() .OR. BOF())
		store .T. to SAME

		do while SAME
		    store SUBSTR(R_PRO_NBR,11,6) to TEST_DATE
		    do AGE

		    if PASS

		        if trim(S_PRO) = trim(SUBSTR(R_PRO_NBR,17,5))
                    store substr(R_PRO_NBR,11,4) to CHK_RNGE
                    do DATERNGE 
                    if VLD_RNGE
		                store NBR_FND + 1 to NBR_FND
		                @ 15,52 say str(NBR_FND,5)
		                store .T. to HIT
                    endif
		        endif

		    endif
	 
		    store RECNO() to RECORD

		    skip

		    if HIT
		        store .F. to SAME

		    else
		        if R_PRO_NBR <> PAT_NBR .or. RECORD = RECNO()
		            store .F. to SAME

		        endif

		    endif

		enddo

	endif

	select B

	if .not. HIT
		store RECNO() to RECORD
		store str(RECORD,5) to DEL_RCD
		delete record &DEL_RCD

	endif

	skip

enddo

select B
pack

select A
use
select B
use

select A
use FOUNDPAT

goto bottom
store RECNO() to PRO_TOT

select A
use

select A
use SRCHPARM

goto top
replace P_PRO_TOT with PRO_TOT

select A
use

return
