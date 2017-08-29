CREATE TABLE SPENDING_PHA.BATCH_STEP_EXECUTION
(
  STEP_EXECUTION_ID   NUMBER(19)                NOT NULL,
  VERSION             NUMBER(19)                NOT NULL,
  STEP_NAME           VARCHAR2(100 BYTE)        NOT NULL,
  JOB_EXECUTION_ID    NUMBER(19)                NOT NULL,
  START_TIME          TIMESTAMP(6)              NOT NULL,
  END_TIME            TIMESTAMP(6),
  STATUS              VARCHAR2(10 BYTE),
  COMMIT_COUNT        NUMBER(19),
  READ_COUNT          NUMBER(19),
  FILTER_COUNT        NUMBER(19),
  WRITE_COUNT         NUMBER(19),
  READ_SKIP_COUNT     NUMBER(19),
  WRITE_SKIP_COUNT    NUMBER(19),
  PROCESS_SKIP_COUNT  NUMBER(19),
  ROLLBACK_COUNT      NUMBER(19),
  EXIT_CODE           VARCHAR2(2500 BYTE),
  EXIT_MESSAGE        VARCHAR2(2500 BYTE),
  LAST_UPDATED        TIMESTAMP(6)
);


CREATE UNIQUE INDEX SPENDING_PHA.SYS_C00250437 ON SPENDING_PHA.BATCH_STEP_EXECUTION
(STEP_EXECUTION_ID);

ALTER TABLE SPENDING_PHA.BATCH_STEP_EXECUTION ADD (
  CONSTRAINT SYS_C00250437
  PRIMARY KEY
  (STEP_EXECUTION_ID)
  USING INDEX
  ENABLE VALIDATE);

ALTER TABLE SPENDING_PHA.BATCH_STEP_EXECUTION ADD (
  CONSTRAINT JOB_EXEC_STEP_FK 
  FOREIGN KEY (JOB_EXECUTION_ID) 
  REFERENCES SPENDING_PHA.BATCH_JOB_EXECUTION (JOB_EXECUTION_ID)
  ENABLE VALIDATE);