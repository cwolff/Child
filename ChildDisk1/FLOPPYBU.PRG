*************************************************************************
*																		*
* FLOPPYBU >>> Permits the backing up of the child data base			*
*		   entry : SRC_FILE - name of file to backup					*
*			   SRC_DRIVE - drive of file to backup						*
*			   DEST_ROOT - 3 letter root name							*
*			   ROW_NBR - row to display messages						*
*			   NBR_PD - number of record per disk						*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

select A
store SRC_DRIVE + SRC_FILE to SRC_NAME
use &SRC_NAME

goto bottom
store RECNO() to NBR_REC

if NBR_REC < NBR_PD
	store 1 to NBR_DISK
	store 1 to LOW_END
	store NBR_REC to HIGH_END

else
	store (NBR_REC / NBR_PD) to NBR_DISK
	store (NBR_PD * int(NBR_DISK)) to NBR_MOD

	if NBR_DISK <> NBR_MOD
		store NBR_DISK + 1 to NBR_DISK
	endif

	store str(NBR_DISK,2) to TOTAL_DISK
	store 1 to LOW_END
	store LOW_END + NBR_PD -1 to HIGH_END

endif

store "A:BU" + DEST_ROOT + "01" to FLOPPY

goto top

store .T. to SCROLL

do while SCROLL
	store 19 to STAT_LINE
	store "Please insert disk labeled " + FLOPPY to STAT_MSG
	do STATUS

	store FLOPPY to DEL_FILE

	store ROW_NBR to PMT_LINE
	store "Formatting " + FLOPPY + " disk" to PMT_MSG
	do PROMPT

	run format a:/4 < blank > nul
	
	store FLOPPY to COPY_FILE

	store ROW_NBR to PMT_LINE
	store SRC_NAME + " -> " + COPY_FILE + ", copying records " to PMT_MSG
	store PMT_MSG + str(LOW_END,5)+" - "+str(HIGH_END,5) to PMT_MSG
	do PROMPT

	goto LOW_END
	copy to &COPY_FILE while RECNO() >= LOW_END .and. RECNO() <= HIGH_END

	if HIGH_END >= NBR_REC
		store .F. to SCROLL

	else
		store HIGH_END + 1 to LOW_END
		store LOW_END + (NBR_PD-1) to HIGH_END

		if HIGH_END > NBR_REC
			store NBR_REC to HIGH_END
		endif

		store val(SUBSTR(FLOPPY,8,2)) to NEXTFILE
		store NEXTFILE + 1 to NEXTFILE
		store SUBSTR(FLOPPY,1,7) to PART1

		if NEXTFILE < 10
			store str(NEXTFILE,1) to TEMP_PART
			store "0"+TEMP_PART to PART2

		else
			store str(NEXTFILE,2) to PART2

		endif

		store PART1 + PART2 to FLOPPY

	endif

enddo

select A
use

return

