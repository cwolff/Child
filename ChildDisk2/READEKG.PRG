*************************************************************************
*																		*
* READEKG >>> Read the current record									*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store K_EKG_NBR to EKG_NBR
store SUBSTR(K_K_DATE,1,2)+"/"+SUBSTR(K_K_DATE,3,2)+"/"+SUBSTR(K_K_DATE,5,2) to K_DATE
store K_RHYTHM to RHYTHM
store K_AXIS to AXIS
store K_HYP to HYP
store K_COND to COND
store K_META to META
store K_LOGON to LOGON

return

                                                                                   