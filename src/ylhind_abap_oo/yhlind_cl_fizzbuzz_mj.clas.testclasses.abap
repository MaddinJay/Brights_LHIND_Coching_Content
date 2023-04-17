CLASS ltcl_fizzbuzz_mj DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      " Wenn 1 eingegeben, dann Return ( 1 , 1 )
      input_1_output_1 FOR TESTING,
      " Wenn 2 eingegeben, dann Return ( ( 1, 1 ) ( 2, 2 ) )
      input_2_output_2 FOR TESTING.
ENDCLASS.


CLASS ltcl_fizzbuzz_mj IMPLEMENTATION.

  METHOD input_1_output_1.
    DATA lo_cut TYPE REF TO yhlind_cl_fizzbuzz_mj.

    lo_cut = NEW yhlind_cl_fizzbuzz_mj( ).

    cl_abap_unit_assert=>assert_equals( msg = 'Bei Eingabe 1 soll ( 1 , 1) ausgegeben werden'
                                        exp = VALUE z007_fizzbuzz( ( z_input = 1 z_output = '1' ) )
                                        act = lo_cut->convert( 1 ) ).
  ENDMETHOD.

  METHOD input_2_output_2.
    DATA lo_cut TYPE REF TO yhlind_cl_fizzbuzz_mj.

    lo_cut = NEW yhlind_cl_fizzbuzz_mj( ).

    cl_abap_unit_assert=>assert_equals( msg = 'Bei Eingabe 1 soll ( 1 , 1 ) ( 2, 2 ) ausgegeben werden'
                                        exp = VALUE z007_fizzbuzz( ( z_input = 1 z_output = '1' )
                                                                   ( z_input = 2 z_output = '2' ) )
                                        act = lo_cut->convert( 2 ) ).
  ENDMETHOD.

ENDCLASS.
