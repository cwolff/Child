*************************************************************************
*																		*
* GETKEY >>> Gets a key for menus from 0 to CHOICE						*
*		 entry : CHOICE													*
*		 exit : CHOICE													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store CHOICE + 1 to KEY
do while KEY < 0 .or. KEY > CHOICE
	@ 2,76 get KEY picture "9"
	@ 2,77 say " "
	read
	clear gets
	@ 2,76 say "   "
enddo

store KEY to CHOICE

return

                                                                                                                                                                 