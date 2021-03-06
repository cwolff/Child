*************************************************************************
*																		*
* PRINTOFF >>> Print office call information for selected patient		*
*		   entry : Positioned at first record of patient data			*
*		   exit : DIA:SEL = None										*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store OFF_NBR to S_OFF_NBR

store 1 to NBR_LINE
do CHKFF

@ CURR_LINE,1 say "<<< Patient's office call information ------------<<<"

store CURR_LINE + 2 to CURR_LINE

store .T. to SCROLL

do while SCROLL
	do READOFF

	store 1 to NBR_LINE
	do CHKFF
	
	@ CURR_LINE,1 say OFF_NBR
	@ CURR_LINE,20 say O_DATE
	@ CURR_LINE,30 say LOGON

	store CURR_LINE + 2 to CURR_LINE

	store RECNO() to RECORD
	skip

	if (bof() .or. eof()) .or. O_OFF_NBR <> S_OFF_NBR .or. RECNO() = RECORD
		store .F. to SCROLL
	endif

enddo

store CURR_LINE + 1 to CURR_LINE

return

                                                                                                                                                                                                                                     