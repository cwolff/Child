*************************************************************************
*																		*
* WRITEADV >>> Write current record variables to the current record		*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

replace A_ADV_NBR with UPPER(ADV_NBR)
replace A_A_DATE with SUBSTR(A_DATE,1,2) + SUBSTR(A_DATE,4,2) + SUBSTR(A_DATE,7,2)
replace A_A_CHG_NO with upper(A_CHG_NO)
replace A_A_DIAG with upper(A_DIAG)
replace A_A_MD with upper(A_MD)
replace A_LOGON with UPPER(LOGON)

return
