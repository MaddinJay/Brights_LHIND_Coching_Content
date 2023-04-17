*&---------------------------------------------------------------------*
*& Report YLHIND_PE_FIZZBUZZ
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ylhind_pe_fizzbuzz_vers_1_ext NO STANDARD PAGE HEADING.

SELECTION-SCREEN BEGIN OF BLOCK one. " WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_eing TYPE int1.
SELECTION-SCREEN END OF BLOCK one.

START-OF-SELECTION.
  DATA lv_number TYPE int1.

  lv_number = 1.

  WHILE lv_number <= p_eing.
    IF lv_number MOD 3 = 0 AND
       lv_number MOD 5 = 0.
      WRITE: /'FIZZBUZZ'.
    ELSEIF lv_number MOD 3 = 0.
      WRITE: /'FIZZ'.
    ELSEIF lv_number MOD 5 = 0.
      WRITE: /'BUZZ'.
    ELSE.
      WRITE: / lv_number.
    ENDIF.
    lv_number = lv_number + 1.
  ENDWHILE.
