*************************************************************************
*																		*
* PRINTSEL >>> Print the searched data of the patients data 			*
*		   entry : SEL:NBR = patient number of patient to print			*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

set DEVICE to print

store 0 to CURR_LINE
store 0 to NBR_LINE
do CHKFF

if file("PATIENT.DBF")
	select A
	use PATIENT index PATNBR

	store SEL_NBR to PAT_NBR
	seek PAT_NBR

	if .NOT. (EOF() .OR. BOF())
		do READPAT
		do PRINTPAT
	
	endif

endif

if .not. (S_D_CODE = "don't care")
	if file("DIAGNOSE.DBF")
		select A
		use DIAGNOSE index DIANBR

		store SEL_NBR to DIA_NBR
		seek DIA_NBR

		if .NOT. (EOF() .OR. BOF())
			do PRINTDIA
		
		endif
	
	endif

endif

if .not. (S_RHYTHM="don't care" .and. S_AXIS="don't care" .and. S_HYP="don't care" .and. S_COND="don't care" .and. S_META="don't care")
	if file("EKG.DBF")
		select A
		use EKG index EKGNBR

		store SEL_NBR to EKG_NBR
		seek EKG_NBR

		if .NOT. (EOF() .OR. BOF())
			do PRINTEKG
		
		endif
		
	endif

endif

if .not. (S_XRAY = "don't care")
	if file("XRAY.DBF")
		select A
		use XRAY index XRYNBR

		store SEL_NBR to XRY_NBR
		seek XRY_NBR

		if .NOT. (EOF() .OR. BOF())
			do PRINTXRY
		
		endif
		
	endif

endif

if .not. (S_M_MODE = "don't care" .and. S_TWO_D = "don't care" .and. S_DOPPLER = "don't care")
	if file("ECHO.DBF")
		select A
		use ECHO index ECHNBR

		store SEL_NBR to ECH_NBR
		seek ECH_NBR

		if .NOT. (EOF() .OR. BOF())
			do PRINTECH
		
		endif
		
	endif

endif

if .not. (S_QP_QS="don't care" .and. S_RP_RS="don't care" .and. S_RVP_LVP="don't care" .and. S_RVP_AOP="don't care" .and. S_GR="don't care")
	if file("CARDIAC.DBF")
		select A
		use CARDIAC index CARNBR

		store SEL_NBR to CAR_NBR
		seek CAR_NBR

		if .NOT. (EOF() .OR. BOF())
			do PRINTCAR
		
		endif
		
	endif

endif

if .not. (S_PRO = "don't care")
	if file("PROC.DBF")
		select A
		use PROC index PRONBR

		store SEL_NBR to PRO_NBR
		seek PRO_NBR

		if .NOT. (EOF() .OR. BOF())
			do PRINTPRO
		
		endif
		
	endif

endif

set DEVICE to screen

select A
use

return


                                                                                                                                            