*************************************************************************
*																		*
* READHOS >>> Read the current record into the record variables 		*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store H_HOS_NBR to HOS_NBR
store H_H_DATE_A to H_DATE_A
store SUBSTR(H_DATE_A,1,2)+"/"+SUBSTR(H_DATE_A,3,2)+"/"+SUBSTR(H_DATE_A,5,2) to H_DATE_A
store H_H_DATE_D to H_DATE_D
store SUBSTR(H_DATE_D,1,2)+"/"+SUBSTR(H_DATE_D,3,2)+"/"+SUBSTR(H_DATE_D,5,2) to H_DATE_D
store H_H_CMNTS to H_CMNTS
store H_H_DIED to H_DIED
store H_H_ATPSY to H_ATPSY
store H_LOGON to LOGON

return

                                                                                                                                                                                         