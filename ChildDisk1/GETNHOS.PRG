*************************************************************************
*																		*
* GETNHOS >>> Get a blank record from the screen which the user added	*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "  /  /  " to H_DATE_D
@ 14,5 say "Enter hospital discharge date ... ";
get H_DATE_D picture "99/99/99"

store "                              " to H_CMNTS
@ 15,5 say "Enter comments .................. ";
get H_CMNTS picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

store "N" to H_DIED
@ 16,5 say "Patient died .................... ";
get H_DIED picture "X"

store "N" to H_ATPSY
@ 17,5 say "Autopsy performed ............... ";
get H_ATPSY picture "X"

set confirm on

read
clear gets

set confirm off

@ 5,0

return

                                   