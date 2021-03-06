*************************************************************************
*																		*
* WRITECAR >>> Write current record variables to the current record		*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

replace C_CAR_NBR with UPPER(CAR_NBR)
replace C_C_DATE with SUBSTR(C_DATE,1,2) + SUBSTR(C_DATE,4,2) + SUBSTR(C_DATE,7,2)

do case
	case QP_QS = "=1     "
		replace C_QP_QS with "1"

	case QP_QS = "<1     "
		replace C_QP_QS with "2"

	case QP_QS = ">1 & <2"
		replace C_QP_QS with "3"

	case QP_QS = ">2 & <3"
		replace C_QP_QS with "4"

	case QP_QS = ">3     "
		replace C_QP_QS with "5"

endcase

do case
	case RP_RS = "<20%       "
		replace C_RP_RS with "1"

	case RP_RS = ">20% & <40%"
		replace C_RP_RS with "2"

	case RP_RS = ">40% & <50%"
		replace C_RP_RS with "3"

	case RP_RS = ">50% & <70%"
		replace C_RP_RS with "4"

	case RP_RS = ">70%       "
		replace C_RP_RS with "5"

endcase

do case
	case RVP_LVP = "<50%        "
		replace C_RVP_LVP with "1"

	case RVP_LVP = ">50% & <70% "
		replace C_RVP_LVP with "2"

	case RVP_LVP = ">70% & <100%"
		replace C_RVP_LVP with "3"

	case RVP_LVP = ">100%       "
		replace C_RVP_LVP with "4"

endcase

do case
	case RVP_AOP = "<50%        "
		replace C_RVP_AOP with "1"

	case RVP_AOP = ">50% & <70% "
		replace C_RVP_AOP with "2"

	case RVP_AOP = ">70% & <100%"
		replace C_RVP_AOP with "3"

	case RVP_AOP = ">100%       "
		replace C_RVP_AOP with "4"

endcase

do case
	case GR = "<40mm        "
		replace C_GR with "1"

	case GR = ">40mm & <60mm"
		replace C_GR with "2"

	case GR = ">60mm        "
		replace C_GR with "3"

endcase

replace C_LOGON with LOGON

return

                                                                                