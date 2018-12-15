*************************************************************************
*																		*
* VIEWDIA >>> View all the diagnoses for the selected patient			*
*		   entry : None													*
*		   exit : DIA:SEL = T, diagnoses found							*
*				F, diagnoses not found									*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store DIA_NBR to S_DIA_NBR

@ 5,1 say "<<< Patient's diagnostic information <<<"
store 7 to DIA_LINE

store .T. to SCROLL
store 7 to STAT_LINE

do while SCROLL
    store .T. to DESCRIPT
    do READDIA

    @ DIA_LINE,1 say DIA_NBR
    @ DIA_LINE,20 say D_CODE
	@ DIA_LINE,30 say D_DATE
    @ DIA_LINE,40 say LOGON

    @ DIA_LINE+1,3 say D_DESC

    if DIA_LINE > 13
        store 19 to STAT_LINE
        store "Viewing patient's diagnostic information" to STAT_MSG
        do STATUS

        do CLRSCRN

        @ 5,5 say "<<< Patient's diagnostic information <<<"
        store 7 to DIA_LINE

    else
        store DIA_LINE + 2 to DIA_LINE

    endif

    store RECNO() to RECORD
    skip

    if D_DIA_NBR <> S_DIA_NBR .or. RECNO() = RECORD
        if DIA_LINE <> 7
            store 19 to STAT_LINE
            store "Patient's diagnostic information" to STAT_MSG
            do STATUS
        
		endif
        
		store .F. to SCROLL
    
	endif

enddo

return

