*&---------------------------------------------------------------------*
*&  Include           LZBUP_FLVN00_ZGIVAO01
*&  Function group    ZBUP_FLVN00_ZGIVA
*&  Descrizione       Moduli PBO (Process Before Output) dello
*&                     schermo 0100 - folder custom "Z1/Z2/Z3".
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      Module  STATUS_0100  OUTPUT
*&---------------------------------------------------------------------*
* GUI status, titolo e pulsanti sono gestiti centralmente dalla
* transazione BP: nessuna impostazione aggiuntiva richiesta qui.
*&---------------------------------------------------------------------*
MODULE status_0100 OUTPUT.
ENDMODULE.

*&---------------------------------------------------------------------*
*&      Module  GET_DATA_0100  OUTPUT
*&---------------------------------------------------------------------*
* Legge, ad ogni PBO, il record ZGIVA del Business Partner corrente
* (BUT000-PARTNER, tenuto sincronizzato dal framework BDT) e valorizza
* i campi schermo (Z1, Z2, Z3, tutti in sola visualizzazione).
*
* Il CLEAR seguito dalla rilettura ad ogni passaggio evita di mostrare
* dati residui ("ghost data") di un Business Partner precedentemente
* visualizzato nella stessa sessione.
*&---------------------------------------------------------------------*
MODULE get_data_0100 OUTPUT.

  CLEAR: gs_zgiva, gv_zgiva_found.

  CALL FUNCTION 'Z_BUP_FLVN00_ZGIVA_GET_DATA'
    EXPORTING
      iv_partner = but000-partner
    IMPORTING
      es_zgiva   = gs_zgiva
      ev_found   = gv_zgiva_found.

ENDMODULE.
