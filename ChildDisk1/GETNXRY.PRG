*************************************************************************
*																		*
* GETNXRY >>> Get a new record from the screen which the user added		*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "        " to XRAY
@ 15,5 say "Enter XRAY (normal/abnormal) .... ";
get XRAY picture "        "

clear gets

store 19 to PMT_LINE
store "1) normal  2) abnormal" to PMT_MSG
do PROMPT

store 2 to CHOICE
do GETKEY

@ 19,0

do case

	case CHOICE = 1
		store "normal  " to XRAY

	case CHOICE = 2
		store "abnormal" to XRAY

endcase

@ 15,39 get XRAY

clear gets

@ 5,0

return

                                                                                                                                                                        