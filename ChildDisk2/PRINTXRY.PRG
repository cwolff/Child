*************************************************************************
*																		*
* PRINTXRY >>> Print the hospital stay information for selected patient *
*		   entry : Positioned at first record of patient data			*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store XRY_NBR to S_XRY_NBR

store 1 to NBR_LINE
do CHKFF

@ CURR_LINE,1 say "<<< Patient's XRAY information -------------------<<<"

store CURR_LINE + 2 to CURR_LINE

store .T. to SCROLL
store 7 to STAT_LINE

do while SCROLL
	do READXRY

	store 1 to NBR_LINE
	do CHKFF
	
	@ CURR_LINE,1 say XRY_NBR
	@ CURR_LINE,20 say X_DATE
	@ CURR_LINE,30 say "xray = " + XRAY
	@ CURR_LINE,50 say LOGON

	store CURR_LINE + 2 to CURR_LINE
	
	store RECNO() to RECORD
	skip

	if (bof() .or. eof()) .or. X_XRY_NBR <> S_XRY_NBR .or. RECNO() = RECORD
		store .F. to SCROLL

	endif

enddo

store CURR_LINE + 1 to CURR_LINE

return

                                                                                                                                                                        