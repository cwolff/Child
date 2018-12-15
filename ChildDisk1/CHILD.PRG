* Last revised : Sun 28-Feb-88 at 8:53 pm
*************************************************************************
*																		*
* CHILD >>> Data Base written for Childrens Hospital and Dr. Craenen	*
*		entry : None													*
*		exit : None 													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

clear ALL

set echo off
set status off
set scoreboard off
set heading off
set safety off
set talk off
set bell off
set delimiter on
set delimiters to "[]"
set century off
set date american
set color to W+/B,W+/N,N,N

clear

@ 10,12 say "C H I L D   D A T A   B A S E   I N I T I A L I Z I N G"

set color to R/B,W+/N,N,N

@ 13,12 say "อออออออออออ[ another information tool from ]อออออออออออ"
@ 15,12 say "                Personal Touch Software"
@ 16,12 say "                   5000 Ostrander Rd"
@ 17,12 say "                  Ostrander Ohio 43061"
@ 18,12 say "                     (614) 666-4421"

set color to W+/B,W+/N,N,N

@ 23,10 say "(C)opyright 1987, Personal Touch Software All Rights Reserved"
@ 1,0 say " "

set color to G/N,W+/N,N,N

public ADV_NBR, A_DATE, A_CHG_NO, A_DIAG, A_MD, A_LOGON, A_DESC, S_ADV_NBR
public ADV_LINE, TOT_ADV, ADV_TOT, ADV_SIZE

public ACT_LOGON, ADDCOUNT, ADDSWITCH, AGE_TOT, ANY_KEY, AXIS, BIRTH
public BIRTH_DATE, BIRTH_MNTH, BLANK, BRTH_TOT, B_LINE, CARNBR, CAR_LINE
public CAR_NBR, CAR_SIZE, CAR_TOT, CHECK, CHECK_AGE, CHOICE, CHK_RNGE, CITY
public CODE, COND, CONTINUE, COPY_FILE, COUNT, CPYRGHT, CUR_CNT
public CUR_COL, CUR_ROW, CURR_LINE, C_DATE, DAY, DAY_NBR, DELRCD, DEL_FILE
public DEL_RCD, DESCRIPT, DEST_FILE, DEST_ROOT, DIANBR, DIA_LINE, DIA_NBR
public DIA_SIZE, DIA_TOT, DIED, DIED_TOT, DO_SEARCH, DOPPLER, DTDCODE, D_CODE, D_DATE
public D_DESC, ECHNBR, ECH_LINE, ECH_NBR, ECH_SIZE, ECH_TOT, EKGNBR
public EKG_LINE, EKG_NBR, EKG_SIZE, EKG_TOT, ENCODE, E_DATE, FATHER
public FILENAME, FILE_NAME, FLOPPY, FST_N, FST_NAME, F_SIZE, GETKEY
public GR, G_CITY, G_FST_N, G_LST_N, G_M_I, G_PHONE, G_STATE
public G_STREET, G_ZIP, HEAD, HEAD_LINE, HIGH_END, HIT, HOSNBR
public HOS_LINE, HOS_NBR, HOS_SIZE, HOS_TOT, HYP, H_ATPSY, H_CMNTS
public H_DATE_A, H_DATE_D, H_DIED, KEY, KTKCODE, KTKPTR, K_CODE
public K_DATE, K_DESC, K_PTR, L1, L10, L2, L3
public L4, L5, L6, L7, L8, L9, LAST
public LINE, LOGON, LOOP, LOW_END, LST_N, LST_NAME, LTRNBR
public LTR_CNT, LTR_COUNT, LTR_LINE, LTR_NBR, LTR_SIZE, LTR_TOT, L_DATE
public L_TAIL, MAX_CNT, MENU_1, MENU_2, MENU_3, MENU_4, MENU_5
public MENU_CNT, META, MIX, MONTH, MORE, MOTHER, MTH_NBR
public M_I, M_MODE, NBRFLD, NBRIDX, NBR_DISK, NBR_FND, NBR_MOD, NBR_LINE
public NBR_PD, NBR_REC, NEWCAR, NEWDIA, NEWECH, NEWEKG, NEWHOS
public NEWLTR, NEWOFF, NEWPAT, NEWPRO, NEWRCD, NEWWORD, NEWXRY
public NEXTFILE, NWCNBR, NWDNBR, NWENBR, NWHNBR, NWKNBR, NWLNBR
public NWONBR, NWPLNFN, NWPNBR, NWRNBR, NWXNBR, OFFNBR, OFF_LINE
public OFF_NBR, OFF_SIZE, OFF_TOT, OK, OLD, OLDRCD, OLDWORD
public O_DATE, PAGE, PART1, PART2, PASS, PASS_LINE, PATLNFN
public PATNBR, PAT_AGE, PAT_LINE, PAT_NBR, PAT_NUMBER, PAT_SEL, PAT_SIZE
public PAT_TOT, PERMISSION, PHONE, PLACE, PMT_LINE, PMT_MSG, PRINT
public PRMSSN, PRONBR, PRO_LINE, PRO_NBR, PRO_SIZE, PRO_TOT, PSSWRD
public PWDATE, P_ADD, P_ADMIN, P_CODE, P_DATE, P_DESC, P_EDIT
public P_REL, P_RPRT, P_VIEW, QP_QS, RCDNBR, RECORD, REC_PLACE
public REFRESH, REF_DOC, RHYTHM, ROW_NBR, RPRT_DATE, RP_RS, RVP_AOP
public RVP_LVP, R_COL, R_TAIL, SAME, SCREEN, SCROLL, SEARCH, SEL_MNTH
public SEL_NAME, SEL_NBR, SEL_PAT, SRCH_PAT, SRC_DRIVE, SRC_FILE, SRC_NAME
public SRC_ROOT, STATE, STAT_LINE, STAT_MSG, STREET, SYSLOGON, S_AGE
public S_AGE_TOT, S_AXIS, S_BRTH_TOT, S_CAR_NBR, S_CAR_TOT, S_COND, S_DATE
public S_DATE_A, S_DIA_NBR, S_DIA_TOT, S_DIED, S_DIED_TOT, S_DOPPLER, S_D_CODE
public S_ECH_NBR, S_ECH_TOT, S_EKG_NBR, S_EKG_TOT, S_END_M, S_END_Y, S_GR, S_HOS_NBR, S_HYP
public S_LTR_NBR, S_META, S_M_MODE, S_OFF_NBR, S_PRO, S_PRO_NBR, S_PRO_TOT
public S_QP_QS, S_RHYTHM, S_RP_RS, S_RVP_AOP, S_RVP_LVP, S_STRT_M, S_STRT_Y, S_TOTAL, S_TWO_D
public S_XRAY, S_XRY_NBR, S_XRY_TOT, TAIL_LINE, TCARNBR, TDIANBR, TDY, TECHNBR
public TEKGNBR, TEMP_PART, TEST_DATE, TEST_MNTH, THOSNBR, TLTRNBR, TMPLNBR
public TMPLTR, TODAY, TOFFNBR, TOTAL_DISK, TOTAL_SIZE, TOTNBR, TOT_CAR
public TOT_DIA, TOT_ECH, TOT_EKG, TOT_HOS, TOT_NBR, TOT_OFF, TOT_PAGE
public TOT_PAT, TOT_PRO, TOT_XRY, TPATNBR, TPRONBR, TWO_D, TXRYNBR
public T_AGE, T_LINE_1, T_LINE_2, USER_LOGON, VALUE, VERIFY, VLD_RNGE, XRAY
public XRYNBR, XRY_LINE, XRY_NBR, XRY_SIZE, XRY_TOT, X_DATE, YEAR
public YN, YN_LINE, YN_MSG, YR_NBR, Y_N, ZIP

select A
use GLOBAL
store G_DATE to TODAY
replace G_LOGON with " "
replace G_PSSWRD with " "
replace G_PRMSSN with " "
replace G_PWDATE with " "
use

do PASSWORD

select A
use GLOBAL
store G_PWDATE to OLD
use
store (366*val(SUBSTR(OLD,7,2)))+(32*val(SUBSTR(OLD,1,2)))+val(SUBSTR(OLD,4,2)) to OLD
store (366*val(SUBSTR(TODAY,7,2)))+(32*val(SUBSTR(TODAY,1,2)))+val(SUBSTR(TODAY,4,2)) to TODAY
if OLD < (TODAY - 60)
	store 19 to STAT_LINE
	store "Your password has expired" to STAT_MSG
	do STATUS
	do CHNGPASS
endif


store .T. to REFRESH
store .T. to CONTINUE
do while CONTINUE

	if REFRESH
		store "First Choice Menu" to HEAD
		do DATETAIL
		store "Press 0 to STOP" to R_TAIL
		do FRAME

		store 5 to MENU_CNT
		store "Search Data Base" to MENU_1
		store "Child Data Base" to MENU_2
		store "System Adminstration" to MENU_3
		store "Change Your Password" to MENU_4
		store "Logoff/Logon" to MENU_5
		do MENU
	endif

	store 5 to CHOICE
	do GETKEY

	do case

		case CHOICE = 0
			store .F. to CONTINUE

		case CHOICE = 1
			do SRCHMENU
			store .T. to REFRESH
			store .T. to CONTINUE

		case CHOICE = 2
			do CHLDMENU
			store .T. to REFRESH
			store .T. to CONTINUE

		case CHOICE = 3
			use global
			store G_PRMSSN to PRMSSN
			use
			if SUBSTR(PRMSSN,7,1) = "A"
				do SYSADMIN
				store .T. to REFRESH
				store .T. to CONTINUE
			else
				store 19 to STAT_LINE
				store "ADMINISTRATION permission denied" to STAT_MSG
				do STATUS
				store .F. to REFRESH
				store .T. to CONTINUE
			endif

		case CHOICE = 4
			do CHNGPASS
			store .T. to REFRESH
			store .T. to CONTINUE

		case CHOICE = 5
			do PASSWORD
			store .T. to REFRESH
			store .T. to CONTINUE

	endcase

enddo

clear ALL
set color to W/N,W/N,N,N

clear

quit

