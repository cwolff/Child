*************************************************************************
*																		*
* READOFF >>> Read the current record into the record variables 		*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store O_OFF_NBR to OFF_NBR
store O_O_DATE to O_DATE
store SUBSTR(O_DATE,1,2) + "/" + SUBSTR(O_DATE,3,2) + "/" + SUBSTR(O_DATE,5,2) to O_DATE
store O_LOGON to LOGON

return

                                                                                                                                       