*************************************************************************
*																		*
* WRITEPRO >>> Write current record variables to the screen				*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

replace R_PRO_NBR with UPPER(PRO_NBR)
replace R_P_DATE with SUBSTR(P_DATE,1,2) + SUBSTR(P_DATE,4,2) + SUBSTR(P_DATE,7,2)
replace R_P_CODE with UPPER(P_CODE)
replace R_LOGON with UPPER(LOGON)

return

                                                                                                               