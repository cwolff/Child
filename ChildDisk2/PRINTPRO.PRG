*************************************************************************
*																		*
* PRINTPRO >>> Print all the diagnoses for the selected patient 		*
*		   entry : None													*
*		   exit : PRO:SEL = T, diagnoses found							*
*				F, diagnoses not found									*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store PRO_NBR to S_PRO_NBR

store 1 to NBR_LINE
do CHKFF

@ CURR_LINE,1 say "<<< Patient's procedure information --------------<<<"

store CURR_LINE + 1 to CURR_LINE

store .T. to SCROLL

do while SCROLL
	store .T. to DESCRIPT
	do READPRO

	store 2 to NBR_LINE
	do CHKFF
	
	@ CURR_LINE,1 say PRO_NBR
	@ CURR_LINE,30 say P_DATE
	@ CURR_LINE,40 say P_CODE
	@ CURR_LINE,50 say LOGON

	@ CURR_LINE+1,3 say P_DESC
	
	store CURR_LINE + 3 to CURR_LINE

	store RECNO() to RECORD
	skip

	if (bof() .or. eof()) .or. R_PRO_NBR <> S_PRO_NBR .or. RECNO() = RECORD
		store .F. to SCROLL

	endif

enddo

store CURR_LINE + 1 to CURR_LINE

return

                                                                                                                          