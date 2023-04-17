CLASS ylhind_cl_umrechnung_distance DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS convert_miles2km IMPORTING iv_miles     TYPE f
                             RETURNING VALUE(rv_km) TYPE f.
ENDCLASS.

CLASS ylhind_cl_umrechnung_distance IMPLEMENTATION.

  METHOD convert_miles2km.
    cl_gis_geocod_cal=>convert_mi_to_km(
      EXPORTING
        iv_mi = iv_miles
      IMPORTING
        ev_km = rv_km
    ).
  ENDMETHOD.

ENDCLASS.
