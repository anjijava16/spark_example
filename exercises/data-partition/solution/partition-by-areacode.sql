-- Create empty partitioned table
DROP TABLE IF EXISTS accounts_by_areacode;
CREATE EXTERNAL TABLE accounts_by_areacode (
    acct_num INT,
    first_name STRING,
    last_name STRING,
    phone_number STRING) 
  PARTITIONED BY (areacode STRING)
  ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
  LOCATION '/loudacre/accounts_by_areacode';

-- Hive only, required to allow dynamic partitioning
-- SET hive.exec.dynamic.partition.mode=nonstrict;
    
-- Insert with dynamic partitioning from existing accounts table
INSERT INTO TABLE accounts_by_areacode
  PARTITION(areacode)
  SELECT acct_num, first_name, last_name, phone_number, SUBSTR(phone_number,1,3) AS areacode FROM accounts_avro;
  