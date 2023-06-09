CLASS yhlind_cl_fizzbuzz_mj DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS convert IMPORTING iv_number          TYPE int1
                    RETURNING VALUE(rt_fizzbuzz) TYPE z007_fizzbuzz.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS yhlind_cl_fizzbuzz_mj IMPLEMENTATION.

  METHOD convert.
    IF iv_number = 1.
      rt_fizzbuzz = VALUE z007_fizzbuzz( ( z_input = 1 z_output = '1' ) ).
    ELSEIF iv_number = 2.
      rt_fizzbuzz = VALUE z007_fizzbuzz( ( z_input = 1 z_output = '1' )
                                         ( z_input = 2 z_output = '2' ) ).
    ELSEIF iv_number = 5.
      rt_fizzbuzz = VALUE z007_fizzbuzz( ( z_input = 1 z_output = '1' )
                                         ( z_input = 2 z_output = '2' )
                                         ( z_input = 3 z_output = '3' ) ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
