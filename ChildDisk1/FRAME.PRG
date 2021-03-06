*************************************************************************
*																		*
* FRAME >>> Erase the screen and frame with a header and trailer		*
*		entry : HEAD, L:TAIL, R:TAIL									*
*		exit : None 													*
*																		*
* (C)opyright 1987, Personal Touch Software Inc.,  All Rights Reserved. *
*																		*
*************************************************************************

store "����������������������������������������" to T_LINE_1
store  T_LINE_1 + "��������������������������������������Ŀ" to T_LINE_1

store "����������������������������������������" to T_LINE_2
store  T_LINE_2 + "����������������������������������������" to T_LINE_2

store "                                              " to BLANK
store "  C H I L D   D A T A   B A S E " to HEAD_LINE 
store HEAD_LINE + SUBSTR(BLANK,1,(46 - len(HEAD)) / 2) + HEAD to HEAD_LINE
store HEAD_LINE + SUBSTR(BLANK,1,79 - len(HEAD_LINE)) + " " to HEAD_LINE

store "������������������������������������������������������������" to LINE
store "�[ " + space(len(L_TAIL)) + " ]" to B_LINE
store B_LINE + SUBSTR(LINE,1,80 - ((len(B_LINE) + len(R_TAIL) + 5))) to B_LINE
store len(B_LINE) + 2 to R_COL
store B_LINE + "[ " + space(len(R_TAIL)) + " ]�" to B_LINE

store "                                       " to TAIL_LINE
store "�" + TAIL_LINE + TAIL_LINE + "�" to TAIL_LINE

store "���� (C) Copyright 1987, Personal Touch " to CPYRGHT
store CPYRGHT + "Software Inc.   All Rights Reserved ����" to CPYRGHT

clear

set color to BG/N,W+/N,N,N
@ 1,0 say T_LINE_1
set color to W/N,W+/N,N,N
@ 2,0 say HEAD_LINE
set color to BG/N,W+/N,N,N
@ 2,0 say "�"
@ 2,79 say "�"
@ 3,0 say T_LINE_2


set color to B/N,W+/N,N,N
@ 21,0 say B_LINE
set color to BG/N,W+/N,N,N
@ 21,3 say L_TAIL
@ 21,R_COL say R_TAIL
set color to B/N,W+/N,N,N
@ 22,0 say TAIL_LINE
set color to BG/N,W+/N,N,N
@ 23,0 say CPYRGHT
set color to B/N,W+/N,N,N
@ 23,0 say "����"
@ 23,76 say "����"

set color to G/N,W+/N,N,N

return
