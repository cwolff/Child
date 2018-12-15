*************************************************************************
*																		*
* RESTDBF >>> Permits the backing up of the child data base				*
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
*	newekg.dbf (index on k_ekg_nbr to nwknbr)							*
*	newcar.dbf (index on c_car_nbr to nwcnbr)							*
*	newech.dbf (index on e_ech_nbr to nwenbr)							*
*	newxry.dbf (index on x_xry_nbr to nwxnbr)							*
*	newpro.dbf (index on r_pro_nbr to nwpnbr)							*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store "Restore Child Data Base" to HEAD
do DATETAIL
store "Press 0 to STOP" to R_TAIL
do FRAME

store .T. to CONTINUE

do while CONTINUE
	store 2 to MENU_CNT
	store "Begin to Restore all data files of Child Data Base" to MENU_1
	store "Begin to Rebuild All Child Data Base Indexes" to MENU_2
	do MENU

	store 2 to CHOICE
	do GETKEY

	do case
		case CHOICE = 0
			store .F. to CONTINUE

		case CHOICE = 1
			do CLRSCRN

			store "Restore in progress" to L_TAIL
			store "Do not disturb this process" to R_TAIL
			do TAIL
		
			store 19 to STAT_LINE
			store "Please insert the Utility disk" to STAT_MSG
			do STATUS
			
			run del *.dbf > nul
			run del *.ntx > nul
	
			do while .not. (file("A:GLOBAL.DBF"))
				store 19 to STAT_LINE
				store "This is not the utility disk, please correct" to STAT_MSG
				do STATUS
			
			enddo
			
			store 5 to PMT_LINE
			store "Copying file A:GLOBAL.DBF to GLOBAL.DBF" to PMT_MSG
			do PROMPT
			
			run copy A:GLOBAL.DBF GLOBAL.DBF > nul
			
			store 7 to PMT_LINE
			store "Copying file A:SYSTEM.DBF to SYSTEM.DBF" to PMT_MSG
			do PROMPT
			
			run copy A:SYSTEM.DBF SYSTEM.DBF > nul
			
			store 9 to PMT_LINE
			store "Copying file A:DIATABLE.DBF to DIATABLE.DBF" to PMT_MSG
			do PROMPT
			
			run copy A:DIATABLE.DBF DIATABLE.DBF > nul

			store 11 to PMT_LINE
			store "Copying file A:EKGTABLE.DBF to EKGTABLE.DBF" to PMT_MSG
			do PROMPT
			
			run copy A:EKGTABLE.DBF EKGTABLE.DBF > nul
			
			store 13 to PMT_LINE
			store "Copying file A:TOTAL.DBF to TOTAL.DBF" to PMT_MSG
			do PROMPT
			
			run copy A:TOTAL.DBF TOTAL.DBF > nul
			
			store 15 to PMT_LINE
			store "Copying file A:CHLDSIZE.DBF to CHLDSIZE.DBF" to PMT_MSG
			do PROMPT
			
			run copy A:CHLDSIZE.DBF CHLDSIZE.DBF  > nul
			run copy A:FOUNDPAT.DBF FOUNDPAT.DBF > nul
			run copy A:SRCHPARM.DBF SRCHPARM.DBF > nul
			run copy A:BLANK BLANK > nul

			select A
			use CHLDSIZE
			goto top

			store C_PAT_SIZE to PAT_SIZE
			store C_DIA_SIZE to DIA_SIZE
			store C_OFF_SIZE to OFF_SIZE
			store C_LTR_SIZE to LTR_SIZE
			store C_HOS_SIZE to HOS_SIZE
			store C_ADV_SIZE to ADV_SIZE
			store C_EKG_SIZE to EKG_SIZE
			store C_CAR_SIZE to CAR_SIZE
			store C_XRY_SIZE to XRY_SIZE
			store C_PRO_SIZE to PRO_SIZE
			store C_ECH_SIZE to ECH_SIZE
			
			use
			
			store 19 to STAT_LINE
			store "Part 1 of Restore All Data Files is Complete" to STAT_MSG
			do STATUS

			do CLRSCRN
			
			store "A:" to SRC_DRIVE
			store "PAT" to SRC_ROOT
			store "PATIENT" to DEST_FILE
			store 5 to ROW_NBR
			store 1300 to NBR_PD
			store PAT_SIZE to TOTAL_SIZE
			do FLOPPYRE

			store "A:" to SRC_DRIVE
			store "DIA" to SRC_ROOT
			store "DIAGNOSE" to DEST_FILE
			store 7 to ROW_NBR
			store 11000 to NBR_PD
			store DIA_SIZE to TOTAL_SIZE
			do FLOPPYRE

			store "A:" to SRC_DRIVE
			store "OFF" to SRC_ROOT
			store "OFFICE" to DEST_FILE
			store 9 to ROW_NBR
			store 12000 to NBR_PD
			store OFF_SIZE to TOTAL_SIZE
			do FLOPPYRE

			store "A:" to SRC_DRIVE
			store "LET" to SRC_ROOT
			store "LETTER" to DEST_FILE
			store 10 to ROW_NBR
			store 350 to NBR_PD
			store LTR_SIZE to TOTAL_SIZE
			do FLOPPYRE

			store "A:" to SRC_DRIVE
			store "HOS" to SRC_ROOT
			store "HOSPITAL" to DEST_FILE
			store 11 to ROW_NBR
			store 5000 to NBR_PD
			store HOS_SIZE to TOTAL_SIZE
			do FLOPPYRE

			store "A:" to SRC_DRIVE
			store "ADV" to SRC_ROOT
			store "ADVICE" to DEST_FILE
			store 12 to ROW_NBR
			store 8000 to NBR_PD
			store ADV_SIZE to TOTAL_SIZE
			do FLOPPYRE

			store "A:" to SRC_DRIVE
			store "EKG" to SRC_ROOT
			store "EKG" to DEST_FILE
			store 13 to ROW_NBR
			store 6000 to NBR_PD
			store EKG_SIZE to TOTAL_SIZE
			do FLOPPYRE

			store "A:" to SRC_DRIVE
			store "XRY" to SRC_ROOT
			store "XRAY" to DEST_FILE
			store 14 to ROW_NBR
			store 12000 to NBR_PD
			store XRY_SIZE to TOTAL_SIZE
			do FLOPPYRE

			store "A:" to SRC_DRIVE
			store "ECH" to SRC_ROOT
			store "ECHO" to DEST_FILE
			store 15 to ROW_NBR
			store 11000 to NBR_PD
			store ECH_SIZE to TOTAL_SIZE
			do FLOPPYRE

			store "A:" to SRC_DRIVE
			store "CAR" to SRC_ROOT
			store "CARDIAC" to DEST_FILE
			store 16 to ROW_NBR
			store 10000 to NBR_PD
			store CAR_SIZE to TOTAL_SIZE
			do FLOPPYRE

			store "A:" to SRC_DRIVE
			store "PRO" to SRC_ROOT
			store "PROC" to DEST_FILE
			store 17 to ROW_NBR
			store 9000 to NBR_PD
			store PRO_SIZE to TOTAL_SIZE
			do FLOPPYRE

			store 19 to STAT_LINE
			store "Part 2 of Restore All Data Files is Complete" to STAT_MSG
			do STATUS

			do CLRSCRN
			
			store DTOC(date()) to L_TAIL
			store "Press 0 to STOP" to R_TAIL
			do TAIL

		case CHOICE = 2
			do CLRSCRN

			store "Reindex in progress" to L_TAIL
			store "Do not disturb this process" to R_TAIL
			do TAIL
			
			store 5 to PMT_LINE
			store "Indexing PATIENT and NEWPAT" to PMT_MSG
			do PROMPT
			
			use PATIENT
			index on P_PAT_NBR to PATNBR
			index on P_LST_N + P_FST_N to PATLNFN
			copy structure to NEWPAT
			use NEWPAT
			index on P_PAT_NBR to NWPNBR
			index on P_LST_N + P_FST_N to NWPLNFN
			
			store 7 to PMT_LINE
			store "Indexing DIAGNOSE and NEWDIA" to PMT_MSG
			do PROMPT
			
			use DIAGNOSE
			index on D_DIA_NBR to DIANBR
			copy structure to NEWDIA
			use NEWDIA
			index on D_DIA_NBR to NWDNBR
			
			store 9 to PMT_LINE
			store "Indexing OFFICE and NEWOFF" to PMT_MSG
			do PROMPT
			
			use OFFICE
			index on O_OFF_NBR to OFFNBR
			copy structure to NEWOFF
			use NEWOFF
			index on O_OFF_NBR to NWONBR
			
			store 10 to PMT_LINE
			store "Indexing LETTER and NEWLTR and TMPLTR" to PMT_MSG
			do PROMPT
			
			use LETTER
			index on L_LTR_NBR to LTRNBR
			copy structure to NEWLTR
			use NEWLTR
			index on L_LTR_NBR to NWLNBR
			copy structure to TMPLTR
			use TMPLTR
			index on L_LTR_NBR to TMPLNBR
			
			store 11 to PMT_LINE
			store "Indexing HOSPITAL and NEWHOS" to PMT_MSG
			do PROMPT
			
			use HOSPITAL
			index on H_HOS_NBR to HOSNBR
			copy structure to NEWHOS
			use NEWHOS
			index on H_HOS_NBR to NWHNBR
			
			store 12 to PMT_LINE
			store "Indexing ADVICE and NEWADV" to PMT_MSG
			do PROMPT
			
			use ADVICE
			index on A_ADV_NBR to ADVNBR
			copy structure to NEWADV
			use NEWADV
			index on A_ADV_NBR to NWANBR

			store 13 to PMT_LINE
			store "Indexing EKG and NEWEKG" to PMT_MSG
			do PROMPT
			
			use EKG
			index on K_EKG_NBR to EKGNBR
			copy structure to NEWEKG
			use NEWEKG
			index on K_EKG_NBR to NWKNBR
			
			store 14 to PMT_LINE
			store "Indexing CARDIAC and NEWCAR" to PMT_MSG
			do PROMPT
			
			use CARDIAC
			index on C_CAR_NBR to CARNBR
			copy structure to NEWCAR
			use NEWCAR
			index on C_CAR_NBR to NWCNBR
			
			store 15 to PMT_LINE
			store "Indexing ECH and NEWECH" to PMT_MSG
			do PROMPT
			
			use ECHO
			index on E_ECH_NBR to ECHNBR
			copy structure to NEWECH
			use NEWECH
			index on E_ECH_NBR to NWENBR
			
			store 16 to PMT_LINE
			store "Indexing XRAY and NEWXRY" to PMT_MSG
			do PROMPT
			
			use XRAY
			index on X_XRY_NBR to XRYNBR
			copy structure to NEWXRY
			use NEWXRY
			index on X_XRY_NBR to NWXNBR
			
			store 17 to PMT_LINE
			store "Indexing PROC and NEWPRO" to PMT_MSG
			do PROMPT
			
			use PROC
			index on R_PRO_NBR to PRONBR
			copy structure to NEWPRO
			use NEWPRO
			index on R_PRO_NBR to NWRNBR
		
			store 19 to PMT_LINE
			store "Indexing SYSTEM, TOTAL, DIATABLE and EKGTABLE" to PMT_MSG
			do PROMPT
			
			use system
			index on S_LOGON to SYSLOGON

			use	TOTAL
			index on T_TOT_NBR to TOTNBR
			
			use DIATABLE
			index on DT_D_CODE to DTDCODE
			
			use EKGTABLE
			index on KT_K_CODE to KTKCODE
			index on KT_K_PTR to KTKPTR
			
			store 19 to STAT_LINE
			store "Restoration of Child Data Base is Complete" to STAT_MSG
			do STATUS
			
			do CLRSCRN
			
			store DTOC(date()) to L_TAIL
			store "Press 0 to STOP" to R_TAIL
			do TAIL

	endcase

enddo

return
