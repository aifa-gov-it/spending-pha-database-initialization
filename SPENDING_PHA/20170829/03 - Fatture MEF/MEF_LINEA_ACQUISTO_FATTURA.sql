CREATE TABLE SPENDING_PHA.MEF_LINEA_ACQUISTO_FATTURA
(
  ID                           VARCHAR2(255 CHAR) NOT NULL,
  IMPORT_DATE                  TIMESTAMP(6),
  ADMINISTRATIVE_REFERENCE     VARCHAR2(255 CHAR),
  DOCUMENT_ID                  VARCHAR2(255 CHAR),
  ITEM_CODE                    VARCHAR2(255 CHAR),
  ITEM_CODE_TYPE               VARCHAR2(255 CHAR),
  ITEM_DESCRIPTION             CLOB,
  KIND                         VARCHAR2(255 CHAR),
  OTHER_MGMT_DATA_DATA_TYPE    VARCHAR2(255 CHAR),
  OTHER_MGMT_DATA_DATE         DATE,
  OTHER_MGMT_DATA_REF_NUMBER   NUMBER(19,2),
  OTHER_MGMT_DATA_REF_TEXT     VARCHAR2(255 CHAR),
  PERIOD_END_DATE              DATE,
  PERIOD_START_DATE            DATE,
  QUANTITY                     NUMBER(19,2),
  RITENUTA                     VARCHAR2(255 CHAR),
  SCONTO_MAGG_AMOUNT           NUMBER(19,2),
  SCONTO_MAGG_PERCENTAGE       NUMBER(19,2),
  SCONTO_MAGG_TYPE             VARCHAR2(255 CHAR),
  TAX_RATE                     NUMBER(19,2),
  TIPO_CESSAZIONE_PRESTAZIONE  VARCHAR2(255 CHAR),
  TOTAL_PRICE                  NUMBER(19,2),
  UNIT_OF_MEASURE_DESCRIPTION  VARCHAR2(255 CHAR),
  UNIT_PRICE                   NUMBER(19,2),
  INVOICE_ID                   VARCHAR2(255 CHAR)
);


CREATE UNIQUE INDEX SPENDING_PHA.PURCHASE_LINEPK ON SPENDING_PHA.MEF_LINEA_ACQUISTO_FATTURA
(ID);

ALTER TABLE SPENDING_PHA.MEF_LINEA_ACQUISTO_FATTURA ADD (
  CONSTRAINT PURCHASE_LINEPK
  PRIMARY KEY
  (ID)
  USING INDEX SPENDING_PHA.PURCHASE_LINEPK
  ENABLE VALIDATE);

ALTER TABLE SPENDING_PHA.MEF_LINEA_ACQUISTO_FATTURA ADD (
  CONSTRAINT FKHNS01UTTNAWTFHLDAI1OWNGM 
  FOREIGN KEY (INVOICE_ID) 
  REFERENCES SPENDING_PHA.MEF_FATTURA (ID)
  ENABLE VALIDATE);