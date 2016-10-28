DROP TABLE IF EXISTS accounts_parquet;

CREATE EXTERNAL TABLE accounts_parquet 
      STORED AS PARQUET
      LOCATION '/loudacre/accounts_parquet/'   
      AS SELECT *
      FROM accounts_avro;