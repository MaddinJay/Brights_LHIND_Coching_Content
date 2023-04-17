CLASS ylhind_cl_pe_fizzbuzz_iosp DEFINITION
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
    METHODS convert IMPORTING iv_number        TYPE int1
                    RETURNING VALUE(rt_result) TYPE ylhind_tt_fizzbuzz.
  PRIVATE SECTION.
    CONSTANTS gc_fizz TYPE string VALUE 'Fizz' ##NO_TEXT.

    METHODS check_input IMPORTING iv_number TYPE int1.
    METHODS prozess_fizzbuzz_algo
      IMPORTING
        iv_number        TYPE int1
      RETURNING
        VALUE(rt_result) TYPE ylhind_tt_fizzbuzz.
    METHODS display_result
      IMPORTING
        it_result TYPE ylhind_tt_fizzbuzz.
ENDCLASS.

CLASS ylhind_cl_pe_fizzbuzz_iosp IMPLEMENTATION.

  METHOD convert.
    check_input( iv_number ).

    DATA(gt_result) = prozess_fizzbuzz_algo( iv_number ).

    display_result( gt_result ).
  ENDMETHOD.

  METHOD check_input.
    " To be implemented
  ENDMETHOD.

  METHOD prozess_fizzbuzz_algo.
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


  METHOD display_result.

  ENDMETHOD.

ENDCLASS.
