*************************************************************************
*																		*
* READCAR >>> Read the current record into the record variables 		*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store C_CAR_NBR to CAR_NBR
store C_C_DATE to C_DATE
store SUBSTR(C_DATE,1,2)+"/"+SUBSTR(C_DATE,3,2)+"/"+SUBSTR(C_DATE,5,2) to C_DATE

store "       " to QP_QS
do case

	case C_QP_QS = "1"
		store "=1     " to QP_QS

	case C_QP_QS = "2"
		store "<1     " to QP_QS

	case C_QP_QS = "3"
		store ">1 & <2" to QP_QS

	case C_QP_QS = "4"
		store ">2 & <3" to QP_QS

	case C_QP_QS = "5"
		store ">3     " to QP_QS

endcase

store "          " to RP_RS
do case

	case C_RP_RS = "1"
		store "<20%       " to RP_RS

	case C_RP_RS = "2"
		store ">20% & <40%" to RP_RS

	case C_RP_RS = "3"
		store ">40% & <50%" to RP_RS

	case C_RP_RS = "4"
		store ">50% & <70%" to RP_RS

	case C_RP_RS = "5"
		store ">70%       " to RP_RS

endcase

store "            " to RVP_LVP
do case

	case C_RVP_LVP = "1"
		store "<50%        " to RVP_LVP

	case C_RVP_LVP = "2"
		store ">50% & <70% " to RVP_LVP

	case C_RVP_LVP = "3"
		store ">70% & <100%" to RVP_LVP

	case C_RVP_LVP = "4"
		store ">100%       " to RVP_LVP

endcase

store "            " to RVP_AOP
do case

	case C_RVP_AOP = "1"
		store "<50%        " to RVP_AOP

	case C_RVP_AOP = "2"
		store ">50% & <70% " to RVP_AOP

	case C_RVP_AOP = "3"
		store ">70% & <100%" to RVP_AOP

	case C_RVP_AOP = "4"
		store ">100%       " to RVP_AOP

endcase

store "             " to GR
do case

	case C_GR = "1"
		store "<40mm        " to GR

	case C_GR = "2"
		store ">40mm & <60mm" to GR

	case C_GR = "3"
		store ">60mm        " to GR

endcase

store C_LOGON to LOGON

return

                                                                                                                                                                                                                                                              