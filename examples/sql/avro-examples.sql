CREATE TABLE order_details_avro 
  STORED AS AVRO 
  TBLPROPERTIES ('avro.schema.url'=
    'hdfs://localhost/loudacre/accounts_schema.json');


CREATE TABLE order_details_avro
  STORED AS AVRO
  TBLPROPERTIES ('avro.schema.literal'=
    '{"name": "order",
      "type": "record",
      "fields": [
          {"name":"order_id", "type":"int"},
          {"name":"cust_id", "type":"int"},
          {"name":"order_date", "type":"string"}
        ]}');

