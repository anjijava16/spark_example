DROP TABLE IF EXISTS webpage;

CREATE EXTERNAL TABLE webpage 
   (page_id SMALLINT, 
    name STRING,
    assoc_files STRING)
   ROW FORMAT DELIMITED 
      FIELDS TERMINATED BY '\t'
      LOCATION '/loudacre/webpage';
