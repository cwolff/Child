*************************************************************************
*																		*
* STATUS >>> Displays a status message at the specified line and		*
*		   prompts the user to hit any key to continue					*
*		   entry : STAT:LINE STAT:MSG									*
*		   exit : None													*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************

@ STAT_LINE,0
store " " to ANY_KEY
store STAT_MSG + ", press ANY KEY to continue. " to STAT_MSG
set color to R+/N,W+/N,N,N
@ STAT_LINE,(((80-len(STAT_MSG))/2)-2) say STAT_MSG get ANY_KEY picture "X"
read
clear gets

set color to G/N,W+/N,N,N
@ STAT_LINE,0

return
