*&---------------------------------------------------------------------*
*& Include ylhind_pe_fizzbuzz_main
*&---------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK one WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_input TYPE int1.
SELECTION-SCREEN END OF BLOCK one.

START-OF-SELECTION.
  PERFORM process_fizzbuzz USING p_input
                           CHANGING gv_result.

END-OF-SELECTION.
  PERFORM display_result USING gv_result.
