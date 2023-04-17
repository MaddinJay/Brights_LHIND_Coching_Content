*&---------------------------------------------------------------------*
*& Report ylhind_pe_fizzbuzz_abap_oo
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ylhind_pe_fizzbuzz_abap_oo.

TYPES: BEGIN OF ts_result,
         user_input  TYPE ylhind_user_input,
         conv_result TYPE ylhind_conv_result,
       END OF ts_result.

DATA lt_result TYPE STANDARD TABLE OF ts_result WITH DEFAULT KEY.
DATA lo_fizzbuzz TYPE REF TO ylhind_cl_pe_fizzbuzz.
DATA lo_salv_table TYPE REF TO cl_salv_table.

PARAMETERS: p_input TYPE int1.


START-OF-SELECTION.
  lo_fizzbuzz = NEW #( ).
  lt_result   = CORRESPONDING #( lo_fizzbuzz->convert( p_input ) ).

END-OF-SELECTION.
  ##TODO " ALternativ: Anzeige der Daten in FizzBuzz Klasse auslagern (Tell don't ask)
  TRY.
      cl_salv_table=>factory( IMPORTING r_salv_table = lo_salv_table
                              CHANGING  t_table      = lt_result ).

      lo_salv_table->display( ).
    CATCH cx_salv_not_found cx_salv_msg.
  ENDTRY.
