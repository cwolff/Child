*************************************************************************
*																		*
* GETNECH >>> Get a new record from the screen which the user added		*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "        " to M_MODE
@ 15,5 say "Enter m mode (normal/abnormal) .. ";
get M_MODE picture "        "

clear gets

store 19 to PMT_LINE
store "1) normal  2) abnormal  3) not done" to PMT_MSG
do PROMPT

store 3 to CHOICE
do GETKEY

@ 19,0

do case

	case CHOICE = 1
		store "normal  " to M_MODE

	case CHOICE = 2
		store "abnormal" to M_MODE

	case CHOICE = 3
		store "not done" to M_MODE

endcase

@ 15,39 get M_MODE

store "        " to TWO_D
@ 16,5 say "Enter 2D (normal/abnormal) ...... ";
get TWO_D picture "        "

clear gets

store 19 to PMT_LINE
store "1) normal  2) abnormal  3) not done" to PMT_MSG
do PROMPT

store 3 to CHOICE
do GETKEY

@ 19,0

do case

	case CHOICE = 1
		store "normal  " to TWO_D

	case CHOICE = 2
		store "abnormal" to TWO_D

	case CHOICE = 3
		store "not done" to TWO_D

endcase

@ 16,39 get TWO_D

store "        " to DOPPLER
@ 17,5 say "Enter doppler (normal/abnormal) . ";
get DOPPLER picture "        "

clear gets

store 19 to PMT_LINE
store "1) normal  2) abnormal  3) not done" to PMT_MSG
do PROMPT

store 3 to CHOICE
do GETKEY

@ 19,0

do case

	case CHOICE = 1
		store "normal  " to DOPPLER

	case CHOICE = 2
		store "abnormal" to DOPPLER

	case CHOICE = 3
		store "not done" to DOPPLER

endcase

@ 17,39 get DOPPLER

clear gets

@ 5,0

return

                                                                                                                                                                                                                       