CLASS ltcl_hello_world DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      test FOR TESTING RAISING cx_static_check.

ENDCLASS.


CLASS ltcl_hello_world IMPLEMENTATION.

  METHOD test.
    cl_abap_unit_assert=>assert_equals( exp = 'Hello, World!'
                                        act = NEW zcl_mj_hello_world( )->hello_world( ) ).
  ENDMETHOD.

ENDCLASS.
