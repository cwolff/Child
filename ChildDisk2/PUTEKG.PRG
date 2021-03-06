*************************************************************************
*																		*
* PITEKG >>> Put a current record to the screen 						*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

@ 5,1 say EKG_NBR
@ 5,20 say K_DATE
@ 5,30 say USER_LOGON
@ 6,3 say "Rhythm >                                Axis > "
@ 7,3 say "Hypertrophy ->"
@ 8,4 say ">                                       >"
@ 9,4 say ">                                       >"
@ 10,4 say ">"
@ 11,3 say "Conduction Defects ->"
@ 12,4 say ">                                       >"
@ 13,4 say ">                                       >"
@ 14,4 say ">"
@ 15,3 say "Metabolic ->"
@ 16,4 say ">                                       >"
@ 17,4 say ">                                       >"

select B
use EKGTABLE index KTKPTR

store "RH" + SUBSTR(RHYTHM,1,2) to K_CODE

seek K_CODE

if .NOT. (EOF() .OR. BOF())
	store KT_K_DESC to K_DESC
	@ 6,12 say SUBSTR(K_DESC,1,25)

endif

store "AX" + SUBSTR(AXIS,1,2) to K_CODE

seek K_CODE

if .NOT. (EOF() .OR. BOF())
	store KT_K_DESC to K_DESC
	@ 6,50 say SUBSTR(K_DESC,1,25)

endif

store 5 to MAX_CNT
store 0 to CUR_CNT
store 0 to HIT

do while HIT <> 1
	store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
	store 8 + int(CUR_CNT/2) to CUR_ROW

	store "HY" + SUBSTR(HYP,(CUR_CNT*2)+1,2) to K_PTR

	seek K_PTR

	if .NOT. (EOF() .OR. BOF())
		store KT_K_DESC to K_DESC
		@ CUR_ROW,CUR_COL say K_DESC

		store CUR_CNT + 1 to CUR_CNT

		if CUR_CNT = MAX_CNT
			store 1 to HIT
		endif

	else
		store 1 to HIT

	endif

enddo

store 5 to MAX_CNT
store 0 to CUR_CNT
store 0 to HIT

do while HIT <> 1
	store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
	store 12 + int(CUR_CNT/2) to CUR_ROW

	store "CD" + SUBSTR(COND,(CUR_CNT*2)+1,2) to K_PTR

	seek K_PTR

	if .NOT. (EOF() .OR. BOF())
		store KT_K_DESC to K_DESC
		@ CUR_ROW,CUR_COL say K_DESC

		store CUR_CNT + 1 to CUR_CNT

		if CUR_CNT = MAX_CNT
			store 1 to HIT
		endif

	else
		store 1 to HIT

	endif

enddo

store 4 to MAX_CNT
store 0 to CUR_CNT
store 0 to HIT

do while HIT <> 1
	store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
	store 16 + int(CUR_CNT/2) to CUR_ROW

	store "ME" + SUBSTR(META,(CUR_CNT*2)+1,2) to K_PTR

	seek K_PTR

	if .NOT. (EOF() .OR. BOF())
		store KT_K_DESC to K_DESC
		@ CUR_ROW,CUR_COL say K_DESC

		store CUR_CNT + 1 to CUR_CNT

		if CUR_CNT = MAX_CNT
			store 1 to HIT
		endif

	else
		store 1 to HIT

	endif

enddo

select B
use

select A

return


                                                                                                                                                                                                                                                        