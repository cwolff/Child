* Last revised : Mon 29-Feb-88 at 7:45 am
*************************************************************************
*                                      									*
*                                                                       *
* SGETVAL >>> Get the search parameters to search the child data base   *
*	       entry : None						                            *
*	       exit : None						                            *
*									                                    *
* (C)opyright 1988 Personal Touch Software Inc.,  All Rights Reserved.  *
*									                                    *
*************************************************************************

store "One moment please, initializing search parameters." to PMT_MSG
store 19 to PMT_LINE
do PROMPT

select 1
use EKGTABLE

store 1 to RH_START
locate for KT_K_PTR="AX01"
store (recno() - 1) to RH_END
store RH_END to RH_PLACE

store recno() to AX_START
locate for KT_K_PTR="HY01"
store (recno() - 1) to AX_END
store AX_END to AX_PLACE

store recno() to HY_START
locate for KT_K_PTR="CD01"
store (recno() - 1) to HY_END
store HY_END to HY_PLACE

store recno() to CD_START
locate for KT_K_PTR="ME01"
store (recno() - 1) to CD_END
store CD_END to CD_PLACE

store recno() to ME_START
goto bottom
store recno() to ME_END
store ME_END to ME_PLACE

select 2
use DIATABLE
goto bottom
store recno() to DIAG_END
store DIAG_END to DIAG_PLACE
store recno() to PROC_END
store PROC_END to PROC_PLACE

store "patient's age" to MENU_1_1
store "patient died" to MENU_1_2

store "begin month" to MENU_2_1
store "begin year" to MENU_2_2
store "end month" to MENU_2_3
store "end year" to MENU_2_4

store "code    DIAG   " to MENU_3_1
store "PROC " to MENU_3_2

store "cardiac QP/QS  " to MENU_4_1
store "RP/RS" to MENU_4_2
store "RVP/LVP" to MENU_4_3
store "RVP/AOP" to MENU_4_4
store "GR   " to MENU_4_5
store "ekg     RHYTHM " to MENU_5_1
store "AXIS " to MENU_5_2
store "HYPER  " to MENU_5_3
store "COND   " to MENU_5_4
store "META " to MENU_5_5
store "echo    M MODE " to MENU_6_1
store "TWO D" to MENU_6_2
store "DOPPLER" to MENU_6_3
store "xray    RESULTS" to MENU_7_1

store 9 to S_AGE
store "don't use               " to S_AGE_PMT
store "don't use" to S_DIED

store "01" to S_STRT_M
store "1980" to S_STRT_Y
store month(date()) to S_TMP
if S_TMP < 10
    store "0" + str(S_TMP,1) to S_END_M
else
    store str(S_TMP,2) to S_END_M
endif
store str(year(date()),4) to S_END_Y

store "don't use    " to S_D_CODE
store space(75) to S_D_DESC
store "don't use    " to S_PRO
store space(75) to S_P_DESC

store "don't use    " to S_QP_QS
store "don't use    " to S_RP_RS
store "don't use    " to S_RVP_LVP
store "don't use    " to S_RVP_AOP
store "don't use    " to S_GR

store "don't use    " to S_RHYTHM
store space(75) to S_RH_DESC
store "don't use    " to S_AXIS
store space(75) to S_AX_DESC
store "don't use    " to S_HYP
store space(75) to S_HY_DESC
store "don't use    " to S_COND
store space(75) to S_CD_DESC
store "don't use    " to S_META
store space(75) to S_ME_DESC

store "don't use    " to S_M_MODE
store "don't use    " to S_TWO_D
store "don't use    " to S_DOPPLER
                    
store "don't use    " to S_XRAY

@ 19,0

store .T. to CONTINUE
do while CONTINUE
    do CLRSCRN

    select 2

    @ 5,1 say "Use  and  to move UP and DOWN, Use <- and -> to SELECT."
	@ 6,1 say "Press ÄÄÙ to START search."

    @ 17,1 say MENU_7_1 get S_XRAY

    @ 16,55 say MENU_6_3 get S_DOPPLER
    @ 16,33 say MENU_6_2 get S_TWO_D
    @ 16,1 say MENU_6_1 get S_M_MODE

    @ 15,33 say MENU_5_5 get S_META
    @ 15,9 say MENU_5_4 get S_COND
    @ 14,55 say MENU_5_3 get S_HYP
    @ 14,33 say MENU_5_2 get S_AXIS
    @ 14,1 say MENU_5_1 get S_RHYTHM

    @ 13,33 say MENU_4_5 get S_GR
    @ 13,9 say MENU_4_4 get S_RVP_AOP
    @ 12,55 say MENU_4_3 get S_RVP_LVP
    @ 12,33 say MENU_4_2 get S_RP_RS
    @ 12,1 say MENU_4_1 get S_QP_QS

    @ 11,33 say MENU_3_2 get S_PRO
    @ 11,1 say MENU_3_1 get S_D_CODE

    @ 9,63 say MENU_2_4 get S_END_Y
    @ 9,48 say MENU_2_3 get S_END_M
    @ 9,18 say MENU_2_2 get S_STRT_Y
    @ 9,1 say MENU_2_1 get S_STRT_M
    @ 8,54 say MENU_1_2 get S_DIED
    @ 8,1 say MENU_1_1 get S_AGE_PMT

    clear gets

    store 1 to SELECT

    store .T. to AGAIN
    store .F. to DO_SEARCH

	do while AGAIN
        store inkey() to KEY
	
		if KEY <> 0

			do case
		
                *
                * Up Arrow () for UP
                *

				case KEY = 5 .or. KEY = 56
					if SELECT > 1
						store SELECT - 1 to SELECT
                    else
                        store 22 to SELECT
                    endif
			
                *
                * Down Arrow () for DOWN
                *

				case KEY = 24 .or. KEY = 50
					if SELECT < 22
						store SELECT + 1 to SELECT
                    else
                        store 1 to SELECT
                    endif

                *
				* RET KEY (ÄÄÙ) when DONE
				*
			
				case KEY = 13
					store .F. to AGAIN
                    store .T. to DO_SEARCH
                    store .F. to CONTINUE

                *
                * 0 Key (ESC) to CANCEL
                *

                case KEY = 48
                    store .F. to AGAIN
                    store .F. to DO_SEARCH
                    store .F. to CONTINUE

				*
				* Left Arrow (<-) to SELECT previous value
				*
			
				case KEY = 19 .or. KEY = 52
                    do case

                         *
                         * Get age of patient
                         *

	                    case SELECT = 1
                            if S_AGE > 1
                                store S_AGE - 1 to S_AGE
	                        else
                                store 9 to S_AGE
	                        endif

                            do case
                                case S_AGE = 1
	                                store "0 mnth >= [age] < 1 mnth" to S_AGE_PMT

                                case S_AGE = 2
	                                store "1 mnth >= [age] < 3 mnth" to S_AGE_PMT

                                case S_AGE = 3
	                                store "3 mnth >= [age] < 6 mnth" to S_AGE_PMT

                                case S_AGE = 4
	                                store "6 mnth >= [age] < 1 yr  " to S_AGE_PMT

                                case S_AGE = 5
	                                store "1 yr   >= [age] < 2 yr  " to S_AGE_PMT

                                case S_AGE = 6
	                                store "2 yr   >= [age] < 5 yr  " to S_AGE_PMT

                                case S_AGE = 7
	                                store "5 yr   >= [age] < 10 yr " to S_AGE_PMT

                                case S_AGE = 8
	                                store "10 yr  >= [age]         " to S_AGE_PMT

                                case S_AGE = 9
	                                store "don't use               " to S_AGE_PMT

		                    endcase

	                    *
	                    * Get DIED
	                    *

		                case SELECT = 2
	                        do case
	                            case S_DIED = "don't use"
	                                store "yes      " to S_DIED

                                case S_DIED = "yes      "
                                    store "no       " to S_DIED

                                case S_DIED = "no       "
                                    store "don't use" to S_DIED

		                    endcase

                        *
                        * Get begin month
                        *

	                    case SELECT = 3
                            if val(S_STRT_M) > 1
        	                    store val(S_STRT_M) - 1 to S_TMP
                                if S_TMP < 10
                                    store "0" + str(S_TMP,1) to S_STRT_M
                                else
                                    store str(S_TMP,2) to S_STRT_M
                                endif
                            else
                                store "12" to S_STRT_M
                            endif

                        *
                        * Get begin year
                        *

	                    case SELECT = 4
                            if val(S_STRT_Y) > 1980
    	                        store val(S_STRT_Y) - 1 to S_TMP
                                store str(S_TMP,4) to S_STRT_Y
                            else
                                store "2030" to S_STRT_Y
                            endif

                        *
                        * Get end month
                        *

	                    case SELECT = 5
                            if val(S_END_M) > 1
    	                        store val(S_END_M) - 1 to S_TMP
                                if S_TMP < 10
                                    store "0" + str(S_TMP,1) to S_END_M
                                else
                                    store str(S_TMP,2) to S_END_M
                                endif
                            else
                                store "12" to S_END_M
                            endif

                        *
                        * Get end year
                        *

	                    case SELECT = 6
                            if val(S_END_Y) > 1980
    	                        store val(S_END_Y) - 1 to S_TMP
                                store str(S_TMP,4) to S_END_Y
                            else
                                store "2030" to S_END_Y
                            endif

                        *
                        * echo diagnoses
                        *

	                    case SELECT = 7
                            select 2
	                        do case
	                            case S_D_CODE = "don't use    "
                                    store DIAG_END to DIAG_PLACE
                                    goto DIAG_PLACE
                                    store DT_D_CODE + space(13-len(DT_D_CODE)) to S_D_CODE
                                    store DT_D_DESC + space(75-len(DT_D_DESC)) to S_D_DESC

                                case DIAG_PLACE = 1
                                    store "don't use    " to S_D_CODE
                                    store space(75) to S_D_DESC

                                 otherwise
                                    store DIAG_PLACE - 1 to DIAG_PLACE
                                    goto DIAG_PLACE
                                    store DT_D_CODE + space(13-len(DT_D_CODE)) to S_D_CODE
                                    store DT_D_DESC + space(75-len(DT_D_DESC)) to S_D_DESC

		                    endcase

                        *
                        * echo procedure
                        *

                        case SELECT = 8
                            select 2
	                        do case
	                            case S_PRO = "don't use    "
                                    store DIAG_END to DIAG_PLACE
                                    goto DIAG_PLACE
                                    store DT_D_CODE + space(13-len(DT_D_CODE)) to S_PRO
                                    store DT_D_DESC + space(75-len(DT_D_DESC)) to S_P_DESC

                                case DIAG_PLACE = 1
                                    store "don't use    " to S_PRO
                                    store space(75) to S_D_DESC

                                 otherwise
                                    store DIAG_PLACE - 1 to DIAG_PLACE
                                    goto DIAG_PLACE
                                    store DT_D_CODE + space(13-len(DT_D_CODE)) to S_PRO
                                    store DT_D_DESC + space(75-len(DT_D_DESC)) to S_P_DESC

		                    endcase

                        *
                        * cardiac QP/QS
                        *

	                    case SELECT = 9
                            do case
                                case S_QP_QS = "don't use    "
                                    store ">3           " to S_QP_QS
                                    
                                case S_QP_QS = ">3           "
                                    store ">2 & <3      " to S_QP_QS

                                case S_QP_QS = ">2 & <3      "
                                    store ">1 & <2      " to S_QP_QS

                                case S_QP_QS = ">1 & <2      "
                                    store "=1           " to S_QP_QS

                                case S_QP_QS = "=1           "
                                    store "<1           " to S_QP_QS

                                case S_QP_QS = "<1           "
                                    store "don't use    " to S_QP_QS

                            endcase

                        *
                        * cardiac RP/RS
                        *

	                    case SELECT = 10
                            do case
                                case S_RP_RS = "don't use    "
                                    store ">70%         " to S_RP_RS
                                    
                                case S_RP_RS = ">70%         "
                                    store ">50% & <70%  " to S_RP_RS

                                case S_RP_RS = ">50% & <70%  "
                                    store ">40% & <50%  " to S_RP_RS

                                case S_RP_RS = ">40% & <50%  "
                                    store ">20% & <40%  " to S_RP_RS

                                case S_RP_RS = ">20% & <40%  "
                                    store "<20%         " to S_RP_RS

                                case S_RP_RS = "<20%         "
                                    store "don't use    " to S_RP_RS
                                                  
                            endcase

                        *
                        * cardiac RVP/LVP
                        *

	                    case SELECT = 11
                            do case
                                case S_RVP_LVP = "don't use    "
                                    store "=100%        " to S_RVP_LVP

                                case S_RVP_LVP = "=100%        "
                                    store ">70% & <100% " to S_RVP_LVP

                                case S_RVP_LVP = ">70% & <100% "
                                    store ">50% & <70%  " to S_RVP_LVP

                                case S_RVP_LVP = ">50% & <70%  "
                                    store "<50%         " to S_RVP_LVP

                                case S_RVP_LVP = "<50%         "
                                    store "don't use    " to S_RVP_LVP

                            endcase

                        *
                        * cardiac RVP/AOP
                        *

	                    case SELECT = 12
                            do case
                                case S_RVP_AOP = "don't use    "
                                    store "=100%        " to S_RVP_AOP

                                case S_RVP_AOP = "=100%      "
                                    store ">70% & <100% " to S_RVP_AOP

                                case S_RVP_AOP = ">70% & <100% "
                                    store ">50% & <70%  " to S_RVP_AOP

                                case S_RVP_AOP = ">50% & <70%  "
                                    store "<50%         " to S_RVP_AOP

                                case S_RVP_AOP = "<50%         "
                                    store "don't use    " to S_RVP_AOP

                            endcase

                        *
                        * cardiac GR
                        *

	                    case SELECT = 13
                            do case
                                case S_GR = "don't use    "
                                    store ">60mm        " to S_GR

                                case S_GR = ">60mm        "
                                    store ">40mm & <60mm" to S_GR

                                case S_GR = ">40mm & <60mm"
                                    store "<40mm        " to S_GR

                                case S_GR = "<40mm        "
                                    store "don't use    " to S_GR

                            endcase

                        *                   
                        * ekg RHYTHM
                        *

                        case SELECT = 14
                            select 1
	                        do case
	                            case S_RHYTHM = "don't use    "
                                    store RH_END to RH_PLACE
                                    goto RH_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_RHYTHM
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_RH_DESC

                                case RH_PLACE = RH_START
                                    store "don't use    " to S_RHYTHM
                                    store space(75) to S_RH_DESC

                                 otherwise
                                    store RH_PLACE - 1 to RH_PLACE
                                    goto RH_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_RHYTHM
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_RH_DESC

		                    endcase

                        *
                        * ekg AXIS
                        *

                        case SELECT = 15
                            select 1
	                        do case
	                            case S_AXIS = "don't use    "
                                    store AX_END to AX_PLACE
                                    goto AX_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_AXIS
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_AX_DESC

                                case AX_PLACE = AX_START
                                    store "don't use    " to S_AXIS
                                    store space(75) to S_AX_DESC

                                 otherwise
                                    store AX_PLACE - 1 to AX_PLACE
                                    goto AX_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_AXIS
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_AX_DESC

		                    endcase

                        *
                        * ekg HYPER
                        *

	                    case SELECT = 16
                            select 1
	                        do case
	                            case S_HYP = "don't use    "
                                    store HY_END to HY_PLACE
                                    goto HY_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_HYP
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_HY_DESC

                                case HY_PLACE = HY_START
                                    store "don't use    " to S_HYP
                                    store space(75) to S_HY_DESC

                                 otherwise
                                    store HY_PLACE - 1 to HY_PLACE
                                    goto HY_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_HYP
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_HY_DESC

		                    endcase

                        *
                        * ekg COND
                        *

	                    case SELECT = 17
                            select 1
	                        do case
	                            case S_COND = "don't use    "
                                    store CD_END to CD_PLACE
                                    goto CD_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_COND
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_CD_DESC

                                case CD_PLACE = CD_START
                                    store "don't use    " to S_COND
                                    store space(75) to S_CD_DESC

                                 otherwise
                                    store CD_PLACE - 1 to CD_PLACE
                                    goto CD_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_COND
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_CD_DESC

		                    endcase

                        *
                        * ekg META
                        *

	                    case SELECT = 18
                            select 1
	                        do case
	                            case S_META = "don't use    "
                                    store ME_END to ME_PLACE
                                    goto ME_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_META
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_ME_DESC

                                case ME_PLACE = ME_START
                                    store "don't use    " to S_META
                                    store space(75) to S_ME_DESC

                                 otherwise
                                    store ME_PLACE - 1 to ME_PLACE
                                    goto ME_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_META
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_ME_DESC

		                    endcase

                        *
                        * echo M MODE
                        *

	                    case SELECT = 19
                            do case
                                case S_M_MODE = "don't use    "
                                    store "abnormal     " to S_M_MODE
                                    
                                case S_M_MODE = "abnormal     "
                                    store "normal       " to S_M_MODE

                                case S_M_MODE = "normal       "
                                    store "don't use    " to S_M_MODE

                            endcase

                        *
                        * echo TWO_D
                        *

	                    case SELECT = 20
                            do case
                                case S_TWO_D = "don't use    "
                                    store "abnormal     " to S_TWO_D
                                    
                                case S_TWO_D = "abnormal     "
                                    store "normal       " to S_TWO_D

                                case S_TWO_D = "normal       "
                                    store "don't use    " to S_TWO_D

                            endcase

                        *
                        * echo DOPPLER
                        *

	                    case SELECT = 21
                            do case
                                case S_DOPPLER = "don't use    "
                                    store "abnormal     " to S_DOPPLER
                                    
                                case S_DOPPLER = "abnormal     "
                                    store "normal       " to S_DOPPLER

                                case S_DOPPLER = "normal       "
                                    store "don't use    " to S_DOPPLER

                            endcase

                        *
                        * echo XRAY
                        *

	                    case SELECT = 22
                            do case
                                case S_XRAY = "don't use    "
                                    store "abnormal     " to S_XRAY
                                    
                                case S_XRAY = "abnormal     "
                                    store "normal       " to S_XRAY

                                case S_XRAY = "normal       "
                                    store "don't use    " to S_XRAY

                            endcase

                endcase

				*
				* Down Arrow (->) to SELECT next value
				*

				case KEY = 4 .or. KEY = 54
                    do case

                         *
                         * Get age of patient
                         *

	                    case SELECT = 1
                            if S_AGE < 9
                                store S_AGE + 1 to S_AGE
	                        else
                                store 1 to S_AGE
	                        endif

                            do case
                                case S_AGE = 1
	                                store "0 mnth >= [age] < 1 mnth" to S_AGE_PMT

                                case S_AGE = 2
	                                store "1 mnth >= [age] < 3 mnth" to S_AGE_PMT

                                case S_AGE = 3
	                                store "3 mnth >= [age] < 6 mnth" to S_AGE_PMT

                                case S_AGE = 4
	                                store "6 mnth >= [age] < 1 yr  " to S_AGE_PMT

                                case S_AGE = 5
	                                store "1 yr   >= [age] < 2 yr  " to S_AGE_PMT

                                case S_AGE = 6
	                                store "2 yr   >= [age] < 5 yr  " to S_AGE_PMT

                                case S_AGE = 7
	                                store "5 yr   >= [age] < 10 yr " to S_AGE_PMT

                                case S_AGE = 8
	                                store "10 yr  >= [age]         " to S_AGE_PMT

                                case S_AGE = 9
	                                store "don't use               " to S_AGE_PMT

		                    endcase

	                    *
	                    * Get DIED
	                    *

		                case SELECT = 2
	                        do case
                                case S_DIED = "no       "
                                    store "yes      " to S_DIED

                                case S_DIED = "yes      "
                                    store "don't use" to S_DIED

                                case S_DIED = "don't use"
	                                store "no       " to S_DIED



		                    endcase

                        *
                        * Get begin month
                        *

	                    case SELECT = 3
                            if val(S_STRT_M) < 12
        	                    store val(S_STRT_M) + 1 to S_TMP
                                if S_TMP < 10
                                    store "0" + str(S_TMP,1) to S_STRT_M
                                else
                                    store str(S_TMP,2) to S_STRT_M
                                endif
                            else
                                store "01" to S_STRT_M
                            endif

                        *
                        * Get begin year
                        *

	                    case SELECT = 4
                            if val(S_STRT_Y) < 2030
    	                        store val(S_STRT_Y) + 1 to S_TMP
                                store str(S_TMP,4) to S_STRT_Y
                            else
                                store "1980" to S_STRT_Y
                            endif

                        *
                        * Get end month
                        *

	                    case SELECT = 5
                            if val(S_END_M) < 12
    	                        store val(S_END_M) + 1 to S_TMP
                                if S_TMP < 10
                                    store "0" + str(S_TMP,1) to S_END_M
                                else
                                    store str(S_TMP,2) to S_END_M
                                endif
                            else
                                store "01" to S_END_M
                            endif

                        *
                        * Get end year
                        *

	                    case SELECT = 6
                            if val(S_END_Y) < 2030
    	                        store val(S_END_Y) + 1 to S_TMP
                                store str(S_TMP,4) to S_END_Y
                            else
                                store "1980" to S_END_Y
                            endif

                        *
                        * echo diagnoses
                        *

	                    case SELECT = 7
                            select 2
	                        do case
	                            case S_D_CODE = "don't use    "
                                    store 1 to DIAG_PLACE
                                    goto DIAG_PLACE
                                    store DT_D_CODE + space(13-len(DT_D_CODE)) to S_D_CODE
                                    store DT_D_DESC + space(75-len(DT_D_DESC)) to S_D_DESC

                                case DIAG_PLACE = DIAG_END
                                    store "don't use    " to S_D_CODE
                                    store space(75) to S_D_DESC

                                 otherwise
                                    store DIAG_PLACE + 1 to DIAG_PLACE
                                    goto DIAG_PLACE
                                    store DT_D_CODE + space(13-len(DT_D_CODE)) to S_D_CODE
                                    store DT_D_DESC + space(75-len(DT_D_DESC)) to S_D_DESC

		                    endcase

                        *
                        * echo procedure
                        *

                        case SELECT = 8
                            select 2
	                        do case
	                            case S_PRO = "don't use    "
                                    store 1 to DIAG_PLACE
                                    goto DIAG_PLACE
                                    store DT_D_CODE + space(13-len(DT_D_CODE)) to S_PRO
                                    store DT_D_DESC + space(75-len(DT_D_DESC)) to S_P_DESC

                                case DIAG_PLACE = DIAG_END
                                    store "don't use    " to S_PRO
                                    store space(75) to S_D_DESC

                                 otherwise
                                    store DIAG_PLACE + 1 to DIAG_PLACE
                                    goto DIAG_PLACE
                                    store DT_D_CODE + space(13-len(DT_D_CODE)) to S_PRO
                                    store DT_D_DESC + space(75-len(DT_D_DESC)) to S_P_DESC

		                    endcase

                        *
                        * cardiac QP/QS
                        *

	                    case SELECT = 9
                            do case
                                case S_QP_QS = "<1           "
                                    store "=1           " to S_QP_QS

                                case S_QP_QS = "=1           "
                                    store ">1 & <2      " to S_QP_QS

                                case S_QP_QS = ">1 & <2      "
                                    store ">2 & <3      " to S_QP_QS
                                    
                                case S_QP_QS = ">2 & <3      "
                                    store ">3           " to S_QP_QS

                                case S_QP_QS = ">3           "
                                    store "don't use    " to S_QP_QS

                                case S_QP_QS = "don't use    "
                                    store "=1           " to S_QP_QS


                            endcase

                        *
                        * cardiac RP/RS
                        *

	                    case SELECT = 10
                            do case
                                case S_RP_RS = "<20%         "
                                    store ">20% & <40%  " to S_RP_RS
                                    
                                case S_RP_RS = ">20% & <40%  "
                                    store ">40% & <50%  " to S_RP_RS

                                case S_RP_RS = ">40% & <50%  "
                                    store ">50% & <70%  " to S_RP_RS

                                case S_RP_RS = ">50% & <70%  "
                                    store ">70%         " to S_RP_RS

                                case S_RP_RS = ">70%         "
                                    store "don't use    " to S_RP_RS

                                case S_RP_RS = "don't use    "
                                    store "<20%         " to S_RP_RS
                                                  
                            endcase

                        *
                        * cardiac RVP/LVP
                        *

	                    case SELECT = 11
                            do case
                                case S_RVP_LVP = "<50%         "
                                    store ">50% & <70%  " to S_RVP_LVP

                                case S_RVP_LVP = ">50% & <70%  "
                                    store ">70% & <100% " to S_RVP_LVP

                                case S_RVP_LVP = ">70% & <100% "
                                    store "=100%        " to S_RVP_LVP

                                case S_RVP_LVP = "=100%        "
                                    store "don't use    " to S_RVP_LVP

                                case S_RVP_LVP = "don't use    "
                                    store "<50%         " to S_RVP_LVP

                            endcase

                        *
                        * cardiac RVP/AOP
                        *

	                    case SELECT = 12
                            do case
                                case S_RVP_AOP = "<50%       "
                                    store ">50% & <70%  " to S_RVP_AOP

                                case S_RVP_AOP = ">50% & <70% "
                                    store ">70% & <100% " to S_RVP_AOP

                                case S_RVP_AOP = ">70% & <100% "
                                    store "=100%        " to S_RVP_AOP

                                case S_RVP_AOP = "=100%        "
                                    store "don't use    " to S_RVP_AOP

                                case S_RVP_AOP = "don't use    "
                                    store "<50%         " to S_RVP_AOP

                            endcase

                        *
                        * cardiac GR
                        *

	                    case SELECT = 13
                            do case
                                case S_GR = "<40mm        "
                                    store ">40mm & <60mm" to S_GR

                                case S_GR = ">40mm & <60mm"
                                    store ">60mm        " to S_GR

                                case S_GR = ">60mm        "
                                    store "don't use    " to S_GR

                                case S_GR = "don't use    "
                                    store "<40mm        " to S_GR

                            endcase

                        *                   
                        * ekg RHYTHM
                        *

                        case SELECT = 14
                            select 1
	                        do case
	                            case S_RHYTHM = "don't use    "
                                    store RH_START to RH_PLACE
                                    goto RH_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_RHYTHM
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_RH_DESC

                                case RH_PLACE = RH_END
                                    store "don't use    " to S_RHYTHM
                                    store space(75) to S_RH_DESC

                                 otherwise
                                    store RH_PLACE + 1 to RH_PLACE
                                    goto RH_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_RHYTHM
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_RH_DESC

		                    endcase

                        *
                        * ekg AXIS
                        *

                        case SELECT = 15
                            select 1
	                        do case
	                            case S_AXIS = "don't use    "
                                    store AX_START to AX_PLACE
                                    goto AX_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_AXIS
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_AX_DESC

                                case AX_PLACE = AX_END
                                    store "don't use    " to S_AXIS
                                    store space(75) to S_AX_DESC

                                 otherwise
                                    store AX_PLACE + 1 to AX_PLACE
                                    goto AX_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_AXIS
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_AX_DESC

		                    endcase

                        *
                        * ekg HYPER
                        *

	                    case SELECT = 16
                            select 1
	                        do case
	                            case S_HYP = "don't use    "
                                    store HY_START to HY_PLACE
                                    goto HY_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_HYP
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_HY_DESC

                                case HY_PLACE = HY_END
                                    store "don't use    " to S_HYP
                                    store space(75) to S_HY_DESC

                                 otherwise
                                    store HY_PLACE + 1 to HY_PLACE
                                    goto HY_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_HYP
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_HY_DESC

		                    endcase

                        *
                        * ekg COND
                        *

	                    case SELECT = 17
                            select 1
	                        do case
	                            case S_COND = "don't use    "
                                    store CD_START to CD_PLACE
                                    goto CD_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_COND
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_CD_DESC

                                case CD_PLACE = CD_END
                                    store "don't use    " to S_COND
                                    store space(75) to S_CD_DESC

                                 otherwise
                                    store CD_PLACE + 1 to CD_PLACE
                                    goto CD_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_COND
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_CD_DESC

		                    endcase

                        *
                        * ekg META
                        *

	                    case SELECT = 18
                            select 1
	                        do case
	                            case S_META = "don't use    "
                                    store ME_START to ME_PLACE
                                    goto ME_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_META
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_ME_DESC

                                case ME_PLACE = ME_END
                                    store "don't use    " to S_META
                                    store space(75) to S_ME_DESC

                                 otherwise
                                    store ME_PLACE + 1 to ME_PLACE
                                    goto ME_PLACE
                                    store KT_K_CODE + space(13-len(KT_K_CODE)) to S_META
                                    store KT_K_DESC + space(75-len(KT_K_DESC)) to S_ME_DESC

		                    endcase

                        *
                        * echo M MODE
                        *

	                    case SELECT = 19
                            do case
                                case S_M_MODE = "normal       "
                                    store "abnormal     " to S_M_MODE
                                    
                                case S_M_MODE = "abnormal     "
                                    store "don't use    " to S_M_MODE

                                case S_M_MODE = "don't use    "
                                    store "normal       " to S_M_MODE

                            endcase

                        *
                        * echo TWO_D
                        *

	                    case SELECT = 20
                            do case
                                case S_TWO_D = "normal       "
                                    store "abnormal     " to S_TWO_D
                                    
                                case S_TWO_D = "abnormal     "
                                    store "don't use    " to S_TWO_D

                                case S_TWO_D = "don't use    "
                                    store "normal       " to S_TWO_D

                            endcase

                        *
                        * echo DOPPLER
                        *

	                    case SELECT = 21
                            do case
                                case S_DOPPLER = "normal       "
                                    store "abnormal     " to S_DOPPLER
                                    
                                case S_DOPPLER = "abnormal     "
                                    store "don't use    " to S_DOPPLER

                                case S_DOPPLER = "don't use    "
                                    store "normal       " to S_DOPPLER

                            endcase

                        *
                        * echo XRAY
                        *

	                    case SELECT = 22
                            do case
                                case S_XRAY = "normal       "
                                    store "abnormal     " to S_XRAY
                                    
                                case S_XRAY = "abnormal     "
                                    store "don't use    " to S_XRAY

                                case S_XRAY = "don't use    "
                                    store "normal       " to S_XRAY

                            endcase

                endcase

			endcase

            do case
                case SELECT = 1
                    @ 19,1
                    @ 8,1 say MENU_1_1 get S_AGE_PMT
                case SELECT = 2
                    @ 19,1
                    @ 8,54 say MENU_1_2 get S_DIED
                case SELECT = 3
                    @ 19,1
                    @ 9,1 say MENU_2_1 get S_STRT_M
                case SELECT = 4
                    @ 19,1
                    @ 9,18 say MENU_2_2 get S_STRT_Y
                case SELECT = 5
                    @ 19,1
                    @ 9,48 say MENU_2_3 get S_END_M
                case SELECT = 6
                    @ 19,1
                    @ 9,63 say MENU_2_4 get S_END_Y
                case SELECT = 7
                    @ 19,1 get S_D_DESC
                    @ 11,1 say MENU_3_1 get S_D_CODE
                case SELECT = 8
                    @ 19,1 get S_P_DESC
                    @ 11,33 say MENU_3_2 get S_PRO
                case SELECT = 9
                    @ 19,1
                    @ 12,1 say MENU_4_1 get S_QP_QS
                case SELECT = 10
                    @ 19,1
                    @ 12,33 say MENU_4_2 get S_RP_RS
                case SELECT = 11
                    @ 19,1
                    @ 12,55 say MENU_4_3 get S_RVP_LVP
                case SELECT = 12
                    @ 19,1
                    @ 13,9 say MENU_4_4 get S_RVP_AOP
                case SELECT = 13
                    @ 19,1
                    @ 13,33 say MENU_4_5 get S_GR
                case SELECT = 14
                    @ 19,1 get S_RH_DESC
                    @ 14,1 say MENU_5_1 get S_RHYTHM
                case SELECT = 15
                    @ 19,1 get S_AX_DESC
                    @ 14,33 say MENU_5_2 get S_AXIS
                case SELECT = 16
                    @ 19,1 get S_HY_DESC
                    @ 14,55 say MENU_5_3 get S_HYP
                case SELECT = 17
                    @ 19,1 get S_CD_DESC
                    @ 15,9 say MENU_5_4 get S_COND
                case SELECT = 18
                    @ 19,1 get S_ME_DESC
                    @ 15,33 say MENU_5_5 get S_META
                case SELECT = 19
                    @ 19,1
                    @ 16,1 say MENU_6_1 get S_M_MODE
                case SELECT = 20
                    @ 19,1
                    @ 16,33 say MENU_6_2 get S_TWO_D
                case SELECT = 21
                    @ 19,1
                    @ 16,55 say MENU_6_3 get S_DOPPLER
                case SELECT = 22
                    @ 19,1
                    @ 17,1 say MENU_7_1 get S_XRAY

            endcase

            clear gets

		endif
	
	enddo

enddo

if DO_SEARCH
    if S_AGE = 9
        store "d/c" to S_AGE
    else
        store ltrim(trim(str(S_AGE,1))) to S_AGE
    endif

    do case
        case S_DIED = "no       "
            store "N" to S_DIED

       case S_DIED = "yes      "
            store "Y" to S_DIED

       case S_DIED = "don't use"
            store "d/c" to S_DIED

    endcase

    if S_D_CODE = "don't use    "
        store "d/c" to S_D_CODE
    else
        store trim(upper(S_D_CODE)) to S_D_CODE
    endif

    if S_PRO = "don't use    "
        store "d/c" to S_PRO
    else
        store trim(upper(S_PRO)) to S_PRO
    endif

    do case
        case S_QP_QS = "<1           "
            store "1" to S_QP_QS

        case S_QP_QS = "=1           "
            store "2" to S_QP_QS

        case S_QP_QS = ">1 & <2      "
            store "3" to S_QP_QS
                                    
        case S_QP_QS = ">2 & <3      "
           store "4" to S_QP_QS

        case S_QP_QS = ">3           "
           store "5" to S_QP_QS

        case S_QP_QS = "don't use    "
           store "d/c" to S_QP_QS

    endcase
                    
    do case
        case S_RP_RS = "<20%         "
           store "1" to S_RP_RS
                       
        case S_RP_RS = ">20% & <40%  "
           store "2" to S_RP_RS

        case S_RP_RS = ">40% & <50%  "
           store "3" to S_RP_RS

        case S_RP_RS = ">50% & <70%  "
           store "4" to S_RP_RS

        case S_RP_RS = ">70%         "
           store "5" to S_RP_RS

        case S_RP_RS = "don't use    "
           store "d/c" to S_RP_RS
                                                  
    endcase

    do case
        case S_RVP_LVP = "<50%         "
           store "1" to S_RVP_LVP

        case S_RVP_LVP = ">50% & <70%  "
           store "2" to S_RVP_LVP

        case S_RVP_LVP = ">70% & <100% "
           store "3" to S_RVP_LVP

        case S_RVP_LVP = "=100%        "
           store "4" to S_RVP_LVP

        case S_RVP_LVP = "don't use    "
           store "d/c" to S_RVP_LVP

    endcase

    do case
        case S_RVP_AOP = "<50%       "
           store "1" to S_RVP_AOP

        case S_RVP_AOP = ">50% & <70% "
           store "2" to S_RVP_AOP

        case S_RVP_AOP = ">70% & <100% "
           store "3" to S_RVP_AOP

        case S_RVP_AOP = "=100%        "
           store "4" to S_RVP_AOP

        case S_RVP_AOP = "don't use    "
           store "d/c" to S_RVP_AOP

    endcase

    do case
        case S_GR = "<40mm        "
            store "1" to S_GR

        case S_GR = ">40mm & <60mm"
            store "2" to S_GR

        case S_GR = ">60mm        "
            store "3" to S_GR

        case S_GR = "don't use    "
            store "d/c" to S_GR

    endcase

    select 1

    if S_RHYTHM = "don't use    "
        store "d/c" to S_RHYTHM
    else
        store substr(S_RHYTHM,1,5) to S_RHYTHM
        locate for KT_K_CODE=S_RHYTHM
        store substr(KT_K_PTR,3,2) to S_RHYTHM
    endif

    if S_AXIS = "don't use    "
        store "d/c" to S_AXIS
    else
        store substr(S_AXIS,1,5) to S_AXIS
        locate for KT_K_CODE=S_AXIS
        store substr(KT_K_PTR,3,2) to S_AXIS
    endif

    if S_HYP = "don't use    "
        store "d/c" to S_HYP
    else
        store substr(S_HYP,1,5) to S_HYP
        locate for KT_K_CODE=S_HYP
        store substr(KT_K_PTR,3,2) to S_HYP
    endif

    if S_COND = "don't use    "
        store "d/c" to S_COND
    else
        store substr(S_COND,1,5) to S_COND
        locate for KT_K_CODE=S_COND
        store substr(KT_K_PTR,3,2) to S_COND
    endif

    if S_META = "don't use    "
        store "d/c" to S_META
    else
        store substr(S_META,1,5) to S_META
        locate for KT_K_CODE=S_META
        store substr(KT_K_PTR,3,2) to S_META
    endif

    do case
        case S_M_MODE = "normal        "
    		store "N" to S_M_MODE

    	case S_M_MODE = "abnormal      "
    		store "A" to S_M_MODE

    	case S_M_MODE = "don't use    "
    		store "d/c" to S_M_MODE

    endcase

    do case
        case S_TWO_D = "normal       "
            store "N" to S_TWO_D
                                    
        case S_TWO_D = "abnormal     "
            store "A" to S_TWO_D

         case S_TWO_D = "don't use    "
             store "d/c" to S_TWO_D

    endcase

    do case
         case S_DOPPLER = "normal       "
             store "N" to S_DOPPLER
                                    
         case S_DOPPLER = "abnormal     "
             store "A" to S_DOPPLER

         case S_DOPPLER = "don't use    "
             store "d/c" to S_DOPPLER

    endcase

    do case
        case S_XRAY = "normal       "
    		store "N" to S_XRAY

    	case S_XRAY = "abnormal     "
	    	store "A" to S_XRAY

    	case S_XRAY = "don't use    "
    		store "d/c" to S_XRAY

    endcase
                    
endif

select 1
use
select 2
use

return

