*************************************************************************
*																		*
* PRINTECH >>> Print the ECHO for selected patient						*
*		   entry : Positioned at first record of ECHO data				*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store ECH_NBR to S_ECH_NBR

store 1 to NBR_LINE
do CHKFF

@ CURR_LINE,1 say "<<< Patient's ECHO information -------------------<<<"

store CURR_LINE + 2 to CURR_LINE

store .T. to SCROLL

do while SCROLL
	do READECH

	store 2 to NBR_LINE
	do CHKFF
	
	@ CURR_LINE,1 say ECH_NBR
	@ CURR_LINE,20 say E_DATE
	@ CURR_LINE,30 say LOGON
	@ CURR_LINE+1,3 say "m mode  = " + M_MODE
	@ CURR_LINE+1,28 say "2D      = " + TWO_D
	@ CURR_LINE+1,53 say "doppler = " + DOPPLER

	store CURR_LINE + 3 to CURR_LINE
	
	store RECNO() to RECORD
	skip

	if (bof() .or. eof()) .or. E_ECH_NBR <> S_ECH_NBR .or. RECNO() = RECORD
		store .F. to SCROLL

	endif

enddo

store CURR_LINE + 1 to CURR_LINE

return

                                                                                                                