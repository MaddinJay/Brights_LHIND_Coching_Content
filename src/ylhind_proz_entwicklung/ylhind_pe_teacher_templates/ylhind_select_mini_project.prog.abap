*&---------------------------------------------------------------------*
*& Report ylhind_select_mini_project
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ylhind_select_mini_project.

TYPES: BEGIN OF ts_help,
         carrid         TYPE s_carr_id,
         distid         TYPE s_distid,
         total_emission TYPE f,
         total_distance TYPE f,
       END OF ts_help,
       tt_help TYPE STANDARD TABLE OF ts_help WITH DEFAULT KEY.

TYPES: BEGIN OF ls_join,
         carrier        TYPE s_carr_id,
         total_emission TYPE dec12_2,
       END OF ls_join.

DATA: gt_ergebnis TYPE TABLE OF ls_join,
      ls_ergebnis TYPE ls_join,
      gt_help     TYPE tt_help.

DATA(go_distance_converter) = NEW ylhind_cl_umrechnung_distance( ).

" Selektiere relevante Daten für Anzeige und KM/MI Konvertierung
SELECT
        sflight~carrid,
        spfli~distid,
        SUM( zco2emis3~emis ) AS total_emission,
        SUM( spfli~distance ) AS total_distance
INTO TABLE @gt_help

FROM sflight
INNER JOIN spfli     ON ( sflight~connid = spfli~connid
                     AND  sflight~carrid = spfli~carrid )
INNER JOIN zco2emis3 ON ( sflight~planetype = zco2emis3~planetype )
GROUP BY sflight~carrid,
         spfli~distid.

" Anzeige Daten
cl_demo_output=>display_data( gt_help ).

" Aufbau Ergebnistabelle mit integrierter MI/KM Konvertierung
gt_ergebnis = VALUE #(
                FOR <line> IN gt_help:
                 ( carrier        = <line>-carrid
                   total_emission = CONV #( SWITCH #( <line>-distid
                                            WHEN 'KM' THEN <line>-total_distance                                            * <line>-total_emission
                                            WHEN 'MI' THEN go_distance_converter->convert_miles2km( <line>-total_distance ) * <line>-total_emission ) ) ) ).

" Anzeige Daten
cl_demo_output=>display_data( gt_ergebnis ).
