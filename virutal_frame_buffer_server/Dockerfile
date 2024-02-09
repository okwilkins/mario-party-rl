FROM debian:bookworm

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

RUN mkdir /home/${MARIO_PARTY_USER}/
RUN chown -R ${MARIO_PARTY_USER} /home/${MARIO_PARTY_USER}

# Install pulseaudio and avahi for zeroconf
RUN apt install pulseaudio-module-zeroconf avahi-daemon avahi-utils -y

USER ${MARIO_PARTY_USER}
