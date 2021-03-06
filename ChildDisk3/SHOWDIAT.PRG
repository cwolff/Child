*************************************************************************
*									  									*
*				   SHOW					  								*
*									  									*
*************************************************************************

set talk off
clear ALL
CLEAR

select A
use DIATABLE

set DEVICE to print
eject

@ 1,1 say "D I A N O S T I C codes for diagnoses and procedures"
@ 3,1 say "Code   Description"

do while .not. EOF()

	store 5 to LINE

	do while LINE < 61

		@ LINE,1 say DT_D_CODE
		@ LINE,8 say DT_D_DESC

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

                                                         