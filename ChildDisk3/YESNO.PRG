*************************************************************************
*																		*
* YESNOS >>> Displays a yes no message at the specified line and		*
*		 prompts the user to type Y or N								*
*		 entry : YN:LINE YN:MSG											*
*		 exit : YN														*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************

@ YN_LINE,15 say YN_MSG
store YN to Y_N
store " " to YN

Do while .not. YN $"Y,N"
	store Y_N to YN
	@ YN_LINE+2,15 say "Enter a Y (yes) or an N (no) " get Y_N picture "A"
	read
	clear gets
	store UPPER(Y_N) to Y_N

	if Y_N = "Y" .or. Y_N = "N"
		store Y_N to YN
	
	else
		store YN to Y_N
		store " " to YN
	
	endif

enddo

@ YN_LINE,0
@ YN_LINE+2,0

return

                                                                                                                                                                