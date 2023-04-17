CLASS ylhind_cl_pe_fizzbuzz_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    "! Konvertiert die Eingabe zu¨:
    "!  - Input durch 3 teilbar:        Ausgabe 'Fizz'
    "!  - Input durch 5 teilbar:        Ausgabe 'Buzz'
    "!  - Input durch 3 und 5 teilbar:  Ausgabe 'FizzBuzz'
    "! @parameter iv_number | <p class="shorttext synchronized" lang="en">User Input</p>
    "! @parameter rt_result | <p class="shorttext synchronized" lang="en">Ausgabe</p>
    METHODS convert IMPORTING iv_number        TYPE int1.

  PRIVATE SECTION.
    CONSTANTS gc_fizz TYPE string VALUE 'Fizz' ##NO_TEXT.
    METHODS convert_user_input2result
      IMPORTING
        iv_number        TYPE int1
      RETURNING
        VALUE(rt_result) TYPE ylhind_tt_fizzbuzz.
    METHODS display_result
      CHANGING
        ct_result TYPE ylhind_tt_fizzbuzz.
ENDCLASS.

CLASS ylhind_cl_pe_fizzbuzz_2 IMPLEMENTATION.

  METHOD convert.
    DATA(lt_result) = convert_user_input2result( iv_number ).

    display_result( CHANGING ct_result = lt_result ).
  ENDMETHOD.

  METHOD display_result.
    DATA lo_salv_table TYPE REF TO cl_salv_table.

    TRY.
        cl_salv_table=>factory( IMPORTING r_salv_table = lo_salv_table
                                CHANGING  t_table      = ct_result ).

        lo_salv_table->display( ).
      CATCH cx_salv_not_found cx_salv_msg.
    ENDTRY.
  ENDMETHOD.

  METHOD convert_user_input2result.
    DATA(lv_counter) = 1.

    WHILE lv_counter <= iv_number.
      IF lv_counter MOD 15 = 0.
        APPEND VALUE ylhind_fizzbuzz( user_input = lv_counter conv_result = 'FizzBuzz' ) TO rt_result.
      ELSEIF lv_counter MOD 3 = 0.
        APPEND VALUE ylhind_fizzbuzz( user_input = lv_counter conv_result = gc_fizz ) TO rt_result.
      ELSEIF lv_counter MOD 5 = 0.
        APPEND VALUE ylhind_fizzbuzz( user_input = lv_counter conv_result = 'Buzz' ) TO rt_result.
      ELSE.
        APPEND VALUE ylhind_fizzbuzz( user_input = lv_counter conv_result = CONV #( lv_counter ) ) TO rt_result.
      ENDIF.
      lv_counter = lv_counter + 1.
    ENDWHILE.
  ENDMETHOD.


ENDCLASS.
