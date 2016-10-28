DROP TABLE IF EXISTS accounts_avro;
CREATE EXTERNAL TABLE accounts_avro 
STORED AS AVRO 
LOCATION '/loudacre/accounts_avro'
TBLPROPERTIES ('avro.schema.url'= '/loudacre/accounts.avsc');
