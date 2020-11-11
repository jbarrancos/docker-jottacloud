# Docker container for Jottacloud sync

Used to backup to jottacloud from for ex. qnap nas.

Example run:

```
docker run -d -v /share/Multimedia:/backup/multimedia \
-v /share/folder2:/backup/folder2 \
-v /share/JottaCloud/jottad:/var/lib/jottad
-e JOTTA_NAME=qnap \
-e JOTTA_SCAN=1h \
-e JOTTA_TOKEN="ONETIMELOGINTOKEN"
-p 14443:14443 jottacloud:latest
```

The JOTTA_TOKEN needs to be only set the first time as it is a one-time login token. Jottad (daemon) will store credentials in /var/lib/jottad.
