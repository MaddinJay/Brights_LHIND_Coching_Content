*&---------------------------------------------------------------------*
*& Report YLHIND_PE_FIZZBUZZ
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ylhind_pe_fizzbuzz_vers_1 NO STANDARD PAGE HEADING.

SELECTION-SCREEN BEGIN OF BLOCK one. " WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_eing TYPE int1.
SELECTION-SCREEN END OF BLOCK one.

IF p_eing MOD 3 = 0 AND
   p_eing MOD 5 = 0.
  WRITE: 'FIZZBUZZ'.
ELSEIF p_eing MOD 3 = 0.
  WRITE: 'FIZZ'.
ELSEIF p_eing MOD 5 = 0.
  WRITE: 'BUZZ'.
ELSE.
  WRITE: p_eing.
ENDIF.
