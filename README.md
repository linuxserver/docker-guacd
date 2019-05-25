[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [IRC](https://irc.linuxserver.io) - on freenode at `#linuxserver.io`. Our primary support channel is Discord.
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!

# [linuxserver/guacd](https://github.com/linuxserver/docker-guacd)
[![](https://img.shields.io/discord/354974912613449730.svg?logo=discord&label=LSIO%20Discord&style=flat-square)](https://discord.gg/YWrKVTn)
[![](https://images.microbadger.com/badges/version/linuxserver/guacd.svg)](https://microbadger.com/images/linuxserver/guacd "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/linuxserver/guacd.svg)](https://microbadger.com/images/linuxserver/guacd "Get your own version badge on microbadger.com")
![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/guacd.svg)
![Docker Stars](https://img.shields.io/docker/stars/linuxserver/guacd.svg)
[![Build Status](https://ci.linuxserver.io/buildStatus/icon?job=Docker-Pipeline-Builders/docker-guacd/master)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-guacd/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/guacd/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/guacd/latest/index.html)

[Guacd](https://guacamole.apache.org/) - Apache Guacamole is a clientless remote desktop gateway. It supports standard protocols like VNC, RDP, and SSH. This container is only the backend server component needed to use The official or 3rd party HTML5 frontends.


[![guacd](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/guacd.png)](https://guacamole.apache.org/)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/). 

Simply pulling `linuxserver/guacd` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v7-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=guacd \
  -p 4822:4822 \
  --restart unless-stopped \
  linuxserver/guacd
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  guacd:
    image: linuxserver/guacd
    container_name: guacd
    ports:
      - 4822:4822
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 4822` | Port Guacamole server listens on |


&nbsp;
## Application Setup

This is a backend only service, to leverage Guacd server you need to use either the official Java frontend [guacamole-client](https://github.com/apache/guacamole-client) or an open source alterantive like [guacamole-lite](https://github.com/vadimpronin/guacamole-lite). 



## Support Info

* Shell access whilst the container is running: `docker exec -it guacd /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f guacd`
* container version number 
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' guacd`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/guacd`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.  
  
Below are the instructions for updating containers:  
  
### Via Docker Run/Create
* Update the image: `docker pull linuxserver/guacd`
* Stop the running container: `docker stop guacd`
* Delete the container: `docker rm guacd`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start guacd`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Compose
* Update all images: `docker-compose pull`
  * or update a single image: `docker-compose pull guacd`
* Let compose update all containers as necessary: `docker-compose up -d`
  * or update a single container: `docker-compose up -d guacd`
* You can also remove the old dangling images: `docker image prune`

### Via Watchtower auto-updater (especially useful if you don't remember the original parameters)
* Pull the latest image at its tag and replace it with the same env variables in one run:
  ```
  docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower \
  --run-once guacd
  ```
* You can also remove the old dangling images: `docker image prune`

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic: 
```
git clone https://github.com/linuxserver/docker-guacd.git
cd docker-guacd
docker build \
  --no-cache \
  --pull \
  -t linuxserver/guacd:latest .
```

The ARM variants can be built on x86_64 hardware using `multiarch/qemu-user-static`
```
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.

## Versions

* **25.05.19:** - Initial Release.
