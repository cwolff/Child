*************************************************************************
*																		*
* READDIA >>> Read the current record into the record variables 		*
*		   entry : # to write, current record variables					*
*			   DESCRIPTION switch to lookup diagnose					*
*				   description in DIATABLE								*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store D_DIA_NBR to DIA_NBR
store D_D_CODE to D_CODE
store substr(D_D_DATE,1,2)+"/"+substr(D_D_DATE,3,2)+"/"+substr(D_D_DATE,5,2) to D_DATE
store D_LOGON to LOGON

if DESCRIPT
    select B
    use DIATABLE index DTDCODE

    set exact on
    seek D_CODE
    set exact off

    if .NOT. (EOF() .OR. BOF())
        store DT_D_DESC to D_DESC

    else
        store "Unable to retrive description" to D_DESC

    endif

    select B
    use

    select A

endif

return

