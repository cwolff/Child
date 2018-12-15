*************************************************************************
*																		*
* SYSADMIN >>> The menu that provides access to system adminstration	*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store .T. to CONTINUE

do while CONTINUE
    store "System Administration Menu" to HEAD
    do DATETAIL
    store "Press 0 to STOP" to R_TAIL
    do FRAME

    store 3 to MENU_CNT
    store "User file maintenance" to MENU_1
    store "Backup data base" to MENU_2
	store "Restore data base" to MENU_3
    do MENU

    store 3 to CHOICE
    do GETKEY

    do case

        case CHOICE = 0
            store .F. to CONTINUE

        case CHOICE = 1
            do USERMAIN
            store .T. to CONTINUE

        case CHOICE = 2
            do BACKDBF
            store .T. to CONTINUE

		case CHOICE = 3
			do RESTDBF
			store .T. to CONTINUE	
			
    endcase

enddo

select A
use
select B
use

return

                                                                          
