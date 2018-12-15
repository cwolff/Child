* Last revised : Sun 28-Feb-88 at 6:02 pm
*************************************************************************
*																		*
* AGE >>> Determines if the date of the test falls within the age group *
*			 entry : S:AGE TEST:DATE, BIRTH:DATE						*
*			 exit : PASS = T or F										*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************

store val(SUBSTR(TEST_DATE,1,2)) * 12 to TEST_MNTH
store val(SUBSTR(TEST_DATE,3,2)) + TEST_MNTH to TEST_MNTH

store val(SUBSTR(BIRTH_DATE,1,2)) * 12 to BIRTH_MNTH
store val(SUBSTR(BIRTH_DATE,3,2)) + BIRTH_MNTH to BIRTH_MNTH

if val(SUBSTR(TEST_DATE,5,2)) < val(SUBSTR(BIRTH_DATE,5,2))
	store TEST_MNTH - 1 to TEST_MNTH

endif

store TEST_MNTH - BIRTH_MNTH to SEL_MNTH

if S_AGE = "d/c"
	store .T. to PASS

else
	do case

		case SEL_MNTH >= 120
			store "8" to T_AGE

		case SEL_MNTH >= 60
			store "7" to T_AGE

		case SEL_MNTH >= 24
			store "6" to T_AGE

		case SEL_MNTH >= 12
			store "5" to T_AGE

		case SEL_MNTH >= 6
			store "4" to T_AGE

		case SEL_MNTH >= 3
			store "3" to T_AGE

		case SEL_MNTH >= 1
			store "2" to T_AGE

		case SEL_MNTH >= 0
			store "1" to T_AGE

	endcase

	if T_AGE = S_AGE
		store .T. to PASS
	else
		store .F. to PASS

	endif

endif

return
