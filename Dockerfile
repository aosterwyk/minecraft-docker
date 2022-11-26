FROM ubuntu

RUN apt update && apt upgrade -y && \
apt install wget -y && \
apt install openjdk-18-jre-headless -y && \
mkdir /opt/minecraft && \
wget https://piston-data.mojang.com/v1/objects/f69c284232d7c7580bd89a5a4931c3581eae1378/server.jar -O /opt/minecraft/server.jar && \
echo "eula=true" > /opt/minecraft/eula.txt

COPY start-server.sh /opt/minecraft/start-server.sh

VOLUME /opt/minecraft
WORKDIR /opt/minecraft
ENTRYPOINT /opt/minecraft/start-server.sh 

EXPOSE 25565/tcp
