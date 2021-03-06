*************************************************************************
*																		*
* PRINTHOS >>> Print the hospital stay information for selected patient *
*		   entry : Positioned at first record of patient data			*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store HOS_NBR to S_HOS_NBR

store 1 to NBR_LINE
do CHKFF

@ CURR_LINE,1 say "<<< Patient's hospital stay information ----------<<<"

store CURR_LINE + 2 to CURR_LINE

store .T. to SCROLL

do while SCROLL
    do READHOS

    store 1 to NBR_LINE
	do CHKFF
	
	@ CURR_LINE,1 say HOS_NBR
    @ CURR_LINE,19 say H_DATE_A
    @ CURR_LINE,29 say H_DATE_D
    @ CURR_LINE,39 say H_CMNTS
    @ CURR_LINE,49 say H_DIED
    @ CURR_LINE,52 say H_ATPSY
    @ CURR_LINE,55 say LOGON

	store CURR_LINE + 2 to CURR_LINE
	
    store RECNO() to RECORD
    skip

    if (bof() .or. eof()) .or. H_HOS_NBR <> S_HOS_NBR .or. RECNO() = RECORD
        store .F. to SCROLL
    endif

enddo

store CURR_LINE + 1 to CURR_LINE

return

                                                                      