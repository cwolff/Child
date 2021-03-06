*************************************************************************
*																		*
* READECH >>> Read the current record into the record variables 		*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store E_ECH_NBR to ECH_NBR
store E_E_DATE to E_DATE
store SUBSTR(E_DATE,1,2)+"/"+SUBSTR(E_DATE,3,2)+"/"+SUBSTR(E_DATE,5,2) to E_DATE

store "        " to M_MODE
do case
	case SUBSTR(E_M_MODE,1,1) = "N"
		store "normal  " to M_MODE

	case SUBSTR(E_M_MODE,1,1) = "A"
		store "abnormal" to M_MODE

	case SUBSTR(E_M_MODE,1,1) = "0"
		store "not done" to M_MODE

endcase

store "        " to TWO_D
do case
	case SUBSTR(E_TWO_D,1,1) = "N"
		store "normal  " to TWO_D

	case SUBSTR(E_TWO_D,1,1) = "A"
		store "abnormal" to TWO_D

	case SUBSTR(E_TWO_D,1,1) = "0"
		store "not done" to TWO_D

endcase

store "        " to DOPPLER
do case
	case SUBSTR(E_DOPPLER,1,1) = "N"
		store "normal  " to DOPPLER

	case SUBSTR(E_DOPPLER,1,1) = "A"
		store "abnormal" to DOPPLER

	case SUBSTR(E_DOPPLER,1,1) = "0"
		store "not done" to DOPPLER

endcase

store E_LOGON to LOGON

return

                                                                                                                                                                           