*************************************************************************
*																		*
* WRITEXRY >>> Write current record variables to the current record		*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

replace X_XRY_NBR with UPPER(XRY_NBR)
replace X_X_DATE with SUBSTR(X_DATE,1,2) + SUBSTR(X_DATE,4,2) + SUBSTR(X_DATE,7,2)

if XRAY = "normal  "
	replace X_XRAY with "N"

else
	replace X_XRAY with "A"

endif

replace X_LOGON with LOGON

return

                                                      