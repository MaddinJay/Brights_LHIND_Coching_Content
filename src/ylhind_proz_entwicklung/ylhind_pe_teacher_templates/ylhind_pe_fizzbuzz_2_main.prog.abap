*&---------------------------------------------------------------------*
*& Include ylhind_pe_fizzbuzz_2_main
*&---------------------------------------------------------------------*

PARAMETERS: p_input TYPE int1.

END-OF-SELECTION.
  lo_fizzbuzz = NEW #( ).
  lo_fizzbuzz->convert( p_input ).
