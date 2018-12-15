*************************************************************************
*																		*
* DATETAIL >>> Set the variable L_TAIL to the text date                 *
*		entry : None													*
*		exit : None 													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

set century on
store date() to TDY
store cdow(TDY) + ", " + cmonth(TDY) + " " + str(day(TDY),2) + ", " + ;
	str(year(TDY),4) to L_TAIL
set century off

return

