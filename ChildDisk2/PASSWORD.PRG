*************************************************************************
*																		*
* PASSWORD >>> Prompts the use to enter their ID and password			*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************

select B
use global

select A
use SYSTEM
index on S_LOGON to SYSLOGON
use
use SYSTEM index SYSLOGON

store "System Logon Procedure" to HEAD
do DATETAIL
store "Press RETURN to ENTER" to R_TAIL
do FRAME

store .T. to CONTINUE

do while CONTINUE
	set confirm on
	store "     " to LOGON
	@ 7,15 say "Please enter your identification."
	@ 9,15 say "Identification ... " get LOGON picture "AAAAA"
	read
	clear gets
	store trim(UPPER(LOGON)) to LOGON
	@ 7,0
	@ 9,0
	set confirm off

	@ 7,15 say "Please enter your password."
	store 9 to PASS_LINE
	do GETPASS
	@ 7,15
	@ 9,0

	seek LOGON
	set exact on

	store " " to PRMSSN
	store "  /  /  " to PWDATE

	if (EOF() .OR. BOF())
		store 19 to STAT_LINE
		store "No such ID see System Administrator" to STAT_MSG
		do STATUS

	else
		store S_PRMSSN to PRMSSN

		if S_PSSWRD = "              "

			if SUBSTR(PRMSSN,1,1) = "B"
				replace S_PSSWRD with PSSWRD 
				store "P" + SUBSTR(PRMSSN,2,9) to PRMSSN
				replace S_PRMSSN with PRMSSN
				store DTOC(date()) to PWDATE
				replace S_PWDATE with PWDATE
				store 19 to STAT_LINE
				store LOGON + " please remember your new password" to STAT_MSG
				do STATUS 
				store .F. to CONTINUE

			else
				store " " to PSSWRD
				replace S_PRMSSN with PRMSSN
				store "I" + SUBSTR(PRMSSN,2,9) to PRMSSN
				replace S_PRMSSN with PRMSSN
				store " " to PRMSSN
				replace S_PSSWRD with PRMSSN
				store 19 to STAT_LINE
				store "Tampered PASSWORD, report to ADMINSTRATOR" to STAT_MSG
				do STATUS

			endif

		else

			if PSSWRD <> trim(S_PSSWRD)
				store 19 to STAT_LINE
				store "Invalid LOGON" to STAT_MSG
				do STATUS

			else
				if SUBSTR(S_PRMSSN,1,1) <> "P"
					store "T" + SUBSTR(PRMSSN,2,9) to PRMSSN
					replace S_PRMSSN with PRMSSN
					store 19 to STAT_LINE
					store "Tampered PERMISSIONS, report to ADMINSTRATOR" to STAT_MSG
					do STATUS

				else
					store S_LOGON to LOGON
					store S_PSSWRD to PSSWRD
					store S_PRMSSN to PRMSSN
					store S_PWDATE to PWDATE
					store .F. to CONTINUE

				endif

			endif

		endif

	endif

	set exact off

	select B
	replace G_LOGON with LOGON
	replace G_PSSWRD with PSSWRD
	replace G_PRMSSN with PRMSSN
	replace G_PWDATE with PWDATE
	select A

enddo

select B
use
select A
use

return

