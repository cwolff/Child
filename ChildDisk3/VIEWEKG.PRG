*************************************************************************
*																		*
* VIEWEKG >>> View the EKG information for selected patient				*
*		   entry : Position at first record of patient data 			*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

select B
use EKGTABLE index KTKPTR

store EKG_NBR to S_EKG_NBR

store .T. to SCROLL

select A

do while SCROLL
	do READEKG

	select B

	@ 5,1 say EKG_NBR
	@ 5,20 say K_DATE
	@ 5,30 say LOGON

	if RHYTHM = "00" .and. AXIS = "00"
		@ 5,40 say "EKG is Normal"

	else
		@ 5,40 say "EKG is Abnormal"

	endif

	store "RH" + SUBSTR(RHYTHM,1,2) to K_CODE

	seek K_CODE

	if .NOT. (EOF() .OR. BOF())
		store KT_K_DESC to K_DESC
		@ 6,3 say "Rhythm >"
		@ 6,12 say SUBSTR(K_DESC,1,25)

	else
		@ 6,3 say "Rhythm >"

	endif

	store "AX" + SUBSTR(AXIS,1,2) to K_CODE

	seek K_CODE

	if .NOT. (EOF() .OR. BOF())
		store KT_K_DESC to K_DESC
		@ 6,43 say "Axis >"
		@ 6,50 say SUBSTR(K_DESC,1,25)

	else
		@ 6,43 say "Axis >"

	endif

	store 5 to MAX_CNT
	store 0 to CUR_CNT
	store 0 to HIT
	@ 7,3 say "Hypertrophy ->"

	do while HIT <> 1
		store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
		store 8 + int(CUR_CNT/2) to CUR_ROW

		store "HY" + SUBSTR(HYP,(CUR_CNT*2)+1,2) to K_PTR

		seek K_PTR

		if .NOT. (EOF() .OR. BOF())
			store KT_K_DESC to K_DESC
			@ CUR_ROW,CUR_COL-2 say ">"
			@ CUR_ROW,CUR_COL say K_DESC

			store CUR_CNT + 1 to CUR_CNT

			if CUR_CNT = MAX_CNT
				store 1 to HIT
			endif

		else
			@ CUR_ROW,CUR_COL-2 say ">"

			store CUR_CNT + 1 to CUR_CNT

			if CUR_CNT = MAX_CNT
				store 1 to HIT
			endif

		endif

	enddo

	store 5 to MAX_CNT
	store 0 to CUR_CNT
	store 0 to HIT
	@ 11,3 say "Conduction Defects ->"

	do while HIT <> 1
		store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
		store 12 + int(CUR_CNT/2) to CUR_ROW

		store "CD" + SUBSTR(COND,(CUR_CNT*2)+1,2) to K_PTR

		seek K_PTR

		if .NOT. (EOF() .OR. BOF())
			store KT_K_DESC to K_DESC
			@ CUR_ROW,CUR_COL-2 say ">"
			@ CUR_ROW,CUR_COL say K_DESC

			store CUR_CNT + 1 to CUR_CNT

			if CUR_CNT = MAX_CNT
				store 1 to HIT
			endif

		else
			@ CUR_ROW,CUR_COL-2 say ">"

			store CUR_CNT + 1 to CUR_CNT

			if CUR_CNT = MAX_CNT
				store 1 to HIT
			endif

		endif

	enddo

	store 4 to MAX_CNT
	store 0 to CUR_CNT
	store 0 to HIT
	@ 15,3 say "Metabolic ->"

	do while HIT <> 1
		store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
		store 16 + int(CUR_CNT/2) to CUR_ROW

		store "ME" + SUBSTR(META,(CUR_CNT*2)+1,2) to K_PTR

		seek K_PTR

		if .NOT. (EOF() .OR. BOF())
			store KT_K_DESC to K_DESC
			@ CUR_ROW,CUR_COL-2 say ">"
			@ CUR_ROW,CUR_COL say K_DESC

			store CUR_CNT + 1 to CUR_CNT

			if CUR_CNT = MAX_CNT
				store 1 to HIT
			endif

		else
			@ CUR_ROW,CUR_COL-2 say ">"

			store CUR_CNT + 1 to CUR_CNT

			if CUR_CNT = MAX_CNT
				store 1 to HIT
			endif

		endif

	enddo

	store 19 to STAT_LINE
	store "Viewing patient's EKG information" to STAT_MSG
	do STATUS

	do CLRSCRN

	select A

	store RECNO() to RECORD
	skip

	if K_EKG_NBR <> S_EKG_NBR .or. RECNO() = RECORD
		store .F. to SCROLL
	endif

enddo

select B
use

select A

return


                                                                                           