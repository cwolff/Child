*************************************************************************
*																		*
* GETNCAR >>> Get a new record from the screen which the user added		*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "       " to QP_QS
@ 13,5 say "Enter QP/QS range ............... ";
get QP_QS picture "       "

clear gets

store 19 to PMT_LINE
store "1) =1  2) <1  3) >1 & <2  4) >2 & <3  5) >3" to PMT_MSG
do PROMPT

store 5 to CHOICE
do GETKEY

@ 19,0

do case

	case CHOICE = 1
		store "=1     " to QP_QS

	case CHOICE = 2
		store "<1     " to QP_QS

	case CHOICE = 3
		store ">1 & <2" to QP_QS

	case CHOICE = 4
		store ">2 & <3" to QP_QS

	case CHOICE = 5
		store ">3     " to QP_QS

endcase

@ 13,39 get QP_QS

store "           " to RP_RS
@ 14,5 say "Enter RP/RS range ............... ";
get RP_RS picture "           "

clear gets

store 19 to PMT_LINE
store "1) <20%  2) >20% & <40%  3) >40% & <50%  " to PMT_MSG
store PMT_MSG + "4) >50% & <70%  5) >70%" to PMT_MSG
do PROMPT

store 5 to CHOICE
do GETKEY

@ 19,0

do case

	case CHOICE = 1
		store "<20%       " to RP_RS

	case CHOICE = 2
		store ">20% & <40%" to RP_RS

	case CHOICE = 3
		store ">40% & <50%" to RP_RS

	case CHOICE = 4
		store ">50% & <70%" to RP_RS

	case CHOICE = 5
		store ">70%       " to RP_RS

endcase

@ 14,39 get RP_RS

store "            " to RVP_LVP
@ 15,5 say "Enter RVP/LVP range ............. ";
get RVP_LVP picture "            "

clear gets

store 19 to PMT_LINE
store "1) <50%  2) >50% & <70%  3) >70% & <100%   4) >100%" to PMT_MSG
do PROMPT

store 4 to CHOICE
do GETKEY

@ 19,0

do case

	case CHOICE = 1
		store "<50%        " to RVP_LVP

	case CHOICE = 2
		store ">50% & <70% " to RVP_LVP

	case CHOICE = 3
		store ">70% & <100%" to RVP_LVP

	case CHOICE = 4
		store ">100%       " to RVP_LVP

endcase

@ 15,39 get RVP_LVP

store "            " to RVP_AOP
@ 16,5 say "Enter RVP/AOP range ............. ";
get RVP_AOP picture "            "

clear gets

store 19 to PMT_LINE
store "1) <50%  2) >50% & <70%  3) >70% & <100%  4) >100%" to PMT_MSG
do PROMPT

store 4 to CHOICE
do GETKEY

@ 19,0

do case

	case CHOICE = 1
		store "<50%        " to RVP_AOP

	case CHOICE = 2
		store ">50% & <70% " to RVP_AOP

	case CHOICE = 3
		store ">70% & <100%" to RVP_AOP

	case CHOICE = 4
		store ">100%       " to RVP_AOP

endcase

@ 16,39 get RVP_AOP

store "             " to GR
@ 17,5 say "Enter GR range .................. ";
get GR picture "             "

clear gets

store 19 to PMT_LINE
store "1) <40mm  2) >40mm & <60mm  3) >60mm" to PMT_MSG
do PROMPT

store 3 to CHOICE
do GETKEY

@ 19,0

do case

	case CHOICE = 1
		store "<40mm        " to GR

	case CHOICE = 2
		store ">40mm & <60mm" to GR

	case CHOICE = 3
		store ">60mm        " to GR

endcase

@ 17,39 get GR

clear gets

@ 5,0

return

                                                                                                                                  