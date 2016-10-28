-- Bonus: Define a table for an Avro dataset written from Spark SQL

DROP TABLE IF EXISTS webpage_files_avro;

CREATE EXTERNAL TABLE webpage_files_avro (
      page_id SMALLINT,
      associated_file STRING)
  STORED AS AVRO 
  LOCATION '/loudacre/webpage_files_avro';