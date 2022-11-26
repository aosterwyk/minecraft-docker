#  minecraft-docker

[![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/aosterwyk/minecraft-docker?sort=semver)](https://github.com/aosterwyk/minecraft-docker/releases) [![GitHub last commit](https://img.shields.io/github/last-commit/aosterwyk/minecraft-docker)](https://github.com/aosterwyk/minecraft-docker/commits/master) [![GitHub last commit (branch)](https://img.shields.io/github/last-commit/aosterwyk/minecraft-docker/dev?label=last%20commit%20%28dev%29)](https://github.com/aosterwyk/minecraft-docker/commits/dev) [![Discord](https://img.shields.io/discord/90687557523771392?color=000000&label=%20&logo=discord)](https://discord.gg/QNppY7T) [![Twitch Status](https://img.shields.io/twitch/status/varixx?label=%20&logo=twitch)](https://twitch.tv/VariXx) 

This project was created to learn more about Docker. 

## Installation

Run the docker command in the usage section.
To use an existing world file, stop the container (`docker stop minecraft`) then copy the world directory to your docker volume. 

Do the same process for adding/updating any custom .jar files or server.jar. 

You can find the location of minecraft-vol by running:

`docker volume inspect --format '{{.Mountpoint}}' minecraft-vol`

This container **does not include backups**! Make sure to backup the docker volume. 

## Usage

### Building
`docker build --no-cache .`

### Running
``docker run --name=minecraft \
--restart=unless-stopped \
-v minecraft-vol:/opt/minecraft \
-p 25565:25565 \
-e SERVERJAR=fabric-server-mc.jar \
-e SERVERMEMORY=4 \ 
<image name>
``

**--name**: Name for the container. You can set this to anything. Technically optional.

**-v**: Mounts minecraft docker volume to /opt/minecraft.

**-p**: Publish minecraft server port (25565). Change this if needed. 

**--restart**: (optional) "unless-stopped" will restart the container unless the container (not the node/system) is restarted. 

**-e**: (optional) Environment variables. Use -e for each variable if using multiple.
Set `SERVERJAR=<.jar filename>` if you'd like to run a .jar other than server.jar. This jar must be copied to the docker volume mounted with -v. Do not include -e if you do not want to use a custom server .jar. 
`SERVERMEMORY=#` Set server memory to # GB. Do not put "G" or "GB" after the number. Defaults to 2GB if not set. 

## Support

[Discord server](https://discord.gg/QNppY7T) or DM `VariXx#8317`

## License

[MIT](https://choosealicense.com/licenses/mit/)
