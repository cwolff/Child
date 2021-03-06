*************************************************************************
*																		*
* READXRY >>> Read the current record into the record variables 		*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store X_XRY_NBR to XRY_NBR
store X_X_DATE to X_DATE
store SUBSTR(X_DATE,1,2)+"/"+SUBSTR(X_DATE,3,2)+"/"+SUBSTR(X_DATE,5,2) to X_DATE

store "        " to XRAY

do case
	case SUBSTR(X_XRAY,1,1) = "N"
		store "normal  " to XRAY

	case SUBSTR(X_XRAY,1,1) = "A"
		store "abnormal" to XRAY

endcase

store X_LOGON to LOGON

return

                                                                                                                                                                                                                                 