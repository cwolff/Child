*************************************************************************
*																		*
* MENU >>> Display the menu window										*
*	   entry : MENU:CNT, MENU:1, ... , MENU:2							*
*	   exit : None														*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

do case

	case MENU_CNT = 1
		@ 9,15 say "1)   " + MENU_1
	  
	case MENU_CNT = 2
		@ 9,15 say "1)   " + MENU_1
		@ 11,15 say "2)   " + MENU_2

	case MENU_CNT = 3
		@ 9,15 say "1)   " + MENU_1
		@ 11,15 say "2)   " + MENU_2
		@ 13,15 say "3)   " + MENU_3
	  
	case MENU_CNT = 4
		@ 9,15 say "1)   " + MENU_1
		@ 11,15 say "2)   " + MENU_2
		@ 13,15 say "3)   " + MENU_3
		@ 15,15 say "4)   " + MENU_4

	case MENU_CNT = 5
		@ 9,15 say "1)   " + MENU_1
		@ 11,15 say "2)   " + MENU_2
		@ 13,15 say "3)   " + MENU_3
		@ 15,15 say "4)   " + MENU_4
		@ 17,15 say "5)   " + MENU_5

endcase

@ 6,15 say "Press the number key next to your choice."

return

                                                                                                                                                                             