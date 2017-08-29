CREATE TABLE SPENDING_PHA.MEF_DOC_CORR_LINEA_ACQUISTO
(
  DOCUMENTO_CORRELATO_ID  VARCHAR2(255 CHAR)    NOT NULL,
  PURCHASE_LINE_ID        VARCHAR2(255 CHAR)    NOT NULL
);


CREATE UNIQUE INDEX SPENDING_PHA.SYS_C00250402 ON SPENDING_PHA.MEF_DOC_CORR_LINEA_ACQUISTO
(DOCUMENTO_CORRELATO_ID, PURCHASE_LINE_ID);

ALTER TABLE SPENDING_PHA.MEF_DOC_CORR_LINEA_ACQUISTO ADD (
  CONSTRAINT SYS_C00250402
  PRIMARY KEY
  (DOCUMENTO_CORRELATO_ID, PURCHASE_LINE_ID)
  USING INDEX
  ENABLE VALIDATE);

ALTER TABLE SPENDING_PHA.MEF_DOC_CORR_LINEA_ACQUISTO ADD (
  CONSTRAINT FKL5SJTHRPI9N2L6FJVYKJ5W704 
  FOREIGN KEY (PURCHASE_LINE_ID) 
  REFERENCES SPENDING_PHA.MEF_LINEA_ACQUISTO_FATTURA (ID)
  ENABLE VALIDATE,
  CONSTRAINT FKQRW1R3M1GOBXCWYF9N773083Q 
  FOREIGN KEY (DOCUMENTO_CORRELATO_ID) 
  REFERENCES SPENDING_PHA.MEF_DOC_CORRELATO_FATTURA (ID)
  ENABLE VALIDATE);