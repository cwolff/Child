*************************************************************************
*																		*
* READPAT >>> Read the current record into the record variables 		*
*		   entry : # to write, current record variables					*
*		   exit : None													*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store P_PAT_NBR to PAT_NBR
store SUBSTR(P_BIRTH,1,2)+"/"+SUBSTR(P_BIRTH,3,2)+"/"+SUBSTR(P_BIRTH,5,2) to BIRTH
store P_LST_N to LST_N
store P_G_LST_N to G_LST_N
store P_FST_N to FST_N
store P_G_FST_N to G_FST_N
store P_M_I to M_I
store P_G_M_I to G_M_I
store P_STREET to STREET
store P_G_STREET to G_STREET
store P_CITY to CITY
store P_G_CITY to G_CITY
store P_STATE to STATE
store P_G_STATE to G_STATE
store P_ZIP to ZIP
store P_G_ZIP to G_ZIP
store SUBSTR(P_PHONE,1,3)+"-"+SUBSTR(P_PHONE,4,3)+"-"+SUBSTR(P_PHONE,7,4) to PHONE
store SUBSTR(P_G_PHONE,1,3)+"-"+SUBSTR(P_G_PHONE,4,3)+"-"+SUBSTR(P_G_PHONE,7,4) to G_PHONE
store P_FATHER to FATHER
store P_MOTHER to MOTHER
store SUBSTR(P_HOS_NBR,1,2)+"-"+SUBSTR(P_HOS_NBR,3,2)+"-"+SUBSTR(P_HOS_NBR,5,2) to HOS_NBR
store P_REF_DOC to REF_DOC
store P_LOGON to LOGON

return

                                                                                                                                                                                                                                               