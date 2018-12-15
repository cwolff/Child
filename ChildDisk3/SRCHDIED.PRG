* Last revised : Sun 28-Feb-88 at 6:34 pm
*************************************************************************
*																		*
* SRCHDIED >>> Perform search of data base for values specified 		*
*		   entry : S:DIED												*
*		   exit : deletes patients who fail the test					*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store 19 to PMT_LINE
store "Searching for deceased matches." to PMT_MSG
do PROMPT

select A
use HOSPITAL index HOSNBR

select B
use FOUNDPAT

store 0 to NBR_FND

@ 9,15 say "Number of deceased that matched .... "
@ 9,52 say str(NBR_FND,5)

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
		    if S_DIED = H_H_DIED
		        store NBR_FND + 1 to NBR_FND
		        @ 9,52 say str(NBR_FND,5)
		        store .T. to HIT
		    endif

		    store RECNO() to RECORD

		    skip

		    if HIT
		        store .F. to SAME

		    else
		        if H_HOS_NBR <> PAT_NBR .or. RECORD = RECNO()
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
store RECNO() to DIED_TOT

select A
use

select A
use SRCHPARM

goto top
replace P_DIED_TOT with DIED_TOT

select A
use

return
