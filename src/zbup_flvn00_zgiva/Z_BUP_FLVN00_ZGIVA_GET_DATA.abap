FUNCTION z_bup_flvn00_zgiva_get_data.
*"----------------------------------------------------------------------
*"*"Interfaccia locale:
*"  IMPORTING
*"     REFERENCE(IV_PARTNER) TYPE  BU_PARTNER
*"  EXPORTING
*"     REFERENCE(ES_ZGIVA) TYPE  ZGIVA
*"     REFERENCE(EV_FOUND) TYPE  ABAP_BOOL
*"----------------------------------------------------------------------
*& Function group    ZBUP_FLVN00_ZGIVA
*& Descrizione       Legge il record ZGIVA (campi custom Z1, Z2, Z3)
*&                   corrispondente al Business Partner passato in
*&                   ingresso. Funzione di sola lettura, richiamata dal
*&                   modulo PBO GET_DATA_0100.
*&
*& Nota: se il sistema, generando il modulo funzione dalla vista BDT
*& in transazione BUSD, propone un'interfaccia standard diversa
*& (es. basata su CENTRAL_DATA), adattare i nomi dei parametri
*& mantenendo la logica di lettura sottostante.
*&---------------------------------------------------------------------*

  CLEAR: es_zgiva, ev_found.

  CHECK iv_partner IS NOT INITIAL.

  SELECT SINGLE z1 z2 z3
    FROM zgiva
    INTO (es_zgiva-z1, es_zgiva-z2, es_zgiva-z3)
    WHERE partner = iv_partner.

  IF sy-subrc = 0.
    ev_found = abap_true.
  ENDIF.

ENDFUNCTION.
