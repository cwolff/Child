*************************************************************************
*																		*
* GETPAGE >>> Get another page for the office call letter				*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

set confirm on

@ 7,4 get L1
@ 8,4 get L2
@ 9,4 get L3
@ 10,4 get L4
@ 11,4 get L5
@ 12,4 get L6
@ 13,4 get L7
@ 14,4 get L8
@ 15,4 get L9
@ 16,4 get L10

read

clear gets

set confirm off

return

                                                                                                     