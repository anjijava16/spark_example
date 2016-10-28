DROP TABLE IF EXISTS accounts_parquet;

-- Impala
CREATE EXTERNAL TABLE accounts_parquet 
  STORED AS PARQUET
  LOCATION '/loudacre/accounts_parquet/'   
    AS SELECT * FROM accounts_avro;
 
 -- Hive   
 -- NOTE: Hive does not support Create Table as Select with external tables
CREATE TABLE accounts_parquet 
  STORED AS PARQUET
  LOCATION '/loudacre/accounts_parquet/'   
    AS SELECT * FROM accounts_avro;
-- change table to external
ALTER TABLE accounts_parquet SET TBLPROPERTIES('EXTERNAL'='TRUE');
