# Docker container for Jottacloud sync

Used to backup to jottacloud from for ex. qnap nas.

Example run:

```
docker run -d -v /share/Multimedia:/backup/multimedia \
-v /share/folder2:/backup/folder2 \
-e JOTTA_NAME=qnap \
-e JOTTA_SCAN=1h \
-e JOTTA_TOKEN="ONETIMELOGINTOKEN"
-p 14443:14443 jottacloud:latest
```

After each cycle the JOTTA_TOKEN needs to be updated as it is a one-time login token. Jottad (daemon) doesn't store the credentials apperantly.
