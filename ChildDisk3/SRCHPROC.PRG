* Last revised : Sun 28-Feb-88 at 10:51 pm
*************************************************************************
*																		*
* SRCHPROC >>> Perform search of data base for values specified 		*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "Performing Selective Search" to HEAD
store "Search in progress" to L_TAIL
store "Do not distrub this process" to R_TAIL
do FRAME

store 19 to PMT_LINE
store "One moment please, recording search parameters." to PMT_MSG
do PROMPT

select A
use SRCHPARM

goto top

replace P_DATE with DTOC(date())

replace P_D_CODE with S_D_CODE
replace P_DIA_TOT with 0

replace P_AGE with S_AGE
replace P_AGE_TOT with 0

replace P_DIED with S_DIED
replace P_DIED_TOT with 0

replace P_STRT_M with S_STRT_M
replace P_STRT_Y with S_STRT_Y
replace P_END_M with S_END_M
replace P_END_Y with S_END_Y

replace P_QP_QS with S_QP_QS
replace P_RP_RS with S_RP_RS
replace P_RVP_LVP with S_RVP_LVP
replace P_RVP_AOP with S_RVP_AOP
replace P_GR with S_GR
replace P_CAR_TOT with 0

replace P_RHYTHM with S_RHYTHM
replace P_AXIS with S_AXIS
replace P_HYP with S_HYP
replace P_COND with S_COND
replace P_META with S_META
replace P_EKG_TOT with 0

replace P_XRAY with S_XRAY
replace P_XRY_TOT with 0

replace P_M_MODE with S_M_MODE
replace P_TWO_D with S_TWO_D
replace P_DOPPLER with S_DOPPLER
replace P_ECH_TOT with 0

replace P_PRO with S_PRO
replace P_PRO_TOT with 0

replace P_BRTH_TOT with 0

select A
use

store .T. to CHECK_AGE

store 5 to PMT_LINE
store "Performing Search on Child Data Base" to PMT_MSG
do PROMPT

*
* Retrieve all patients and birth dates
*

do SRCHAGE

*
* Check to see if diagnoses match
*

if S_D_CODE = "d/c"
	@ 8,15 say "Don't use, no search for diagnoses match."

else	
	do SRCHDIA

endif

*
* Check to see if patient died
*

if S_DIED = "d/c"
	@ 9,15 say "Don't use, no search for deceased match."

else
	do SRCHDIED

endif

*
* Check if cardiac cath is to be searched
*

store .T. to SEARCH
if S_QP_QS = "d/c"
	if S_RP_RS = "d/c"
		if S_RVP_LVP = "d/c"
		    if S_RVP_AOP = "d/c"
		        if S_GR = "d/c"
		            @ 11,15 say "Don't use, no search for cardiac cath. match."
		            store .F. to SEARCH
		        endif
		    endif
		endif
	endif
endif

if SEARCH
	do SRCHCAR
	store .F. to CHECK_AGE
endif

*
* Check if EKG is to be searched
*

store .T. to SEARCH

if S_RHYTHM = "d/c"
	if S_AXIS = "d/c"
		if S_HYP = "d/c"
		    if S_COND = "d/c"
		        if S_META = "d/c"
		            @ 12,15 say "Don't use, no search for EKG match."
		            store .F. to SEARCH
		        endif
		    endif
		endif
	endif
endif

if SEARCH
	do SRCHEKG
	store .F. to CHECK_AGE
endif

*
* Check if XRAY is to be searched
*

if S_XRAY = "d/c"
	@ 13,15 say "Don't use, no search for XRAY match."

else
	do SRCHXRY
	store .F. to CHECK_AGE

endif

*
* Check if echo is to be searched
*

store .T. to SEARCH

if S_M_MODE = "d/c"
	if S_TWO_D = "d/c"
		if S_DOPPLER = "d/c"
		    @ 14,15 say "Don't use, no search for ECHO match."
		    store .F. to SEARCH
		endif
	endif
endif

if SEARCH
	do SRCHECH
	store .F. to CHECK_AGE
endif

*
* Check if procedure is to be searched
*

if S_PRO = "d/c"
	@ 15,15 say "Don't use, no search for procedure match."

else
	do SRCHPRO
	store .F. to CHECK_AGE

endif
   
*
* Age was selected but no test were selected so take age from current date
*

if CHECK_AGE .and. S_AGE <> "d/c"
	do SRCHBRTH
endif

store 19 to STAT_LINE
store "Search of data base is finished" to STAT_MSG
do STATUS

return

