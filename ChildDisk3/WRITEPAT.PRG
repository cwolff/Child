*************************************************************************
*																		*
* WRITEPAT >>> Write current record variables to the screen				*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

replace P_PAT_NBR with UPPER(PAT_NBR)
replace P_BIRTH with UPPER(SUBSTR(BIRTH,1,2)) + UPPER(SUBSTR(BIRTH,4,2)) +UPPER(SUBSTR(BIRTH,7,2))
replace P_LST_N with UPPER(LST_N)
replace P_G_LST_N with UPPER(G_LST_N)
replace P_FST_N with UPPER(FST_N)
replace P_G_FST_N with UPPER(G_FST_N)
replace P_M_I with UPPER(M_I)
replace P_G_M_I with UPPER(G_M_I)
replace P_STREET with UPPER(STREET)
replace P_G_STREET with UPPER(G_STREET)
replace P_CITY with UPPER(CITY)
replace P_G_CITY with UPPER(G_CITY)
replace P_STATE with UPPER(STATE)
replace P_G_STATE with UPPER(G_STATE)
replace P_ZIP with UPPER(ZIP)
replace P_G_ZIP with UPPER(G_ZIP)
replace P_PHONE with UPPER(SUBSTR(PHONE,1,3)) + UPPER(SUBSTR(PHONE,5,3)) + UPPER(SUBSTR(PHONE,9,4))
replace P_G_PHONE with UPPER(SUBSTR(G_PHONE,1,3))+UPPER(SUBSTR(G_PHONE,5,3))+UPPER(SUBSTR(G_PHONE,9,4))
replace P_FATHER with UPPER(FATHER)
replace P_MOTHER with UPPER(MOTHER)
replace P_HOS_NBR with UPPER(SUBSTR(HOS_NBR,1,2))+UPPER(SUBSTR(HOS_NBR,4,2))+UPPER(SUBSTR(HOS_NBR,7,2))
replace P_REF_DOC with REF_DOC
replace P_LOGON with UPPER(LOGON)

return

                                                                                                                                                                                                                                             