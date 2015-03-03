docker-compose-sqlite
=====================

A Docker Compose example.
It uses socat to create a sqlite server accessible on localhost:12346.

Run:

```
./setup_dbs.sh
docker-compose up
telnet localhost 12346
[another terminal]
telnet localhost 12346
select * from t1;
```


