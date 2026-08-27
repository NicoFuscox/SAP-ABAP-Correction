*&---------------------------------------------------------------------*
*&  Programma principale del gruppo di funzioni ZBUP_FLVN00_ZGIVA
*&---------------------------------------------------------------------*
*& Function group creato per ospitare il folder custom "Z1/Z2/Z3"
*& (dati da tabella ZGIVA) nei Dati Generali del ruolo partner FLVN00
*& della transazione BP (framework BDT - Business Data Toolset).
*&
*& Include:
*&   LZBUP_FLVN00_ZGIVATOP   - dati globali
*&   LZBUP_FLVN00_ZGIVAO01   - moduli PBO (schermo 0100)
*&   LZBUP_FLVN00_ZGIVAI01   - moduli PAI (schermo 0100)
*&
*& Lo schermo 0100 (subscreen) e la relativa flow logic sono descritti
*& nel file SCREEN_0100_FLOW_LOGIC.txt: la creazione dello schermo va
*& infine eseguita in SE51 (Screen Painter) all'interno di questo
*& function group, perche' il layout grafico non e' rappresentabile
*& come sorgente ABAP testuale.
*&---------------------------------------------------------------------*
FUNCTION-POOL zbup_flvn00_zgiva.

INCLUDE lzbup_flvn00_zgivatop.               " Dati globali
INCLUDE lzbup_flvn00_zgivao01.               " Moduli PBO (schermo 0100)
INCLUDE lzbup_flvn00_zgivai01.               " Moduli PAI (schermo 0100)
