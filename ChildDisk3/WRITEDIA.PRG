*************************************************************************
*																		*
* WRITEDIA >>> Write current record variables to the screen				*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

replace D_DIA_NBR with UPPER(DIA_NBR)
replace D_D_CODE with UPPER(D_CODE)
replace D_D_DATE with substr(D_DATE,1,2)+substr(D_DATE,4,2)+substr(D_DATE,7,2)
replace D_LOGON with UPPER(LOGON)

return
