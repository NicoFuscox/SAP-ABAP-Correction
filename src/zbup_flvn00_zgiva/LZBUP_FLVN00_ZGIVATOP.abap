*&---------------------------------------------------------------------*
*&  Include           LZBUP_FLVN00_ZGIVATOP
*&  Function group    ZBUP_FLVN00_ZGIVA
*&  Descrizione       Dati globali per il folder custom "Z1/Z2/Z3"
*&                     (tabella ZGIVA) inserito nei Dati Generali del
*&                     ruolo partner FLVN00 - Supplier (FI): dati
*&                     fornitore a livello di societa'.
*&
*&  Nota tecnica: BUT000 e' l'area di lavoro globale che il framework
*&  BDT tiene sincronizzata con il Business Partner correntemente
*&  visualizzato/elaborato in transazione BP; e' quindi disponibile in
*&  tutte le schermate "Dati Generali", incluse quelle custom come
*&  questa (vedi BUT000-PARTNER usato nel modulo PBO).
*&---------------------------------------------------------------------*
TABLES: but000.

* Area di lavoro con il record custom letto da ZGIVA (sola lettura,
* nessun campo modificabile sullo schermo 0100).
DATA: gs_zgiva TYPE zgiva.

* Indica se per il Business Partner corrente esiste un record ZGIVA.
DATA: gv_zgiva_found TYPE abap_bool.
