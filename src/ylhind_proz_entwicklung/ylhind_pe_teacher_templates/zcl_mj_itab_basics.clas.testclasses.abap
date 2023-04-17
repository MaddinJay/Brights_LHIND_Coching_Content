CLASS ltcl_itab_basics DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA:
      cut TYPE REF TO zcl_mj_itab_basics.
    METHODS:
      setup,
      first_test FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_itab_basics IMPLEMENTATION.

  METHOD setup.
    cut = NEW zcl_mj_itab_basics( ).
  ENDMETHOD.

  METHOD first_test.
    DATA(actual) = cut->fill_itab( ).
    cl_abap_unit_assert=>assert_not_initial( actual ).

    DATA(expected_values) = VALUE zcl_mj_itab_basics=>itab_data_type(
        ( group = 'A' number = 10  description = 'Group A-2' )
        ( group = 'B' number = 5   description = 'Group B' )
        ( group = 'A' number = 6   description = 'Group A-1' )
        ( group = 'C' number = 22  description = 'Group C-1' )
        ( group = 'A' number = 13  description = 'Group A-3' )
        ( group = 'C' number = 500 description = 'Group C-2' ) ).

    cl_abap_unit_assert=>assert_equals(
      act = cut->fill_itab( )
      exp = expected_values ).
  ENDMETHOD.


ENDCLASS.
