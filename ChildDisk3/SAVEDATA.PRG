*************************************************************************
*																		*
* SAVEDATA >>> Save all new data to the data base						*
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************

select A
use
select B
use

do CLRSCRN

store 19 to PMT_LINE
store "Take a break while I check to see if any data was added." to PMT_MSG
do PROMPT

store SUBSTR(DTOC(date()),7,2)+SUBSTR(DTOC(date()),1,2)+SUBSTR(DTOC(date()),4,2) to DAY_NBR
store SUBSTR(DAY_NBR,1,4) + "00" to MTH_NBR
store SUBSTR(MTH_NBR,1,2) + "00" + "00" to YR_NBR

store 0 to PAT_TOT
store 0 to DIA_TOT
store 0 to OFF_TOT
store 0 to HOS_TOT
store 0 to LTR_TOT
store 0 to EKG_TOT
store 0 to XRY_TOT
store 0 to ECH_TOT
store 0 to CAR_TOT
store 0 to PRO_TOT

*
* SAVE PATIENT DATA
*

@ 5,15 say "Checking for new patients."

if file("NEWPAT.DBF") .and. file("PATIENT.DBF")
	select A
	use NEWPAT

	goto bottom
	
	store eof() to ADDSWITCH
	store RECNO() to ADDCOUNT
	store ADDCOUNT to PAT_TOT
	
	select A
	use

	if .not. ADDSWITCH
		select A
		use PATIENT

		@ 5,15
		@ 5,15 say "Number of new patients added .... "
		@ 5,49 say ADDCOUNT

		append from NEWPAT for .not. DELETE()

		select A
		use

		store "PAT" + SUBSTR(DTOC(date()),1,2)+SUBSTR(DTOC(date()),4,2)+SUBSTR(DTOC(date()),8,1)+".DBF" to FILENAME

		if file (FILENAME)
			select A
			use &FILENAME

			append from NEWPAT for .not. DELETE()

		else
			select A
			use NEWPAT

			copy structure to &FILENAME

			select A
			use &FILENAME

			append from NEWPAT for .not. DELETE()

			select A
			use

		endif

		select A
		use NEWPAT

		zap

		index on P_PAT_NBR to NWPNBR
		index on P_LST_N + P_FST_N to NWPLNFN

		select A
		use PATIENT

		index on P_PAT_NBR to PATNBR
		index on P_LST_N + P_FST_N to PATLNFN

		select A
		use

	else
		@ 5,15
		@ 5,15 say "No new patients were added to the data base."

	endif

else
	@ 5,0
	@ 5,15 say "No patient or newpat file present."

endif

*
* SAVE NEW DIAGNOSES
*

@ 7,15 say "Checking for new diagnoses."

if file("NEWDIA.DBF") .and. file("DIAGNOSE.DBF") .and. file("DIATABLE.DBF")
	select A
	use NEWDIA

	goto bottom

	store eof() to ADDSWITCH
	store RECNO() to ADDCOUNT
	store ADDCOUNT to DIA_TOT

	select A
	use

	if .not. ADDSWITCH
		select A
		use DIAGNOSE

		@ 7,15
		@ 7,15 say "Number of new diagnoses added ... "
		@ 7,49 say ADDCOUNT

		append from NEWDIA for .not. DELETE()

		select A
		use

		store "DIA" + SUBSTR(DTOC(date()),1,2)+SUBSTR(DTOC(date()),4,2)+SUBSTR(DTOC(date()),8,1)+".DBF" to FILENAME

		if file (FILENAME)
			select A
			use &FILENAME

			append from NEWDIA for .not. DELETE()

		else
			select A
			use NEWDIA

			copy structure to &FILENAME

			select A
			use &FILENAME

			append from NEWDIA for .not. DELETE()

			select A
			use

		endif

		select A
		use NEWDIA

		zap

		index on D_DIA_NBR to NWDNBR

		select A
		use DIAGNOSE

		index on D_DIA_NBR to DIANBR

		select A
		use

	else
		@ 7,15
		@ 7,15 say "No new diagnoses were added to the data base."

	endif

else
	@ 7,0
	@ 7,15 say "No diagnose, newdia or diatable file present."

endif

*
* SAVE NEW OFFICE CALLS
*

@ 9,15 say "Checking for new office calls."

if file("NEWOFF.DBF") .and. file("OFFICE.DBF")
	select A
	use NEWOFF

	goto bottom
	
	store eof() to ADDSWITCH
	store RECNO() to ADDCOUNT
	store ADDCOUNT to OFF_TOT

	select A
	use

	if .not. ADDSWITCH
		select A
		use OFFICE

		@ 9,15
		@ 9,15 say "Number of office calls added .... "
		@ 9,49 say ADDCOUNT

		append from NEWOFF for .not. DELETE()

		select A
		use

		store "OFF" + SUBSTR(DTOC(date()),1,2)+SUBSTR(DTOC(date()),4,2)+SUBSTR(DTOC(date()),8,1)+".DBF" to FILENAME

		if file (FILENAME)
			select A
			use &FILENAME

			append from NEWOFF for .not. DELETE()

		else
			select A
			use NEWOFF

			copy structure to &FILENAME

			select A
			use &FILENAME

			append from NEWOFF for .not. DELETE()

			select A
			use

		endif

		select A
		use NEWOFF

		zap

		index on O_OFF_NBR to NWONBR

		select A
		use OFFICE

		index on O_OFF_NBR to OFFNBR

		select A
		use

	else
		@ 9,15
		@ 9,15 say "No office calls were added to the data base."

	endif

else
	@ 9,0
	@ 9,15 say "No office or newoff file present."

endif

*
* SAVE NEW LETTERS
*

@ 10,15 say "Checking for new letters."

if file("NEWLTR.DBF") .and. file("LETTER.DBF")
	select A
	use NEWLTR

	goto bottom
	
	store eof() to ADDSWITCH
	store RECNO() to ADDCOUNT
	store ADDCOUNT to LTR_TOT

	select A
	use

	if .not. ADDSWITCH
		select A
		use LETTER

		@ 10,15
		@ 10,15 say "Number of letter pages added  ... "
		@ 10,49 say ADDCOUNT

		append from NEWLTR for .not. DELETE()

		select A
		use

		store "LTR" + SUBSTR(DTOC(date()),1,2)+SUBSTR(DTOC(date()),4,2)+SUBSTR(DTOC(date()),8,1)+".DBF" to FILENAME

		if file (FILENAME)
			select A
			use &FILENAME

			append from NEWLTR for .not. DELETE()

		else
			select A
			use NEWLTR

			copy structure to &FILENAME

			select A
			use &FILENAME

			append from NEWLTR for .not. DELETE()

			select A
			use

		endif

		select A
		use NEWLTR

		zap

		index on L_LTR_NBR to NWLNBR

		select A
		use LETTER

		index on L_LTR_NBR to LTRNBR

		select A
		use

	else
		@ 10,15
		@ 10,15 say "No letters were added to the data base."

	endif

else
	@ 10,0
	@ 10,15 say "No letter or newlet file present."

endif

*
* SAVE NEW HOSPITAL STAYS
*

@ 11,15 say "Checking for new hospital stays."

if file("NEWHOS.DBF") .and. file("HOSPITAL.DBF")
	select A
	use NEWHOS

	goto bottom
	
	store eof() to ADDSWITCH
	store RECNO() to ADDCOUNT
	store ADDCOUNT to HOS_TOT

	select A
	use

	if .not. ADDSWITCH
		select A
		use HOSPITAL

		@ 11,15
		@ 11,15 say "Number of hospital stays added .. "
		@ 11,49 say ADDCOUNT

		append from NEWHOS for .not. DELETE()

		select A
		use

		store "HOS" + SUBSTR(DTOC(date()),1,2)+SUBSTR(DTOC(date()),4,2)+SUBSTR(DTOC(date()),8,1)+".DBF" to FILENAME

		if file (FILENAME)
			select A
			use &FILENAME

			append from NEWHOS for .not. DELETE()

		else
			select A
			use NEWHOS

			copy structure to &FILENAME

			select A
			use &FILENAME

			append from NEWHOS for .not. DELETE()

			select A
			use

		endif

		select A
		use NEWHOS

		zap

		index on H_HOS_NBR to NWHNBR

		select A
		use HOSPITAL

		index on H_HOS_NBR to HOSNBR

		select A
		use

	else
		@ 11,15
		@ 11,15 say "No hospital stays were added to the data base."

	endif

else
	@ 11,0
	@ 11,15 say "No hospital or newhos file present."

endif

*
* SAVE NEW CONSULTS (advice)
*

@ 12,15 say "Checking for new consults."

if file("NEWADV.DBF") .and. file("ADVICE.DBF")
	select A
	use NEWADV

	goto bottom
	
	store eof() to ADDSWITCH
	store RECNO() to ADDCOUNT
	store ADDCOUNT to ADV_TOT

	select A
	use

	if .not. ADDSWITCH
		select A
		use ADVICE

		@ 12,15
		@ 12,15 say "Number of consutls added ........ "
		@ 12,49 say ADDCOUNT

		append from NEWADV for .not. DELETE()

		select A
		use

		store "ADV" + SUBSTR(DTOC(date()),1,2)+SUBSTR(DTOC(date()),4,2)+SUBSTR(DTOC(date()),8,1)+".DBF" to FILENAME

		if file (FILENAME)
			select A
			use &FILENAME

			append from NEWADV for .not. DELETE()

		else
			select A
			use NEWADV

			copy structure to &FILENAME

			select A
			use &FILENAME

			append from NEWADV for .not. DELETE()

			select A
			use

		endif

		select A
		use NEWADV

		zap

		index on A_ADV_NBR to NWANBR

		select A
		use ADVICE

		index on A_ADV_NBR to ADVNBR

		select A
		use

	else
		@ 12,15
		@ 12,15 say "No consults were added to the data base."

	endif

else
	@ 12,0
	@ 12,15 say "No advice or newadv file present."

endif

*
* SAVE NEW EKG TESTS
*

@ 13,15 say "Checking for new EKG tests."

if file("NEWEKG.DBF") .and. file("EKG.DBF")
	select A
	use NEWEKG

	goto bottom
	
	store eof() to ADDSWITCH
	store RECNO() to ADDCOUNT
	store ADDCOUNT to EKG_TOT

	select A
	use

	if .not. ADDSWITCH
		select A
		use EKG

		@ 13,15
		@ 13,15 say "Number of EKG tests ............. "
		@ 13,49 say ADDCOUNT

		append from NEWEKG for .not. DELETE()

		select A
		use

		store "EKG" + SUBSTR(DTOC(date()),1,2)+SUBSTR(DTOC(date()),4,2)+SUBSTR(DTOC(date()),8,1)+".DBF" to FILENAME

		if file (FILENAME)
			select A
			use &FILENAME

			append from NEWEKG for .not. DELETE()

		else
			select A
			use NEWEKG

			copy structure to &FILENAME

			select A
			use &FILENAME

			append from NEWEKG for .not. DELETE()

			select A
			use

		endif

		select A
		use NEWEKG

		zap

		index on K_EKG_NBR to NWKNBR

		select A
		use EKG

		index on K_EKG_NBR to EKGNBR

		select A
		use

	else
		@ 13,15
		@ 13,15 say "No EKG tests were added to the data base."

	endif

else
	@ 13,0
	@ 13,15 say "No ekg or newekg file present."

endif

*
* SAVE NEW XRAYS TESTS
*

@ 14,15 say "Checking for new XRAYS.."

if file("NEWXRY.DBF") .and. file("XRAY.DBF")
	select A
	use NEWXRY

	goto bottom
	
	store eof() to ADDSWITCH
	store RECNO() to ADDCOUNT
	store ADDCOUNT to XRY_TOT

	select A
	use

	if .not. ADDSWITCH
		select A
		use XRAY

		@ 14,15
		@ 14,15 say "Number of XRAYS added ........... "
		@ 14,49 say ADDCOUNT

		append from NEWXRY for .not. DELETE()

		select A
		use

		store "XRY" + SUBSTR(DTOC(date()),1,2)+SUBSTR(DTOC(date()),4,2)+SUBSTR(DTOC(date()),8,1)+".DBF" to FILENAME

		if file (FILENAME)
			select A
			use &FILENAME

			append from NEWXRY for .not. DELETE()

		else
			select A
			use NEWXRY

			copy structure to &FILENAME

			select A
			use &FILENAME

			append from NEWXRY for .not. DELETE()

			select A
			use

		endif

		select A
		use NEWXRY

		zap

		index on X_XRY_NBR to NWXNBR

		select A
		use XRAY

		index on X_XRY_NBR to XRYNBR

		select A
		use

	else
		@ 14,15
		@ 14,15 say "No XRAY tests were added to the data base."

	endif

else
	@ 14,0
	@ 14,15 say "No xray or newxry file present."

endif

*
* SAVE NEW ECHO TEST
*

@ 15,15 say "Checking for new ECHO tests."

if file("NEWECH.DBF") .and. file("ECHO.DBF")
	select A
	use NEWECH

	goto bottom
	
	store eof() to ADDSWITCH
	store RECNO() to ADDCOUNT
	store ADDCOUNT to ECH_TOT

	select A
	use

	if .not. ADDSWITCH
		select A
		use ECHO

		@ 15,15
		@ 15,15 say "Number of ECHO tests ............ "
		@ 15,49 say ADDCOUNT

		append from NEWECH for .not. DELETE()

		select A
		use

		store "ECH" + SUBSTR(DTOC(date()),1,2)+SUBSTR(DTOC(date()),4,2)+SUBSTR(DTOC(date()),8,1)+".DBF" to FILENAME

		if file (FILENAME)
			select A
			use &FILENAME

			append from NEWECH for .not. DELETE()

		else
			select A
			use NEWECH

			copy structure to &FILENAME

			select A
			use &FILENAME

			append from NEWECH for .not. DELETE()

			select A
			use

		endif

		select A
		use NEWECH

		zap

		index on E_ECH_NBR to NWENBR

		select A
		use ECHO

		index on E_ECH_NBR to ECHNBR

		select A
		use

	else
		@ 15,15
		@ 15,15 say "No ECHO tests were added to the data base."

	endif

else
	@ 15,0
	@ 15,15 say "No echo or newech file present."

endif

*
* SAVE NEW CARDIAC CATHERIZATIONS
*

@ 16,15 say "Checking for new cardiac catherizations."

if file("NEWCAR.DBF") .and. file("CARDIAC.DBF")
	select A
	use NEWCAR

	goto bottom
	
	store eof() to ADDSWITCH
	store RECNO() to ADDCOUNT
	store ADDCOUNT to CAR_TOT

	select A
	use

	if .not. ADDSWITCH
		select A
		use CARDIAC

		@ 16,15
		@ 16,15 say "Number of cardiac cath. added ...  "
		@ 16,49 say ADDCOUNT

		append from NEWCAR for .not. DELETE()

		select A
		use

		store "CAR" + SUBSTR(DTOC(date()),1,2)+SUBSTR(DTOC(date()),4,2)+SUBSTR(DTOC(date()),8,1)+".DBF" to FILENAME

		if file (FILENAME)
			select A
			use &FILENAME

			append from NEWCAR for .not. DELETE()

		else
			select A
			use NEWCAR

			copy structure to &FILENAME

			select A
			use &FILENAME

			append from NEWCAR for .not. DELETE()

			select A
			use

		endif

		select A
		use NEWCAR

		zap

		index on C_CAR_NBR to NWCNBR

		select A
		use CARDIAC

		index on C_CAR_NBR to CARNBR

		select A
		use

	else
		@ 16,15
		@ 16,15 say "No cardiac catherizations were added to the data base."

	endif

else
	@ 16,0
	@ 16,15 say "No cardiac or newcar file present."

endif

*
* SAVE NEW PROCEDURE/ OPERATIONS
*

@ 17,15 say "Checking for new procedure/ operations."

if file("NEWPRO.DBF") .and. file("PROC.DBF")
	select A
	use NEWPRO

	goto bottom
	
	store eof() to ADDSWITCH
	store RECNO() to ADDCOUNT
	store ADDCOUNT to PRO_TOT

	select A
	use

	if .not. ADDSWITCH
		select A
		use PROC

		@ 17,15
		@ 17,15 say "Number of procedures added ...... "
		@ 17,49 say ADDCOUNT

		append from NEWPRO for .not. DELETE()

		select A
		use

		store "PRO" + SUBSTR(DTOC(date()),1,2)+SUBSTR(DTOC(date()),4,2)+SUBSTR(DTOC(date()),8,1)+".DBF" to FILENAME

		if file (FILENAME)
			select A
			use &FILENAME

			append from NEWPRO for .not. DELETE()

		else
			select A
			use NEWPRO

			copy structure to &FILENAME

			select A
			use &FILENAME

			append from NEWPRO for .not. DELETE()

			select A
			use

		endif

		select A
		use NEWPRO

		zap

		index on R_PRO_NBR to NWRNBR

		select A
		use PROC

		index on R_PRO_NBR to PRONBR

		select A
		use

	else
		@ 17,15
		@ 17,15 say "No procedure/ operations were added to the data base."

	endif

else
	@ 17,0
	@ 17,15 say "No proc or newpro file present."

endif

*
* Update TOTAL file for EOD, EOM and EOY reports
*

select A
use TOTAL index TOTNBR

set exact on

store YR_NBR to TOT_NBR
seek TOT_NBR

if (EOF() .OR. BOF())
	append blank

	replace T_TOT_NBR with TOT_NBR
	replace T_PAT_TOT with 0
	replace T_DIA_TOT with 0
	replace T_OFF_TOT with 0
	replace T_LTR_TOT with 0
	replace T_HOS_TOT with 0
	replace T_EKG_TOT with 0
	replace T_XRY_TOT with 0
	replace T_ECH_TOT with 0
	replace T_CAR_TOT with 0
	replace T_PRO_TOT with 0
endif

replace T_TOT_NBR with TOT_NBR
replace T_PAT_TOT with T_PAT_TOT + PAT_TOT
replace T_DIA_TOT with T_DIA_TOT + DIA_TOT
replace T_OFF_TOT with T_OFF_TOT + OFF_TOT
replace T_LTR_TOT with T_LTR_TOT + LTR_TOT
replace T_HOS_TOT with T_HOS_TOT + HOS_TOT
replace T_EKG_TOT with T_EKG_TOT + EKG_TOT
replace T_XRY_TOT with T_XRY_TOT + XRY_TOT
replace T_ECH_TOT with T_ECH_TOT + ECH_TOT
replace T_CAR_TOT with T_CAR_TOT + CAR_TOT
replace T_PRO_TOT with T_PRO_TOT + PRO_TOT

store MTH_NBR to TOT_NBR
seek TOT_NBR

if (EOF() .OR. BOF())
	append blank

	replace T_TOT_NBR with TOT_NBR
	replace T_PAT_TOT with 0
	replace T_DIA_TOT with 0
	replace T_OFF_TOT with 0
	replace T_LTR_TOT with 0
	replace T_HOS_TOT with 0
	replace T_EKG_TOT with 0
	replace T_XRY_TOT with 0
	replace T_ECH_TOT with 0
	replace T_CAR_TOT with 0
	replace T_PRO_TOT with 0
endif

replace T_TOT_NBR with TOT_NBR
replace T_PAT_TOT with T_PAT_TOT + PAT_TOT
replace T_DIA_TOT with T_DIA_TOT + DIA_TOT
replace T_OFF_TOT with T_OFF_TOT + OFF_TOT
replace T_LTR_TOT with T_LTR_TOT + LTR_TOT
replace T_HOS_TOT with T_HOS_TOT + HOS_TOT
replace T_EKG_TOT with T_EKG_TOT + EKG_TOT
replace T_XRY_TOT with T_XRY_TOT + XRY_TOT
replace T_ECH_TOT with T_ECH_TOT + ECH_TOT
replace T_CAR_TOT with T_CAR_TOT + CAR_TOT
replace T_PRO_TOT with T_PRO_TOT + PRO_TOT

store DAY_NBR to TOT_NBR
seek TOT_NBR

if (EOF() .OR. BOF())
	append blank

	replace T_TOT_NBR with TOT_NBR
	replace T_PAT_TOT with 0
	replace T_DIA_TOT with 0
	replace T_OFF_TOT with 0
	replace T_LTR_TOT with 0
	replace T_HOS_TOT with 0
	replace T_EKG_TOT with 0
	replace T_XRY_TOT with 0
	replace T_ECH_TOT with 0
	replace T_CAR_TOT with 0
	replace T_PRO_TOT with 0
endif

replace T_TOT_NBR with TOT_NBR
replace T_PAT_TOT with T_PAT_TOT + PAT_TOT
replace T_DIA_TOT with T_DIA_TOT + DIA_TOT
replace T_OFF_TOT with T_OFF_TOT + OFF_TOT
replace T_LTR_TOT with T_LTR_TOT + LTR_TOT
replace T_HOS_TOT with T_HOS_TOT + HOS_TOT
replace T_EKG_TOT with T_EKG_TOT + EKG_TOT
replace T_XRY_TOT with T_XRY_TOT + XRY_TOT
replace T_ECH_TOT with T_ECH_TOT + ECH_TOT
replace T_CAR_TOT with T_CAR_TOT + CAR_TOT
replace T_PRO_TOT with T_PRO_TOT + PRO_TOT

*
* CLEAN UP AND RETURN
*

set exact off

select A
use

@ 19,0

store 19 to STAT_LINE
store "Okay its time to go back to work" to STAT_MSG
do STATUS

return

