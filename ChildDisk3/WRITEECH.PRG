*************************************************************************
*																		*
* WRITEECH >>> Write current record variables to the current record		*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

replace E_ECH_NBR with UPPER(ECH_NBR)
replace E_E_DATE with SUBSTR(E_DATE,1,2) + SUBSTR(E_DATE,4,2) + SUBSTR(E_DATE,7,2)

do case
	case M_MODE = "normal  "
		replace E_M_MODE with "N"

	case M_MODE = "abnormal"
		replace E_M_MODE with "A"

	case M_MODE = "not done"
		replace E_M_MODE with "0"

endcase

do case
	case TWO_D = "normal  "
		replace E_TWO_D with "N"

	case TWO_D = "abnormal"
		replace E_TWO_D with "A"

	case TWO_D = "not done"
		replace E_TWO_D with "0"

endcase

do case
	case DOPPLER = "normal  "
		replace E_DOPPLER with "N"

	case DOPPLER = "abnormal"
		replace E_DOPPLER with "A"

	case DOPPLER = "not done"
		replace E_DOPPLER with "0"

endcase

replace E_LOGON with LOGON

return

                                                                             