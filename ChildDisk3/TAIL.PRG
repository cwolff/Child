*************************************************************************
*																		*
* TAIL >>> Display the tail line only									*
*		entry : L:TAIL, R:TAIL											*
*		exit : None 													*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************

store "ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ" to LINE
store "ี[ " + space(len(L_TAIL)) + " ]" to B_LINE
store B_LINE + SUBSTR(LINE,1,80 - ((len(B_LINE) + len(R_TAIL) + 5))) to B_LINE
store len(B_LINE) + 2 to R_COL
store B_LINE + "[ " + space(len(R_TAIL)) + " ]ธ" to B_LINE


set color to B/N,BG+/N,N,N
@ 21,0 say B_LINE
set color to BG/N,BG+/N,N,N
@ 21,3 say L_TAIL
@ 21,R_COL say R_TAIL

set color to G/N,W+/N,N,N

return
