*************************************************************************
*																		*
* VIEWADV >>> View all the consulting (advice) information for selected *
*			  patient 													*
*		   entry : Positioned at first record of patient data			*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store ADV_NBR to S_ADV_NBR

@ 5,1 say "<<< Patient's consulting information <<<"
store 7 to ADV_LINE

store .T. to SCROLL
store 7 to STAT_LINE

do while SCROLL
	store .T. to DESCRIPT
	do READADV

	@ ADV_LINE,1 say ADV_NBR
	@ ADV_LINE,20 say A_DATE
	@ ADV_LINE,30 say A_CHG_NO
	@ ADV_LINE,40 say A_MD
	@ ADV_LINE,45 say LOGON

	@ ADV_LINE+1,1 say A_DESC

	if ADV_LINE > 16
		store 19 to STAT_LINE
		store "Viewing patient's consulting information" to STAT_MSG
		do STATUS

		do CLRSCRN

		@ 5,5 say "<<< Patient's consulting information <<<"
		store 7 to ADV_LINE

	else
		store ADV_LINE + 2 to ADV_LINE

	endif

	store RECNO() to RECORD
	skip

	if A_ADV_NBR <> S_ADV_NBR .or. RECNO() = RECORD
		if ADV_LINE <> 7
			store 19 to STAT_LINE
			store "Patient's consulting information" to STAT_MSG
			do STATUS
		endif
		store .F. to SCROLL
	endif

enddo

return
