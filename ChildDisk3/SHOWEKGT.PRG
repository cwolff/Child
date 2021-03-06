*************************************************************************
*									  									*	
*				   SHOW					  								*
*									  									*
*************************************************************************

set talk off
clear ALL
CLEAR

select A
use EKGTABLE

set DEVICE to print
eject

@ 1,1 say "E K G codes by catagory"
@ 3,1 say "Catagory   EKG code   Description"

do while .not. EOF()
	store 5 to LINE

	do while LINE < 61
		@ LINE,1 say SUBSTR(KT_K_CODE,1,2)
		@ LINE,12 say SUBSTR(KT_K_CODE,3,5)
		@ LINE,23 say KT_K_DESC

		skip

		if EOF()
			store 61 to LINE
		else
			store LINE + 1 to LINE
		endif

	enddo

	eject

enddo

set DEVICE to screen

select A
use

return

                      