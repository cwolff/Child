*************************************************************************
*																		*
* PRINTEKG >>> Print all the diagnoses for the selected patient 		*
*		   entry : None													*
*		   exit : EKG:SEL = T, diagnoses found							*
*				F, diagnoses not found									*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

select B
use EKGTABLE index KTKPTR

store EKG_NBR to S_EKG_NBR

store 1 to NBR_LINE
do CHKFF

@ CURR_LINE,1 say "<<< Patient's EKG information --------------------<<<"

store CURR_LINE + 2 to CURR_LINE

store .T. to SCROLL

select A

do while SCROLL

	do READEKG

	select B
	
	store 12 to NBR_LINE
	do CHKFF

	@ CURR_LINE,1 say EKG_NBR
	@ CURR_LINE,20 say K_DATE

	if RHYTHM = "00" .and. AXIS = "00"
		@ CURR_LINE,30 say "EKG is Normal"

	else
		@ CURR_LINE,30 say "EKG is Abnormal"

	endif

	@ CURR_LINE,50 say LOGON

	store "RH" + SUBSTR(RHYTHM,1,2) to K_CODE

	seek K_CODE

	if .NOT. (EOF() .OR. BOF())
		store KT_K_DESC to K_DESC
		@ CURR_LINE+1,3 say "Rhythm >"
		@ CURR_LINE+1,12 say SUBSTR(K_DESC,1,25)

	else
		@ CURR_LINE+1,3 say "Rhythm >"

	endif

	store "AX" + SUBSTR(AXIS,1,2) to K_CODE

	seek K_CODE

	if .NOT. (EOF() .OR. BOF())
		store KT_K_DESC to K_DESC
		@ CURR_LINE+1,43 say "Axis >"
		@ CURR_LINE+1,50 say SUBSTR(K_DESC,1,25)

	else
		@ CURR_LINE+1,43 say "Axis >"

	endif

	store 5 to MAX_CNT
	store 0 to CUR_CNT
	store 0 to HIT
	@ CURR_LINE+2,3 say "Hypertrophy ->"

	do while HIT <> 1
		store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
		store 3 + int(CUR_CNT/2) to CUR_ROW

		store "HY" + SUBSTR(HYP,(CUR_CNT*2)+1,2) to K_PTR

		seek K_PTR

		if .NOT. (EOF() .OR. BOF())
			store KT_K_DESC to K_DESC
			@ CURR_LINE+CUR_ROW,CUR_COL-2 say ">"
			@ CURR_LINE+CUR_ROW,CUR_COL say K_DESC

			store CUR_CNT + 1 to CUR_CNT

			if CUR_CNT = MAX_CNT
				store 1 to HIT
			endif

		else
			@ CURR_LINE+CUR_ROW,CUR_COL-2 say ">"

			store CUR_CNT + 1 to CUR_CNT

			if CUR_CNT = MAX_CNT
				store 1 to HIT
			endif

		endif

	enddo

	store 5 to MAX_CNT
	store 0 to CUR_CNT
	store 0 to HIT
	@ CURR_LINE+6,3 say "Conduction Defects ->"

	do while HIT <> 1
		store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
		store 7 + int(CUR_CNT/2) to CUR_ROW

		store "CD" + SUBSTR(COND,(CUR_CNT*2)+1,2) to K_PTR

		seek K_PTR

		if .NOT. (EOF() .OR. BOF())
			store KT_K_DESC to K_DESC
			@ CURR_LINE+CUR_ROW,CUR_COL-2 say ">"
			@ CURR_LINE+CUR_ROW,CUR_COL say K_DESC

			store CUR_CNT + 1 to CUR_CNT

			if CUR_CNT = MAX_CNT
				store 1 to HIT
			endif

		else
			@ CURR_LINE+CUR_ROW,CUR_COL-2 say ">"

			store CUR_CNT + 1 to CUR_CNT

			if CUR_CNT = MAX_CNT
				store 1 to HIT
			endif

		endif

	enddo

	store 4 to MAX_CNT
	store 0 to CUR_CNT
	store 0 to HIT
	@ CURR_LINE+10,3 say "Metabolic ->"

	do while HIT <> 1
		store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
		store 11 + int(CUR_CNT/2) to CUR_ROW

		store "ME" + SUBSTR(META,(CUR_CNT*2)+1,2) to K_PTR

		seek K_PTR

		if .NOT. (EOF() .OR. BOF())
			store KT_K_DESC to K_DESC
			@ CURR_LINE+CUR_ROW,CUR_COL-2 say ">"
			@ CURR_LINE+CUR_ROW,CUR_COL say K_DESC

			store CUR_CNT + 1 to CUR_CNT

			if CUR_CNT = MAX_CNT
				store 1 to HIT
			endif

		else
			@ CURR_LINE+CUR_ROW,CUR_COL-2 say ">"

			store CUR_CNT + 1 to CUR_CNT

			if CUR_CNT = MAX_CNT
				store 1 to HIT
			endif

		endif

	enddo

	store CURR_LINE + 14 to CURR_LINE
	
	select A

	store RECNO() to RECORD
	skip

	if (bof() .or. eof()) .or. K_EKG_NBR <> S_EKG_NBR .or. RECNO() = RECORD
		store .F. to SCROLL

	endif

enddo

store CURR_LINE + 1 to CURR_LINE

select B
use

select A

return

                                                                                                                                                                               