* Last revised : Sun 28-Feb-88 at 9:15 pm
*************************************************************************
*																		*
* SRCHEKG >>> Perform search of data base for values specified			*
*		   entry : S:EKG												*
*		   exit : deletes patients who fail the test					*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store 19 to PMT_LINE
store "Searching for EKG matches." to PMT_MSG
do PROMPT

select A
use EKG index EKGNBR

select B
use FOUNDPAT

store 0 to NBR_FND

@ 12,15 say "Number of EKG's matched ............ "
@ 12,52 say str(NBR_FND,5)

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
		    store SUBSTR(K_EKG_NBR,11,6) to TEST_DATE
		    do AGE

		   if PASS
		       if S_RHYTHM = K_RHYTHM .or. S_RHYTHM = "d/c"
		           if S_AXIS = K_AXIS .or. S_AXIS = "d/c"
		               store S_HYP to CHECK
		               store K_HYP to VALUE
		               do CHECKIT
		               if OK
		                   store S_COND to CHECK
		                   store K_COND to VALUE
		                   do CHECKIT
		                   if OK
			                   store S_META to CHECK
			                   store K_META + "00" to VALUE
			                   do CHECKIT
			                   if OK
                                    store substr(K_EKG_NBR,11,4) to CHK_RNGE
                                    do DATERNGE 
                                    if VLD_RNGE
        			   	               store NBR_FND + 1 to NBR_FND
		    			               @ 12,52 say str(NBR_FND,5)
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
			    if K_EKG_NBR <> PAT_NBR .or. RECORD = RECNO()
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
store RECNO() to EKG_TOT

select A
use

select A
use SRCHPARM

goto top
replace P_EKG_TOT with EKG_TOT

select A
use

return
