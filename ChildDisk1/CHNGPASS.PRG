*************************************************************************
*																		*
* CHNGPASS >>> Prompts the user to change their password				*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************

select B
use SYSTEM index SYSLOGON
select A
use GLOBAL

store "Changing Your Password" to HEAD
do DATETAIL
store "Press RETURN to ENTER" to R_TAIL
do FRAME

store 1 to CONTINUE

set exact on
do while CONTINUE <> 0

	store G_PSSWRD to OLDWORD
	store G_LOGON to LOGON
	store G_PRMSSN to PRMSSN
	store trim(LOGON) to LOGON

	@ 7,15 say "Enter your old password."
	store 9 to PASS_LINE
	do GETPASS
	@ 7,0
	@ 9,0

	if OLDWORD = PSSWRD

		@ 7,15 say "Enter your new password."
		store 9 to PASS_LINE
		do GETPASS
		@ 7,0
		@ 9,0

		store PSSWRD to NEWWORD

		@ 7,15 say "Enter your new password a second time."
		store 9 to PASS_LINE
		do GETPASS
		@ 7,0
		@ 9,0

		if NEWWORD = PSSWRD
			if OLDWORD = PSSWRD
				store 19 to STAT_LINE
				store "Can not use the old password again" to STAT_MSG
				do status

			else
				select B

				seek LOGON

				if (EOF() .OR. BOF())
					store 19 to STAT_LINE
					store "Unable to change password" to STAT_MSG
					do STATUS
					store OLDWORD to PSSWRD

				else
					store NEWWORD to PSSWRD
					replace S_PSSWRD with PSSWRD
					replace S_PWDATE with DTOC(date())
					store 19 to STAT_LINE
					store LOGON + " please remember your new password" to STAT_MSG
					do STATUS

				endif

				select A
				replace G_PSSWRD with PSSWRD
				replace G_PWDATE with DTOC(date())
				store 0 to CONTINUE

			endif

		else

			store 19 to STAT_LINE
			store "Second entry did not match first" to STAT_MSG
			do STATUS

			store 1 to CONTINUE

		endif

	else

		store 19 to STAT_LINE
		store "Invalid password" to STAT_MSG
		do STATUS

		store 1 to CONTINUE

	endif

enddo
set exact off

select B
use
select A
use

return

