*&---------------------------------------------------------------------*
*& Include ylhind_pe_fizzbuzz_f01
*&---------------------------------------------------------------------*
FORM process_fizzbuzz USING iv_number    TYPE int1
                      CHANGING cv_result LIKE gv_result.
  IF iv_number MOD 3 = 0 AND  " Durch 15 teilbar (3 und 5)
     iv_number MOD 5 = 0.
    cv_result = 'FIZZBUZZ'.
  ELSEIF iv_number MOD 3 = 0. " Durch 3 teilbar
    cv_result = 'FIZZ'.
  ELSEIF iv_number MOD 5 = 0. " Durch 5 teilbar
    cv_result = 'BUZZ'.
  ELSE.
    cv_result = iv_number.
  ENDIF.
ENDFORM.

FORM display_result USING iv_result LIKE gv_result.
  cl_demo_output=>display_text( iv_result ).
ENDFORM.
