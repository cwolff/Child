*************************************************************************
*																		*
* WRITEEKG >>> Write the current record 								*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

replace K_EKG_NBR with EKG_NBR
replace K_K_DATE with SUBSTR(K_DATE,1,2)+SUBSTR(K_DATE,4,2)+SUBSTR(K_DATE,7,2)
replace K_RHYTHM with RHYTHM
replace K_AXIS with AXIS
replace K_HYP with HYP
replace K_COND with COND
replace K_META with META
replace K_LOGON with LOGON

return

                                                             