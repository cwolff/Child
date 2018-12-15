*************************************************************************
*																		*
* GETPASS >>> Prompts the use to enter their password					*
*		   entry : PASS:LINE											*
*		   exit : PSSWRD												*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************


@ PASS_LINE,15 say "Password ......... "

store "              " to PSSWRD

store .T. to VERIFY

do while VERIFY
	set color to N/N,N/N,N,N
	clear gets
	@ PASS_LINE,34 get PSSWRD picture "XXXXXXXXXXXXXX"
	read
	clear gets
	set color to G/N,W+/N,N,N
	store upper(trim(PSSWRD)) to PSSWRD
	if len(PSSWRD) > 4
		store len(PSSWRD) to F_SIZE
		store .F. to VERIFY
	else
		store 19 to STAT_LINE
		store "Start over, password is to short" to STAT_MSG
		do STATUS
		store "              " to PSSWRD
	endif
enddo

store trim(SUBSTR(UPPER(PSSWRD),2,F_SIZE+1)) to PSSWRD
store len(PSSWRD) to CODE 
if CODE > 7
	store SUBSTR(PSSWRD,1,7) to PSSWRD
	store 7 to CODE
endif

store "!1@2#3$4%5^6&7*8(9)0_-+=~`|\QWERT" to MIX
store "YUIOP][ASDFGHJKL:;'ZXCVBNM<,>.?/}{" + MIX to MIX
store PSSWRD to ENCODE
store str(AT(SUBSTR(ENCODE,CODE,1),MIX)/3,1,0) to PSSWRD
STORE CODE - 1 to CODE
do while CODE <> 0
	store PSSWRD + str(AT(SUBSTR(ENCODE,CODE,1),MIX),2,0) to PSSWRD
	store CODE - 1 to CODE
enddo



return

