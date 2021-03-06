*************************************************************************
*																		*
* PRNITLTR >>> Allow the user to print the patient letter.				*
*		   entry : LTR:NBR, O:DATE, LOGON								*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store 1 to PAGE
store 7 to LTR_LINE

store .T. to CONTINUE

do while CONTINUE
    store SUBSTR(LTR_NBR,1,16) + str(PAGE,1) to LTR_NBR

    seek LTR_NBR

    if (EOF() .OR. BOF())
        store .F. to CONTINUE

    else
        do READLTR

        @ LTR_LINE,5 say L1
        @ LTR_LINE+1,5 say L2
        @ LTR_LINE+2,5 say L3
        @ LTR_LINE+3,5 say L4
        @ LTR_LINE+4,5 say L5
        @ LTR_LINE+5,5 say L6
        @ LTR_LINE+6,5 say L7
        @ LTR_LINE+7,5 say L8
        @ LTR_LINE+8,5 say L9
        @ LTR_LINE+9,5 say L10

        store PAGE + 1 to PAGE

        store LTR_LINE + 10 to LTR_LINE

        if LTR_LINE > 56
            store 7 to LTR_LINE
        endif

    endif

enddo

return



                                                                                       