*************************************************************************
*																		*
* PALLEKG >>> Print all the procedures									*
*		   entry : RPRT:DATE											*
*		   exit :  None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

select B
use EKGTABLE index KTKPTR

store "EKG" + SUBSTR(RPRT_DATE,1,2)+SUBSTR(RPRT_DATE,4,2)+SUBSTR(RPRT_DATE,8,1)+".DBF" to FILE_NAME

if file(FILE_NAME)
	@ 13,15 say "Currently printing added EKG ..............   0 of   0"

	select A
	use &FILE_NAME

	goto bottom
	store RECNO() to TOT_EKG
	@ 13,66 say str(TOT_EKG,3)

	index on K_EKG_NBR to TEKGNBR

	set index to TEKGNBR

	goto top

	store 1 to PAGE
	store int(TOT_EKG/4) to TOT_PAGE
	if 4 * TOT_PAGE <> TOT_EKG
		store TOT_PAGE + 1 to TOT_PAGE
	endif

	set DEVICE to print

	eject
	@ 3,1 say "<<< EOD EKG report for " + RPRT_DATE + " <<<"
	@ 3,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)

	store 0 to EKG_LINE
	store 0 to RECORD

	select A

	do while .not. EOF()

		set DEVICE to screen
		store RECORD + 1 to RECORD
		@ 13,59 say str(RECORD,3)
		set DEVICE to print

		do READEKG

		select B

		@ EKG_LINE+5,1 say EKG_NBR
		@ EKG_LINE+5,20 say K_DATE
		@ EKG_LINE+5,30 say LOGON

		if RHYTHM = "00" .and. AXIS = "00"
			@ EKG_LINE+5,40 say "EKG is Normal"

		else
			@ EKG_LINE+5,40 say "EKG is Abnormal"

		endif

		store "RH" + SUBSTR(RHYTHM,1,2) to K_CODE

		seek K_CODE

		if .NOT. (EOF() .OR. BOF())
			store KT_K_DESC to K_DESC
			@ EKG_LINE+6,3 say "Rhythm >"
			@ EKG_LINE+6,12 say SUBSTR(K_DESC,1,25)

		else
			@ EKG_LINE+6,3 say "Rhythm >"

		endif

		store "AX" + SUBSTR(AXIS,1,2) to K_CODE

		seek K_CODE

		if .NOT. (EOF() .OR. BOF())
			store KT_K_DESC to K_DESC
			@ EKG_LINE+6,43 say "Axis >"
			@ EKG_LINE+6,50 say SUBSTR(K_DESC,1,25)

		else
			@ EKG_LINE+6,43 say "Axis >"

		endif

		store 5 to MAX_CNT
		store 0 to CUR_CNT
		store 0 to HIT
		@ EKG_LINE+7,3 say "Hypertrophy ->"

		do while HIT <> 1
			store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
			store 8 + int(CUR_CNT/2) to CUR_ROW

			store "HY" + SUBSTR(HYP,(CUR_CNT*2)+1,2) to K_PTR

			seek K_PTR

			if .NOT. (EOF() .OR. BOF())
				store KT_K_DESC to K_DESC
				@ EKG_LINE+CUR_ROW,CUR_COL-2 say ">"
				@ EKG_LINE+CUR_ROW,CUR_COL say K_DESC

				store CUR_CNT + 1 to CUR_CNT

				if CUR_CNT = MAX_CNT
					store 1 to HIT
				endif

			else
				@ EKG_LINE+CUR_ROW,CUR_COL-2 say ">"

				store CUR_CNT + 1 to CUR_CNT

				if CUR_CNT = MAX_CNT
					store 1 to HIT
				endif

			endif

		enddo

		store 5 to MAX_CNT
		store 0 to CUR_CNT
		store 0 to HIT
		@ EKG_LINE+11,3 say "Conduction Defects ->"

		do while HIT <> 1
			store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
			store 12 + int(CUR_CNT/2) to CUR_ROW

			store "CD" + SUBSTR(COND,(CUR_CNT*2)+1,2) to K_PTR

			seek K_PTR

			if .NOT. (EOF() .OR. BOF())
				store KT_K_DESC to K_DESC
				@ EKG_LINE+CUR_ROW,CUR_COL-2 say ">"
				@ EKG_LINE+CUR_ROW,CUR_COL say K_DESC

				store CUR_CNT + 1 to CUR_CNT

				if CUR_CNT = MAX_CNT
					store 1 to HIT
				endif

			else
				@ EKG_LINE+CUR_ROW,CUR_COL-2 say ">"

				store CUR_CNT + 1 to CUR_CNT

				if CUR_CNT = MAX_CNT
					store 1 to HIT
				endif

			endif

		enddo

		store 4 to MAX_CNT
		store 0 to CUR_CNT
		store 0 to HIT
		@ EKG_LINE+15,3 say "Metabolic ->"

		do while HIT <> 1
			store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
			store 16 + int(CUR_CNT/2) to CUR_ROW

			store "ME" + SUBSTR(META,(CUR_CNT*2)+1,2) to K_PTR

			seek K_PTR

			if .NOT. (EOF() .OR. BOF())
				store KT_K_DESC to K_DESC
				@ EKG_LINE+CUR_ROW,CUR_COL-2 say ">"
				@ EKG_LINE+CUR_ROW,CUR_COL say K_DESC

				store CUR_CNT + 1 to CUR_CNT

				if CUR_CNT = MAX_CNT
					store 1 to HIT
				endif

			else
				@ EKG_LINE+CUR_ROW,CUR_COL-2 say ">"

				store CUR_CNT + 1 to CUR_CNT

				if CUR_CNT = MAX_CNT
					store 1 to HIT
				endif

			endif

		enddo

		if EKG_LINE > 41
			store PAGE + 1 to PAGE

			if PAGE <= TOT_PAGE
				eject
				@ 3,1 say "<<< EOD EKG report for " + RPRT_DATE + " <<<"
				@ 3,65 say "Page " + str(PAGE,3) + " of " + str(TOT_PAGE,3)
				store 0 to EKG_LINE

			endif

		else
			store EKG_LINE + 14 to EKG_LINE

		endif

		select A

		skip

	enddo

	set DEVICE to screen

	select A
	use

	delete file TEKGNBR.NDX

else
	@ 13,15 say FILE_NAME + " is not found (already deleted or not created)."

endif

select B
use

select A

return


                                                                                 
