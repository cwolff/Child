* Last revised : Sun 28-Feb-88 at 9:14 pm
*************************************************************************
*																		*
* SRCHCAR >>> Perform search of data base for values specified			*
*		   entry : S:QP:QS, S:RP:RS, S:RVP:LVP, S:RVP:AOP, S:GR			*
*		   exit : deletes patients who fail the test					*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store 19 to PMT_LINE
store "Searching for cardiac cath. matches." to PMT_MSG
do PROMPT

set exact off

select A
use CARDIAC index CARNBR

select B
use FOUNDPAT

store 0 to NBR_FND

@ 11,15 say "Number of cardiac caths. matched ... "
@ 11,52 say str(NBR_FND,5)

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
		    store SUBSTR(C_CAR_NBR,11,6) to TEST_DATE
		    do AGE

		    if PASS

		        if S_QP_QS = C_QP_QS .or. S_QP_QS = "d/c"
		            if S_RP_RS = C_RP_RS .or. S_RP_RS = "d/c"
		                if S_RVP_LVP = C_RVP_LVP .or. S_RVP_LVP = "d/c"
			                if S_RVP_AOP = C_RVP_AOP .or. S_RVP_AOP = "d/c"
				                if S_GR = C_GR .or. S_GR = "d/c"
                                    store substr(C_CAR_NBR,11,4) to CHK_RNGE
                                    do DATERNGE 
                                    if VLD_RNGE
    					                store NBR_FND + 1 to NBR_FND
	    				                @ 11,52 say str(NBR_FND,5)
		    			                store .T. to HIT
                                    endif

				                endif
			                endif
		                endif
				    endif
			    endif
		    endif
	 
		    store RECNO() to RECORD

		    skip

		    if HIT
		        store .F. to SAME

		    else
		        if C_CAR_NBR <> PAT_NBR .or. RECORD = RECNO()
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
store RECNO() to CAR_TOT

select A
use

select A
use SRCHPARM

goto top
replace P_CAR_TOT with CAR_TOT

select A
use

return
