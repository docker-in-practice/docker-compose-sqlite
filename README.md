docker-compose-sqlite
=====================

A Docker Compose example.
It uses socat to create a sqlite server accessible on localhost:12346.

Example run:

```
./setup_dbs.sh
[sudo] docker-compose up
[rlwrap] telnet localhost 12346
[another terminal]
[rlwrap] telnet localhost 12346
select * from t1;
```


