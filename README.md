# README

## Setup

### Prerequisites

- docker
- docker-compose

### Resources

Container resources are defined in the `docker-compose.yml`, you should adapt it.

### Saves

If you have existing saves: copy/paste content of `palworld/Pal/Saved` into `saves` folder.

As user which run Palworld is `steam`, you probably don't have this user/group on your system, change permissions of the copied files:

```bash
chmod -Rf 777 ./saves
```

### Game settings

Just copy `./DefaultPalWorldSettings.ini` to `./PalWorldSettings.ini` and edit file.

### Build

```bash
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose build
```

### Run

```bash
docker-compose up
```
