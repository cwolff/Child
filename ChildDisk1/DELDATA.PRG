*************************************************************************
*																		*
* DELDATA >>> Deletes pack and reindex files that have deleted records. *
*		   entry : None													*
*		   exit : None													*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************

do CLRSCRN

store 19 to PMT_LINE
store "Take a break while I check to see if any data was deleted" to PMT_MSG
do PROMPT

*
* Can't delete patient data so print dummy message
*

@ 5,15 say "Checking for deleted Child Data Base data."

*
* Check for deleted diagnoses data
*

@ 7,15 say "Checking for deleted diagnose data."

if file("DIAGNOSE.DBF")
	select A
	use DIAGNOSE
	locate for DELETE()

	if DELETE()
		@ 7,0
		@ 7,15 say "Packing diagnoses file."
		pack

		@ 7,0
		@ 7,15 say "Reindexing diagnoses file."

		index on D_DIA_NBR to DIANBR

		@ 7,0
		@ 7,15 say "Deleted diagnoses have been removed."

	else
		@ 7,15
		@ 7,15 say "No diagnoses were deleted."

	endif

else
	@ 7,0
	@ 7,15 say "No diagnoses file present."

endif

*
* Check for deleted office call data
*

@ 9,15 say "Checking for deleted office data."

if file("OFFICE.DBF")
	select A
	use OFFICE
	locate for DELETE()

	if DELETE()
		@ 9,0
		@ 9,15 say "Packing office call file."
		pack

		@ 9,0
		@ 9,15 say "Reindexing office call file."

		index on O_OFF_NBR to OFFNBR

		@ 9,0
		@ 9,15 say "Deleted office calls have been removed."

	else
		@ 9,15
		@ 9,15 say "No office calls were deleted."

	endif

else
	@ 9,0
	@ 9,15 say "No office file present."

endif

*
* Check for deleted letters
*

@ 10,15 say "Checking for deleted letter data."

if file("LETTER.DBF")
	select A
	use LETTER
	locate for DELETE()

	if DELETE()
		@ 10,0
		@ 10,15 say "Packing letters file."
		pack

		@ 10,0
		@ 10,15 say "Reindexing letter file."

		index on L_LTR_NBR to LTRNBR

		@ 10,0
		@ 10,15 say "Deleted letters have been removed."

	else
		@ 10,15
		@ 10,15 say "No letters were deleted."

	endif

else
	@ 10,0
	@ 10,15 say "No letter file present."

endif

*
* Check for deleted hospital stays
*

@ 11,15 say "Checking for deleted hospital data."

if file("HOSPITAL.DBF")
	select A
	use HOSPITAL
	locate for DELETE()

	if DELETE()
		@ 11,0
		@ 11,15 say "Packing hospital file."
		pack

		@ 11,0
		@ 11,15 say "Reindexing hospital file."

		index on H_HOS_NBR to HOSNBR

		@ 11,0
		@ 11,15 say "Deleted hospital stays have been removed."

	else
		@ 11,15
		@ 11,15 say "No hospital stays were deleted."

	endif

else
	@ 11,0
	@ 11,15 say "No hospital file present."

endif

*
* Check for deleted consult	(advice)
*

@ 12,15 say "Checking for deleted hospital data."

if file("ADVICE.DBF")
	select A
	use ADVICE
	locate for DELETE()

	if DELETE()
		@ 12,0
		@ 12,15 say "Packing advice file."
		pack

		@ 12,0
		@ 12,15 say "Reindexing advice file."

		index on A_ADV_NBR to ADVNBR

		@ 12,0
		@ 12,15 say "Deleted consults have been removed."

	else
		@ 12,15
		@ 12,15 say "No consults were deleted."

	endif

else
	@ 12,0
	@ 12,15 say "No advice file present."

endif

*
* Check for deleted EKG tests
*

@ 13,15 say "Checking for deleted EKG data."

if file("EKG.DBF")
	select A
	use EKG
	locate for DELETE()

	if DELETE()
		@ 13,0
		@ 13,15 say "Packing EKG file."
		pack

		@ 13,0
		@ 13,15 say "Reindexing EKG file."

		index on K_EKG_NBR to EKGNBR

		@ 13,0
		@ 13,15 say "Deleted EKG tests have been removed."

	else
		@ 13,15
		@ 13,15 say "No EKG tests were deleted."

	endif

else
	@ 13,0
	@ 13,15 say "No EKG file present."

endif

*
* Check for deleted XRY tests
*

@ 14,15 say "Checking for deleted XRAY data."

if file("XRAY.DBF")
	select A
	use XRAY
	locate for DELETE()

	if DELETE()
		@ 14,0
		@ 14,15 say "Packing XRAY file."
		pack

		@ 14,0
		@ 14,15 say "Reindexing XRAY file."

		index on X_XRY_NBR to XRYNBR

		@ 14,0
		@ 14,15 say "Deleted XRAY tests have been removed."

	else
		@ 14,15
		@ 14,15 say "No XRAY tests were deleted."

	endif

else
	@ 14,0
	@ 14,15 say "No XRAY file present."

endif

*
* Check for deleted ECHO tests
*

@ 15,15 say "Checking for deleted ECHO data."

if file("ECHO.DBF")
	select A
	use ECHO
	locate for DELETE()

	if DELETE()
		@ 15,0
		@ 15,15 say "Packing ECHO file."
		pack

		@ 15,0
		@ 15,15 say "Reindexing ECHO file."

		index on E_ECH_NBR to ECHNBR

		@ 15,0
		@ 15,15 say "Deleted ECHO tests have been removed."

	else
		@ 15,15
		@ 15,15 say "No ECHO tests were deleted."

	endif

else
	@ 15,0
	@ 15,15 say "No ECHO file present."

endif

*
* Check for deleted cardiac catherization
*

@ 16,15 say "Checking for deleted cardiac cath. data."

if file("CARDIAC.DBF")
	select A
	use CARDIAC
	locate for DELETE()

	if DELETE()
		@ 16,0
		@ 16,15 say "Packing cardiac cath. file."
		pack

		@ 16,0
		@ 16,15 say "Reindexing cardiac cath. file."

		index on C_CAR_NBR to CARNBR

		@ 16,0
		@ 16,15 say "Deleted cardiac cath. have been removed."

	else
		@ 16,15
		@ 16,15 say "No cardiac cath. were deleted."

	endif

else
	@ 16,0
	@ 16,15 say "No cardiac file present."

endif

*
* Check for deleted procedure/ operation
*

@ 17,15 say "Checking for deleted procedure/ operations data."

if file("PROC.DBF")
	select A
	use PROC
	locate for DELETE()

	if DELETE()
		@ 17,0
		@ 17,15 say "Packing procedure/ operation file."
		pack

		@ 17,0
		@ 17,15 say "Reindexing procedure/ operation file."

		index on R_PRO_NBR to PRONBR

		@ 17,0
		@ 17,15 say "Deleted procedure/ operations have been removed."

	else
		@ 17,15
		@ 17,15 say "No procedure/ operations were deleted."

	endif

else
	@ 17,0
	@ 17,15 say "No proc file present."

endif

select A
use

@ 19,0

store 19 to STAT_LINE
store "Okay its time to go back to work" to STAT_MSG
do STATUS

return

                                                                                                                                              
