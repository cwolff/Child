*************************************************************************
*																		*
* CHKFF >>> Checks to see if a form feed is necessary					*
*		   entry : NBR_LINE = number of lines to print					*
*		   exit : Formfeed if needed									*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

if NBR_LINE = 0
	eject
	store 1 to CURR_LINE
else
	if CURR_LINE + NBR_LINE > 61
		eject
		store 1 to CURR_LINE
	endif
endif


                                                                                                                                                                                 