*&---------------------------------------------------------------------*
*& Report ylhind_pe_fizzbuzz_prozedural
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ylhind_pe_fizzbuzz_prozedural NO STANDARD PAGE HEADING.

DATA: gv_result TYPE string.

SELECTION-SCREEN BEGIN OF BLOCK one WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_input TYPE int1.
SELECTION-SCREEN END OF BLOCK one.

START-OF-SELECTION.
  " 1. Konvertiere Eingabe in Output-Wert (Zahl, Fizz, Buzz, FizzBuzz)
  IF p_input MOD 3 = 0 AND  " Durch 15 teilbar (3 und 5)
     p_input MOD 5 = 0.
    gv_result = 'FIZZBUZZ'.
  ELSEIF p_input MOD 3 = 0. " Durch 3 teilbar
    gv_result = 'FIZZ'.
  ELSEIF p_input MOD 5 = 0. " Durch 5 teilbar
    gv_result = 'BUZZ'.
  ELSE.
    gv_result = p_input.
  ENDIF.

END-OF-SELECTION.
  " 2. Schreibe Ergebnis in Protocol-Screen
  cl_demo_output=>display_text( gv_result ).
