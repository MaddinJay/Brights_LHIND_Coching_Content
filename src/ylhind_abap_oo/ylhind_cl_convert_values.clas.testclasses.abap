CLASS ltcl_convert_values DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA mo_cut TYPE REF TO ylhind_cl_convert_values.

    METHODS:
      setup,

      map_wohnsitz_kanton_success FOR TESTING.

ENDCLASS.

CLASS ltcl_convert_values IMPLEMENTATION.

  METHOD setup.
    mo_cut = NEW #( ).
  ENDMETHOD.

  METHOD map_wohnsitz_kanton_success.
    " If P_PLZ = 8085 -> EX, else initial
    cl_abap_unit_assert=>assert_equals( exp = 'EX'
                                        act = mo_cut->map_wohnsitz_kanton( iv_post_code = '8085' iv_kanton_id = 'ZH' ) ).
    " Else map Kanton
    cl_abap_unit_assert=>assert_equals( exp = 'ZH'
                                        act = mo_cut->map_wohnsitz_kanton( iv_post_code = '6005' iv_kanton_id = 'ZH' ) ).
  ENDMETHOD.

ENDCLASS.
