DROP TABLE IF EXISTS devstatus_by_region;

CREATE EXTERNAL TABLE devstatus_by_region
       (dt STRING, 
        manufacturer STRING,
        dev_id STRING,
        latitude FLOAT,
        longitude FLOAT)
    PARTITIONED BY (region STRING)
    ROW FORMAT DELIMITED 
    FIELDS TERMINATED BY ','
    LOCATION '/loudacre/devstatusByRegion';

-- Impala: manually add the new partitions
ALTER TABLE devstatus_by_region ADD PARTITION (region='A');
ALTER TABLE devstatus_by_region ADD PARTITION (region='B');
ALTER TABLE devstatus_by_region ADD PARTITION (region='C');
ALTER TABLE devstatus_by_region ADD PARTITION (region='D');
ALTER TABLE devstatus_by_region ADD PARTITION (region='E');

-- Or in Hive only: add new partitions automatically by rebuilding the table
-- MSCK REPAIR TABLE devstatus_by_region;

