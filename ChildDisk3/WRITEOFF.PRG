*************************************************************************
*																		*
* WRITEDIA >>> Write current record variables to the current record		*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

replace O_OFF_NBR with UPPER(OFF_NBR)
replace O_O_DATE with SUBSTR(O_DATE,1,2) + SUBSTR(O_DATE,4,2) + SUBSTR(O_DATE,7,2)
replace O_LOGON with UPPER(LOGON)

return

                                                                                                                                              