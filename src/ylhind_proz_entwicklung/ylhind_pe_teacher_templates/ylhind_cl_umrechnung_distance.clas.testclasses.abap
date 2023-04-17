CLASS ltcl_umrechnung_distance DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      Umrechnung_miles_to_km FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_umrechnung_distance IMPLEMENTATION.

  METHOD Umrechnung_miles_to_km.
    DATA(mo_cut) = NEW ylhind_cl_umrechnung_distance( ).
    cl_abap_unit_assert=>assert_equals( exp = CONV f( '1.609344' )
                                        act = mo_cut->convert_miles2km( 1 ) ).
  ENDMETHOD.

ENDCLASS.
