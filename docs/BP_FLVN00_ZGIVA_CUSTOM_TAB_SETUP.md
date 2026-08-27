# Configurazione BDT: folder "Z1/Z2/Z3" nel ruolo partner FLVN00

Questo documento descrive la configurazione da eseguire nel framework
**BDT (Business Data Toolset)** per rendere visibile, in transazione
**BP**, il nuovo folder di sola visualizzazione con i campi custom
`Z1`, `Z2`, `Z3` (tabella `ZGIVA`) nei Dati Generali del ruolo partner
**FLVN00 - Supplier (FI): dati fornitore a livello di societa'**.

Gli oggetti ABAP di supporto (function group, schermo, function
module) sono descritti in `src/zbup_flvn00_zgiva/README.md` e vanno
creati e attivati **prima** di eseguire questa configurazione.

## 1. Individuare il punto di innesto (BDT_ANALYZER)

Con la transazione **BDT_ANALYZER** (o navigando in BP con lo strumento
di analisi schermo attivo), individuare l'applicazione, la Screen
Sequence e la Section attualmente usate per i Dati Generali del ruolo
`FLVN00`, cosi' da sapere dove agganciare il nuovo folder senza
impattare gli altri ruoli.

## 2. Transazione BUSD (Business Data Toolset - customizing)

Percorso IMG: *Cross-Application Components → SAP Business Partner →
Business Partner → Basic Settings → Business Data Toolset*, oppure
direttamente transazione `BUSD`.

Applicazione di riferimento: **BUPA** (Business Partner).

### 2.1 Views (Sichten)

- Creare una nuova **View** (es. `ZBUP_FLVN00_ZGIVA_V`), assegnandole:
  - Function group: `ZBUP_FLVN00_ZGIVA`
  - Numero schermo: `0100`
  - Programma: `SAPLZBUP_FLVN00_ZGIVA`
- Se richiesto dal livello di customizing, assegnare alla view i
  Field Group con i campi `Z1`, `Z2`, `Z3` (utili anche per eventuali
  controlli di visualizzazione/autorizzazione futuri).

### 2.2 Sections

- Creare una nuova **Section** (es. `ZBUP_ZGIVA_SEC`) con il testo che
  comparira' come titolo del folder (es. "Z1/Z2/Z3" o una descrizione
  piu' parlante concordata con l'utente chiave, es. "Dati aggiuntivi").
- Assegnare a questa Section la View creata al punto 2.1.

### 2.3 Screen Sequence

- Individuare la **Screen Sequence** utilizzata dai Dati Generali per
  il ruolo `FLVN00` (identificata al punto 1).
- Inserire la nuova Section nella posizione desiderata della sequenza,
  cosi' che il folder compaia solo quando quel ruolo e' selezionato.
- **Non modificare** la Screen Sequence standard usata da altri ruoli:
  se necessario, copiarla in una versione Z dedicata prima di
  modificarla (pratica standard per non impattare altri processi).

### 2.4 Field Grouping (facoltativo)

- Se il folder deve comparire solo per determinate condizioni
  aggiuntive (es. categoria di partner, ulteriori ruoli attivi),
  configurare i **Field Grouping** corrispondenti sulla View/Section.
- Per il solo requisito "sola visualizzazione", il carattere
  read-only e' gia' garantito a livello di schermo (campi con Input
  disattivato in Screen Painter); il Field Grouping serve solo per
  eventuali regole di visibilita' aggiuntive.

## 3. Test funzionale

In transazione `BP`, con un utente di test:

1. Aprire un Business Partner con ruolo `FLVN00` e verificare che il
   nuovo folder compaia nella posizione attesa tra i Dati Generali.
2. Con un partner che ha un record `ZGIVA` associato: verificare che
   `Z1`, `Z2`, `Z3` mostrino correttamente i valori letti.
3. Con un partner **senza** record `ZGIVA`: verificare che i campi
   risultino vuoti e che non si verifichi alcun dump (short dump) o
   messaggio di errore.
4. Verificare che i tre campi non siano modificabili (nessun cursore
   di input, nessuna possibilita' di editare i valori).
5. Aprire un Business Partner **senza** ruolo `FLVN00` (o con un ruolo
   diverso) e verificare che il folder **non** compaia, salvo diversa
   indicazione funzionale.
6. Navigare tra due Business Partner differenti nella stessa sessione
   BP e verificare che i dati mostrati siano sempre corretti e
   coerenti con il partner effettivamente visualizzato (nessun dato
   residuo del partner precedente).

## 4. Trasporto

Includere in un'unica richiesta di trasporto (o in richieste correlate
tracciate insieme):

- la tabella `ZGIVA` (se non gia' trasportata in precedenza);
- il function group `ZBUP_FLVN00_ZGIVA` (programma, include, schermo
  `0100`, function module `Z_BUP_FLVN00_ZGIVA_GET_DATA` e
  `Z_BUP_FLVN00_ZGIVA_CHECK_DATA`);
- le voci di customizing BDT create/modificate in `BUSD` (View,
  Section, Screen Sequence, eventuali Field Grouping): essendo entry
  di tabelle di customizing, in genere non vengono registrate in
  automatico e vanno **registrate esplicitamente** nella richiesta di
  trasporto al momento del salvataggio in `BUSD`.

## 5. Riepilogo oggetti creati

| Oggetto BDT       | ID proposto             | Descrizione                                   |
|--------------------|--------------------------|------------------------------------------------|
| View               | `ZBUP_FLVN00_ZGIVA_V`   | Lega function group/schermo 0100 alla vista    |
| Section            | `ZBUP_ZGIVA_SEC`        | Contenitore/folder mostrato in BP              |
| Screen Sequence    | (quella del ruolo FLVN00, eventualmente copiata in versione Z) | Determina dove/quando compare il folder |

Aggiornare questa tabella con gli ID tecnici effettivamente assegnati
dal sistema al termine della configurazione, per facilitare la
manutenzione futura.
