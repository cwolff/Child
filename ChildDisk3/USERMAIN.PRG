*************************************************************************
*																		*
* USERMAIN >>> Maintains the SYSTEM.DBF add kill users, kill passwords	*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************

select B
use GLOBAL
store trim(G_LOGON) to ACT_LOGON
use

select A
use SYSTEM index SYSLOGON

store "User File Maintenance" to HEAD
do DATETAIL
store "Press 0 to STOP" to R_TAIL
do FRAME

store .T. to CONTINUE

do while CONTINUE
	store 5 to MENU_CNT
	store "Add a new user" to MENU_1
	store "Delete an existing user" to MENU_2
	store "Clear a user's password" to MENU_3
	store "Edit a user's permissions" to MENU_4
	store "List users on system" to MENU_5
	do MENU

	store 5 to CHOICE
	do GETKEY

	do case

		case CHOICE = 0
			store .F. to CONTINUE

		case CHOICE = 1

			do CLRSCRN

			do DATETAIL
			store "Press RETURN to ENTER" to R_TAIL
			do tail

			set confirm on
			store "     " to LOGON
			@ 8,15 say "Enters users identification to add. "
			@ 10,15 say "Identification ... " get LOGON picture "AAAAA"
			read
			@ 8,15
			@ 10,15
			clear gets
			store UPPER(LOGON) to LOGON
			set confirm off

			goto top
			seek LOGON

			if (EOF() .OR. BOF())
				set confirm on
				store 8 to YN_LINE
				store "Does the user have view permission ?" to YN_MSG
				store "Y" to YN
				do YESNO
				store YN to P_VIEW

				store 8 to YN_LINE
				store "Does the user have add permission ?" to YN_MSG
				store "N" to YN
				do YESNO
				store YN to P_ADD

				store 8 to YN_LINE
				store "Does the user have edit permission ?" to YN_MSG
				store "N" to YN
				do YESNO
				store YN to P_EDIT

				store 8 to YN_LINE
				store "Does the user have delete permission ?" to YN_MSG
				store "N" to YN
				do YESNO
				store YN to P_REL

				store 8 to YN_LINE
				store "Does the user have report permission ?" to YN_MSG
				store "N" to YN
				do YESNO
				store YN to P_RPRT

				store 8 to YN_LINE
				store "Does the user have administration permission ?" to YN_MSG
				store "N" to YN
				do YESNO
				store YN to P_ADMIN

				store "B"+P_VIEW+P_ADD+P_EDIT to PERMISSION
				store PERMISSION+P_REL+P_RPRT+P_ADMIN+"Y" to PERMISSION
				store "BVAEDRAZ" to CODE
				store "B" to PRMSSN
				store 2 to COUNT

				do while COUNT < 9
					if SUBSTR(PERMISSION,COUNT,1) = "Y"
						store PRMSSN + SUBSTR(CODE,COUNT,1) to PRMSSN
					else
						store PRMSSN + "N" to PRMSSN
					endif
					store COUNT + 1 to COUNT
				enddo

				append blank
				replace S_LOGON with LOGON
				replace S_PRMSSN with PRMSSN

				set confirm off

			else
				store 19 to STAT_LINE
				store LOGON + " is already a user" to STAT_MSG
				do STATUS

			endif
 
		case CHOICE = 2
			do CLRSCRN

			do DATETAIL
			store "Press RETURN to ENTER" to R_TAIL
			do tail

			set confirm on
			store "     " to LOGON
			@ 8,15 say "Enters users identification to delete."
			@ 10,15 say "Identification ... " get LOGON picture "AAAAA"
			read
			@ 8,15
			@ 10,15
			clear gets
			store trim(UPPER(LOGON)) to LOGON
			set confirm off

			if LOGON <> ACT_LOGON

				goto top
				*!! EOF() will be true if NO FIND, and RECNO() will equal BOTTOM, not 0.
				seek LOGON

				if (EOF() .OR. BOF())
					store 19 to STAT_LINE
					store LOGON + " is not a user" to STAT_MSG
					do STATUS

				else
					if LOGON = "ADMIN"
						store 19 to STAT_LINE
						store "ADMIN can not be deleted" to STAT_MSG
						do STATUS

					else
						delete for S_LOGON = LOGON
						pack
						store 19 to STAT_LINE
						store LOGON + " is now deleted" to STAT_MSG
						do STATUS

					endif

				endif

			else
				store 19 to STAT_LINE
				store "Can not delete an active LOGON" to STAT_MSG
				do STATUS

			endif

		case CHOICE = 3
			do CLRSCRN

			do DATETAIL
			store "Press RETURN to ENTER" to R_TAIL
			do tail

			set confirm on
			store "     " to LOGON
			@ 8,15 say "Enters users identification to clear password."
			@ 10,15 say "Identification ... " get LOGON picture "AAAAA"
			read
			@ 8,15
			@ 10,15
			clear gets
			store trim(UPPER(LOGON)) to LOGON
			set confirm off

			if LOGON <> ACT_LOGON
				goto top
				seek LOGON

				if (EOF() .OR. BOF())
					store 19 to STAT_LINE
					store LOGON + " is not a user" to STAT_MSG
					do STATUS

				else
					replace S_PSSWRD with "              "
					store S_PRMSSN to PRMSSN
					replace S_PRMSSN with "B" + SUBSTR(PRMSSN,2,7)

					store 19 to STAT_LINE
					store LOGON + "'s password is now cleared." to STAT_MSG
					do STATUS
 
				endif

			else
				store 19 to STAT_LINE
				store "Can not clear an active LOGON's password" to STAT_MSG
				do STATUS
			endif

		case CHOICE = 4
			do CLRSCRN

			do DATETAIL
			store "Press RETURN to ENTER" to R_TAIL
			do tail
 
			set confirm on
			store "     " to LOGON
			@ 8,15 say "Enters users identification to edit. "
			@ 10,15 say "Identification ... " get LOGON picture "AAAAA"
			read
			@ 8,15
			@ 10,15
			clear gets
			store trim(UPPER(LOGON)) to LOGON
			set confirm off

			if LOGON <> ACT_LOGON
				goto top
				seek LOGON

				if .NOT. (EOF() .OR. BOF())
					if LOGON = "ADMIN"
						store 19 to STAT_LINE
						store "ADMIN's permissions can not be edited" to STAT_MSG
						do STATUS
					else
						set confirm on
						store S_PRMSSN to PRMSSN
						store 8 to YN_LINE
						store "Does the user have view permission ?" to YN_MSG
						if SUBSTR(PRMSSN,2,1) = "V"
							store "Y" to YN
						else
							store "N" to YN
						endif
						do YESNO
						store YN to P_VIEW

						store 8 to YN_LINE
						store "Does the user have add permission ?" to YN_MSG
						if SUBSTR(PRMSSN,3,1) = "A"
							store "Y" to YN
						else
							store "N" to YN
						endif
						do YESNO
						store YN to P_ADD

						store 8 to YN_LINE
						store "Does the user have edit permission ?" to YN_MSG
						if SUBSTR(PRMSSN,4,1) = "E"
							store "Y" to YN
						else
							store "N" to YN
						endif
						do YESNO
						store YN to P_EDIT

						store 8 to YN_LINE
						store "Does the user have delete permission ?" to YN_MSG
						if SUBSTR(PRMSSN,5,1) = "D"
							store "Y" to YN
						else
							store "N" to YN
						endif
						do YESNO
						store YN to P_REL

						store 8 to YN_LINE
						store "Does the user have report permission ?" to YN_MSG
						if SUBSTR(PRMSSN,6,1) = "R"
							store "Y" to YN
						else
							store "N" to YN
						endif
						do YESNO
						store YN to P_RPRT

						store 8 to YN_LINE
						store "Does the user have administration" to YN_MSG
						store YN_MSG + " permission ?" to YN_MSG
						if SUBSTR(PRMSSN,7,1) = "A"
							store "Y" to YN
						else
							store "N" to YN
						endif
						do YESNO
						store YN to P_ADMIN

						store SUBSTR(PRMSSN,1,1)+P_VIEW+P_ADD+P_EDIT to PERMISSION
						store PERMISSION+P_REL+P_RPRT+P_ADMIN+"Z" to PERMISSION
						store "BVAEDRAZ" to CODE
						store "B" to PRMSSN
						store 2 to COUNT
						do while COUNT < 8
							if SUBSTR(PERMISSION,COUNT,1) = "Y"
								store PRMSSN + SUBSTR(CODE,COUNT,1) to PRMSSN
							else
								store PRMSSN + "N" to PRMSSN
							endif
							store COUNT + 1 to COUNT
						enddo
						store PRMSSN + "Z" to PRMSSN

						replace S_PRMSSN with PRMSSN

						set confirm off

					endif

				else
					store 19 to STAT_LINE
					store LOGON + " is not a user" to STAT_MSG
					do STATUS

				endif

			else
				store 19 to STAT_LINE
				store "Can not edit an active LOGON's permissions" to STAT_MSG
				do STATUS

			endif

		case CHOICE = 5
			do CLRSCRN

			do DATETAIL
			store "Press ANY KEY for next user" to R_TAIL
			do tail

			goto top

			do while .not. (bof() .or. eof())
				store S_LOGON to LOGON
				store S_PRMSSN to PRMSSN

				if SUBSTR(PRMSSN,2,1) = "V"
					store "allowed" to P_VIEW
				else
					store "NOT allowed" to P_VIEW
				endif

				if SUBSTR(PRMSSN,3,1) = "A"
					store "allowed" to P_ADD
				else
					store "NOT allowed" to P_ADD
				endif

				if SUBSTR(PRMSSN,4,1) = "E"
					store "allowed" to P_EDIT
				else
					store "NOT allowed" to P_EDIT
				endif

				if SUBSTR(PRMSSN,5,1) = "D"
					store "allowed" to P_REL
				else
					store "NOT allowed" to P_REL
				endif

				if SUBSTR(PRMSSN,6,1) = "R"
					store "allowed" to P_RPRT
				else
					store "NOT allowed" to P_RPRT
				endif

				if SUBSTR(PRMSSN,7,1) = "A"
					store "allowed" to P_ADMIN
				else
					store "NOT allowed" to P_ADMIN
				endif

				@ 8,15 say "USER's identification is ....... " + LOGON
				@ 10,15 say "VIEW permission is ............. " + P_VIEW
				@ 11,15 say "ADD permission is .............. " + P_ADD
				@ 12,15 say "EDIT permission is .............." + P_EDIT
				@ 13,15 say "RELEASE permission is .......... " + P_REL
				@ 14,15 say "REPORT permission is ........... " + P_RPRT
				@ 15,15 say "ADMINISTRATION permission is ... " + P_ADMIN

				store 19 to STAT_LINE
				store "You are scrolling through the user listing" to STAT_MSG
				do status

				skip

				do CLRSCRN

			enddo

	endcase

	do DATETAIL
	store "Press 0 to STOP" to R_TAIL
	do tail

enddo

select A
use

return

