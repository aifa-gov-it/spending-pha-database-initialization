CREATE TABLE SPENDING_PHA.BATCH_JOB_INSTANCE
(
  JOB_INSTANCE_ID  NUMBER(19)                   NOT NULL,
  VERSION          NUMBER(19),
  JOB_NAME         VARCHAR2(100 BYTE)           NOT NULL,
  JOB_KEY          VARCHAR2(32 BYTE)            NOT NULL
);


CREATE UNIQUE INDEX SPENDING_PHA.JOB_INST_UN ON SPENDING_PHA.BATCH_JOB_INSTANCE
(JOB_NAME, JOB_KEY);

CREATE UNIQUE INDEX SPENDING_PHA.SYS_C00250420 ON SPENDING_PHA.BATCH_JOB_INSTANCE
(JOB_INSTANCE_ID);

ALTER TABLE SPENDING_PHA.BATCH_JOB_INSTANCE ADD (
  CONSTRAINT SYS_C00250420
  PRIMARY KEY
  (JOB_INSTANCE_ID)
  USING INDEX
  ENABLE VALIDATE,
  CONSTRAINT JOB_INST_UN
  UNIQUE (JOB_NAME, JOB_KEY)
  USING INDEX SPENDING_PHA.JOB_INST_UN
  ENABLE VALIDATE);