*************************************************************************
*																		*
* WRITEHOS >>> Write current record variables to the current record		*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

replace H_HOS_NBR with UPPER(HOS_NBR)
replace H_H_DATE_A with SUBSTR(H_DATE_A,1,2) + SUBSTR(H_DATE_A,4,2) + SUBSTR(H_DATE_A,7,2)
replace H_H_DATE_D with SUBSTR(H_DATE_D,1,2) + SUBSTR(H_DATE_D,4,2) + SUBSTR(H_DATE_D,7,2)
replace H_H_CMNTS with UPPER(H_CMNTS)
replace H_H_DIED with UPPER(H_DIED)
replace H_H_ATPSY with UPPER(H_ATPSY)
replace H_LOGON with UPPER(LOGON)

return

                                                                                                                                                                                       