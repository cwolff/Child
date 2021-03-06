*************************************************************************
*																		*
* VIEWXRY >>> View the XRAY information for selected patient			*
*		   entry : Position at first record of patient data 			*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store XRY_NBR to S_XRY_NBR

@ 5,1 say "<<< Patient's XRAY information <<<"
store 7 to XRY_LINE

store .T. to SCROLL
store 7 to STAT_LINE

do while SCROLL
	do READXRY

	@ XRY_LINE,1 say XRY_NBR
	@ XRY_LINE,20 say X_DATE
	@ XRY_LINE,30 say LOGON
	@ XRY_LINE,40 say "xray = " + XRAY

	if XRY_LINE > 16
		store 19 to STAT_LINE
		store "Viewing patient's XRAY information" to STAT_MSG
		do STATUS

		do CLRSCRN

		@ 5,5 say "<<< Patient's XRAY information <<<"
		store 7 to XRY_LINE

	else
		store XRY_LINE + 1 to XRY_LINE

	endif

	store RECNO() to RECORD
	skip

	if X_XRY_NBR <> S_XRY_NBR .or. RECNO() = RECORD
		if XRY_LINE <> 7
			store 19 to STAT_LINE
			store "Patient's XRAY information" to STAT_MSG
			do STATUS
		
		endif
		
		store .F. to SCROLL
	
	endif

enddo

return

 