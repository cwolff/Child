* Last revised : Sun 28-Feb-88 at 8:53 pm
*************************************************************************
*																		*
* SRCHMENU >>> The menu that performs search functions					*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store .T. to REFRESH
store .T. to CONTINUE
store .F. to DO_SEARCH

do while CONTINUE
	if REFRESH
		store "Search Menu" to HEAD
		do DATETAIL
		store "Press 0 to STOP" to R_TAIL
		do FRAME

		store 4 to MENU_CNT
		store "Perform search" to MENU_1
		store "Print header page" to MENU_2
		store "Print header page, names and searched data" to MENU_3
		store "Print header page, names and all data" to MENU_4
		do MENU
	endif

	store 4 to CHOICE
	do GETKEY

	do case

		case CHOICE = 0
		    store .F. to CONTINUE

		case CHOICE = 1
            do CLRSCRN

            set century on
            do SGETVAL
            set century off

            if DO_SEARCH
    		    store "1) Begin search  2) Don't search" to PMT_MSG
    		    store 19 to PMT_LINE
    		    do PROMPT

    		    store 2 to CHOICE
    		    do GETKEY

    		    @ 19,0

    		    if CHOICE = 1
    		        do SRCHPROC

		        endif

            endif

		    store .T. to REFRESH
		    store .T. to CONTINUE

		case CHOICE = 2 .or. CHOICE = 3 .or. CHOICE = 4
		    do PRINTIT

		    store .T. to REFRESH
		    store .T. to CONTINUE

	endcase

enddo

return

