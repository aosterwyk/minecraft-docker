#!/bin/sh
# java -Xmx3G -Xms2G -jar ./fabric-server-mc.jar nogui

if [ -z $SERVERJAR ]
then
    SERVERJARFILENAME="server.jar"
    echo "No custom server jar set. Using server.jar."
else
    SERVERJARFILENAME=$SERVERJAR
    echo "Custom jar set. Using $SERVERJARFILENAME."
fi

echo "Running /opt/minecraft/$SERVERJARFILENAME"

java -Xmx3G -Xms3G -jar /opt/minecraft/server.jar nogui
