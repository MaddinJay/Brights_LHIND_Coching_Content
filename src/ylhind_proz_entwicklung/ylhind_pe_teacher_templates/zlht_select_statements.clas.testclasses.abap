CLASS ltcl_select_statements DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO zlht_select_statements.

    METHODS:
      setup,
      test_full_select   FOR TESTING,
      test_select_single FOR TESTING,
      test_fields_select FOR TESTING,
      test_select_inline_declaration FOR TESTING,
      test_order_by      FOR TESTING,
    test_up_to_5_rows FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_select_statements IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW zlht_select_statements( ).
  ENDMETHOD.

  METHOD test_full_select.
    DATA(lt_result) = mo_cut->select_full_table( ).

    cl_abap_unit_assert=>assert_equals( exp = 93
                                        act = lines( lt_result ) ).
  ENDMETHOD.

  METHOD test_select_single.
    DATA(ls_result) = mo_cut->select_single_entry( ).

    cl_abap_unit_assert=>assert_equals( exp = 'AA'
                                        act = ls_result-carrid ).
  ENDMETHOD.

  METHOD test_fields_select.
    cl_abap_unit_assert=>assert_equals( exp = VALUE zlht_select_statements=>ts_fields( carrid = 'AA' connid = '017' fldate = '20220719' price = '422.94' )
                                        act = mo_cut->select_fields( ) ).
  ENDMETHOD.

  METHOD test_select_inline_declaration.
    cl_abap_unit_assert=>assert_equals( exp = VALUE zlht_select_statements=>ts_fields( carrid = 'AA' connid = '017' fldate = '20220719' price = '422.94' )
                                        act = mo_cut->select_inline_declaration( ) ).
  ENDMETHOD.

  METHOD test_order_by.
    " Select auf SFLIGHT mit CARRID = 'AA', ORDER BY fldate aufsteigend -> 1. Zeile der Ergebnistabelle hat FLDATE = 19.07.2022
    DATA(lt_return) = mo_cut->select_order_by( ).

    TRY.
        DATA(ls_return) = lt_return[ 1 ].
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    cl_abap_unit_assert=>assert_equals( exp = '20220719'
                                        act = ls_return-fldate ).
  ENDMETHOD.

  METHOD test_up_to_5_rows.
  cl_abap_unit_assert=>assert_equals( exp =  5
                                      act =  lines( mo_cut->select_up_to_5_rows(  ) ) ).
  ENDMETHOD.
ENDCLASS.
