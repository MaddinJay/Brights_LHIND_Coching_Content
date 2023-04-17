CLASS zcl_mj_hello_world DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS hello_world RETURNING VALUE(rv_result) TYPE string.

ENDCLASS.

CLASS zcl_mj_hello_world IMPLEMENTATION.

  METHOD hello_world.
    rv_result = 'Hello, World!'.
  ENDMETHOD.

ENDCLASS.
