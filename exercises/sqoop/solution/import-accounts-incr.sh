$DEV1/exercises/sqoop/add_new_accounts.py

sqoop import \
 --connect jdbc:mysql://localhost/loudacre \
 --username training --password training \
 --incremental append \
 --null-non-string '\\N' \
 --table accounts \
 --target-dir /loudacre/accounts \
 --check-column acct_num \
 --last-value 129764
