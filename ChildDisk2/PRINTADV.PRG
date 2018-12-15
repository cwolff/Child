*************************************************************************
*																		*
* PRINTADV >>> Print consulting (advice) information for selected		*
*			   patient													*
*		   entry : Positioned at first record of patient data			*
*		   exit : DIA:SEL = None										*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store ADV_NBR to S_ADV_NBR

store 1 to NBR_LINE
do CHKFF

@ CURR_LINE,1 say "<<< Patient's consulting information ------------<<<"

store CURR_LINE + 2 to CURR_LINE

store .T. to SCROLL

do while SCROLL
	store .T. to DESCRIPT
	do READADV

	store 2 to NBR_LINE
	do CHKFF
	
	@ CURR_LINE,1 say ADV_NBR
	@ CURR_LINE,20 say A_DATE
	@ CURR_LINE,30 say A_CHG_NO
	@ CURR_LINE,40 say A_MD
	@ CURR_LINE,45 say LOGON

	@ CURR_LINE+1,1 say A_DESC

	store CURR_LINE + 2 to CURR_LINE

	store RECNO() to RECORD
	skip

	if (bof() .or. eof()) .or. A_ADV_NBR <> S_ADV_NBR .or. RECNO() = RECORD
		store .F. to SCROLL
	endif

enddo

store CURR_LINE + 2 to CURR_LINE

return
