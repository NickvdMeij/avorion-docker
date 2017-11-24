[![GitHub release](https://img.shields.io/github/release/psykzz/avorion-docker.svg?style=flat-square)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/psykzz/avorion-docker.svg?style=flat-square)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/psykzz/avorion-docker.svg?style=flat-square)]()

Avorion for Docker
==================


### Game Info

For some information about the game see https://www.kickstarter.com/projects/koonschi/avorion

This is a docker image to create a dedicated server.

**Currently supported version: public (0.14.5) and beta (0.15.0)**


## Getting started
Starting the server 

* Create a `/data` directory, this will be mounted into the container.
* Add your settings.ini and fill out the values as you like.

> **Note: if you change ports in the config, you'll need to adjust the port mappings.**
> **Note: if you enable RCON by setting a password, you need to open port 27015 (`-p 27015 -p 27015/udp`)**

Run the following to start the server.
```
docker run --name avorion -d -v `pwd`/data:/root/.avorion/galaxies/avorion_galaxy -p 27000:27000 -p 27000:27000/udp -p 27003:27003 -p 27003:27003/udp -p 27020:27020 -p 27022:27022 psykzz/avorion-docker
```

The server data will be saved locally on the host machine within the data folder. This allows you to bring the server down, and restart when needed to do any updates.

You can specify an admin via the environment, adding `-e USER=<steamid>` to set the default admin on server start.

By setting the environment variable `USE_BETA` to true using the `-e USE_BETA=true` flag, the server will use the beta branch for its server runtime files. this environment variable defaults to `false`, meaning it will install the release build by default.

> **Keep in mind that if you upgrade your server, the galaxy will still be "generated" in the previous patch and will not have the new features available in the `beta` branch.**

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)
