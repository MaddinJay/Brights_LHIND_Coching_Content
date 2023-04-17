CLASS ylhind_cl_convert_values DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    "! Mapping Wohnsitz Kanton
    "! @parameter iv_post_code        | PLZ der quellensteuerpflichtigen Person
    "! @parameter rv_wohnsitz_kanton  | Wohnsitz Kanton
    METHODS map_wohnsitz_kanton
      IMPORTING
        iv_kanton_id              TYPE char3
        iv_post_code              TYPE numc4
      RETURNING
        VALUE(rv_wohnsitz_kanton) TYPE char3 .

  PRIVATE SECTION.

ENDCLASS.

CLASS ylhind_cl_convert_values IMPLEMENTATION.

  METHOD map_wohnsitz_kanton.
    rv_wohnsitz_kanton = COND #( WHEN iv_post_code = '8085' THEN 'EX'
                                 ELSE iv_kanton_id ).
  ENDMETHOD.

ENDCLASS.


