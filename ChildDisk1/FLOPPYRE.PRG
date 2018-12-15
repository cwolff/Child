*************************************************************************
*																		*
* FLOPPYRE >>> Permits the restoring of the child data base				*
*		   entry : SRC_ROOT - root (3 letter) name of file to restore	*
*							  from 										*
*			   SRC_DRIVE - drive of file(s) to restore from				*
*			   DEST_FILE - Name of file to restore						*
*			   ROW_NBR - row to display messages						*
*			   NBR_PD - number of record per disk						*
*			   TOTAL_SIZE - total number of records to restore			*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

if TOTAL_SIZE < NBR_PD
	store 1 to NBR_DISK
	store 1 to LOW_END
	store TOTAL_SIZE to HIGH_END

else
	store (TOTAL_SIZE / NBR_PD) to NBR_DISK
	store (NBR_PD * int(NBR_DISK)) to NBR_MOD

	if NBR_DISK <> NBR_MOD
		store NBR_DISK + 1 to NBR_DISK
	
	endif

	store 1 to LOW_END
	store LOW_END + NBR_PD - 1 to HIGH_END

endif

store .T. to SCROLL

do while SCROLL
	if LOW_END = 1
		store DEST_FILE+".DBF" to DEL_FILE
		
		store "A:BU" + SRC_ROOT + "01" to FLOPPY
			
		store 19 to STAT_LINE
		store "Please insert disk labeled " + FLOPPY to STAT_MSG
		do STATUS
		
		if file (DEL_FILE)
			delete file	&DEL_FILE
		
		endif

		select A
	
		do while .not. file(FLOPPY+".DBF")
			store 19 to STAT_LINE
			store "Disk not labeled &FLOPPY - please correct" to STAT_MSG
			do STATUS
			
		enddo
			
		use &FLOPPY
		copy structure to &DEST_FILE
		use
		
		select A
		use &DEST_FILE
		goto bottom

	else
		store 19 to STAT_LINE
		store "Please insert " + FLOPPY to STAT_MSG
		do STATUS
	
	endif	
	
	store ROW_NBR to PMT_LINE
	store DEST_FILE + " <- " + FLOPPY + ", appending records " to PMT_MSG
	store PMT_MSG + str(LOW_END,5)+" - "+str(HIGH_END,5) to PMT_MSG
	do PROMPT

	goto bottom
	append from &FLOPPY

	if HIGH_END >= TOTAL_SIZE
		store .F. to SCROLL

	else
		store HIGH_END + 1 to LOW_END
		store LOW_END + (NBR_PD-1) to HIGH_END

		if HIGH_END > TOTAL_SIZE
			store TOTAL_SIZE to HIGH_END
		
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