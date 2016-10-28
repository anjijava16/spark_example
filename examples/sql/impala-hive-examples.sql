-- Database commands

CREATE DATABASE loudacre; 
CREATE DATABASE IF NOT EXISTS loudacre;
DROP DATABASE loudacre; 
DROP DATABASE IF EXISTS loudacre;
-- Hive only
DROP DATABASE loudacre CASCADE;

-- Table commands

CREATE TABLE jobs (
    id INT, 
    title STRING, 
    salary INT, 
    posted TIMESTAMP
  )
  ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ',';

CREATE TABLE jobs_archived LIKE jobs;

CREATE TABLE ny_customers AS  SELECT cust_id, fname, lname 
  FROM customers  WHERE state = 'NY';


CREATE TABLE jobs (
    id INT, 
    title STRING, 
    salary INT, 
    posted TIMESTAMP
  )
  ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY ','
  LOCATION '/loudacre/jobs';


CREATE EXTERNAL TABLE adclicks
  ( campaign_id STRING,
    click_time TIMESTAMP,
    keyword STRING, 
    site STRING,
    placement STRING,
    was_clicked BOOLEAN,
    cost SMALLINT)
  LOCATION '/loudacre/ad_data';


SHOW TABLES;

DESCRIBE jobs;

DESCRIBE FORMATTED jobs;

SHOW CREATE jobs;

-- Load table commands

LOAD DATA INPATH '/tmp/sales.txt'    INTO TABLE sales;

LOAD DATA INPATH '/tmp/sales.txt'
  OVERWRITE INTO TABLE sales;

INSERT INTO TABLE accounts_copy 
  SELECT * FROM accounts;

INSERT INTO TABLE loyal_customers
  SELECT * FROM accounts 
  WHERE YEAR(acct_create_dt) = 2008 
    AND acct_close_dt IS NULL;

INSERT OVERWRITE TABLE ny_customers 
  SELECT * FROM customers 
  WHERE state = 'NY';

INSERT INTO TABLE ny_customers 
  SELECT * FROM customers 
  WHERE state = 'NJ' OR state = 'CT';


