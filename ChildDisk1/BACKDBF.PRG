*************************************************************************
*																		*
* BACKDBF >>> Permits the backing up of the child data base				*
*		   entry : None													*
*		   exit : None													*
*																		*
* drive c:																*
*	patient.dbf (index on p_pat_nbr to patnbr, 							*
*		  index on p_lst_n + p_fst_n to patlnfn)						*
*	diagnose.dbf (index on d_dia_nbr to dianbr)							*
*	office.dbf (index on o_off_nbr to offnbr)							*
*	letter.dbf (index on l_ltr_nbr to ltrnbr)							*
*	hospital.dbf (index on h_hos_nbr to hosnbr)							*
*	advice.dbf (index on a_adv_nbr to advnbr)							*
*	ekg.dbf (index on k_ekg_nbr to ekgnbr)								*
*	cardiac.dbf (index on c_car_nbr to carnbr) 							*
*	echo.dbf (index on e_ech_nbr to echnbr)								*
*	xray.dbf (index on x_xry_nbr to xrynbr)								*
*	proc.dbf (index on r_pro_nbr to pronbr)								*
*																		*
*	diatable.dbf (index on dt_d_code to dtdcode)						*
*	ekgtable.dbf (index on kt_k_code to ktkcode)						*
*				 (index on kt_k_ptr to ktkptr)							*
*																		*
*	global.dbf 															*
*	system.dbf (index on sys_logon to syslogon)							*
*	chldsize.dbf														*
*	total.dbf (index on t_tot_nbr to totnbr)							*
*																		*
*	newpat.dbf (index on p_pat_nbr to nwpnbr)							*
*				(index on p_lst_n + p_fst_n to nwplnfn					*
*	newdia.dbf (index on d_dia_nbr to nwdnbr)							*
*	newoff.dbf (index on o_off_nbr to nwonbr)							*
*	newltr.dbf (index on l_ltr_nbr to nwlnbr)							*
*	tmpltr.dbf (index on l_ltr_nbr to nwtlnbr) 							*
*	newhos.dbf (index on h_hos_nbr to nwhnbr)							*
*	newadv.dbf (index on a_adv_nbr to nwanbr)							*
*	newekg.dbf (index on k_ekg_nbr to nwknbr)							*
*	newcar.dbf (index on c_car_nbr to nwcnbr)							*
*	newech.dbf (index on e_ech_nbr to nwenbr)							*
*	newxry.dbf (index on x_xry_nbr to nwxnbr)							*
*	newpro.dbf (index on r_pro_nbr to nwpnbr)							*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "Backup Child Data Base" to HEAD
do DATETAIL
store "Press 0 to STOP" to R_TAIL
do FRAME

store .T. to CONTINUE

do while CONTINUE
	store 1 to MENU_CNT
	store "Begin Backup of all data files of Child Data Base" to MENU_1
	do MENU

	store 1 to CHOICE
	do GETKEY

	do case
		case CHOICE = 0
			store .F. to CONTINUE

		case CHOICE = 1
			do CLRSCRN

			store "Backup in progress" to L_TAIL
			store "Do not disturb this process" to R_TAIL
			do TAIL
		
			store "C:" to SRC_DRIVE
			store "PATIENT" to SRC_FILE
			store "PAT" to DEST_ROOT
			store 5 to ROW_NBR
			store 1300 to NBR_PD
			do FLOPPYBU

			store "C:" to SRC_DRIVE
			store "DIAGNOSE" to SRC_FILE
			store "DIA" to DEST_ROOT
			store 7 to ROW_NBR
			store 11000 to NBR_PD
			do FLOPPYBU

			store "C:" to SRC_DRIVE
			store "OFFICE" to SRC_FILE
			store "OFF" to DEST_ROOT
			store 9 to ROW_NBR
			store 12000 to NBR_PD
			do FLOPPYBU

			store "C:" to SRC_DRIVE
			store "LETTER" to SRC_FILE
			store "LET" to DEST_ROOT
			store 10 to ROW_NBR
			store 350 to NBR_PD
			do FLOPPYBU

			store 19 to PMT_LINE
			store "1) Clear  LETTER.DBF  2) Don't clear" to PMT_MSG
			do PROMPT

			store 2 to CHOICE
			do GETKEY

			@ 19,0

			if CHOICE = 1
				store 19 to PMT_LINE
				store "Clearing letters from LETTER.DBF." to PMT_MSG
				do PROMPT

				select A
				use LETTER

				zap
				index on L_LTR_NBR to LTRNBR

				select A
				use

				@ 19,0

			endif

			store "C:" to SRC_DRIVE
			store "HOSPITAL" to SRC_FILE
			store "HOS" to DEST_ROOT
			store 11 to ROW_NBR
			store 5000 to NBR_PD
			do FLOPPYBU

			store "C:" to SRC_DRIVE
			store "ADVICE" to SRC_FILE
			store "ADV" to DEST_ROOT
			store 12 to ROW_NBR
			store 8000 to NBR_PD
			do FLOPPYBU

			store "C:" to SRC_DRIVE
			store "EKG" to SRC_FILE
			store "EKG" to DEST_ROOT
			store 13 to ROW_NBR
			store 6000 to NBR_PD
			do FLOPPYBU

			store "C:" to SRC_DRIVE
			store "XRAY" to SRC_FILE
			store "XRY" to DEST_ROOT
			store 14 to ROW_NBR
			store 12000 to NBR_PD
			do FLOPPYBU

			store "C:" to SRC_DRIVE
			store "ECHO" to SRC_FILE
			store "ECH" to DEST_ROOT
			store 15 to ROW_NBR
			store 11000 to NBR_PD
			do FLOPPYBU

			store "C:" to SRC_DRIVE
			store "CARDIAC" to SRC_FILE
			store "CAR" to DEST_ROOT
			store 16 to ROW_NBR
			store 10000 to NBR_PD
			do FLOPPYBU

			store "C:" to SRC_DRIVE
			store "PROC" to SRC_FILE
			store "PRO" to DEST_ROOT
			store 17 to ROW_NBR
			store 9000 to NBR_PD
			do FLOPPYBU

			store 19 to STAT_LINE
			store "Part 1 of Backup of all data files is complete" to STAT_MSG
			do STATUS

			do CLRSCRN
			
			store 19 to STAT_LINE
			store "Please Insert the Utility Disk" to STAT_MSG
			do STATUS
		
			store 5 to PMT_LINE
			store "Formatting UTILITY disk" to PMT_MSG
			do PROMPT
			
			run format a:/4 < blank > nul

			store 5 to PMT_LINE
			store "Copying GLOBAL.DBF to A:GLOBAL.DBF" to PMT_MSG
			do PROMPT
			
			run copy GLOBAL.DBF A:GLOBAL.DBF > nul
			
			store 7 to PMT_LINE
			store "Copying SYSTEM.DBF to A:SYSTEM.DBF" to PMT_MSG
			do PROMPT
			
			run copy SYSTEM.DBF A:SYSTEM.DBF > nul
			
			store 9 to PMT_LINE
			store "Copying DIATABLE.DBF to A:DIATABLE.DBF" to PMT_MSG
			do PROMPT
			
			run copy DIATABLE.DBF A:DIATABLE.DBF > nul
			
			store 11 to PMT_LINE
			store "Copying EKGTABLE.DBF to A:EKGTABLE.DBF" to PMT_MSG
			do PROMPT
			
			run copy EKGTABLE.DBF A:EKGTABLE.DBF > nul

			store 13 to PMT_LINE
			store "Copying TOTAL.DBF to A:TOTAL.DBF" to PMT_MSG
			do PROMPT
			
			run copy TOTAL.DBF A:TOTAL.DBF	> nul
			
			store 15 to PMT_LINE
			store "Copying CHDLSIZE.DBF to A:CHDLSIZE.DBF" to PMT_MSG
			do PROMPT
			
			select A
			use CHLDSIZE
			goto top
			
			select B
			
			use PATIENT
			goto bottom
			store recno() to PAT_SIZE		
			
			use DIAGNOSE
			goto bottom
			store recno() to DIA_SIZE
			
			use OFFICE
			goto bottom
			store recno() to OFF_SIZE
			
			use LETTER
			goto bottom
			store recno() to LTR_SIZE
			
			use HOSPITAL
			goto bottom
			store recno() to HOS_SIZE
			
			use ADVICE
			goto bottom
			store recno() to ADV_SIZE

			use EKG
			goto bottom
			store recno() to EKG_SIZE
			
			use CARDIAC
			goto bottom
			store recno() to CAR_SIZE
			
			use XRAY
			goto bottom
			store recno() to XRY_SIZE
			
			use PROC
			goto bottom
			store recno() to PRO_SIZE
			
			use ECHO
			goto bottom
			store recno() to ECH_SIZE
			
			use
			
			select A

			replace C_PAT_SIZE with PAT_SIZE
			replace C_DIA_SIZE with DIA_SIZE
			replace C_OFF_SIZE with OFF_SIZE
			replace C_LTR_SIZE with LTR_SIZE
			replace C_HOS_SIZE with HOS_SIZE
			replace C_ADV_SIZE with ADV_SIZE
			replace C_EKG_SIZE with EKG_SIZE
			replace C_CAR_SIZE with CAR_SIZE
			replace C_XRY_SIZE with XRY_SIZE
			replace C_PRO_SIZE with PRO_SIZE
			replace C_ECH_SIZE with ECH_SIZE
			
			use
			
			run copy CHLDSIZE.DBF A:CHLDSIZE.DBF > nul
			run copy FOUNDPAT.DBF A:FOUNDPAT.DBF > nul
			run copy SRCHPARM.DBF A:SRCHPARM.DBF > nul
			run copy BLANK A:BLANK > nul
			
			store 19 to STAT_LINE
			store "Part 2 of Backup of all data files is complete" to STAT_MSG
			do STATUS

			do CLRSCRN

			do DATETAIL
			store "Press 0 to STOP" to R_TAIL
			do TAIL

	endcase

enddo

return

