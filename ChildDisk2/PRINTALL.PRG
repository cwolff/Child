*************************************************************************
*																		*
* PRINTALL >>> Put the all of the patients data 						*
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

if file("DIAGNOSE.DBF")
	select A
	use DIAGNOSE index DIANBR

	store SEL_NBR to DIA_NBR
	seek DIA_NBR

	if .NOT. (EOF() .OR. BOF())
		do PRINTDIA
	
	endif

endif

if file("OFFICE.DBF")
	select A
	use OFFICE index OFFNBR

	store SEL_NBR to OFF_NBR
	seek OFF_NBR

	if .NOT. (EOF() .OR. BOF())
		do PRINTOFF
	
	endif

endif

if file("HOSPITAL.DBF")
	select A
	use HOSPITAL index HOSNBR

	store SEL_NBR to HOS_NBR
	seek HOS_NBR

	if .NOT. (EOF() .OR. BOF())
		do PRINTHOS
	
	endif

endif

if file("ADVICE.DBF")
	select A
	use ADVICE index ADVNBR

	store SEL_NBR to ADV_NBR
	seek ADV_NBR

	if .NOT. (EOF() .OR. BOF())
		do PRINTADV
	
	endif

endif

if file("EKG.DBF")
	select A
	use EKG index EKGNBR

	store SEL_NBR to EKG_NBR
	seek EKG_NBR

	if .NOT. (EOF() .OR. BOF())
		do PRINTEKG
	
	endif

endif

if file("XRAY.DBF")
	select A
	use XRAY index XRYNBR

	store SEL_NBR to XRY_NBR
	seek XRY_NBR

	if .NOT. (EOF() .OR. BOF())
		do PRINTXRY
	
	endif

endif

if file("ECHO.DBF")
	select A
	use ECHO index ECHNBR

	store SEL_NBR to ECH_NBR
	seek ECH_NBR

	if .NOT. (EOF() .OR. BOF())
		do PRINTECH
	
	endif

endif

if file("CARDIAC.DBF")
	select A
	use CARDIAC index CARNBR

	store SEL_NBR to CAR_NBR
	seek CAR_NBR

	if .NOT. (EOF() .OR. BOF())
		do PRINTCAR
	
	endif

endif

if file("PROC.DBF")
	select A
	use PROC index PRONBR

	store SEL_NBR to PRO_NBR
	seek PRO_NBR

	if .NOT. (EOF() .OR. BOF())
		do PRINTPRO
	
	endif

endif

set DEVICE to screen

select A
use

return
