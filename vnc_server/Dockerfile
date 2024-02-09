FROM debian:bookworm

# Set default values for build arguments
ARG MARIO_PARTY_USER=mario
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} mario_party_user
RUN useradd -g ${GID} -u ${UID} ${MARIO_PARTY_USER}

RUN apt update && apt-get install -y
RUN apt-get install x11vnc pulseaudio alsa-utils -y

COPY start_vnc_server.sh /scripts/start_vnc_server.sh
RUN chmod +x /scripts/start_vnc_server.sh

WORKDIR /home/${MARIO_PARTY_USER}
RUN chown -R ${MARIO_PARTY_USER} /home/${MARIO_PARTY_USER}

USER ${MARIO_PARTY_USER}
