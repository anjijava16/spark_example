sqoop import \
  --connect jdbc:mysql://localhost/loudacre \
  --username training --password training \
  --table webpage \
  --target-dir /loudacre/webpage \
  --fields-terminated-by "\t"
