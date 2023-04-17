CLASS zcl_mj_itab_basics DEFINITION PUBLIC CREATE PUBLIC.
  PUBLIC SECTION.
    TYPES group TYPE c LENGTH 1.
    TYPES: BEGIN OF initial_type,
             group       TYPE group,
             number      TYPE i,
             description TYPE string,
           END OF initial_type,
           itab_data_type TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

    METHODS fill_itab RETURNING VALUE(rt_itab) TYPE itab_data_type.

ENDCLASS.

CLASS zcl_mj_itab_basics IMPLEMENTATION.

  METHOD fill_itab.
    APPEND: VALUE initial_type( group = 'A' number = 10  description = 'Group A-2' ) TO rt_itab,
            VALUE initial_type( group = 'B' number = 5   description = 'Group B' )   TO rt_itab,
            VALUE initial_type( group = 'A' number = 6   description = 'Group A-1' ) TO rt_itab,
            VALUE initial_type( group = 'C' number = 22  description = 'Group C-1' ) TO rt_itab,
            VALUE initial_type( group = 'A' number = 13  description = 'Group A-3' ) TO rt_itab,
            VALUE initial_type( group = 'C' number = 500 description = 'Group C-2' ) TO rt_itab.
  ENDMETHOD.

ENDCLASS.
