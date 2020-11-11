#!/bin/bash

echo Starting jottad deamon
jottad &
sleep 5s

echo Loging in with Token
expect <<- DONE
    spawn jotta-cli login
    expect "accept license ("
    send "yes\r"
    expect "Personal login token:"
    send "$JOTTA_TOKEN\r"
    expect "Devicename"
    send "$JOTTA_NAME\r"
    expect "Keep on going"
DONE

echo Setting up backups
for D in `ls -d /backup/*/`
do
    jotta-cli add "$D"
done

echo Setting scan interval
jotta-cli config set scaninterval $JOTTA_SCAN
echo "Done"
jotta-cli tail
echo End
