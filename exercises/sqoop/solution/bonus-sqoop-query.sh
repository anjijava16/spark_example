#!/bin/bash

# Using a custom query
sqoop import \
--connect jdbc:mysql://localhost/loudacre \
--username training --password training \
--table accounts \
--target-dir /loudacre/account-active-ca \
--where 'state = "CA" and acct_close_dt IS NULL'
