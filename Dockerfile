FROM debian:bookworm

# Set default values for build arguments
ARG MARIO_PARTY_USER=mario
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} mario_party_user
RUN useradd -g ${GID} -u ${UID} ${MARIO_PARTY_USER}

RUN apt update && apt-get install -y
RUN apt-get install build-essential \
zlib1g zlib1g-dev \
libsdl2-dev \
pkg-config \
libpng-dev \
libfreetype6-dev \
libglu1-mesa-dev \
libvulkan-dev \
nasm \
wget \
libminizip-dev \
p7zip-full -y

# Install mupen64plus
RUN wget https://github.com/mupen64plus/mupen64plus-core/releases/download/2.5/mupen64plus-bundle-linux64-2.5.tar.gz -O /var/tmp/mupen64plus-bundle-linux64-2.5.tar.gz
RUN tar -xvf /var/tmp/mupen64plus-bundle-linux64-2.5.tar.gz -C /var/tmp
RUN rm /var/tmp/mupen64plus-bundle-linux64-2.5.tar.gz
WORKDIR /var/tmp/mupen64plus-bundle-linux64-2.5
RUN ./install.sh

WORKDIR /home/${MARIO_PARTY_USER}
RUN chown -R ${MARIO_PARTY_USER} /home/${MARIO_PARTY_USER}

# Download Mario Party 64
RUN mkdir /home/${MARIO_PARTY_USER}/roms
RUN wget https://archive.org/download/nointro.n64/Mario%20Party%20%28USA%29.7z -O /home/${MARIO_PARTY_USER}/roms/mario_party.7z
RUN 7z e /home/${MARIO_PARTY_USER}/roms/mario_party.7z -o/home/${MARIO_PARTY_USER}/roms/
RUN rm /home/${MARIO_PARTY_USER}/roms/mario_party.7z
RUN mv /home/${MARIO_PARTY_USER}/roms/'Mario Party (USA).z64' /home/${MARIO_PARTY_USER}/roms/mario_party_usa.z64

USER ${MARIO_PARTY_USER}
