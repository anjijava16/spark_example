CREATE TABLE order_details_parquet (
    order_id INT,
    prod_id INT)
  STORED AS PARQUET;

CREATE EXTERNAL TABLE ad_data
  LIKE PARQUET '/loudacre/ad_data/datafile1.parquet'
  STORED AS PARQUET
  LOCATION '/loudacre/ad_data/';
