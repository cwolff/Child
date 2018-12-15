*************************************************************************
*																		*
* READADV >>> Read the current record into the record variables 		*
*		   entry : # to write, current record variables					*
*			   DESCRIPTION switch to lookup diagnose					*
*				   description in DIATABLE								*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store upper(A_ADV_NBR) to ADV_NBR
store A_A_DATE to A_DATE
store SUBSTR(A_DATE,1,2) + "/" + SUBSTR(A_DATE,3,2) + "/" + SUBSTR(A_DATE,5,2) to A_DATE
store upper(A_A_CHG_NO) to A_CHG_NO
store upper(A_A_DIAG) to A_DIAG
store upper(A_A_MD) to A_MD
store upper(A_LOGON) to LOGON

if DESCRIPT
    select B
    use DIATABLE index DTDCODE

    set exact on
    seek A_DIAG
    set exact off

    if .NOT. (EOF() .OR. BOF())
        store DT_D_DESC to A_DESC

    else
        store "Unable to retrive description" to A_DESC

    endif

    select B
    use

    select A

endif

return


