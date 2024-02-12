FROM python:3.12.2-bookworm

# Set default values for build arguments
ARG MARIO_PARTY_USER=mario
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} mario_party_user
RUN useradd -g ${GID} -u ${UID} ${MARIO_PARTY_USER}

RUN apt update && apt-get install -y
RUN apt-get install xvfb pulseaudio alsa-utils -y

COPY start_xvfb.sh /scripts/start_xvfb.sh
RUN chmod +x /scripts/start_xvfb.sh

# Pulse audio client configuration
COPY pulseaudio_client.conf /etc/pulse/client.conf

RUN mkdir /home/${MARIO_PARTY_USER}/
RUN chown -R ${MARIO_PARTY_USER} /home/${MARIO_PARTY_USER}

USER ${MARIO_PARTY_USER}
