* Last revised : Sun 28-Feb-88 at 9:15 pm
*************************************************************************
*																		*
* SRCHECHO >>> Perform search of data base for values specified 		*
*		   entry : S:QP:QS, S:RP:RS, S:RVP:LVP, S:RVP:AOP, S:GR			*
*		   exit : deletes patients who fail the test					*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store 19 to PMT_LINE
store "Searching for ECHO matches." to PMT_MSG
do PROMPT

select A
use ECHO index ECHNBR

select B
use FOUNDPAT

store 0 to NBR_FND

@ 14,15 say "Number of ECHOs matched ............ "
@ 14,52 say str(NBR_FND,5)

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
		    store SUBSTR(E_ECH_NBR,11,6) to TEST_DATE
		    do AGE

		    if PASS

		        if S_M_MODE = E_M_MODE .or. S_M_MODE = "dc/"
		            if S_TWO_D = E_TWO_D .or. S_TWO_D = "d/c"
		                if S_DOPPLER = E_DOPPLER .or. S_DOPPLER = "d/c"
                            store substr(E_ECH_NBR,11,4) to CHK_RNGE
                            do DATERNGE 
                            if VLD_RNGE
    			                 store NBR_FND + 1 to NBR_FND
	    		                 @ 14,52 say str(NBR_FND,5)
		    	                 store .T. to HIT
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
		        if E_ECH_NBR <> PAT_NBR .or. RECORD = RECNO()
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
store RECNO() to ECH_TOT

select A
use

select A
use SRCHPARM

replace P_ECH_TOT with ECH_TOT

select A
use

return
