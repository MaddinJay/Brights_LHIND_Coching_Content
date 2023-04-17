*&---------------------------------------------------------------------*
*& Report ylhind_pe_fizzbuzz_test
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ylhind_pe_fizzbuzz_test.

CLASS ltcl_fizzbuzz DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      test_with_while FOR TESTING,
      test_with_do_enddo FOR TESTING RAISING cx_static_check,
      test_with_loop FOR TESTING RAISING cx_static_check,
      test_with_while_modif FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_fizzbuzz IMPLEMENTATION.

  METHOD test_with_while.
    DATA lv_number TYPE int1.
    DATA lt_results TYPE STANDARD TABLE OF string.

    lv_number = 1.

    WHILE lv_number <= 5.
      IF lv_number MOD 3 = 0 AND
         lv_number MOD 5 = 0.
        APPEND 'FizzBuzz' TO lt_results.
      ELSEIF lv_number MOD 3 = 0.
        APPEND 'Fizz' TO lt_results.
      ELSEIF lv_number MOD 5 = 0.
        APPEND 'Buzz' TO lt_results.
      ELSE.
        APPEND CONV string( lv_number ) TO lt_results.
      ENDIF.
      lv_number = lv_number + 1.
    ENDWHILE.

    cl_abap_unit_assert=>assert_equals( exp = VALUE string_t( ( CONV string( 1 ) )
                                                              ( CONV string( 2 ) )
                                                              ( CONV string( 'Fizz' ) )
                                                              ( CONV string( 4 ) )
                                                              ( CONV string( 'Buzz' ) )  )
                                        act = lt_results ).
  ENDMETHOD.

  METHOD test_with_while_modif.
    DATA lv_number TYPE int1.
    DATA lt_results TYPE STANDARD TABLE OF string.

    lv_number = 1.

    WHILE lv_number <= 5.
      APPEND INITIAL LINE TO lt_results ASSIGNING FIELD-SYMBOL(<result>).
      IF lv_number MOD 3 = 0 AND
         lv_number MOD 5 = 0.
        <result> = 'FizzBuzz'.
      ELSEIF lv_number MOD 3 = 0.
        <result> = 'Fizz'.
      ELSEIF lv_number MOD 5 = 0.
        <result> = 'Buzz'.
      ELSE.
        <result> = lv_number.
      ENDIF.
      lv_number = lv_number + 1.
    ENDWHILE.

    cl_abap_unit_assert=>assert_equals( exp = VALUE string_t( ( CONV string( 1 ) )
                                                              ( CONV string( 2 ) )
                                                              ( CONV string( 'Fizz' ) )
                                                              ( CONV string( 4 ) )
                                                              ( CONV string( 'Buzz' ) )  )
                                        act = lt_results ).
  ENDMETHOD.

  METHOD test_with_do_enddo.
    DATA lv_number TYPE int1.
    DATA lt_results TYPE STANDARD TABLE OF string.

    lv_number = 1.

    DO 5 TIMES.
      IF lv_number MOD 3 = 0 AND
         lv_number MOD 5 = 0.
        APPEND 'FizzBuzz' TO lt_results.
      ELSEIF lv_number MOD 3 = 0.
        APPEND 'Fizz' TO lt_results.
      ELSEIF lv_number MOD 5 = 0.
        APPEND 'Buzz' TO lt_results.
      ELSE.
        APPEND CONV string( lv_number ) TO lt_results.
      ENDIF.
      lv_number = lv_number + 1.
    ENDDO.

    cl_abap_unit_assert=>assert_equals( exp = VALUE string_t( ( CONV string( 1 ) )
                                                              ( CONV string( 2 ) )
                                                              ( CONV string( 'Fizz' ) )
                                                              ( CONV string( 4 ) )
                                                              ( CONV string( 'Buzz' ) )  )
                                        act = lt_results ).
  ENDMETHOD.

  METHOD test_with_loop.
    DATA lt_results TYPE STANDARD TABLE OF string.
    DATA lt_input   TYPE STANDARD TABLE OF int1.

    lt_input = VALUE #( ( |1| )
                        ( |2| )
                        ( |3| )
                        ( |4| )
                        ( |5| ) ).

    LOOP AT lt_input INTO DATA(lv_input).
      IF lv_input MOD 3 = 0 AND
         lv_input MOD 5 = 0.
        APPEND 'FizzBuzz' TO lt_results.
      ELSEIF lv_input MOD 3 = 0.
        APPEND 'Fizz' TO lt_results.
      ELSEIF lv_input MOD 5 = 0.
        APPEND 'Buzz' TO lt_results.
      ELSE.
        APPEND CONV string( lv_input ) TO lt_results.
      ENDIF.
    ENDLOOP.

    cl_abap_unit_assert=>assert_equals( exp = VALUE string_t( ( CONV string( 1 ) )
                                                              ( CONV string( 2 ) )
                                                              ( CONV string( 'Fizz' ) )
                                                              ( CONV string( 4 ) )
                                                              ( CONV string( 'Buzz' ) )  )
                                        act = lt_results ).
  ENDMETHOD.
ENDCLASS.
