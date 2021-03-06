*************************************************************************
*																		*
* READPRO >>> Read the current record into the record variables 		*
*		   entry : # to write, current record variables					*
*			   DESCRIPTION switch to lookup diagnose					*
*				   description in DIATABLE								*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store R_PRO_NBR to PRO_NBR
store SUBSTR(R_P_DATE,1,2) + "/" + SUBSTR(R_P_DATE,3,2) + "/" to P_DATE
store P_DATE + SUBSTR(R_P_DATE,5,2) to P_DATE
store R_P_CODE to P_CODE
store R_LOGON to LOGON

if DESCRIPT
	select B
	use DIATABLE index DTDCODE

	set exact on
	seek P_CODE
	set exact off

	if .NOT. (EOF() .OR. BOF())
		store DT_D_DESC to P_DESC

	else
		store "Unable to retrive description" to P_DESC

	endif

	select B
	use

	select A

endif

return


                                                                                                                                                                                                                                                       