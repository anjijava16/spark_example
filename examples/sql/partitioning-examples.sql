CREATE EXTERNAL TABLE accounts(
    cust_id INT,
    fname STRING,
    lname STRING,
    address STRING,
    city STRING,
    state STRING,
    zipcode STRING) 
  PARTITIONED BY (state STRING)
  ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
  LOCATION '/loudacre/accounts';

CREATE EXTERNAL TABLE accounts_by_state(
    cust_id INT,
    fname STRING,
    lname STRING,
    address STRING,
    city STRING,
    state STRING,
    zipcode STRING) 
  PARTITIONED BY (state STRING)
  ROW FORMAT DELIMITED
  FIELDS TERMINATED BY ','
  LOCATION '/loudacre/accounts_by_state';

INSERT OVERWRITE TABLE accounts_by_state
   PARTITION(state)
    SELECT cust_id, fname, lname, address,     city, zipcode, state 
      FROM accounts;

CREATE TABLE call_logs (    call_time STRING,
    phone STRING,    event_type STRING,    details STRING)  PARTITIONED BY (call_date STRING)  ROW FORMAT DELIMITED   FIELDS TERMINATED BY ',';

ALTER TABLE call_logs   ADD PARTITION (call_date='2014-10-01');

LOAD DATA INPATH 'call-20141001.log'  INTO TABLE call_logs  PARTITION(call_date='2014-10-01');

LOAD DATA INPATH 'call-20141001.log'  INTO TABLE call_logs OVERWRITE  PARTITION(call_date='2014-10-01');

SHOW PARTITIONS call_logs;

ALTER TABLE call_logs 
   ADD PARTITION (call_date='2013-06-05') 
   LOCATION '/loudacre/call_logs/call_date=2013-06-05';


ALTER TABLE call_logs 
   DROP PARTITION (call_date='2013-06-06');


