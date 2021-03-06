CREATE TABLE SPENDING_PHA.MEF_DATI_PAGAMENTO_FATTURA
(
  ID                            VARCHAR2(255 CHAR)     NOT NULL,
  IMPORT_DATE                   TIMESTAMP(6),
  BENEFICIARIO_PAG              VARCHAR2(255 CHAR),
  CF_QUIETANZANTE_PAG           VARCHAR2(255 CHAR),
  COD_UFFICIO_POSTALE_PAG       VARCHAR2(255 CHAR),
  CODICE_PAG                    VARCHAR2(255 CHAR),
  COGNOME_QUIETANZANTE_PAG      VARCHAR2(255 CHAR),
  DATA_DECORRENZA_PENALE_PAG    DATE,
  DATA_LIMITE_PAG_ANTICIPATO    DATE,
  DATA_RIFERIMENTO_TERMINI_PAG  DATE,
  NOME_QUIETANZANTE_PAG         VARCHAR2(255 CHAR),
  PAYMENT_AMOUNT                NUMBER(19,2)     NOT NULL,
  PAYMENT_CONDITIONS            VARCHAR2(255 CHAR),
  PAYMENT_EXPIRATION_DATE       DATE,
  PAYMENT_MODE                  VARCHAR2(255 CHAR),
  PAYMENT_TERM_DAYS             NUMBER(10),
  PENALITA_PAGAMENTI_RITARDATI  NUMBER(19,2),
  SCONTO_PAG_ANTICIPATO_PAG     NUMBER(19,2),
  TITOLO_QUIETANZANTE_PAG       VARCHAR2(255 CHAR),
  INVOICE_ID                    VARCHAR2(255 CHAR)
);

CREATE UNIQUE INDEX SPENDING_PHA.DATI_PAGAMENTO_FATTURA_PK ON SPENDING_PHA.MEF_DATI_PAGAMENTO_FATTURA
(ID);

ALTER TABLE SPENDING_PHA.MEF_DATI_PAGAMENTO_FATTURA ADD (
  CONSTRAINT DATI_PAGAMENTO_FATTURA_PK
  PRIMARY KEY
  (ID)
  USING INDEX SPENDING_PHA.DATI_PAGAMENTO_FATTURA_PK
  ENABLE VALIDATE);

ALTER TABLE SPENDING_PHA.MEF_DATI_PAGAMENTO_FATTURA ADD (
  CONSTRAINT FKAPETYEV9J9MLNDTDPJY0MHEVM
  FOREIGN KEY (INVOICE_ID)
  REFERENCES SPENDING_PHA.MEF_FATTURA (ID)
  ENABLE VALIDATE);
