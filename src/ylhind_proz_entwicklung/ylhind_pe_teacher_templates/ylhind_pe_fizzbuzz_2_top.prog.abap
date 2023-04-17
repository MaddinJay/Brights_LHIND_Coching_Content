*&---------------------------------------------------------------------*
*& Include ylhind_pe_fizzbuzz_2_top
*&---------------------------------------------------------------------*
TYPES: BEGIN OF ts_result,
         user_input  TYPE ylhind_user_input,
         conv_result TYPE ylhind_conv_result,
       END OF ts_result.

DATA lt_result TYPE STANDARD TABLE OF ts_result WITH DEFAULT KEY.
DATA lo_fizzbuzz TYPE REF TO ylhind_cl_pe_fizzbuzz_2.
