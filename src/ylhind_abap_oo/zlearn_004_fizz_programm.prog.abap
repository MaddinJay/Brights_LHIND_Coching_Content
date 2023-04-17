*&---------------------------------------------------------------------*
*& Report zlearn_004_fizz_programm
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zlearn_004_fizz_programm.

DATA(o_test) = NEW zlearn_004_testklasse(  ).
o_test->convert( 1 ).

DATA: ls_struktur type z007_fizzbuzz,
      lt_tabelle type table of z007_fizzbuzz.

LOOP at lt_tabelle into ls_struktur.

ENDLOOP.
