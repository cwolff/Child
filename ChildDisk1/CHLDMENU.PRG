*************************************************************************
*																		*
* CHLDMENU >>> The menu that provides acces to the data base			*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store 1 to CURR_LINE

store .T. to REFRESH
store .T. to CONTINUE
do while CONTINUE

	if REFRESH
		store "Child Data Base Menu" to HEAD
		do DATETAIL
		store "Press 0 to STOP" to R_TAIL
		do FRAME

		store 4 to MENU_CNT
		store "View patient(s) information" to MENU_1
		store "Add patient(s) information" to MENU_2
		store "Edit patient(s) information" to MENU_3
		store "Report patient(s) information" to MENU_4
		do MENU
	endif

	store 4 to CHOICE
	do GETKEY

	do case

		case CHOICE = 0
			store .F. to CONTINUE

		case CHOICE = 1
			select A
			use GLOBAL
			store G_PRMSSN to PRMSSN
			use
			if SUBSTR(PRMSSN,2,1) = "V"
				do CHLDVIEW
				store .T. to REFRESH
				store .T. to CONTINUE
			else
				store 19 to STAT_LINE
				store "VIEW permission denied" to STAT_MSG
				do STATUS
				store .F. to REFRESH
			endif

		case CHOICE = 2
			select A
			use GLOBAL
			store G_PRMSSN to PRMSSN
			use
			if SUBSTR(PRMSSN,3,1) = "A"
				do CHLDADD
				store .T. to REFRESH
				store .T. to CONTINUE
			else
				store 19 to STAT_LINE
				store "ADD permission denied" to STAT_MSG
				do STATUS
				store .F. to REFRESH
			endif

		case CHOICE = 3
			select A
			use GLOBAL
			store G_PRMSSN to PRMSSN
			use
			if SUBSTR(PRMSSN,4,1) = "E"
				do CHLDEDIT
				store .T. to REFRESH
				store .T. to CONTINUE
			else
				store 19 to STAT_LINE
				store "EDIT permission denied" to STAT_MSG
				do STATUS
				store .F. to REFRESH
			endif

		case CHOICE = 4
			select A
			use GLOBAL
			store G_PRMSSN to PRMSSN
			use
			if SUBSTR(PRMSSN,6,1) = "R"
				do CHLDRPRT
				store .T. to REFRESH
				store .T. to CONTINUE
			else
				store 19 to STAT_LINE
				store "Report permission denied" to STAT_MSG
				do STATUS
				store .F. to REFRESH
			endif

	endcase

enddo

return

