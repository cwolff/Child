*************************************************************************
*																		*
* PROMPT >>> Displays a prompt message centered at the given line		*
*		   entry : PMT:LINE PMT:MSG 									*
*		   exit : None													*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************

@ PMT_LINE,0
set color to G+/N,W+/N,N,N
@ PMT_LINE,(((80-len(PMT_MSG))/2)) say PMT_MSG

set color to G/N,W+/N,N,N

return

