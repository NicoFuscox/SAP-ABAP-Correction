# Function group ZBUP_FLVN00_ZGIVA

Oggetti custom per il nuovo folder di sola visualizzazione **"Z1/Z2/Z3"**
nei Dati Generali del ruolo partner **FLVN00 - Supplier (FI): dati
fornitore a livello di societa'**, transazione **BP** (framework BDT -
Business Data Toolset).

## Prerequisito: tabella ZGIVA

Il folder presuppone che la tabella custom `ZGIVA` esista gia' con:

- chiave `PARTNER` di tipo `BU_PARTNER` (coerente con `BUT000-PARTNER`),
  cosi' che ogni record sia univocamente collegato a un Business Partner;
- i campi `Z1`, `Z2`, `Z3` con elementi dati/domini coerenti con il dato
  da visualizzare.

Verificare la struttura in SE11 prima di procedere con l'installazione
degli oggetti seguenti.

## Oggetti contenuti in questa cartella

| Oggetto                              | Tipo                    | File                              |
|---------------------------------------|-------------------------|------------------------------------|
| `ZBUP_FLVN00_ZGIVA`                    | Function group           | `SAPLZBUP_FLVN00_ZGIVA.abap`       |
| Dati globali                           | Include TOP              | `LZBUP_FLVN00_ZGIVATOP.abap`       |
| Moduli PBO                             | Include                  | `LZBUP_FLVN00_ZGIVAO01.abap`       |
| Moduli PAI                             | Include                  | `LZBUP_FLVN00_ZGIVAI01.abap`       |
| Schermo `0100` (subscreen)             | Flow logic + layout      | `SCREEN_0100_FLOW_LOGIC.txt`       |
| `Z_BUP_FLVN00_ZGIVA_GET_DATA`          | Function module          | `Z_BUP_FLVN00_ZGIVA_GET_DATA.abap` |
| `Z_BUP_FLVN00_ZGIVA_CHECK_DATA`        | Function module (stub)   | `Z_BUP_FLVN00_ZGIVA_CHECK_DATA.abap` |

## Installazione in SAP (SE80/SE37/SE51)

1. Creare il gruppo di funzioni `ZBUP_FLVN00_ZGIVA` (SE80) e incollarne
   il programma principale da `SAPLZBUP_FLVN00_ZGIVA.abap`.
2. Creare i tre include (`...TOP`, `...O01`, `...I01`) con il rispettivo
   contenuto e includerli nel programma principale (gia' referenziati).
3. Creare lo schermo `0100` come **subscreen** nello stesso function
   group (SE51): inserire la Flow Logic e ricreare il layout come
   descritto in `SCREEN_0100_FLOW_LOGIC.txt`, impostando i tre campi
   come non modificabili.
4. Creare i function module `Z_BUP_FLVN00_ZGIVA_GET_DATA` e
   `Z_BUP_FLVN00_ZGIVA_CHECK_DATA` nello stesso function group,
   copiandone interfaccia e corpo dai rispettivi file.
5. Attivare tutti gli oggetti.
6. Proseguire con la configurazione BDT descritta in
   `docs/BP_FLVN00_ZGIVA_CUSTOM_TAB_SETUP.md` per rendere visibile il
   folder in transazione BP per il ruolo FLVN00.

## Note

- Il folder e' **esclusivamente in visualizzazione**: nessun dato viene
  scritto su `ZGIVA` da questa vista.
- Il modulo PBO rilegge sempre il record ZGIVA ad ogni passaggio,
  evitando di mostrare dati residui di un Business Partner
  precedentemente visualizzato nella stessa sessione.
