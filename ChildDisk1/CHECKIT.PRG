* Last revised : Sun 28-Feb-88 at 6:39 pm
*************************************************************************
*																		*
* CHECKIT >>> Check EKG string values									*
*		   entry : VALUE, CHECK											*
*		   exit : Current record variables								*
*																		*
* (C)opyright 1987 Personal Touch Software Inc.,  All Rights Reserved.	*
*																		*
*************************************************************************

store .F. to OK

do case
	case CHECK = "don't care    "
		store .T. to OK

	case CHECK = "00"
		if SUBSTR(VALUE,1,2) = "00"
		    store .T. to OK
		endif

	case CHECK <> "00"
		if CHECK = SUBSTR(VALUE,1,2)
		    store .T. to OK
		endif

		if CHECK = SUBSTR(VALUE,3,2)
		    store .T. to OK
		endif

		if CHECK = SUBSTR(VALUE,5,2)
		    store .T. to OK
		endif

		if CHECK = SUBSTR(VALUE,7,2)
		    store .T. to OK
		endif

		if CHECK = SUBSTR(VALUE,9,2)
		    store .T. to OK
		endif

endcase

return
