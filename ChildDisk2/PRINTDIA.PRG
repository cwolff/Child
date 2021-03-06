*************************************************************************
*																		*
* PRINTDIA >>> Print all the diagnoses for the selected patient 		*
*		   entry : None													*
*		   exit : DIA:SEL = T, diagnoses found							*
*				F, diagnoses not found									*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store DIA_NBR to S_DIA_NBR

store 1 to NBR_LINE
do CHKFF

@ CURR_LINE,1 say "<<< Patient's diagnostic information -------------<<<"

store CURR_LINE + 2 to CURR_LINE

store .T. to SCROLL

do while SCROLL
	store .T. to DESCRIPT
	do READDIA

	store 2 to NBR_LINE
	do CHKFF
	
	@ CURR_LINE,1 say DIA_NBR
	@ CURR_LINE,20 say D_CODE
	@ CURR_LINE,30 say D_DATE
	@ CURR_LINE,40 say LOGON

	@ CURR_LINE+1,3 say D_DESC
	
	store CURR_LINE + 3 to CURR_LINE

	store RECNO() to RECORD
	skip

	if (bof() .or. eof()) .or. D_DIA_NBR <> S_DIA_NBR .or. RECNO() = RECORD
		store .F. to SCROLL
	
	endif

enddo

store CURR_LINE + 1 to CURR_LINE

return

                                                                                                                         