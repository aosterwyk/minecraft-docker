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

if [ -z $SERVERMEMORY ] 
then
    SERVERMEM="2"
    echo "Max memory not set. Defaulting to 2GB."
else
    SERVERMEM=$SERVERMEMORY
    echo "Max memory set to ${SERVERMEM}GB."
fi

# echo "Running /opt/minecraft/$SERVERJARFILENAME"
java "-Xmx${SERVERMEM}G" "-Xms${SERVERMEM}G" -jar "/opt/minecraft/${SERVERJARFILENAME}" nogui
# java -Xmx3G -Xms3G -jar /opt/minecraft/server.jar nogui
