*&---------------------------------------------------------------------*
*& Report yhlind_test_speed_class
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT yhlind_test_speed_class.

CLASS ltcl_speed DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      test_speed_class_init FOR TESTING.
ENDCLASS.


CLASS ltcl_speed IMPLEMENTATION.

  METHOD test_speed_class_init.
    DATA lo_cut TYPE REF TO zgr2_cl_speed.

    lo_cut = NEW #( ).

    cl_abap_unit_assert=>assert_equals( exp = 255
                                        act = lo_cut->zgr2_if_speed~gv_speed ).
  ENDMETHOD.

ENDCLASS.
