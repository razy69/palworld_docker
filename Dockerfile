# syntax=docker/dockerfile:1


#
# BASE
#

FROM cm2network/steamcmd:root AS base

ENV TIMEZONE=Europe/Paris \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get upgrade -fy && \
    apt-get install -fy --no-install-recommends \
            locales \
            xdg-user-dirs \
            procps && \
    rm -Rf /var/lib/apt/lists/* && \
    locale-gen en_US.UTF-8

ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US:en"


#
# BUILDER
#

FROM base AS builder


COPY ./entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh && \
    mkdir -p /opt/palworld && \
    chown -Rf steam:steam /opt/palworld && \
    /home/steam/steamcmd/steamcmd.sh +force_install_dir /opt/palworld +login anonymous +app_update 2394010 validate +quit


#
# GAME
#

FROM builder AS palworld

COPY --from=builder /opt/palworld /opt/palworld

USER steam

WORKDIR /opt/palworld

HEALTHCHECK --start-period=30s CMD pgrep "PalServer-Linux" > /dev/null || exit 1

ENTRYPOINT ["/entrypoint.sh"]
