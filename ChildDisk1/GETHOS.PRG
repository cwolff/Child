*************************************************************************
*																		*
* GETHOS >>> Get a record from the screen which the user added			*
*		   entry : #													*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

@ 13,5 say "Enter hospital admission date ... ";
get H_DATE_A picture "99/99/99"

@ 14,5 say "Enter hospital discharge date ... ";
get H_DATE_D picture "99/99/99"

@ 15,5 say "Enter comments .................. ";
get H_CMNTS picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

@ 16,5 say "Patient died .................... ";
get H_DIED picture "X"

@ 17,5 say "Autopsy performed ............... ";
get H_ATPSY picture "X"

set confirm on

read
clear gets

set confirm off

@ 5,0

return

                                                                               