*&---------------------------------------------------------------------*
*& Report YLHIND_PE_FIZZBUZZ
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ylhind_pe_fizzbuzz_vers_2 NO STANDARD PAGE HEADING.

DATA: gv_result TYPE string.

SELECTION-SCREEN BEGIN OF BLOCK one WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_input TYPE int1.
SELECTION-SCREEN END OF BLOCK one.

START-OF-SELECTION.
  " 1. Konvertiere Eingabe in Output-Wert (Zahl, Fizz, Buzz, FizzBuzz)
  PERFORM process_conversion USING p_input
                             CHANGING gv_result.

END-OF-SELECTION.
  " 2. Schreibe Ergebnis in Protocol-Screen
  PERFORM display_result USING gv_result.

*&---------------------------------------------------------------------*
*& Form process_conversion
*&---------------------------------------------------------------------*
FORM process_conversion USING    iv_input  TYPE int1
                        CHANGING cv_result LIKE gv_result.
  IF iv_input MOD 3 = 0 AND  " Durch 15 teilbar (3 und 5)
     iv_input MOD 5 = 0.
    cv_result = 'FIZZBUZZ'.
  ELSEIF iv_input MOD 3 = 0. " Durch 3 teilbar
    cv_result = 'FIZZ'.
  ELSEIF iv_input MOD 5 = 0. " Durch 5 teilbar
    cv_result = 'BUZZ'.
  ELSE.
    cv_result = iv_input.
  ENDIF.

  " Anmerkung: Statt iv_input könnten wir auch p_eing verwenden, da Parameter
  " global zur Verfügung stehen.

  " Routinen übergreifende Variablen machen die Nachvollziehbarkeit aber sehr
  " schwer -> "Side-Effects" und schlechtere Übersicht im Programm
ENDFORM.

*&---------------------------------------------------------------------*
*& Form display_result
*&---------------------------------------------------------------------*
FORM display_result USING iv_result LIKE gv_result.
  cl_demo_output=>display_text( gv_result ).
ENDFORM.
