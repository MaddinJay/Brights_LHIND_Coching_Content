CLASS zlht_select_statements DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: tt_flights TYPE STANDARD TABLE OF sflight WITH DEFAULT KEY.

    TYPES: BEGIN OF ts_fields,
             carrid TYPE sflight-carrid,
             connid TYPE sflight-connid,
             fldate TYPE sflight-fldate,
             price  TYPE sflight-price,
           END OF ts_fields.
    TYPES tt_fields TYPE STANDARD TABLE OF ts_fields WITH DEFAULT KEY.

    METHODS select_full_table           RETURNING VALUE(rt_result) TYPE tt_flights.
    METHODS select_single_entry         RETURNING VALUE(rs_result) TYPE sflight.
    METHODS select_fields               RETURNING VALUE(rs_result) TYPE ts_fields.
    METHODS select_inline_declaration   RETURNING VALUE(rs_result) TYPE ts_fields.
    METHODS select_order_by             RETURNING VALUE(rt_result) TYPE tt_flights.
    METHODS select_up_to_5_rows         RETURNING VALUE(rt_result) TYPE tt_flights.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zlht_select_statements IMPLEMENTATION.

  METHOD select_full_table.
    " Liest die volle Tabelle, mit kompletter Spaltenanzahl und allen Einträgen in der DB
    SELECT * FROM sflight INTO TABLE @rt_result.
  ENDMETHOD.

  METHOD select_single_entry.
    " Liest einen Satz mit CARRID = 'AA'. Rückgabe der DB ist random. Wenn Select wiederholt ausgeführt wird, werden
    " unterschiedliche Datensätze zu 'AA' ausgegeben
    SELECT SINGLE * FROM sflight INTO @rs_result WHERE carrid = 'AA'.
  ENDMETHOD.


  METHOD select_fields.
    " Liest Satz zu WHERE-Bedingung mapped die Felder mit gleichen Namen von DBtab in die Ziel-Stuktur
    SELECT SINGLE *
      FROM sflight
      INTO CORRESPONDING FIELDS OF @rs_result
      WHERE carrid = 'AA'
      AND   connid = '0017'
      AND   fldate = '20220719'.
  ENDMETHOD.

  METHOD select_inline_declaration.
    " Liest gegebene Felder aus DBtab in Zielstruktur, welche dynamisch aufgebaut wird (keine explizite Deklaration notwendig)
    SELECT SINGLE
      carrid,
      connid,
      fldate,
      price
      FROM sflight
      INTO @DATA(ls_flights_short)
      WHERE carrid = 'AA'
      AND   connid = '0017'.

    rs_result = ls_flights_short. " Zuordnung funktioniert, weil Strukturen gleich augebaut sind
  ENDMETHOD.

  METHOD select_order_by.
    SELECT * FROM sflight
      INTO TABLE rt_result
      WHERE carrid = 'AA'
      ORDER BY fldate ASCENDING. " Default = ASCENDING
  ENDMETHOD.

  METHOD select_up_to_5_rows.
     SELECT * FROM sflight
     INTO TABLE @rt_result
     UP TO 5 ROWS.
  ENDMETHOD.

ENDCLASS.
