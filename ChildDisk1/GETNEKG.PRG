*************************************************************************
*																		*
* GETNEKG >>> Get a blank record from the screen which the user added	*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

@ 15,5 say "Was the EKG normal or adnormal?"

store 19 to PMT_LINE
store "1) Normal EKG  2) Abnormal EKG" to PMT_MSG
do PROMPT

store 2 to CHOICE
do GETKEY

@ 19,0

if CHOICE = 1
	@ 15,37 say "normal"

	store "00" to RHYTHM
	store "00" to AXIS
	store "0000000000" to HYP
	store "0000000000" to COND
	store "00000000" to META

else
	do CLRSCRN
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
	use EKGTABLE index KTKCODE

	store 0 to HIT

	do while HIT <> 1
		store "     " to K_CODE
		@ 6,12 get K_CODE

		set confirm on
		read
		set confirm off
		clear gets

		store "RH" + trim(UPPER(K_CODE)) to K_CODE

		seek K_CODE

		if .NOT. (EOF() .OR. BOF())
			store KT_K_DESC to K_DESC
			@ 6,12 say "                         "
			@ 6,12 say SUBSTR(K_DESC,1,25)

			store 19 to PMT_LINE
			store "1) Correct RHYTHM  2) Incorrect RHYTHM" to PMT_MSG
			do PROMPT

			store 2 to CHOICE
			do GETKEY

			@ 19,0

			if CHOICE = 1
				store SUBSTR(KT_K_PTR,3,2) to RHYTHM
				store 1 to HIT

			else
				@ 6,12 say "                         "

			endif

		else
			store 19 to STAT_LINE
			store "SORRY : Unable to find RHYTHM code" to STAT_MSG
			do STATUS

			@ 6,12 say "                         "

		endif

	enddo

	store 0 to HIT

	do while HIT <> 1
		store "     " to K_CODE
		@ 6,50 get K_CODE

		set confirm on
		read
		set confirm off
		clear gets

		store "AX" + trim(UPPER(K_CODE)) to K_CODE

		seek K_CODE

		if .NOT. (EOF() .OR. BOF())
			store KT_K_DESC to K_DESC
			@ 6,50 say "                         "
			@ 6,50 say SUBSTR(K_DESC,1,25)

			store 19 to PMT_LINE
			store "1) Correct AXIS  2) Incorrect AXIS" to PMT_MSG
			do PROMPT

			store 2 to CHOICE
			do GETKEY

			@ 19,0

			if CHOICE = 1
				store SUBSTR(KT_K_PTR,3,2) to AXIS
				store 1 to HIT

			else
				@ 6,50 say "                         "

			endif

		else
			store 19 to STAT_LINE
			store "SORRY : Unable to find AXIS code" to STAT_MSG
			do STATUS

			@ 6,50 say "                         "

		endif

	enddo

	store "0000000000" to HYP
	store 5 to MAX_CNT
	store 0 to CUR_CNT
	store 0 to HIT

	do while HIT <> 1
		store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
		store 8 + int(CUR_CNT/2) to CUR_ROW
		store "     " to K_CODE
		@ CUR_ROW,CUR_COL get K_CODE

		set confirm on
		read
		set confirm off
		clear gets

		if K_CODE <> '0'
			store "HY" + trim(UPPER(K_CODE)) to K_CODE

			seek K_CODE

			if .NOT. (EOF() .OR. BOF())
				store KT_K_DESC to K_DESC
				@ CUR_ROW,CUR_COL say "                                 "
				@ CUR_ROW,CUR_COL say K_DESC

				store 19 to PMT_LINE
				store "1) Correct code  2) Incorrect code" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store CUR_CNT + 1 to CUR_CNT

					if CUR_CNT = 1
						store SUBSTR(KT_K_PTR,3,2) to HYP

					else
						store HYP + SUBSTR(KT_K_PTR,3,2) to HYP

					endif

					if CUR_CNT = MAX_CNT
						store 1 to HIT

					endif

				else
					@ CUR_ROW,CUR_COL say "                                 "

				endif

			else
				store 19 to STAT_LINE
				store "SORRY : Unable to find HYP. code" to STAT_MSG
				do STATUS

				@ CUR_ROW,CUR_COL say "                                 "

			endif

		else
			if CUR_CNT <> 0
				store HYP + SUBSTR("0000000000",(CUR_CNT*2)+1,10-(CUR_CNT*2)) to HYP
			endif
			@ CUR_ROW,CUR_COL say "                                 "
			store 1 to HIT

		endif

	enddo

	store "0000000000" to COND
	store 5 to MAX_CNT
	store 0 to CUR_CNT
	store 0 to HIT

	do while HIT <> 1
		store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
		store 12 + int(CUR_CNT/2) to CUR_ROW
		store "     " to K_CODE
		@ CUR_ROW,CUR_COL get K_CODE

		set confirm on
		read
		set confirm off
		clear gets

		if K_CODE <> '0'
			store "CD" + trim(UPPER(K_CODE)) to K_CODE

			seek K_CODE

			if .NOT. (EOF() .OR. BOF())
				store KT_K_DESC to K_DESC
				@ CUR_ROW,CUR_COL say "                                 "
				@ CUR_ROW,CUR_COL say K_DESC

				store 19 to PMT_LINE
				store "1) Correct code  2) Incorrect code" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store CUR_CNT + 1 to CUR_CNT

					if CUR_CNT = 1
						store SUBSTR(KT_K_PTR,3,2) to COND

					else
						store COND + SUBSTR(KT_K_PTR,3,2) to COND

					endif

					if CUR_CNT = MAX_CNT
						store 1 to HIT

					endif

				else
					@ CUR_ROW,CUR_COL say "                                 "

				endif

			else
				store 19 to STAT_LINE
				store "SORRY : Unable to find C. D. code" to STAT_MSG
				do STATUS

				@ CUR_ROW,CUR_COL say "                                 "

			endif

		else
			if CUR_CNT <> 0
				store COND + SUBSTR("0000000000",(CUR_CNT*2)+1,10-(CUR_CNT*2)) to COND
			endif
			@ CUR_ROW,CUR_COL say "                                 "
			store 1 to HIT

		endif

	enddo

	store "0000000000" to META
	store 4 to MAX_CNT
	store 0 to CUR_CNT
	store 0 to HIT

	do while HIT <> 1
		store ((CUR_CNT-(int(CUR_CNT/2)*2))*40) + 6 to CUR_COL
		store 16 + int(CUR_CNT/2) to CUR_ROW
		store "     " to K_CODE
		@ CUR_ROW,CUR_COL get K_CODE

		set confirm on
		read
		set confirm off
		clear gets

		if K_CODE <> '0'
			store "ME" + trim(UPPER(K_CODE)) to K_CODE

			seek K_CODE

			if .NOT. (EOF() .OR. BOF())
				store KT_K_DESC to K_DESC
				@ CUR_ROW,CUR_COL say "                                 "
				@ CUR_ROW,CUR_COL say K_DESC

				store 19 to PMT_LINE
				store "1) Correct code  2) Incorrect code" to PMT_MSG
				do PROMPT

				store 2 to CHOICE
				do GETKEY

				@ 19,0

				if CHOICE = 1
					store CUR_CNT + 1 to CUR_CNT

					if CUR_CNT = 1
						store SUBSTR(KT_K_PTR,3,2) to META

					else
						store META + SUBSTR(KT_K_PTR,3,2) to META

					endif

					if CUR_CNT = MAX_CNT
						store 1 to HIT

					endif

				else
					@ CUR_ROW,CUR_COL say "                                 "

				endif

			else
				store 19 to STAT_LINE
				store "SORRY : Unable to find META. code" to STAT_MSG
				do STATUS

				@ CUR_ROW,CUR_COL say "                                 "

			endif

		else
			if CUR_CNT <> 0
				store META + SUBSTR("0000000000",(CUR_CNT*2)+1,10-(CUR_CNT*2)) to META
			endif
			@ CUR_ROW,CUR_COL say "                                 "
			store 1 to HIT

		endif

	enddo

endif

select B
use

select A

return


                                                   